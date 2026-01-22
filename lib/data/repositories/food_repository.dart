import 'package:bolehmakan/data/models/food_model.dart';
import 'package:bolehmakan/domain/entities/food_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// 🗄️ Food Repository - Data Layer
class FoodRepository {
  final SupabaseClient _client;

  FoodRepository(this._client);

  /// 🔍 Search foods by query (name or tags)
  Future<List<FoodEntity>> searchFoods(String query) async {
    if (query.trim().isEmpty) return [];

    try {
      final response =
          await _client.from('foods').select().or('name.ilike.%$query%,tags.cs.{$query}').limit(20);

      return (response as List).map((json) => FoodModel.fromJson(json).toEntity()).toList();
    } catch (e) {
      // 🐛 Fallback: coba search nama saja jika tags error
      try {
        final response = await _client.from('foods').select().ilike('name', '%$query%').limit(20);

        return (response as List).map((json) => FoodModel.fromJson(json).toEntity()).toList();
      } catch (_) {
        rethrow;
      }
    }
  }

  /// 📋 Get all foods (untuk testing)
  Future<List<FoodEntity>> getAllFoods() async {
    final response = await _client.from('foods').select().limit(50);

    return (response as List).map((json) => FoodModel.fromJson(json).toEntity()).toList();
  }

  /// 🔎 Get food by ID
  Future<FoodEntity?> getFoodById(String id) async {
    try {
      final response = await _client.from('foods').select().eq('id', id).single();

      return FoodModel.fromJson(response).toEntity();
    } catch (_) {
      return null;
    }
  }
}
