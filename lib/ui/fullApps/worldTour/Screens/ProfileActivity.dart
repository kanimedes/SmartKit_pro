import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/NotificationActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBox.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBoxCurve.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBoxFull.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/StringsRes.dart';

class ProfileActivity extends StatefulWidget {
  const ProfileActivity({Key? key}) : super(key: key);

  @override
  _ProfileActivityState createState() => _ProfileActivityState();
}

class _ProfileActivityState extends State<ProfileActivity> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        extendBody: true,
        drawerScrimColor: Colors.transparent,
        drawer: DesignConfig.drawer(_scaffoldKey, context),
        body: GlassBoxFull(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
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
                  alignment: Alignment.topLeft,
                  child: Container(
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.only(left: 10.0, top: 25.0),
                      child: GlassBox(
                          redius: 40.0,
                          width: 50,
                          height: 50,
                          child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                    "assets/images/fullApps/worldTour/svg/drawer_icon.svg"),
                              )))),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationActivity(),
                    ),
                  );
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.only(right: 10.0, top: 25.0),
                      child: GlassBox(
                          redius: 40.0,
                          width: 50,
                          height: 50,
                          child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                    "assets/images/fullApps/worldTour/svg/notifications_icon.svg"),
                              )))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 8.6),
                child: Stack(children: [
                  // image set in circle
                  Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .01),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: ColorsRes.white.withOpacity(0.5),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: ClipOval(
                            child: OctoImage(
                              image: CachedNetworkImageProvider(
                                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fprofilepic.png?alt=media&token=af80c7e4-e14d-4645-b706-c651fb08116e"),
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                "LRHe%pIA.m_2KjxawKNGIWkWD*M{",
                              ),
                              errorBuilder: OctoError.icon(color: Colors.black),
                              width: 135,
                              height: 135,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      )),
                  //edit image
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .06,
                          left: MediaQuery.of(context).size.width * .52),
                      child: GestureDetector(
                        child: Container(
                            padding: EdgeInsets.all(15.0),
                            margin: EdgeInsets.only(top: 35.0, left: 20.0),
                            decoration: DesignConfig.boxDecorationButtonColor(
                                ColorsRes.white.withOpacity(0.8),
                                ColorsRes.white.withOpacity(0.6),
                                50),
                            child: SvgPicture.asset(
                                "assets/images/fullApps/worldTour/svg/camera.svg",
                                color: ColorsRes.bottomColor)),
                        onTap: () async {},
                      )),
                ]),
              ),
              SizedBox(
                height: 50.0,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 3.4),
                  child: Text(
                    StringsRes.nameText,
                    style: TextStyle(
                        fontSize: 35,
                        color: ColorsRes.bottomColor,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2.8),
                  child: Text(
                    StringsRes.locationText,
                    style: TextStyle(
                        fontSize: 18,
                        color: ColorsRes.iconColor,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.2),
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: 20.0),
                width: MediaQuery.of(context).size.width,
                child: GlassBoxCurve(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      color: ColorsRes.white.withOpacity(0.7),
                                      elevation: 5,
                                      shadowColor:
                                          ColorsRes.iconColor.withOpacity(0.5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              12,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5.5,
                                          padding: EdgeInsets.all(15.0),
                                          decoration: DesignConfig
                                              .boxDecorationButtonColor(
                                                  ColorsRes.white
                                                      .withOpacity(0.7),
                                                  ColorsRes.white
                                                      .withOpacity(0.6),
                                                  50),
                                          child: SvgPicture.asset(
                                              "assets/images/fullApps/worldTour/svg/purchase.svg")),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      StringsRes.purchasesText,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: ColorsRes.bottomColor,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      color: ColorsRes.white.withOpacity(0.7),
                                      elevation: 5,
                                      shadowColor:
                                          ColorsRes.iconColor.withOpacity(0.5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              12,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5.5,
                                          padding: EdgeInsets.all(15.0),
                                          decoration: DesignConfig
                                              .boxDecorationButtonColor(
                                                  ColorsRes.white
                                                      .withOpacity(0.7),
                                                  ColorsRes.white
                                                      .withOpacity(0.6),
                                                  50),
                                          child: SvgPicture.asset(
                                              "assets/images/fullApps/worldTour/svg/scan.svg")),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      StringsRes.scanText,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: ColorsRes.bottomColor,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      color: ColorsRes.white.withOpacity(0.7),
                                      elevation: 5,
                                      shadowColor:
                                          ColorsRes.iconColor.withOpacity(0.5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              12,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5.5,
                                          padding: EdgeInsets.all(15.0),
                                          decoration: DesignConfig
                                              .boxDecorationButtonColor(
                                                  ColorsRes.white
                                                      .withOpacity(0.7),
                                                  ColorsRes.white
                                                      .withOpacity(0.6),
                                                  50),
                                          child: SvgPicture.asset(
                                              "assets/images/fullApps/worldTour/svg/settings.svg")),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      StringsRes.settingsText,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: ColorsRes.bottomColor,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Card(
                                        color: ColorsRes.white.withOpacity(0.7),
                                        elevation: 5,
                                        shadowColor: ColorsRes.iconColor
                                            .withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                12,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5.5,
                                            padding: EdgeInsets.all(15.0),
                                            decoration: DesignConfig
                                                .boxDecorationButtonColor(
                                                    ColorsRes.white
                                                        .withOpacity(0.7),
                                                    ColorsRes.white
                                                        .withOpacity(0.6),
                                                    50),
                                            child: SvgPicture.asset(
                                                "assets/images/fullApps/worldTour/svg/payment.svg")),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        StringsRes.paymentText,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: ColorsRes.bottomColor,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Card(
                                        color: ColorsRes.white.withOpacity(0.7),
                                        elevation: 5,
                                        shadowColor: ColorsRes.iconColor
                                            .withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                12,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5.5,
                                            padding: EdgeInsets.all(15.0),
                                            decoration: DesignConfig
                                                .boxDecorationButtonColor(
                                                    ColorsRes.white
                                                        .withOpacity(0.7),
                                                    ColorsRes.white
                                                        .withOpacity(0.6),
                                                    50),
                                            child: SvgPicture.asset(
                                                "assets/images/fullApps/worldTour/svg/terms.svg")),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        StringsRes.termsText,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: ColorsRes.bottomColor,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Card(
                                        color: ColorsRes.white.withOpacity(0.7),
                                        elevation: 5,
                                        shadowColor: ColorsRes.iconColor
                                            .withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                12,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5.5,
                                            padding: EdgeInsets.all(15.0),
                                            margin: EdgeInsets.only(
                                              top: 0,
                                            ),
                                            decoration: DesignConfig
                                                .boxDecorationButtonColor(
                                                    ColorsRes.white
                                                        .withOpacity(0.7),
                                                    ColorsRes.white
                                                        .withOpacity(0.6),
                                                    50),
                                            child: SvgPicture.asset(
                                                "assets/images/fullApps/worldTour/svg/logout.svg")),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        StringsRes.logoutText,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: ColorsRes.bottomColor,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
