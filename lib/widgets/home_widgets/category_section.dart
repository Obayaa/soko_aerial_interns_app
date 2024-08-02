// lib/widgets/home_widgets/category_section.dart

import 'package:flutter/material.dart';
import '../../utils/app_theme.dart';
import '../../utils/strings.dart';
import 'category_item.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            Strings.categories,
            style: AppTheme.sectionTitleStyle,
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CategoryItem(icon: Icons.code, label: 'Coding'),
            CategoryItem(icon: Icons.airplanemode_active, label: 'Drones'),
            CategoryItem(icon: Icons.engineering, label: 'Engineering'),
            CategoryItem(icon: Icons.map, label: 'Mapping'),
          ],
        ),
      ],
    );
  }
}