class Recipe {
  final String title;
  final String image;
  final int time; // minutes
  final double rating;
  final String author;

  Recipe({
    required this.title,
    required this.image,
    required this.time,
    required this.rating,
    required this.author,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'] as String,
      image: json['image'] as String,
      time: (json['time'] as num).toInt(),
      rating: (json['rating'] as num).toDouble(),
      author: json['author'] as String,
    );
  }
}
