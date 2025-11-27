import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/recipe_controller.dart';
import '../widgets/ingredient_list.dart';
import '../widgets/ingredient_tab.dart';
import '../widgets/profile_recipe.dart';
import '../widgets/recipe_detail.dart';
import '../models/new_recipe.dart';
import '../widgets/items_serve.dart';

class RecipePage extends StatelessWidget {
  final NewRecipe recipe;

  RecipePage({required this.recipe, super.key});
  final RecipeController controller = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
          child: SingleChildScrollView(
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
                // Back arrow
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back, color: Colors.black, size: 28),
                    ),
                    Spacer(), // împinge următorul widget în dreapta
                    Icon(Icons.more_horiz, color: Colors.black, size: 28), // 3 puncte orizontale
                  ],
                ),

                SizedBox(height: 16),

                // Detalii rețetă
                RecipeDetail(recipe: recipe),
                SizedBox(height: 12),

                // Widget profil
                ProfileRecipe(
                  profileImagePath: 'assets/images/profile2.png',
                ),
                SizedBox(height: 20),

                // Tabs Ingredient / Procedure
                IngredientProcedureTabs(),
                SizedBox(height: 40),

                // Serve & Items row
                ServeItemsRow(
                  serve: '1 Serve',
                  items: '10 Items',
                  iconPath: 'assets/images/serve_icon.png',
                ),
                SizedBox(height: 25),

                // Lista ingredientelor
                Column(
                  children: controller.ingredients.map((ingredient) {
                    return IngredientList(
                      imagePath: ingredient.imagePath,
                      title: ingredient.title,
                      quantity: ingredient.quantity,
                    );
                  }).toList(),
                ),
              ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
