import 'package:flutter/material.dart';

class CircularButtonContainer extends StatelessWidget {
  final Color? backgroundColor;
  final Function onTap;
  final IconData iconData;
  final Color? iconColor;
  final double? iconSize;
  final double? buttonRadius;
  const CircularButtonContainer(
      {Key? key,
      this.backgroundColor,
      this.iconColor,
      this.buttonRadius,
      this.iconSize,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.5),
      child: GestureDetector(
        onTap: () async {
          onTap();
        },
        child: CircleAvatar(
          backgroundColor: backgroundColor ?? Colors.black,
          child: Icon(
            iconData,
            color: iconColor ?? Colors.white,
            size: iconSize ?? 40.0,
          ),
          radius: buttonRadius ?? 30.0,
        ),
      ),
    );
  }
}
