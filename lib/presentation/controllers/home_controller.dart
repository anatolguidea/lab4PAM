import 'package:get/get.dart';

import '../../domain/entities/home_entities.dart';
import '../../domain/usecases/get_home_data.dart';

class HomeController extends GetxController {
  final GetHomeDataUseCase _getHomeDataUseCase;
  HomeController({GetHomeDataUseCase? getHomeDataUseCase})
      : _getHomeDataUseCase = getHomeDataUseCase ?? Get.find<GetHomeDataUseCase>();

  final Rxn<HomeUser> user = Rxn<HomeUser>();
  final RxString searchPlaceholder = ''.obs;
  final RxList<FilterCategory> categories = <FilterCategory>[].obs;
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
      final data = await _getHomeDataUseCase();
      user.value = data.user;
      searchPlaceholder.value = data.searchPlaceholder;
      categories.assignAll(data.categories);
      final selectedIndexFromApi = categories.indexWhere((c) => c.selected);
      selectedCategory.value = selectedIndexFromApi == -1 ? 0 : selectedIndexFromApi;
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
    categories.assignAll(categories
        .asMap()
        .entries
        .map((entry) => entry.value.copyWith(selected: entry.key == index))
        .toList());
  }
}
