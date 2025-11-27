import 'package:flutter/material.dart';
import '../../domain/entities/recipe_detail.dart';

class RecipeDetail extends StatelessWidget {
  final RecipeSummary recipe;

  const RecipeDetail({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    final reviewText = recipe.reviews.isNotEmpty ? '(${recipe.reviews})' : '';

    return SizedBox(
      width: 365,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              // Imagine principală cu efect de întunecare
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Image.network(
                      recipe.image,
                      width: 365,
                      height: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 365,
                        height: 150,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.broken_image),
                      ),
                    ),
                    Container(
                      width: 365,
                      height: 150,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.0),
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.9),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Rating sus dreapta
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE1B3), // background galben pal
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, size: 13, color: Color(0xFFFFAD30)),
                      SizedBox(width: 4),
                      Text(
                        recipe.rating.toStringAsFixed(1),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Timp și salvare jos dreapta
              Positioned(
                bottom: 8,
                right: 8,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/time_icon.png',
                      width: 17,
                      height: 17,
                    ),
                    SizedBox(width: 4),
                    Text(
                      recipe.cookTime,
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    SizedBox(width: 12),
                    Image.asset(
                      'assets/images/save_icon.png',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 8),

          // Titlu + review (dreapta)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 0.7 * 315,
                child: Text(
                  recipe.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (reviewText.isNotEmpty)
                Text(
                  reviewText,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
