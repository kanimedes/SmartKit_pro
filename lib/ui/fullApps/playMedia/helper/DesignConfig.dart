import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';

import '../../furnitureHub/helper/flutter_rating_bar.dart';

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

  static BoxDecoration boxDecorationBorderButtonColor(
      Color color, double sizes) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(sizes),
        border: Border.all(color: color, width: 1));
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
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
      child: Row(
        children: <Widget>[
          isfullratingbar
              ? RatingBarIndicator(
                  rating: double.parse(rating),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 14,
                  direction: Axis.horizontal,
                )
              : Icon(
                  Icons.star,
                  size: 14,
                  color: Colors.amber,
                ),
          Text(
            "\t\t$rating",
            style:
                TextStyle(color: ColorsRes.white, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  static Widget displayRatingFull(String? rating, bool isfullratingbar) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
      child: Row(
        children: <Widget>[
          isfullratingbar
              ? RatingBarIndicator(
                  rating: double.parse(rating!),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 14,
                  direction: Axis.horizontal,
                )
              : Icon(
                  Icons.star,
                  size: 14,
                  color: Colors.amber,
                ),
          //Text("\t\t${item.rate}",style: TextStyle(color: ColorsRes.white,fontWeight: FontWeight.w400),),
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
