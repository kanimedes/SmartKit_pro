import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/SignInActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/SignUpActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class LoginActivity extends StatefulWidget {
  const LoginActivity({Key? key}) : super(key: key);

  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  String status = StringsRes.signInText;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        toolbarHeight: 0,
        backgroundColor: ColorsRes.backgroundColor,
        shadowColor: ColorsRes.backgroundColor,
      ),
      backgroundColor: ColorsRes.backgroundColor,
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(
              "assets/images/fullApps/playMedia/svg/bg01.svg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(children: [
                    Text(StringsRes.welcomeBackText,
                        style: TextStyle(
                            fontSize: 30,
                            color: ColorsRes.yellowColor,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: MediaQuery.of(context).size.height / 4),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          status = StringsRes.signInText;
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInActivity(),
                            ),
                          );
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 20, left: 20, top: 20.0),
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        decoration: status == StringsRes.signInText
                            ? DesignConfig.boxDecorationButtonColor(
                                ColorsRes.yellowColor,
                                ColorsRes.yellowColor,
                                50)
                            : DesignConfig.boxDecorationBorderButtonColor(
                                ColorsRes.yellowColor, 50),
                        child: Text(
                          StringsRes.signInText,
                          style: TextStyle(
                            color: status == StringsRes.signInText
                                ? ColorsRes.white
                                : ColorsRes.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          status = StringsRes.signUpText;
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpActivity(),
                            ),
                          );
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 20, left: 20, top: 20.0),
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        decoration: status == StringsRes.signUpText
                            ? DesignConfig.boxDecorationButtonColor(
                                ColorsRes.yellowColor,
                                ColorsRes.yellowColor,
                                50)
                            : DesignConfig.boxDecorationBorderButtonColor(
                                ColorsRes.yellowColor, 50),
                        child: Text(
                          StringsRes.signUpText,
                          style: TextStyle(
                            color: status == StringsRes.signUpText
                                ? ColorsRes.white
                                : ColorsRes.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 5),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(StringsRes.signInWithSocialMediaText,
                          style: TextStyle(
                              fontSize: 18,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.normal)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.asset(
                                  "assets/images/fullApps/playMedia/svg/twitter.svg",
                                  height: 50,
                                  width: 50),
                            )),
                        GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.asset(
                                  "assets/images/fullApps/playMedia/svg/facebook.svg",
                                  height: 50,
                                  width: 50),
                            )),
                        GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SvgPicture.asset(
                                  "assets/images/fullApps/playMedia/svg/linkedin.svg",
                                  height: 50,
                                  width: 50),
                            ))
                      ],
                    )
                  ]),
                ],
              ),
            ),
          )
        ],
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
