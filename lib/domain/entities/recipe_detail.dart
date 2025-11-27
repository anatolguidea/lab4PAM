import 'ingredient.dart';

class RecipeSummary {
  final int id;
  final String title;
  final String image;
  final double rating;
  final String reviews;
  final String cookTime;
  final bool isBookmarked;

  const RecipeSummary({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.cookTime,
    required this.isBookmarked,
  });
}

class Chef {
  final String name;
  final String profileImage;
  final String location;
  final bool isFollowing;

  const Chef({
    required this.name,
    required this.profileImage,
    required this.location,
    required this.isFollowing,
  });
}

class ServingInfo {
  final String serves;
  final int totalItems;

  const ServingInfo({
    required this.serves,
    required this.totalItems,
  });
}

class RecipeDetailData {
  final RecipeSummary recipe;
  final Chef chef;
  final ServingInfo serving;
  final List<Ingredient> ingredients;

  const RecipeDetailData({
    required this.recipe,
    required this.chef,
    required this.serving,
    required this.ingredients,
  });
}
