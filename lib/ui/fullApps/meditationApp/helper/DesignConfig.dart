import 'package:flutter/material.dart';

class DesignConfig {
  static RoundedRectangleBorder setRoundedBorder(
      Color bordercolor, double bradius, bool issetside) {
    return RoundedRectangleBorder(
        side: BorderSide(color: bordercolor, width: issetside ? 1.0 : 0),
        borderRadius: BorderRadius.circular(bradius));
  }

  static RoundedRectangleBorder setHalfRoundedBorder(
      Color bordercolor,
      double bradius1,
      double bradius2,
      double bradius3,
      double bradius4,
      bool issetside) {
    return RoundedRectangleBorder(
        side: BorderSide(color: bordercolor, width: issetside ? 1.0 : 0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(bradius1),
            bottomLeft: Radius.circular(bradius2),
            topRight: Radius.circular(bradius3),
            bottomRight: Radius.circular(bradius4)));
  }

  static BoxDecoration boxDecorationContainerRoundHalf(Color color,
      double bradius1, double bradius2, double bradius3, double bradius4) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bradius1),
          bottomLeft: Radius.circular(bradius2),
          topRight: Radius.circular(bradius3),
          bottomRight: Radius.circular(bradius4)),
    );
  }

  static BoxDecoration boxDecorationContainerShadow(Color color,
      double bradius1, double bradius2, double bradius3, double bradius4) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bradius1),
          bottomLeft: Radius.circular(bradius2),
          topRight: Radius.circular(bradius3),
          bottomRight: Radius.circular(bradius4)),
      boxShadow: [
        BoxShadow(
            color: color,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
            spreadRadius: 0)
      ],
    );
  }

  static BoxDecoration boxDecorationContainer(Color color, double radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration boxDecorationContainerborder(
      Color color, double radius) {
    return BoxDecoration(
      border: Border.all(color: color),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static const BoxShadow boxShadow = BoxShadow(
    color: Colors.black12,
    offset: Offset(3, 3),
    blurRadius: 5,
  );

  static BoxDecoration buttonShadow(
      Color btncolor, double radius, Color bordercolor) {
    return BoxDecoration(
        color: btncolor,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        border: Border.all(color: bordercolor),
        boxShadow: [
          BoxShadow(
            color: btncolor.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ]);
  }

  static BoxDecoration buttonShadowColor(
      Color btncolor1, double radius, Color btncolor2, Color btncolor3) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      boxShadow: const [
        BoxShadow(
          color: Color(0x33000000),
          spreadRadius: 0,
          blurRadius: 10,
          offset: Offset(5, 10),
        )
      ],
      gradient: LinearGradient(
        colors: [
          btncolor1,
          btncolor2,
          btncolor3,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0, 2, 2],
      ),
    );
  }

  static BoxDecoration buttonShadowPlayColor(
      Color btncolor1, double radius, Color btncolor2, Color btncolor3) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      boxShadow: const [
        BoxShadow(
          color: Color(0x33000000),
          spreadRadius: 0,
          blurRadius: 10,
          offset: Offset(5, -10),
        )
      ],
      gradient: LinearGradient(
        colors: [
          btncolor1,
          btncolor2,
          btncolor3,
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: const [0, 4, 4],
      ),
    );
  }

  static BoxDecoration boxDecorationHalfContainerShadow(Color color,
      double bradius1, double bradius2, double bradius3, double bradius4) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bradius1),
          bottomLeft: Radius.circular(bradius2),
          topRight: Radius.circular(bradius3),
          bottomRight: Radius.circular(bradius4)),
      boxShadow: [
        BoxShadow(
            color: color,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
            spreadRadius: 0)
      ],
    );
  }

  static Widget shadowButton(Color btncolor, String btntext, Color textcolor,
      double radius, Color bordercolor) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
        alignment: Alignment.center,
        decoration: buttonShadow(btncolor, radius, bordercolor),
        child: Text(
          btntext,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: textcolor,
          ),
        ),
      ),
    );
  }

  static Widget shadowButtonFullwidgth(Color btncolor, String btntext,
      Color textcolor, double radius, Color bordercolor, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      alignment: Alignment.center,
      decoration: buttonShadow(btncolor, radius, bordercolor),
      child: Text(
        btntext,
        style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
              fontWeight: FontWeight.bold,
              color: textcolor,
            )),
      ),
    );
  }
}
