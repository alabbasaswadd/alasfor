import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFC21617);
  static const Color secondary = Color(0xFFFBD550);
  static const Color redLight = Color(0xFFE31118);
  static const Color redMedium = Color(0xFFDF1218);
  static const Color redDark = Color(0xFFD41318);
  static const Color redDeep = Color(0xFFA81A17);
  static const Color redExtraDeep = Color(0xFFA61A17);
  static const Color goldDark = Color(0xFFBB8D16);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFF2F2F2);
  static const Color darkGray = Color(0xFF333333);
  static const Color black = Color(0xFF000000);
  static const Color pink = Color(0xFFffebeb);
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [redLight, redExtraDeep],
  );
  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [secondary, goldDark],
  );

  static const Color primaryDark = redDeep;
  static const Color secondaryLight = secondary;
  static const Color secondaryDark = goldDark;
  static const Color background = lightGray;
  static const Color cardBackground = white;
  static const Color textPrimary = darkGray;
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Color(0xFF9E9E9E);

  // Notification card colors
  static const Color purpleLight = Color(0xFFF3E5F5);
  static const Color purpleBorder = Color(0xFF9C27B0);
  static const Color blueLight = Color(0xFFE3F2FD);
  static const Color blueBorder = Color(0xFF2196F3);
  static const Color greenLight = Color(0xFFE8F5E9);
  static const Color greenBorder = Color(0xFF4CAF50);
  static const Color yellowBorder = Color(0xFFFFC107);
  static const Color redBorder = Color(0xFFE53935);
}
