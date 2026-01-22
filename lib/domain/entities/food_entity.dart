import 'package:bolehmakan/core/constants/status_constants.dart';

/// 🍽️ Food Entity - Domain Layer
class FoodEntity {
  final String id;
  final String name;
  final String? imageUrl;
  final HealthStatus goutStatus;
  final HealthStatus diabetesStatus;
  final HealthStatus cholesterolStatus;
  final String? notes;
  final List<String> tags;

  const FoodEntity({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.goutStatus,
    required this.diabetesStatus,
    required this.cholesterolStatus,
    this.notes,
    this.tags = const [],
  });

  /// 🔄 CopyWith pattern
  FoodEntity copyWith({
    String? id,
    String? name,
    String? imageUrl,
    HealthStatus? goutStatus,
    HealthStatus? diabetesStatus,
    HealthStatus? cholesterolStatus,
    String? notes,
    List<String>? tags,
  }) {
    return FoodEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      goutStatus: goutStatus ?? this.goutStatus,
      diabetesStatus: diabetesStatus ?? this.diabetesStatus,
      cholesterolStatus: cholesterolStatus ?? this.cholesterolStatus,
      notes: notes ?? this.notes,
      tags: tags ?? this.tags,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FoodEntity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
