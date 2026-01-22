import 'package:bolehmakan/data/repositories/food_repository.dart';
import 'package:bolehmakan/domain/entities/food_entity.dart';
import 'package:bolehmakan/domain/usecases/food_usecases.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// 🔌 Supabase Client Provider
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

/// 🗄️ Food Repository Provider
final foodRepositoryProvider = Provider<FoodRepository>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return FoodRepository(client);
});

/// 🔍 Search Foods UseCase Provider
final searchFoodsUseCaseProvider = Provider<SearchFoodsUseCase>((ref) {
  final repository = ref.watch(foodRepositoryProvider);
  return SearchFoodsUseCase(repository);
});

/// 📝 Search Query Provider (state)
final searchQueryProvider = StateProvider<String>((ref) => '');

/// 🔍 Search Results Provider
final searchResultsProvider = FutureProvider<List<FoodEntity>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.trim().isEmpty) return [];

  final useCase = ref.watch(searchFoodsUseCaseProvider);
  return useCase.execute(query);
});

/// 📄 Selected Food Provider (for detail page)
final selectedFoodProvider = StateProvider<FoodEntity?>((ref) => null);

/// 🔎 Food Detail Provider
final foodDetailProvider = FutureProvider.family<FoodEntity?, String>((ref, id) async {
  final repository = ref.watch(foodRepositoryProvider);
  return repository.getFoodById(id);
});
