import '../../domain/entities/ingredient.dart';

class IngredientModel extends Ingredient {
  IngredientModel({
    required int id,
    required String name,
    required String iconUrl,
    required String quantity,
  }) : super(
          id: id,
          name: name,
          iconUrl: iconUrl,
          quantity: quantity,
        );

  factory IngredientModel.fromJson(Map<String, dynamic> json) {
    return IngredientModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      iconUrl: json['icon'] as String? ?? '',
      quantity: json['quantity'] as String? ?? '',
    );
  }
}
