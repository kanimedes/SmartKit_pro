import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Demo_Localization.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/String.dart';
import 'package:shared_preferences/shared_preferences.dart';

//prefrence string set using this function
setPrefrence(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}

//prefrence string get using this function
Future<String?> getPrefrence(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

//prefrence boolean set using this function
setPrefrenceBool(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}

//prefrence boolean get using this function
Future<bool> getPrefrenceBool(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key) ?? false;
}

setPrefrenceList(String key, String query) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? valueList = await getPrefrenceList(key);
  if (!valueList!.contains(query)) {
    if (valueList.length > 4) valueList.removeAt(0);
    valueList.add(query);

    prefs.setStringList(key, valueList);
  }
}

Future<List<String>?> getPrefrenceList(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(key);
}

String placeHolder = "assets/news/images/placeholder.png";

//network image in error
errorWidget(double height, double width) {
  return Image.asset(
    "assets/news/images/placeholder.png",
    height: height,
    width: width,
  );
}

//set circular progress here
Widget showCircularProgress(bool _isProgress, Color color) {
  if (_isProgress) {
    return Center(
        child: CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(color),
    ));
  }
  return SizedBox(
    height: 0.0,
    width: 0.0,
  );
}

//set language code
Future<Locale> setLocale(String? languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode!);
  return _locale(languageCode);
}

//get language code
Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String? languageCode = _prefs.getString(LANGUAGE_CODE) ?? "en";
  return _locale(languageCode);
}

//change language code from list
Locale _locale(String languageCode) {
  switch (languageCode) {
    case "en":
      return Locale("en", "US");
    case "es":
      return Locale("es", "ES");
    case "hi":
      return Locale("hi", "IN");
    case "tr":
      return Locale("tr", "TR");
    case "pt":
      return Locale("pt", "PT");
    default:
      return Locale("en", "US");
  }
}

//translate string based on language code
String? getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context)!.translate(key);
}

//name validation check
String? nameValidation(String value, BuildContext context) {
  if (value.isEmpty) {
    return getTranslated(context, 'name_required')!;
  }
  if (value.length <= 1) {
    return getTranslated(context, 'name_length')!;
  }
  return null;
}

//email validation check
String? emailValidation(String value, BuildContext context) {
  if (value.isEmpty) {
    return getTranslated(context, 'email_required')!;
  } else if (!RegExp(
          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)"
          r"*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+"
          r"[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
      .hasMatch(value)) {
    return getTranslated(context, 'email_valid')!;
  } else {
    return null;
  }
}

//password validation check
String? passValidation(String value, BuildContext context) {
  if (value.isEmpty) {
    return getTranslated(context, 'pwd_required')!;
  } else if (value.length <= 5) {
    return getTranslated(context, 'pwd_length')!;
  } else {
    return null;
  }
}

String? mobValidation(String value, BuildContext context) {
  if (value.isEmpty) {
    return getTranslated(context, 'mbl_required')!;
  }
  if (value.length < 9) {
    return getTranslated(context, 'mbl_valid')!;
  }
  return null;
}
