import '../../domain/entities/recipe_detail.dart';
import 'ingredient_model.dart';

class RecipeSummaryModel extends RecipeSummary {
  RecipeSummaryModel({
    required int id,
    required String title,
    required String image,
    required double rating,
    required String reviews,
    required String cookTime,
    required bool isBookmarked,
  }) : super(
          id: id,
          title: title,
          image: image,
          rating: rating,
          reviews: reviews,
          cookTime: cookTime,
          isBookmarked: isBookmarked,
        );

  factory RecipeSummaryModel.fromJson(Map<String, dynamic> json) {
    return RecipeSummaryModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      image: json['image'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      reviews: json['reviews'] as String? ?? '',
      cookTime: json['cook_time'] as String? ?? '',
      isBookmarked: json['is_bookmarked'] as bool? ?? false,
    );
  }
}

class ChefModel extends Chef {
  ChefModel({
    required String name,
    required String profileImage,
    required String location,
    required bool isFollowing,
  }) : super(
          name: name,
          profileImage: profileImage,
          location: location,
          isFollowing: isFollowing,
        );

  factory ChefModel.fromJson(Map<String, dynamic> json) {
    return ChefModel(
      name: json['name'] as String? ?? '',
      profileImage: json['profile_image'] as String? ?? '',
      location: json['location'] as String? ?? '',
      isFollowing: json['is_following'] as bool? ?? false,
    );
  }
}

class ServingInfoModel extends ServingInfo {
  ServingInfoModel({
    required String serves,
    required int totalItems,
  }) : super(
          serves: serves,
          totalItems: totalItems,
        );

  factory ServingInfoModel.fromJson(Map<String, dynamic> json) {
    return ServingInfoModel(
      serves: json['serves'] as String? ?? '',
      totalItems: (json['total_items'] as num?)?.toInt() ?? 0,
    );
  }
}

class RecipeDetailModel extends RecipeDetailData {
  RecipeDetailModel({
    required RecipeSummary recipe,
    required Chef chef,
    required ServingInfo serving,
    required List<IngredientModel> ingredients,
  }) : super(
          recipe: recipe,
          chef: chef,
          serving: serving,
          ingredients: ingredients,
        );

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailModel(
      recipe: RecipeSummaryModel.fromJson(json['recipe'] as Map<String, dynamic>),
      chef: ChefModel.fromJson(json['chef'] as Map<String, dynamic>),
      serving: ServingInfoModel.fromJson(json['serving'] as Map<String, dynamic>),
      ingredients: (json['ingredients'] as List<dynamic>? ?? [])
          .map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
