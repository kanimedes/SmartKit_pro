import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/Widget/GoRideRatingWidget.dart';

class GoRideConstant {
  static String getPngImagePath(String imageName) {
    return "assets/goRide/image/$imageName";
  }

  static String getSvgImagePath(String imageName) {
    return "assets/images/fullApps/goRide/$imageName";
  }

  static BoxDecoration boxDecorationContainer(Color color, bool shadow) {
    return shadow
        ? BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 25.0,
              ),
            ],
          )
        : BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
          );
  }

  static Widget displayRating(String rating, bool isfullratingbar) {
    return TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 60),
        duration: Duration(milliseconds: 1000),
        builder: (context, double size, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              isfullratingbar
                  ? RatingBarIndicator(
                      rating: double.parse(rating),
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        size: 20,
                        color: GoRideColors.yellow,
                      ),
                      itemCount: 5,
                      itemSize: 40,
                      direction: Axis.horizontal,
                    )
                  : Icon(
                      Icons.star,
                      size: 20,
                      color: Color(0xffebebeb),
                    ),
            ],
          );
        });
  }
}
