// ignore_for_file: empty_catches

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopString.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/widget/HappyShopbtn.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'HappyShopHome.dart';

class HappyShopMobailVerification extends StatefulWidget {
  const HappyShopMobailVerification({Key? key}) : super(key: key);

  @override
  _HappyShopMobailVerificationState createState() =>
      _HappyShopMobailVerificationState();
}

class _HappyShopMobailVerificationState
    extends State<HappyShopMobailVerification> with TickerProviderStateMixin {
  final dataKey = new GlobalKey();
  String? password,
      mobile,
      username,
      email,
      id,
      city,
      area,
      pincode,
      address,
      mobileno,
      countrycode,
      name,
      latitude,
      longitude,
      dob;
  String? otp;
  bool isCodeSent = false;
  String signature = "";

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Animation? buttonSqueezeanimation;
  AnimationController? buttonController;

  @override
  void initState() {
    super.initState();
    getSingature();
    buttonController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);

    buttonSqueezeanimation = new Tween(
      begin: deviceWidth * 0.7,
      end: 50.0,
    ).animate(new CurvedAnimation(
      parent: buttonController!,
      curve: new Interval(
        0.0,
        0.150,
      ),
    ));
  }

  Future<void> getSingature() async {
    signature = await SmsAutoFill().getAppSignature;
    SmsAutoFill().listenForCode;
  }

  verifyBtn() {
    return AppBtn(
        title: VERIFY_AND_PROCEED,
        btnAnim: buttonSqueezeanimation,
        btnCntrl: buttonController,
        onBtnSelected: () async {
          checkNetwork();
        });
  }

  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 1.0,
    ));
  }

  Future<void> checkNetwork() async {
    _playAnimation();
    Future.delayed(Duration(milliseconds: 500)).then((_) async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HappyShopHome()));
      await buttonController!.reverse();
    });
  }

  Future<void> _playAnimation() async {
    try {
      await buttonController!.forward();
    } on TickerCanceled {}
  }

  getImage() {
    return Container(
      padding: EdgeInsets.only(top: 100.0),
      child: Center(
        child: new SvgPicture.asset(
          'assets/images/fullApps/happyshop/happyshopwhitelogo.svg',
          width: 80.0,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  void dispose() {
    buttonController!.dispose();
    super.dispose();
  }

  monoVarifyText() {
    return Padding(
        padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        child: Center(
          child: new Text(MOBILE_NUMBER_VARIFICATION,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: lightblack)),
        ));
  }

  otpText() {
    return Padding(
        padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Center(
          child: new Text(ENTER_YOUR_OTP_SENT_TO,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: lightblack, fontStyle: FontStyle.normal)),
        ));
  }

  mobText() {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.0, left: 20.0, right: 20.0, top: 10.0),
      child: Center(
        child: Text("0123456789",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: lightblack)),
      ),
    );
  }

  otpLayout() {
    return Padding(
        padding: EdgeInsets.only(left: 80.0, right: 80.0, top: 10.0),
        child: Center(
            child: PinFieldAutoFill(
                decoration: UnderlineDecoration(
                  textStyle: TextStyle(fontSize: 20, color: Colors.black),
                  colorBuilder: FixedColorBuilder(primaryLight2),
                ),
                currentCode: otp,
                codeLength: 6,
                onCodeChanged: (String? code) {
                  otp = code;
                },
                onCodeSubmitted: (String code) {
                  otp = code;
                })));
  }

  resendText() {
    return Padding(
      padding:
          EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0, top: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DIDNT_GET_THE_CODE,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: lightblack2, fontWeight: FontWeight.normal),
          ),
          InkWell(
              onTap: () {},
              child: Text(
                RESEND_OTP,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: primary, decoration: TextDecoration.underline),
              ))
        ],
      ),
    );
  }

  expandedBottomView() {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
        child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: width,
                    padding: EdgeInsets.only(top: 50.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      margin: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          monoVarifyText(),
                          otpText(),
                          mobText(),
                          otpLayout(),
                          verifyBtn(),
                          resendText(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  back() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [primaryLight2, primaryLight3],
          stops: const [0, 1]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: back(),
            child: Center(
              child: Column(
                children: <Widget>[
                  getImage(),
                  expandedBottomView(),
                ],
              ),
            )));
  }
}
