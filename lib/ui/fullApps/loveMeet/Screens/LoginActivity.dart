import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/EmailLoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/MobileNumbeInputActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/ProfilePictureActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/StringsRes.dart';

class LoginActivity extends StatefulWidget {
  const LoginActivity({Key? key}) : super(key: key);

  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: ColorsRes.backgroundColor,
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/fullApps/loveMeet/Logo.svg',
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Text(
                        StringsRes.signInTextText,
                        style: TextStyle(
                            color: ColorsRes.darkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePictureActivity(),
                            ),
                          );
                        },
                        child: Container(
                            decoration: DesignConfig.boxDecorationButton(
                                ColorsRes.gradientOne, ColorsRes.gradientTwo),
                            margin: EdgeInsets.only(right: 20, left: 20),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            alignment: Alignment.center,
                            child: Text(StringsRes.facebookText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsRes.white,
                                ))),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MobileNumbeInputActivity(),
                            ),
                          );
                        },
                        child: Container(
                            decoration: DesignConfig.boxDecorationButton(
                                ColorsRes.white, ColorsRes.white),
                            margin: EdgeInsets.only(right: 20, left: 20),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            alignment: Alignment.center,
                            child: Text(StringsRes.loginWithPhoneText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsRes.gradientTwo,
                                ))),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmailLoginActivity(),
                            ),
                          );
                        },
                        child: Container(
                            decoration: DesignConfig.boxDecorationButton(
                                ColorsRes.white, ColorsRes.white),
                            margin: EdgeInsets.only(right: 20, left: 20),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            alignment: Alignment.center,
                            child: Text(StringsRes.loginWithEmailText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsRes.gradientTwo,
                                ))),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Row(children: [
                        Expanded(
                            child: Divider(
                          thickness: 1,
                          color: ColorsRes.darkColor,
                          indent: 15,
                          endIndent: 15,
                        )),
                        Text(
                          StringsRes.orLoginWithText,
                          style: TextStyle(
                              color: ColorsRes.gradientTwo,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1,
                          color: ColorsRes.darkColor,
                          indent: 15,
                          endIndent: 15,
                        )),
                      ]),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //Navigator.pop(context);
                              },
                              child: Container(
                                  decoration: DesignConfig.boxDecorationButton(
                                      ColorsRes.white, ColorsRes.white),
                                  margin: EdgeInsets.only(right: 20, left: 20),
                                  padding: EdgeInsets.all(15),
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                      "assets/images/fullApps/loveMeet/insta.svg")),
                            ),
                            GestureDetector(
                              onTap: () {
                                //Navigator.pop(context);
                              },
                              child: Container(
                                  decoration: DesignConfig.boxDecorationButton(
                                      ColorsRes.white, ColorsRes.white),
                                  margin: EdgeInsets.only(right: 20, left: 20),
                                  padding: EdgeInsets.all(15),
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                      "assets/images/fullApps/loveMeet/twitter.svg")),
                            ),
                            GestureDetector(
                              onTap: () {
                                //Navigator.pop(context);
                              },
                              child: Container(
                                  decoration: DesignConfig.boxDecorationButton(
                                      ColorsRes.white, ColorsRes.white),
                                  margin: EdgeInsets.only(right: 20, left: 20),
                                  padding: EdgeInsets.all(15),
                                  alignment: Alignment.center,
                                  child: SvgPicture.asset(
                                      "assets/images/fullApps/loveMeet/google.svg")),
                            ),
                          ]),
                      SizedBox(
                        height: 35.0,
                      ),
                      Text(
                        StringsRes.termsServicesPrivacyPolicyText,
                        style: TextStyle(
                            color: ColorsRes.darkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginActivity(),
      ),
    );
  }
}
