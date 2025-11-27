import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String userName;
  final String greeting;
  final String profileImage;

  const HeaderWidget({
    super.key,
    required this.userName,
    required this.greeting,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    final String displayName = userName.isNotEmpty ? userName : 'Guest';
    final String displayGreeting = greeting.isNotEmpty ? greeting : 'Welcome back';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello $displayName',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              displayGreeting,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: profileImage.isNotEmpty
              ? Image.network(
                  profileImage,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _placeholderAvatar(),
                )
              : _placeholderAvatar(),
        ),
      ],
    );
  }

  Widget _placeholderAvatar() {
    return Container(
      width: 48,
      height: 48,
      color: Colors.grey.shade300,
      child: const Icon(Icons.person, color: Colors.grey),
    );
  }
}
