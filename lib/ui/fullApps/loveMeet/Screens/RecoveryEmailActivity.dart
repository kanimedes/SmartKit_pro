import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/StringsRes.dart';

class RecoveryEmailActivity extends StatefulWidget {
  const RecoveryEmailActivity({Key? key}) : super(key: key);

  @override
  _RecoveryEmailActivityState createState() => _RecoveryEmailActivityState();
}

class _RecoveryEmailActivityState extends State<RecoveryEmailActivity> {
  final bool _conobscureText = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return navigationPage() as Future<bool>;
      },
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
                        height: 50.0,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(
                            StringsRes.recoveryEmailTitleText,
                            style: TextStyle(
                                color: ColorsRes.gradientTwo,
                                fontWeight: FontWeight.normal,
                                fontSize: 50),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text(
                          StringsRes.recoveryEmailDescriptionText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorsRes.darkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(
                            StringsRes.emailText,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorsRes.gradientTwo,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        decoration: DesignConfig.boxDecorationContainer(
                            ColorsRes.white, 10),
                        child: Container(
                          height: 61,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                            style: TextStyle(
                                color: ColorsRes.darkColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            cursorColor: ColorsRes.darkColor,
                            decoration: InputDecoration(
                              hintText: StringsRes.enterEmailText,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .merge(TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: ColorsRes.darkColor)),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                      SizedBox(height: 80),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            decoration: DesignConfig.boxDecorationButton(
                                ColorsRes.gradientOne, ColorsRes.gradientTwo),
                            margin: EdgeInsets.only(right: 20, left: 20),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            alignment: Alignment.center,
                            child: Text(StringsRes.continueText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsRes.white,
                                ))),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            decoration: DesignConfig.boxDecorationButton(
                                ColorsRes.white, ColorsRes.white),
                            margin: EdgeInsets.only(right: 20, left: 20),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            alignment: Alignment.center,
                            child: Text(StringsRes.skipText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsRes.grayColor,
                                ))),
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
    Navigator.pop(context);
  }
}
