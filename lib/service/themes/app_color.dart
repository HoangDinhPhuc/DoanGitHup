import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color.fromARGB(255, 255, 255, 255);
  static const primaryGradient1 = Color.fromARGB(255, 206, 6, 152);
  static const primaryGradient2 = Color(0xff09FBD3);
  static const button = Color(0xffD45555);
  static const black = Color.fromARGB(255, 29, 29, 29);
  static const white = Color.fromARGB(255, 255, 255, 255);
  static const bottomNavBar = Color(0xff1E1E1E);
  static const iconBottomNavBar = Color(0xff98A2B3);

  static Color hexToColor(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    int colorValue = int.parse(hexColor, radix: 16);
    return Color(colorValue);
  }
}
