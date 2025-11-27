import 'package:flutter/material.dart';

class ServeItemsRow extends StatelessWidget {
  final String serve;
  final String items;
  final String iconPath; // cale imagine icon

  const ServeItemsRow({
    super.key,
    required this.serve,
    required this.items,
    required this.iconPath, // adăugat
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // primul la stânga, al doilea la dreapta
      children: [
        Row(
          children: [
            Image.asset(
              iconPath,
              width: 17,
              height: 17,
            ),
            SizedBox(width: 6),
            Text(
              serve,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFFA9A9A9), // gri deschis
              ),
            ),
          ],
        ),
        Text(
          items,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFFA9A9A9), // gri deschis
          ),
        ),
      ],
    );
  }
}