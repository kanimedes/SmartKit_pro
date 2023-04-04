// ignore_for_file: constant_identifier_names

import 'dart:ui' show Color;

import 'package:flutter/material.dart';

class ColorsRes {
  static const Color appcolor = Color(0xFF7D8CEB);
  static const Color introbackcolor = Color(0xFF5B81E8);
  static const Color white = Color(0xFFffffff);
  static const Color black = Color(0xFF000000);
  static const Color bgcolor = Color(0xFFEEEEEE);
  static const Color blue = Color(0xFF345EB4);
  static const Color yellow = Color(0xFFF8D320);
  static const Color textblack = Color(0xFF2D2D2D);
  static const Color grey = Color(0xFF686868);
  static const Color firstgradientcolor = Color(0xFF4F6FC8);
  static const Color secondgradientcolor = Color(0xFF7D8CEB);
  static const Color thirdgradientcolor = Color(0xFF345EB4);
  static const Color fbcolor = Color(0xFF345EB4);
  static const Color googlecolor = Color(0xFFdd4b39);
  static const Color red = Color(0xFFD32F2F);
  static const Color green = Color(0xff00d285);

  static const Color btnlightshadow = Color(0x1affffff);

  static const Color categorycolor1 = Color(0xffF91E8F);
  static const Color categorycolor2 = Color(0xff0FD7D1);
  static const Color categorycolor3 = Color(0xffF9C11E);
  static const Color categorycolor4 = Color(0xff7B0CEA);
  static const Color categorycolor5 = Color(0xff5BD70F);
  static const Color categorycolor6 = Color(0xffF9601E);
  static const Color categorycolor7 = Color(0xff0F73D7);
  static const Color categorycolor8 = Color(0xffF23C63);

  static const MaterialColor appcolor_material = MaterialColor(
    0xFF19294a,
    <int, Color>{
      50: Color(0xFF19294a),
      100: Color(0xFF19294a),
      200: Color(0xFF19294a),
      300: Color(0xFF19294a),
      400: Color(0xFF19294a),
      500: Color(0xFF19294a),
      600: Color(0xFF19294a),
      700: Color(0xFF19294a),
      800: Color(0xFF19294a),
      900: Color(0xFF19294a),
    },
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    fontFamily: 'MyFont',
    iconTheme: IconThemeData(
      color: ColorsRes.white,
    ),
    primaryTextTheme:
        TextTheme(headline6: TextStyle(color: ColorsRes.appcolor)),
    colorScheme:
        ColorScheme.fromSwatch(primarySwatch: ColorsRes.appcolor_material)
            .copyWith(secondary: ColorsRes.appcolor),
  );

  static final lightTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    fontFamily: 'MyFont',
    iconTheme: IconThemeData(
      color: ColorsRes.white,
    ),
    primaryTextTheme:
        TextTheme(headline6: TextStyle(color: ColorsRes.appcolor)),
    colorScheme:
        ColorScheme.fromSwatch(primarySwatch: ColorsRes.appcolor_material)
            .copyWith(secondary: ColorsRes.appcolor),
  );
}
