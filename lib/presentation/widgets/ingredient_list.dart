import 'package:flutter/material.dart';

class IngredientList extends StatelessWidget {
  final String iconUrl;
  final String name;
  final String quantity;

  const IngredientList({
    super.key,
    required this.iconUrl,
    required this.name,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365,
      height: 76,
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9), // sur deschis
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Imaginea ingredientului
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              iconUrl,
              width: 52,
              height: 52,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 52,
                height: 52,
                color: Colors.grey.shade300,
                child: const Icon(Icons.broken_image),
              ),
            ),
          ),
          SizedBox(width: 12),
          // Titlu
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          // Cantitate
          Text(
            quantity,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFFA9A9A9), // sur mai deschis
            ),
          ),
        ],
      ),
    );
  }
}
