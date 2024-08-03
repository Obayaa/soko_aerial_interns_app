import 'package:flutter/material.dart';
import 'package:soko_aerial_interns_app/utils/app_theme.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            // color: Color(0xFFF2F2F2), // Light grey background
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 30.0,
            backgroundColor: const Color.fromRGBO(242, 242, 252, 100),
            child: Icon(icon, size: 30.0, color: AppTheme.primaryColor),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(label, style: const TextStyle(color: AppTheme.secondaryColor),),
      ],
    );
  }
}
