// ignore_for_file: constant_identifier_names

import 'StringsRes.dart';

class Constant {
  static const double BOTTOM_PADDING_PIP = 16;
  static const double VIDEO_HEIGHT_PIP = 200;
  static const double VIDEO_TITLE_HEIGHT_PIP = 70;

  static String? validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return StringsRes.entervalidemail;
    } else {
      return null;
    }
  }
}
