import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/new_recipe.dart';
import '../models/recipe.dart';

class HomeData {
  final List<String> categories;
  final List<Recipe> recipes;
  final List<NewRecipe> newRecipes;

  HomeData({required this.categories, required this.recipes, required this.newRecipes});
}

class HomeRepository {
  final String assetPath;

  HomeRepository({this.assetPath = 'assets/data/home.json'});

  Future<HomeData> load() async {
    final jsonStr = await rootBundle.loadString(assetPath);
    final data = json.decode(jsonStr) as Map<String, dynamic>;

    final categories = (data['categories'] as List<dynamic>).cast<String>().toList();
    final recipes = ((data['recipes'] as List<dynamic>)
        .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
        .toList());
    final newRecipes = ((data['new_recipes'] as List<dynamic>)
        .map((e) => NewRecipe.fromJson(e as Map<String, dynamic>))
        .toList());

    return HomeData(categories: categories, recipes: recipes, newRecipes: newRecipes);
  }
}

