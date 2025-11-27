


import 'package:flutter/material.dart';

class ProfileRecipe extends StatelessWidget {
  final String profileImagePath;

  const ProfileRecipe({
    super.key,
    required this.profileImagePath,
  });

  @override
  Widget build(BuildContext context) {
    const double containerWidth = 365;
    const double containerHeight = 40;
    const Color followGreen = Color(0xFF129575);

    return Container(
      width: containerWidth,
      height: containerHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Imagine profil rotundă 40x40
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              profileImagePath,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 12),

          // Nume + locație (statice)
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Laura Wilson',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/location_icon.png',
                      width: 17,
                      height: 17,
                    ),
                    SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        'Lagos, Nigeria', // 👈 locație statică
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(width: 8),

          // Buton Follow
          SizedBox(
            width: 85,
            height: 37,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: followGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.zero,
                elevation: 0,
              ),
              child: Text(
                'Follow',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}