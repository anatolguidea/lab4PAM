import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Valorile username și imagine sunt definite direct aici
    const String userName = 'Jega';
    const String profileImage = 'assets/images/profile.png';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello $userName',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'What are you cooking today?',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            profileImage,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}