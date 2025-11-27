import 'package:get/get.dart';

import '../repository/home_repository.dart';
import '../models/new_recipe.dart';
import '../models/recipe.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController({HomeRepository? repository}) : repository = repository ?? HomeRepository();

  final RxList<String> categories = <String>[].obs;
  final RxInt selectedCategory = 0.obs;
  final RxList<Recipe> recipes = <Recipe>[].obs;
  final RxList<NewRecipe> newRecipes = <NewRecipe>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    load();
  }

  Future<void> load() async {
    try {
      isLoading.value = true;
      error.value = '';
      final data = await repository.load();
      categories.assignAll(data.categories);
      recipes.assignAll(data.recipes);
      newRecipes.assignAll(data.newRecipes);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void selectCategory(int index) {
    selectedCategory.value = index;
    // If filtering needed later, implement here.
  }
}

