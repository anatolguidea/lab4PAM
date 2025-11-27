


import 'package:flutter/material.dart';

class ProfileRecipe extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final String location;
  final bool isFollowing;

  const ProfileRecipe({
    super.key,
    required this.profileImageUrl,
    required this.name,
    required this.location,
    required this.isFollowing,
  });

  @override
  Widget build(BuildContext context) {
    const double containerWidth = 365;
    const double containerHeight = 40;
    const Color followGreen = Color(0xFF129575);

    return SizedBox(
      width: containerWidth,
      height: containerHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Imagine profil rotundă 40x40
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: profileImageUrl.isNotEmpty
                ? Image.network(
                    profileImageUrl,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 40,
                      height: 40,
                      color: Colors.grey.shade300,
                      child: const Icon(Icons.person),
                    ),
                  )
                : Container(
                    width: 40,
                    height: 40,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.person),
                  ),
          ),

          SizedBox(width: 12),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
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
                        location,
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
                backgroundColor: isFollowing ? Colors.grey.shade500 : followGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.zero,
                elevation: 0,
              ),
              child: Text(
                isFollowing ? 'Following' : 'Follow',
                style: const TextStyle(
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
