import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final VoidCallback? onFilterTap;
  final String hintText;

  const CustomSearchBar({super.key, this.onFilterTap, this.hintText = 'Search recipe'});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Câmpul de căutare
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/search_icon.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain, //imaginea sau conținutul va fi redimensionat pentru a încăpea complet în spațiul
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            ),
          ),
        ),

        const SizedBox(width: 12),

        //Iconița de după search bar
        GestureDetector(
          onTap: onFilterTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/filter_icon.png',
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
