import 'package:flutter/material.dart';

class MentorItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  // final VoidCallback onTap;

  const MentorItem({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40.0,
          backgroundImage: AssetImage(imageUrl),
        ),
        const SizedBox(height: 8.0),
        Text(
          name,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
