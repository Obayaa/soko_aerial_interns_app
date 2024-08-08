// lib/widgets/common/custom_bottom_navigation_bar.dart

import 'package:flutter/material.dart';
import '../../utils/app_theme.dart';
import '../../utils/strings.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      selectedItemColor: AppTheme.primaryColor,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (index != currentIndex) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/drone');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/profile');
              break;
          }
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: Strings.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmarks),
          label: Strings.course,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: Strings.profile,
        ),
      ],
    );
  }
}