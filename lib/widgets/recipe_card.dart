import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../screens/recipe_page.dart';
import '../models/new_recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 150;
    const double greyContainerHeight = 176;
    const double imageHeight = 100;
    final double cardHeight = greyContainerHeight + imageHeight / 2;

    return GestureDetector(
      onTap: () {
        final newRecipeEquivalent = NewRecipe(
          title: recipe.title,
          recipeImage: recipe.image,
          userImage: 'assets/images/profile_placeholder.png',
          userName: recipe.author,
          rating: recipe.rating,
          time: '${recipe.time} mins',
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecipePage(recipe: newRecipeEquivalent)), //deschide RecipeDetailPage peste pagina curentă
        );
      },
      child: Container(
        width: cardWidth,
        height: cardHeight,
        margin: EdgeInsets.only(right: 16),
        child: Stack( //widget care permite suprapunerea mai multor copii
          clipBehavior: Clip.none, //taie (clipping) widgeturile după o formă.
          children: [

            //containerul sur cu scrisul si iconita de salvare
            Positioned(
              bottom: 0,
              child: Container(
                width: cardWidth,
                height: greyContainerHeight,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.only(top: imageHeight / 2 + 8, left: 12, right: 12, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(recipe.title, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade800), maxLines: 2, overflow: TextOverflow.ellipsis),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Time', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                            Text('${recipe.time} Mins', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey.shade800)),
                          ],
                        ),
                        Image.asset('assets/images/save_icon.png', width: 24, height: 24),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            //imaginea rotunda
            Positioned(
              top: -55,
              left: (150 - 130) / 2,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage(recipe.image), fit: BoxFit.cover)),
              ),
            ),

            //rating-ul
            Positioned(
              top: -25,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFFFFE1B3), // background galben pal
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, size: 13, color: Color(0xFFFFAD30)), // steluta portocalie
                    SizedBox(width: 4),
                    Text(
                      recipe.rating.toString(),
                      style: TextStyle(
                        color: Colors.black, // text negru
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}