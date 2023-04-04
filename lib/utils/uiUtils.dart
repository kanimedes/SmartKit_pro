import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiUtils {
  static double titleTextFontSize = 21.0;

  static String getFullAppsImagePath() {
    return "assets/";
  }

  static void changeStatusBarBrightness(Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness));
  }
}
