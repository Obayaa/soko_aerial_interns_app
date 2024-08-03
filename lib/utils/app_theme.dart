// lib/utils/app_theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1976D2);
  static const Color secondaryColor = Color(0xff827575);
  static const Color backgroundColor = Colors.white;

  static const TextStyle headerTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'ProductSans'
  );

  static const TextStyle subHeaderTextStyle = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontFamily: 'ProductSans'
  );

  // static const TextStyle mentorTitleStyle = TextStyle(
  //   fontSize: 20,
  //   color: Colors.white,
  //   fontFamily: 'ProductSans'
  // );

  static const TextStyle sectionTitleStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontFamily: 'ProductSans'
  );

  static const TextStyle TitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'ProductSans'
  );
  // Add more styles as needed
}