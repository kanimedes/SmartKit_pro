import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final Color purpal = Color(0xff3d3270);
final Color purpalOpacity22 = purpal.withOpacity(0.22);

final Color smarKitcolor1 = Color(0xFFe59999);
final Color smarKitcolor2 = Color(0xFFFFFFFF);
final Color color1 = Color(0xFFFB2A59);
final Color color2 = Color(0xFF7E152D);
final Color color3 = Color(0xFF132735);
AppBarTheme appBarTheme() {
  return AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    elevation: 2.0,
    color: smarKitcolor2,
    toolbarTextStyle: TextStyle(
      color: Color(0xFF020202),
      fontSize: 22.0,
    ),
    iconTheme: IconThemeData(
      color: Color(0xFF020202),
    ),
  );
}

List<Color> tilecolor = [
  Color(0xFFF5F9F9),
  Color(0xFFFEF4F4),
  Color(0xFFFDF9FB),
  Color(0xFFF6F5FB),
];
List<Color> tileiconbgcolor = [
  Color(0xFFCDE4E4),
  Color(0xFFFCE0DB),
  Color(0xFFFBD7ED),
  Color(0xFFE8E5F3),
];
List<Color> tiletextcolor = [
  Color(0xFF469695),
  Color(0xFFFD3627),
  Color(0xFFC93F8D),
  Color(0xFF3C326F),
];
