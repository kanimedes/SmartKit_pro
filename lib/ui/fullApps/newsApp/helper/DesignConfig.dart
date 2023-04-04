import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ColorsRes.dart';

class DesignConfig {
  static RoundedRectangleBorder roundedrectangleshape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  );

  static RoundedRectangleBorder colorroundedrectangleshape =
      RoundedRectangleBorder(
          side: new BorderSide(color: ColorsRes.firstgradientcolor, width: 1.0),
          borderRadius: BorderRadius.circular(4.0));

  static RoundedRectangleBorder setRoundedBorder(
      Color bordercolor, double bradius, bool issetside) {
    return RoundedRectangleBorder(
        side: new BorderSide(color: bordercolor, width: issetside ? 1.0 : 0),
        borderRadius: BorderRadius.circular(bradius));
  }

  static BoxDecoration boxDecorationContainerColor(Color color, double radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration boxDecorationContainerBorder(
      Color color, double radius) {
    return BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: color, width: 0.5),
    );
  }

  static BoxDecoration boxDecorationContainerGradient(double radius) {
    return BoxDecoration(
      gradient: gradient,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: const [
        boxShadow,
      ],
    );
  }

  static const Gradient gradient = LinearGradient(colors: [
    ColorsRes.secondgradientcolor,
    ColorsRes.firstgradientcolor,
  ], stops: [
    0,
    1
  ], begin: Alignment(-0.98, -0.19), end: Alignment(0.98, 0.19)
      /*colors: [
      //ColorsRes.thirdgradientcolor,
      ColorsRes.secondgradientcolor,
      ColorsRes.appcolor
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,*/
      );

  static Widget setAppbar(String bartitle) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(
        color: ColorsRes.white,
      ),
      elevation: 3,
      backgroundColor: ColorsRes.appcolor,
      centerTitle: true,
      title: Text(bartitle,
          style:
              TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
    );
  }

  static const BoxShadow boxShadow = BoxShadow(
    color: Colors.black12,
    offset: Offset(3, 3),
    blurRadius: 5,
  );
}
