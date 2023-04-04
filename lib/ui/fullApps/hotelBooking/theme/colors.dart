import 'package:flutter/material.dart';

extension AppColors on ColorScheme {
  static MaterialColor primaryApp = MaterialColor(
    0xff00BBD4,
    <int, Color>{
      50: primaryColor,
      100: primaryColor,
      200: primaryColor,
      300: primaryColor,
      400: primaryColor,
      500: primaryColor,
      600: primaryColor,
      700: primaryColor,
      800: primaryColor,
      900: primaryColor,
    },
  );

  static Color primaryColor = Color(0xff39b75c);
  static Color primaryLightColor = Color(0xffd3e7d9);
  static Color white = Color(0xffffffff);
  static Color scafoldColor = Color(0xfff6f6f6);
  static Color textColor = Color(0xff171717);
  static Color textColorLight = Color(0xff8c8c8c);
  static Color grey = Color(0xffefeeee);
  static Color red = Color(0xffdd4b39);
  static Color redLight = Color(0xffffbfbd);
}
