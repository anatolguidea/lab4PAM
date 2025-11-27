import 'package:flutter/material.dart';
import '../../domain/entities/home_entities.dart';
import '../screens/recipe_page.dart';

String truncateTitle(String title, int maxLength) {
  if (title.length <= maxLength) return title;
  return title.substring(0, maxLength) + '...';
}

class NewRecipeCard extends StatelessWidget {
  final NewRecipe recipe;

  const NewRecipeCard({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 251;
    const double cardHeight = 95;
    const double imageHeight = 60;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecipePage(recipe: recipe)),
        );
      },
      child: Container(
        width: cardWidth,
        height: cardHeight,
        margin: EdgeInsets.only(bottom: 16),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: cardWidth,
              height: cardHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 0))],
              ),
              padding: EdgeInsets.only(left: 12, right: 8, top: 12, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(truncateTitle(recipe.title, 17), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey.shade600)),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        size: 14,
                        color: index < recipe.rating ? Color(0xFFFFAD30) : Colors.grey.shade300,
                      );
                    }),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              recipe.userImage,
                              width: 20,
                              height: 20,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                width: 20,
                                height: 20,
                                color: Colors.grey.shade300,
                                child: const Icon(Icons.person, size: 14),
                              ),
                            ),
                          ),
                          SizedBox(width: 4),
                          Text('By ${recipe.userName}', style: TextStyle(fontSize: 12, color: Colors.grey.shade800)),
                        ],
                      ),
                      Spacer(), //adaugă spațiu flexibil între widget-uri
                      Row(
                        children: [
                          Image.asset('assets/images/time_icon.png', width: 17, height: 17),
                          SizedBox(width: 4),
                          Text(recipe.time, style: TextStyle(fontSize: 12, color: Colors.grey.shade800)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: -imageHeight / 3,
              right: -8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  recipe.recipeImage,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 110,
                    height: 110,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.broken_image),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
