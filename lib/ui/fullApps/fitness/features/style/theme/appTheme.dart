// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/Utils/colors.dart';

enum AppTheme { Light, Dark }

final appThemeData = {
  AppTheme.Light: ThemeData(
      shadowColor: primaryColor.withOpacity(0.25),
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: pageBackgroundColor,
      backgroundColor: backgroundColor,
      canvasColor: canvasColor,
      fontFamily: "Poppins",
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: secondaryColor,
          )),
  AppTheme.Dark: ThemeData(
      shadowColor: darkPrimaryColor.withOpacity(0.25),
      brightness: Brightness.dark,
      primaryColor: darkPrimaryColor,
      scaffoldBackgroundColor: darkPageBackgroundColor,
      backgroundColor: darkBackgroundColor,
      canvasColor: darkCanvasColor,
      fontFamily: "Poppins",
      colorScheme: ThemeData().colorScheme.copyWith(
            brightness: Brightness.dark,
            secondary: darkSecondaryColor,
          )),
};
