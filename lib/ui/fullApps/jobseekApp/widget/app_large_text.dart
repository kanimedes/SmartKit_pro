import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final int? maxlines;
  AppLargeText(
      {Key? key,
      this.size = 30,
      required this.text,
      this.color = Colors.black,
      this.maxlines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.none),
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
