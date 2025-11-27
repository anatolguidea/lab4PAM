import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/header_widget.dart';
import '../widgets/menu_bar_widget.dart';
import '../widgets/new_recipe_card.dart';
import '../widgets/recipe_card.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.error.isNotEmpty) {
              return Center(child: Text('Error: ${controller.error}'));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(),
                const SizedBox(height: 40),
                const CustomSearchBar(),
                const SizedBox(height: 20),
                MenuSelector(
                  categories: controller.categories,
                  selectedIndex: controller.selectedCategory.value,
                  onSelect: controller.selectCategory,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 226,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    padding: const EdgeInsets.only(top: 50),
                    itemCount: controller.recipes.length,
                    itemBuilder: (context, index) {
                      return RecipeCard(recipe: controller.recipes[index]);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'New Recipes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 95 + 60 / 2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    itemCount: controller.newRecipes.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: NewRecipeCard(recipe: controller.newRecipes[index]),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
