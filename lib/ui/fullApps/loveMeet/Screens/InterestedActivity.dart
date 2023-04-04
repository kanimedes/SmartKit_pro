import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/MainActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/StringsRes.dart';

class InterestedActivity extends StatefulWidget {
  const InterestedActivity({Key? key}) : super(key: key);

  @override
  _InterestedActivityState createState() => _InterestedActivityState();
}

class _InterestedActivityState extends State<InterestedActivity> {
  String gender = StringsRes.maleText;
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
                      SizedBox(
                        height: 35.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text(
                          StringsRes.whatAreYouInterestedText,
                          style: TextStyle(
                              color: ColorsRes.gradientTwo,
                              fontWeight: FontWeight.bold,
                              fontSize: 50),
                        ),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Column(children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = StringsRes.maleText;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 20, left: 20),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            decoration: gender == StringsRes.maleText
                                ? DesignConfig.boxDecorationButton(
                                    ColorsRes.gradientOne,
                                    ColorsRes.gradientTwo)
                                : DesignConfig.boxDecorationButton(
                                    ColorsRes.white, ColorsRes.white),
                            child: Text(
                              StringsRes.maleText,
                              style: TextStyle(
                                color: gender == StringsRes.maleText
                                    ? ColorsRes.white
                                    : ColorsRes.darkColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = StringsRes.femaleText;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 20, left: 20),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            decoration: gender == StringsRes.femaleText
                                ? DesignConfig.boxDecorationButton(
                                    ColorsRes.gradientOne,
                                    ColorsRes.gradientTwo)
                                : DesignConfig.boxDecorationButton(
                                    ColorsRes.white, ColorsRes.white),
                            child: Text(
                              StringsRes.femaleText,
                              style: TextStyle(
                                color: gender == StringsRes.femaleText
                                    ? ColorsRes.white
                                    : ColorsRes.darkColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              gender = StringsRes.everyoneText;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 20, left: 20),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            decoration: gender == StringsRes.everyoneText
                                ? DesignConfig.boxDecorationButton(
                                    ColorsRes.gradientOne,
                                    ColorsRes.gradientTwo)
                                : DesignConfig.boxDecorationButton(
                                    ColorsRes.white, ColorsRes.white),
                            child: Text(
                              StringsRes.everyoneText,
                              style: TextStyle(
                                color: gender == StringsRes.everyoneText
                                    ? ColorsRes.white
                                    : ColorsRes.darkColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(height: 60),
                      GestureDetector(
                        onTap: () {
                          //Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainActivity(),
                            ),
                          );
                        },
                        child: Container(
                            decoration: DesignConfig.boxDecorationButton(
                                ColorsRes.gradientOne, ColorsRes.gradientTwo),
                            margin: EdgeInsets.only(right: 20, left: 20),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            alignment: Alignment.center,
                            child: Text(StringsRes.doneText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsRes.white,
                                ))),
                      ),
                      SizedBox(
                        height: 35.0,
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
