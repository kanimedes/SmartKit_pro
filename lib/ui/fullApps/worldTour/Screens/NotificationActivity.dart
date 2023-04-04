import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBox.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBoxFull.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/StringsRes.dart';

class NotificationActivity extends StatefulWidget {
  const NotificationActivity({Key? key}) : super(key: key);

  @override
  _NotificationActivityState createState() => _NotificationActivityState();
}

class _NotificationActivityState extends State<NotificationActivity> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: GlassBoxFull(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/fullApps/worldTour/svg/no_notification.svg",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      StringsRes.noNotificationFoundText,
                      style: TextStyle(
                          color: ColorsRes.bottomColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      StringsRes.notificationSubTitleText,
                      style: TextStyle(
                          color: ColorsRes.bottomColor,
                          fontWeight: FontWeight.normal,
                          fontSize: 18),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          decoration: DesignConfig.boxDecorationButtonColor(
                              ColorsRes.blueColor, ColorsRes.blueColor, 20),
                          margin: EdgeInsets.only(
                              left: 30.0, top: 30.0, right: 30.0),
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Text(
                            StringsRes.letsStartExploringText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsRes.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.only(top: 25.0, left: 10.0),
                    child: GlassBox(
                        redius: 40.0,
                        width: 50,
                        height: 50,
                        child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.arrow_back_ios_sharp,
                                  color: ColorsRes.bottomColor),
                            )))),
              ),
            ),
          ])),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
