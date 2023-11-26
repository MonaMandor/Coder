import 'package:flutter/material.dart';

class AppColors {
  static Color splashScreenBackground =
      HexColor("#F3F3F3"); //main background color
  static Color onBoardingBackground = Colors.white;
  static Color primaryColor = HexColor("#7B76F1"); //blue
  static Color secondaryColor = HexColor("#F5BA41"); //orange
  static Color primaryTextColor = HexColor("#152354"); //dark blue
  static Color secondaryTextColor = HexColor("#1E1E2D"); // black
  static Color ThirdTextColor = HexColor("#39434F"); //grey black
  static Color FourthTextColor = HexColor("#4F4F4F"); //light grey black
  static Color sexthTextColor = HexColor("#828282"); //grey
  static Color TextColor = HexColor("#F5BA41"); //orange
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
