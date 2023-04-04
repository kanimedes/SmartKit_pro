import 'dart:io';
import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/StringsRes.dart';

class DesignConfig {
  static BoxDecoration boxDecorationIntroductionColor(
      Color color1, Color color2, double sizes) {
    return BoxDecoration(
      gradient: LinearGradient(colors: [
        color1,
        color2,
      ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(sizes),
        topRight: Radius.circular(sizes),
      ),
    );
  }

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

  static BoxDecoration boxDecorationLeafButtonColor(
      Color color1, Color color2, double sizes) {
    return BoxDecoration(
      gradient: LinearGradient(colors: [
        color1,
        color2,
      ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(sizes),
        bottomRight: Radius.circular(sizes),
      ),
    );
  }

  static drawer(GlobalKey<ScaffoldState> _scaffoldKey, BuildContext context) {
    return Container(
      width: 300,
      height: double.infinity,
      decoration: BoxDecoration(
        color: ColorsRes.white.withOpacity(0.4),
        boxShadow: [
          BoxShadow(
            color: ColorsRes.white.withOpacity(0.4),
            blurRadius: 8.0,
          )
        ],
      ),
      child: Stack(
        children: [
          SizedBox(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4.0,
                  sigmaY: 4.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.grey.withOpacity(0.0),
                    Colors.white.withOpacity(0.2),
                  ])),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 20.5,
                    bottom: MediaQuery.of(context).size.height / 15.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_scaffoldKey.currentState!.isDrawerOpen) {
                          Navigator.of(context).pop();
                        } else {
                          _scaffoldKey.currentState!.openDrawer();
                        }
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Platform.isIOS ? BackButton() : Text(""),
                            Container(
                                padding: EdgeInsets.all(10.0),
                                margin: EdgeInsets.only(left: 20.0),
                                decoration:
                                    DesignConfig.boxDecorationButtonColor(
                                        ColorsRes.white.withOpacity(0.6),
                                        ColorsRes.white.withOpacity(0.7),
                                        50),
                                child:
                                    Icon(Icons.close, color: ColorsRes.black)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                          StringsRes.menuText,
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorsRes.bottomColor,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ))
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 1, vertical: -2),
                      onTap: () {},
                      title: Text(
                        StringsRes.myAccountText,
                        style: TextStyle(
                            fontSize: 25,
                            color: ColorsRes.iconColor,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    ListTile(
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 1, vertical: -2),
                      onTap: () {},
                      title: Text(
                        StringsRes.notificationText,
                        style: TextStyle(
                            fontSize: 25,
                            color: ColorsRes.iconColor,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    ListTile(
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 1, vertical: -2),
                      onTap: () {},
                      title: Text(
                        StringsRes.myTripsText,
                        style: TextStyle(
                            fontSize: 25,
                            color: ColorsRes.iconColor,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    ListTile(
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 1, vertical: -2),
                      onTap: () {},
                      title: Text(
                        StringsRes.languageText,
                        style: TextStyle(
                            fontSize: 25,
                            color: ColorsRes.iconColor,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    ListTile(
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 1, vertical: -2),
                      onTap: () {},
                      title: Text(
                        StringsRes.settingsText,
                        style: TextStyle(
                            fontSize: 25,
                            color: ColorsRes.iconColor,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 60),
                    ListTile(
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 1, vertical: -2),
                      onTap: () {},
                      title: Text(
                        StringsRes.blogText,
                        style: TextStyle(
                            fontSize: 20,
                            color: ColorsRes.bottomColor,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    ListTile(
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 1, vertical: -2),
                      onTap: () {},
                      title: Text(
                        StringsRes.faqText,
                        style: TextStyle(
                            fontSize: 20,
                            color: ColorsRes.bottomColor,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    ListTile(
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 1, vertical: -2),
                      onTap: () {},
                      title: Text(
                        StringsRes.privacyPolicyText,
                        style: TextStyle(
                            fontSize: 20,
                            color: ColorsRes.bottomColor,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    ListTile(
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 1, vertical: -2),
                      onTap: () {},
                      title: Text(
                        StringsRes.termsConditionsText,
                        style: TextStyle(
                            fontSize: 20,
                            color: ColorsRes.bottomColor,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    ListTile(
                      dense: true,
                      visualDensity: VisualDensity(horizontal: 1, vertical: -4),
                      onTap: () {},
                      title: Text(
                        StringsRes.contactUsText,
                        style: TextStyle(
                            fontSize: 20,
                            color: ColorsRes.bottomColor,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
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
