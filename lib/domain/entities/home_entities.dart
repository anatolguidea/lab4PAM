class HomeUser {
  final String name;
  final String profileImage;
  final String greeting;

  const HomeUser({
    required this.name,
    required this.profileImage,
    required this.greeting,
  });
}

class FilterCategory {
  final int id;
  final String name;
  final bool selected;

  const FilterCategory({
    required this.id,
    required this.name,
    required this.selected,
  });

  FilterCategory copyWith({bool? selected}) {
    return FilterCategory(
      id: id,
      name: name,
      selected: selected ?? this.selected,
    );
  }
}

class HomeData {
  final HomeUser user;
  final String searchPlaceholder;
  final List<FilterCategory> categories;
  final List<Recipe> recipes;
  final List<NewRecipe> newRecipes;

  const HomeData({
    required this.user,
    required this.searchPlaceholder,
    required this.categories,
    required this.recipes,
    required this.newRecipes,
  });
}

class Recipe {
  final int id;
  final String title;
  final String image;
  final String time; // already formatted
  final double rating;
  final bool isBookmarked;
  final String? author;

  const Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.time,
    required this.rating,
    required this.isBookmarked,
    this.author,
  });
}

class NewRecipe {
  final int id;
  final String title;
  final String recipeImage;
  final String userImage;
  final String userName;
  final double rating;
  final String time;

  const NewRecipe({
    required this.id,
    required this.title,
    required this.recipeImage,
    required this.userImage,
    required this.userName,
    required this.rating,
    required this.time,
  });
}
