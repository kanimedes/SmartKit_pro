import 'package:flutter/material.dart';


class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode;
  ThemeNotifier(this._themeMode);

  getThemeMode() => _themeMode;

  void setThemeMode(ThemeMode themeMode) async {
    _themeMode = themeMode;
    notifyListeners();
  }
}