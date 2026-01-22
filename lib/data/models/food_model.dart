import 'package:bolehmakan/core/constants/status_constants.dart';
import 'package:bolehmakan/domain/entities/food_entity.dart';

/// 🍽️ Food Model - Data Layer (for Supabase)
class FoodModel {
  final String id;
  final String name;
  final String? imageUrl;
  final String goutStatus;
  final String diabetesStatus;
  final String cholesterolStatus;
  final String? notes;
  final List<String> tags;

  const FoodModel({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.goutStatus,
    required this.diabetesStatus,
    required this.cholesterolStatus,
    this.notes,
    this.tags = const [],
  });

  /// 📥 From Supabase JSON
  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String?,
      goutStatus: json['gout_status'] as String? ?? 'caution',
      diabetesStatus: json['diabetes_status'] as String? ?? 'caution',
      cholesterolStatus: json['cholesterol_status'] as String? ?? 'caution',
      notes: json['notes'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
    );
  }

  /// 📤 To Supabase JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_url': imageUrl,
      'gout_status': goutStatus,
      'diabetes_status': diabetesStatus,
      'cholesterol_status': cholesterolStatus,
      'notes': notes,
      'tags': tags,
    };
  }

  /// 🔄 Convert to Entity (Domain Layer)
  FoodEntity toEntity() {
    return FoodEntity(
      id: id,
      name: name,
      imageUrl: imageUrl,
      goutStatus: parseHealthStatus(goutStatus),
      diabetesStatus: parseHealthStatus(diabetesStatus),
      cholesterolStatus: parseHealthStatus(cholesterolStatus),
      notes: notes,
      tags: tags,
    );
  }

  /// 🔄 Create Model from Entity
  factory FoodModel.fromEntity(FoodEntity entity) {
    return FoodModel(
      id: entity.id,
      name: entity.name,
      imageUrl: entity.imageUrl,
      goutStatus: entity.goutStatus.name,
      diabetesStatus: entity.diabetesStatus.name,
      cholesterolStatus: entity.cholesterolStatus.name,
      notes: entity.notes,
      tags: entity.tags,
    );
  }
}
