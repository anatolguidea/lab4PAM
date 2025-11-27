class Ingredient {
  final String title;
  final String imagePath;
  final String quantity;

  Ingredient({
    required this.title,
    required this.imagePath,
    required this.quantity,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      quantity: json['quantity'] as String,
    );
  }
}
