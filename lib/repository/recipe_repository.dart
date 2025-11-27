import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/ingredient.dart';

class RecipeRepository {
  final String assetPath;

  RecipeRepository({this.assetPath = 'assets/data/ingredients.json'});

  Future<List<Ingredient>> loadIngredients() async {
    final jsonStr = await rootBundle.loadString(assetPath);
    final data = json.decode(jsonStr) as Map<String, dynamic>;
    final list = (data['ingredients'] as List<dynamic>)
        .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
        .toList();
    return list;
  }
}

