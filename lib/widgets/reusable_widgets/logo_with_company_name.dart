import 'package:flutter/material.dart';

class LogoWithCompanyName extends StatelessWidget {
  final double logoHeight;
  final double spacing;
  final double companyNameFontSize;
  final double logoToCompanyNameSpacing;

  const LogoWithCompanyName({
    super.key,
    this.logoHeight = 100,
    this.spacing = 1,
    this.companyNameFontSize = 30,
    this.logoToCompanyNameSpacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: logoHeight,
        ),
        SizedBox(height: spacing),
        Text(
          'SOKO AERIAL',
          style: TextStyle(
            fontFamily: 'ProductSans',
            color: Colors.white,
            fontSize: companyNameFontSize,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: logoToCompanyNameSpacing),
      ],
    );
  }
}
