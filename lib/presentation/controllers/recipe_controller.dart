import 'package:get/get.dart';

import '../../domain/entities/ingredient.dart';
import '../../domain/entities/recipe_detail.dart';
import '../../domain/usecases/get_recipe_detail.dart';

class RecipeController extends GetxController {
  final GetRecipeDetailUseCase _getRecipeDetailUseCase;
  RecipeController({GetRecipeDetailUseCase? getRecipeDetailUseCase})
      : _getRecipeDetailUseCase =
            getRecipeDetailUseCase ?? Get.find<GetRecipeDetailUseCase>();

  final Rxn<RecipeDetailData> details = Rxn<RecipeDetailData>();
  final RxList<Ingredient> ingredients = <Ingredient>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadDetails();
  }

  Future<void> loadDetails() async {
    try {
      isLoading.value = true;
      error.value = '';
      final data = await _getRecipeDetailUseCase();
      details.value = data;
      ingredients.assignAll(data.ingredients);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
