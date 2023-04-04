// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const MaterialColor primary_app = MaterialColor(
  0xff00b65f,
  <int, Color>{
    50: primary,
    100: primary,
    200: primary,
    300: primary,
    400: primary,
    500: primary,
    600: primary,
    700: primary,
    800: primary,
    900: primary,
  },
);

const Color primary = Color(0xff00b65f);
const Color secondary = Color(0xffFD741F);
const Color fontColor = Color(0xff333333);
const Color fontLight = Color(0xff7F848D);

const Color white = Color(0xffF8F9FB);
const Color lightBack = Color(0xffD4D8De);
const Color black = Color(0xff000000);
const Color green = Color(0xff52C462);
const Color pink = Color(0xffFB5568);
const Color yellow = Color(0xffFEA142);

// Grobag1 //

final Color grobag1 = Color(0xffF1FFF6);
final Color grobag2 = Color(0xff00B65F);
final Color grobag3 = Color(0xff005B30);
final Color grobag4 = Color(0xffF1FFF6);
final Color grobag5 = Color(0x3349DE7F);
final Color grobag6 = Color(0xFF9FF5CD);
const Color grobag7 = Colors.black;
final Color grobag8 = Color(0xFF777777);
Gradient grobaggradient = LinearGradient(
  begin: Alignment(1.0, 1.0),
  end: Alignment(-1.0, -1.0),
  colors: [grobag3, grobag2],
  stops: const [0.1, 0.9],
);
