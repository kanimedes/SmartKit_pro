import 'package:flutter/material.dart';

class TabItem {
  IconData? icon;
  String title;
  Color circleColor;
  TextStyle labelStyle;
  String image;

  TabItem(this.icon, this.title, this.circleColor,this.image,
      {this.labelStyle = const TextStyle(fontWeight: FontWeight.bold)});
}
