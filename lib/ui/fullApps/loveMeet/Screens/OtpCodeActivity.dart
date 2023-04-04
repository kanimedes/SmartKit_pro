import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/ProfilePictureActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/StringsRes.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpCodeActivity extends StatefulWidget {
  const OtpCodeActivity({Key? key}) : super(key: key);

  @override
  _OtpCodeActivityState createState() => _OtpCodeActivityState();
}

class _OtpCodeActivityState extends State<OtpCodeActivity> {
  String? countrycode;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Text(
                          StringsRes.enterCodeText,
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
                      child: Text.rich(TextSpan(
                          text: StringsRes.enterDigitCodeText,
                          style: TextStyle(
                              color: ColorsRes.darkColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          children: const <InlineSpan>[
                            TextSpan(
                              text: "+91 0000 000 000",
                              style: TextStyle(
                                  color: ColorsRes.gradientTwo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ])),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 61,
                        alignment: Alignment.center,
                        //padding: const EdgeInsets.only(left: 10),
                        child: Padding(
                            padding: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                            ),
                            child: Center(
                                child: PinFieldAutoFill(
                                    decoration: BoxLooseDecoration(
                                      strokeColorBuilder: FixedColorBuilder(
                                          ColorsRes.gradientTwo),
                                      bgColorBuilder:
                                          FixedColorBuilder(ColorsRes.white),
                                      radius: Radius.circular(10.0),
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          color: ColorsRes.gradientTwo),
                                    ),
                                    codeLength: 4,
                                    onCodeChanged: (String? code) {},
                                    onCodeSubmitted: (String code) {}))),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
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
                          child: Text(StringsRes.continueText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: ColorsRes.white,
                              ))),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
