import 'package:get/get.dart';

import '../repository/recipe_repository.dart';
import '../models/ingredient.dart';

class RecipeController extends GetxController {
  final RecipeRepository repository;
  RecipeController({RecipeRepository? repository}) : repository = repository ?? RecipeRepository();

  final RxList<Ingredient> ingredients = <Ingredient>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadIngredients();
  }

  Future<void> loadIngredients() async {
    try {
      isLoading.value = true;
      error.value = '';
      final list = await repository.loadIngredients();
      ingredients.assignAll(list);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}

