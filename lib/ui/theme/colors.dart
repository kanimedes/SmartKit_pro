import 'dart:ui';

import 'package:flutter/material.dart';

class ColorTheme {
  final Color primaryColor;
  final Color darkPrimaryColor;

  ColorTheme({required this.darkPrimaryColor, required this.primaryColor});
}

//list of colors based on theme
//primaryColor and dark PrimaryColor
List<ColorTheme> colorThemes = [
  ColorTheme(
      darkPrimaryColor: const Color(0xff8288E7),
      primaryColor: const Color(0xff746DBD)),
  ColorTheme(
      darkPrimaryColor: const Color(0xff00E0D3),
      primaryColor: const Color(0xff00BDD5)),
  ColorTheme(
      darkPrimaryColor: const Color(0xffFFCBA6),
      primaryColor: const Color(0xffFFCBA6)),
  ColorTheme(
      darkPrimaryColor: const Color(0xffFF747A),
      primaryColor: const Color(0xffF7699B)),
  ColorTheme(
      darkPrimaryColor: const Color(0xff67DCA0),
      primaryColor: const Color(0xff43A8A7)),
  ColorTheme(
      darkPrimaryColor: const Color(0xff749AF4),
      primaryColor: const Color(0xff3F95AC)),
];
