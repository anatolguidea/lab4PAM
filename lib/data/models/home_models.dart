import '../../domain/entities/home_entities.dart';

class HomeUserModel extends HomeUser {
  HomeUserModel({
    required String name,
    required String profileImage,
    required String greeting,
  }) : super(
          name: name,
          profileImage: profileImage,
          greeting: greeting,
        );

  factory HomeUserModel.fromJson(Map<String, dynamic> json) {
    return HomeUserModel(
      name: json['name'] as String? ?? '',
      profileImage: json['profile_image'] as String? ?? '',
      greeting: json['greeting'] as String? ?? '',
    );
  }
}

class FilterCategoryModel extends FilterCategory {
  FilterCategoryModel({
    required int id,
    required String name,
    required bool selected,
  }) : super(id: id, name: name, selected: selected);

  factory FilterCategoryModel.fromJson(Map<String, dynamic> json) {
    return FilterCategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      selected: json['selected'] as bool? ?? false,
    );
  }
}

class RecipeModel extends Recipe {
  RecipeModel({
    required int id,
    required String title,
    required String image,
    required String time,
    required double rating,
    required bool isBookmarked,
    String? author,
  }) : super(
          id: id,
          title: title,
          image: image,
          time: time,
          rating: rating,
          isBookmarked: isBookmarked,
          author: author,
        );

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'] as int? ?? 0,
      title: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      time: json['time'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      isBookmarked: json['is_bookmarked'] as bool? ?? false,
      author: json['author'] as String?,
    );
  }
}

class NewRecipeModel extends NewRecipe {
  NewRecipeModel({
    required int id,
    required String title,
    required String recipeImage,
    required String userImage,
    required String userName,
    required double rating,
    required String time,
  }) : super(
          id: id,
          title: title,
          recipeImage: recipeImage,
          userImage: userImage,
          userName: userName,
          rating: rating,
          time: time,
        );

  factory NewRecipeModel.fromJson(Map<String, dynamic> json) {
    return NewRecipeModel(
      id: json['id'] as int? ?? 0,
      title: json['name'] as String? ?? '',
      recipeImage: json['image'] as String? ?? '',
      userImage: json['author_image'] as String? ?? '',
      userName: json['author'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      time: json['time'] as String? ?? '',
    );
  }
}

class HomeDataModel extends HomeData {
  HomeDataModel({
    required HomeUser user,
    required String searchPlaceholder,
    required List<FilterCategory> categories,
    required List<Recipe> recipes,
    required List<NewRecipe> newRecipes,
  }) : super(
          user: user,
          searchPlaceholder: searchPlaceholder,
          categories: categories,
          recipes: recipes,
          newRecipes: newRecipes,
        );

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    final user = HomeUserModel.fromJson((json['user'] as Map<String, dynamic>?) ?? {});
    final filters = (json['filters'] as Map<String, dynamic>?) ?? {};
    final searchPlaceholder = filters['search_placeholder'] as String? ?? '';
    final categories = ((filters['categories'] as List<dynamic>?) ?? [])
        .map((e) => FilterCategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
    final recipes = ((json['recipes'] as List<dynamic>?) ?? [])
        .map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
        .toList();
    final newRecipes = ((json['new_recipes'] as List<dynamic>?) ?? [])
        .map((e) => NewRecipeModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return HomeDataModel(
      user: user,
      searchPlaceholder: searchPlaceholder,
      categories: categories,
      recipes: recipes,
      newRecipes: newRecipes,
    );
  }
}
