import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/flutter_rating_bar.dart';

class DesignConfig {
  static RoundedRectangleBorder setRoundedBorder(
      Color bordercolor, double bradius, bool issetside) {
    return RoundedRectangleBorder(
        side: BorderSide(color: bordercolor, width: 0),
        borderRadius: BorderRadius.circular(bradius));
  }

  static BoxDecoration boxDecorationButton(Color color1, Color color2) {
    return BoxDecoration(
      gradient: LinearGradient(colors: [
        color1,
        color2,
      ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      borderRadius: BorderRadius.circular(10),
    );
  }

  static BoxDecoration boxDecorationContainer(Color color, double radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration boxDecorationHalfContainer(Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            10.0,
          ),
          topRight: Radius.circular(10.0)),
    );
  }

  static BoxDecoration boxDecorationBorderButtonColor(
      Color color, double sizes) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(sizes),
        border: Border.all(color: color, width: 1));
  }

  static BoxDecoration circleButton() {
    return BoxDecoration(
        shape: BoxShape.circle, color: ColorsRes.greyColor.withOpacity(0.50));
  }

  static BoxDecoration boxDecorationButtonColor(
      Color color1, Color color2, double sizes) {
    return BoxDecoration(
      gradient: LinearGradient(colors: [
        color1,
        color2,
      ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      borderRadius: BorderRadius.circular(sizes),
    );
  }

  static BoxDecoration buttonShadowColor(Color btncolor, double radius) {
    return BoxDecoration(
      color: btncolor,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: const [
        BoxShadow(
          color: Color(0x29000000),
          spreadRadius: 0,
          blurRadius: 2,
          offset: Offset(0, 3),
        )
      ],
    );
  }

  static BoxDecoration halfCurve(
      Color btncolor, double radius1, double radius2) {
    return BoxDecoration(
      color: btncolor,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius1),
          topRight: Radius.circular(radius2)),
      boxShadow: const [
        BoxShadow(
          color: Color(0x29000000),
          spreadRadius: 0,
          blurRadius: 10,
          offset: Offset(2, 2),
        )
      ],
    );
  }

  static BoxDecoration buttonShadowDetalColor(Color btncolor, double radius) {
    return BoxDecoration(
      color: btncolor,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: const [
        BoxShadow(
          color: Color(0x29000000),
          spreadRadius: 0,
          blurRadius: 10,
          offset: Offset(2, 2),
        )
      ],
    );
  }

  static BoxDecoration buttonShadow(Color btncolor, double radius) {
    return BoxDecoration(
      color: btncolor,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: const [
        BoxShadow(
          color: Color(0x29000000),
          spreadRadius: 0,
          blurRadius: 8,
          offset: Offset(0, 2),
        )
      ],
    );
  }

  static BoxDecoration buttonShadowColorListColor(Color btncolor) {
    return BoxDecoration(
      color: btncolor,
      shape: BoxShape.circle,
      boxShadow: const [
        BoxShadow(
          color: Color(0x29000000),
          spreadRadius: 0,
          blurRadius: 10,
          offset: Offset(2, 2),
        )
      ],
    );
  }

  static Widget displayCourseImage(String image, double height, double width) {
    return Image.asset(
      image,
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }

  static Widget displayRating(String rating, bool isfullratingbar) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 5),
      child: Row(
        children: <Widget>[
          isfullratingbar
              ? RatingBarIndicator(
                  rating: double.parse(rating),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: ColorsRes.ratingColor,
                  ),
                  itemCount: 5,
                  itemSize: 14,
                  direction: Axis.horizontal,
                )
              : Icon(
                  Icons.star,
                  size: 14,
                  color: ColorsRes.ratingColor,
                ),
          Text(
            "\t\t$rating",
            style: TextStyle(
                color: ColorsRes.greyColor, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  static Future<bool> checkInternet() async {
    bool check = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      //print("===check==true");
      // return true;
      check = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      //print("===check=***=true");
      //return true;
      check = true;
    }
    //print("===check==false");
    //return false;
    return check;
  }
}
