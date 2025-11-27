import 'package:flutter/material.dart';

import '../../domain/entities/home_entities.dart';

class MenuSelector extends StatelessWidget {
  final List<FilterCategory> categories;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  const MenuSelector({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onSelect,
  });

  static const Color activeGreen = Color(0xFF129575);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final bool selected = categories[index].selected || index == selectedIndex;

          return GestureDetector(
            onTap: () => onSelect(index),
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: selected ? activeGreen : Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                categories[index].name,
                style: TextStyle(
                  color: selected ? Colors.white : activeGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
