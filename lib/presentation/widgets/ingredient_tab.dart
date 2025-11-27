import 'package:flutter/material.dart';

class IngredientProcedureTabs extends StatefulWidget {
  const IngredientProcedureTabs({super.key});

  @override
  State<IngredientProcedureTabs> createState() => _IngredientProcedureTabsState();
}

class _IngredientProcedureTabsState extends State<IngredientProcedureTabs> {
  String selectedTab = 'Ingredients'; // implicit
  static const Color green = Color(0xFF129575);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // fix în stânga
      children: [
        _buildTabButton(
          label: 'Ingredients',
          isSelected: selectedTab == 'Ingredients',
          onTap: () {
            setState(() {
              selectedTab = 'Ingredients';
            });
          },
        ),
        SizedBox(width: 80), // distanța fixă între butoane
        _buildTabButton(
          label: 'Procedure',
          isSelected: selectedTab == 'Procedure',
          onTap: () {
            setState(() {
              selectedTab = 'Procedure';
            });
          },
        ),
      ],
    );
  }

  Widget _buildTabButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 37,
      child: isSelected
          ? ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(horizontal: 40),
          elevation: 0,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      )
          : TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20),
          minimumSize: Size(0, 37),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: green,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}