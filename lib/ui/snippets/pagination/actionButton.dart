import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Action Buttons [<<, < , > , >>]
class ActionButton extends StatelessWidget {
  String svgPath;
  VoidCallback voidCallBack;
  double btnWidth;
  double btnHeight;

  ActionButton(
      {Key? key,
        required this.svgPath,
        required this.voidCallBack,
        required this.btnWidth,
        required this.btnHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallBack,
      child: SvgPicture.asset(
        svgPath,
        height: btnHeight,
        width: btnWidth,
      ),
    );
  }
}