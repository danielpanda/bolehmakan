import 'package:bolehmakan/data/repositories/food_repository.dart';
import 'package:bolehmakan/domain/entities/food_entity.dart';

/// 🔍 Use Case: Search Foods
class SearchFoodsUseCase {
  final FoodRepository _repository;

  SearchFoodsUseCase(this._repository);

  Future<List<FoodEntity>> execute(String query) {
    return _repository.searchFoods(query);
  }
}

/// 🔎 Use Case: Get Food Detail
class GetFoodDetailUseCase {
  final FoodRepository _repository;

  GetFoodDetailUseCase(this._repository);

  Future<FoodEntity?> execute(String id) {
    return _repository.getFoodById(id);
  }
}
