import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/activity/HomeActivityMobile.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/StringsRes.dart';

class PaymentSuccessActivityMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PaymentSuccessActivityMobileState();
  }
}

class PaymentSuccessActivityMobileState
    extends State<PaymentSuccessActivityMobile> {
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
    return Scaffold(
      backgroundColor: ColorsRes.bgPage,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: ColorsRes.appcolor, //change your color here
        ),
        title: Text(
          StringsRes.Payment_Methods_lb,
          style: TextStyle(color: ColorsRes.introTitlecolor, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: new Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
                "assets/images/fullApps/eStudy/payment_success.svg",
                color: ColorsRes.appcolor),
            SizedBox(
              height: 14.9,
            ),
            Text(
              StringsRes.Payment_Successfull_lb,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Nunito-Regular',
                  fontSize: 38,
                  color: ColorsRes.introTitlecolor),
            ),
            SizedBox(
              height: 65,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(StringsRes.Payment_Detail_lb,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Nunito-Regular',
                      fontSize: 14,
                      color: ColorsRes.lightgraycolor)),
            ),
            SizedBox(height: 65),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => HomeActivityMobile()));
                },
                child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: const [
                            ColorsRes.secondgradientcolor,
                            ColorsRes.firstgradientcolor,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      StringsRes.Goto_Home_button_lb,
                      style: TextStyle(color: ColorsRes.white, fontSize: 20),
                    ))),
          ],
        ),
      ),
    );
  }
}
