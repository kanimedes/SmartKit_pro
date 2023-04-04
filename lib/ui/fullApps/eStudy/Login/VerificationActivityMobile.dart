import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/activity/HomeActivityMobile.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/StringsRes.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerificationActivityMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new VerificationActivityMobileState();
  }
}

class VerificationActivityMobileState
    extends State<VerificationActivityMobile> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: ColorsRes.bgPage,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: ColorsRes.appcolor,
        ),
        title: Text(
          StringsRes.Verification_lb,
          style: TextStyle(color: ColorsRes.introTitlecolor, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                StringsRes.Verification_Code_Title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Nunito-Regular',
                    fontSize: 24,
                    color: ColorsRes.introMessagecolor),
              )),
          SizedBox(height: 35),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 61,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10),
              child: Padding(
                  padding: EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                  ),
                  child: Center(
                      child: PinFieldAutoFill(
                          decoration: BoxLooseDecoration(
                            strokeColorBuilder:
                                FixedColorBuilder(ColorsRes.introMessagecolor),
                            bgColorBuilder: FixedColorBuilder(ColorsRes.white),
                            radius: Radius.circular(10.0),
                            textStyle:
                                TextStyle(fontSize: 20, color: ColorsRes.black),
                          ),
                          codeLength: 4,
                          onCodeChanged: (String? code) {},
                          onCodeSubmitted: (String code) {}))),
            ),
          ),
          SizedBox(height: 69),
          TextButton(
              onPressed: () {},
              child: Text(
                StringsRes.Did_Not_Receive_A_Code_lb,
                style:
                    TextStyle(color: ColorsRes.introMessagecolor, fontSize: 20),
              )),
          SizedBox(height: 12),
          TextButton(
              onPressed: () {},
              child: Text(
                StringsRes.Resend_lb,
                style: TextStyle(color: ColorsRes.appcolor, fontSize: 20),
              )),
          SizedBox(height: 43),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => HomeActivityMobile()),
                    (Route<dynamic> route) => false);

                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeActivity()));
              },
              child: Container(
                  padding: EdgeInsets.only(left: 65),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.center,
                  height: 65,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: const [
                      ColorsRes.secondgradientcolor,
                      ColorsRes.firstgradientcolor,
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringsRes.Continue_Button_lb,
                          style:
                              TextStyle(color: ColorsRes.white, fontSize: 20),
                        ),
                        SizedBox(width: 65),
                        Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                                "assets/images/fullApps/eStudy/continue.svg"))
                      ]))),
        ],
      ),
    );
  }
}
