class NewRecipe {
  final String title;
  final String recipeImage;
  final String userImage;
  final String userName;
  final double rating;
  final String time;

  NewRecipe({
    required this.title,
    required this.recipeImage,
    required this.userImage,
    required this.userName,
    required this.rating,
    required this.time,
  });

  factory NewRecipe.fromJson(Map<String, dynamic> json) {
    return NewRecipe(
      title: json['title'] as String,
      recipeImage: json['recipeImage'] as String,
      userImage: json['userImage'] as String,
      userName: json['userName'] as String,
      rating: (json['rating'] as num).toDouble(),
      time: json['time'] as String,
    );
  }
}
