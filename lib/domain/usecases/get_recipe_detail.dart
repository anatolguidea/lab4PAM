import '../entities/recipe_detail.dart';
import '../repositories/recipe_repository.dart';

class GetRecipeDetailUseCase {
  final RecipeRepository repository;

  GetRecipeDetailUseCase(this.repository);

  Future<RecipeDetailData> call() {
    return repository.loadDetails();
  }
}
