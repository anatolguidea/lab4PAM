import '../entities/recipe_detail.dart';

abstract class RecipeRepository {
  Future<RecipeDetailData> loadDetails();
}
