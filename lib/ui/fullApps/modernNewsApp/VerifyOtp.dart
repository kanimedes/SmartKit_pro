import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Color.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Session.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/String.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'ManagePref.dart';
import 'Privacy.dart';

class VerifyOtp extends StatefulWidget {
  String? verifyId, countryCode, mono;

  VerifyOtp({Key? key, this.verifyId, this.countryCode, this.mono})
      : super(key: key);

  @override
  VerifyOtpState createState() => VerifyOtpState();
}

class VerifyOtpState extends State<VerifyOtp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController phoneC = TextEditingController();
  String? phone, otp;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  int secondsRemaining = 60;
  bool enableResend = false;
  Timer? timer;
  String? id, name, email, pass, mobile, type, status, profile, confpass;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _resendCode() {
    setState(() {
      secondsRemaining = 60;
      enableResend = false;
    });
  }

  //set snackbar msg
  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).colorScheme.fontColor),
      ),
      backgroundColor: isDark! ? colors.tempdarkColor : colors.bgColor,
      elevation: 1.0,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            showContent(),
            showCircularProgress(isLoading, colors.primary)
          ],
        ));
  }

  //show form content
  showContent() {
    return SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(
            top: 80.0, bottom: 20.0, start: 50.0, end: 50.0),
        child: Form(
            key: _formkey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  otpVerifySet(),
                  otpSentSet(),
                  mblSet(),
                  otpFillSet(),
                  buildTimer(),
                  submitBtn(),
                  termPolicyTxt()
                ])));
  }

  otpVerifySet() {
    return Align(
        alignment: Alignment.center,
        child: Text(
          getTranslated(context, 'otpVerify_lbl')!,
          style: Theme.of(context).textTheme.headline5?.copyWith(
              color: colors.primary,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5),
          textAlign: TextAlign.center,
        ));
  }

  otpSentSet() {
    return Padding(
      padding: EdgeInsets.only(top: 55.0),
      child: Text(
        getTranslated(context, 'otpSent_lbl')!,
        style: Theme.of(context).textTheme.headline6?.copyWith(
              color: Theme.of(context).colorScheme.fontColor,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  mblSet() {
    return Padding(
      padding: EdgeInsets.only(top: 7.0),
      child: Text(
        "${widget.countryCode}\t${widget.mono}",
        style: Theme.of(context).textTheme.subtitle2?.copyWith(
              color: Theme.of(context).colorScheme.fontColor.withOpacity(0.8),
            ),
      ),
    );
  }

  otpFillSet() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 30.0),
        child: PinFieldAutoFill(
            decoration: BoxLooseDecoration(
                strokeColorBuilder: PinListenColorBuilder(
                    Theme.of(context).colorScheme.boxColor,
                    Theme.of(context).colorScheme.boxColor),
                bgColorBuilder: PinListenColorBuilder(
                    Theme.of(context).colorScheme.boxColor,
                    Theme.of(context).colorScheme.boxColor),
                gapSpace: 3.8),
            currentCode: otp,
            codeLength: 6,
            onCodeChanged: (String? code) {
              otp = code;
            },
            onCodeSubmitted: (String code) {
              otp = code;
            }));
  }

  buildTimer() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 100.0),
      child: secondsRemaining != 0
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(getTranslated(context, 'resendCode_lbl')!,
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .fontColor
                              .withOpacity(0.8),
                        )),
                Text('\t00:$secondsRemaining',
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: colors.primary,
                        )),
              ],
            )
          : TextButton(
              child: Text(getTranslated(context, 'resend_lbl')!,
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .fontColor
                            .withOpacity(0.8),
                        letterSpacing: 0.5,
                      )),
              onPressed: enableResend ? _resendCode : null,
            ),
    );
  }

  //navigate page route
  Future<void> navigationPage() async {
    bool isFirstTime = await getPrefrenceBool(ISFIRSTTIME);
    if (isFirstTime) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ManagePref(
                    from: 2,
                  )),
          (Route<dynamic> route) => false);
    }
  }

  submitBtn() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 20.0),
        child: InkWell(
            child: Container(
              height: 48.0,
              width: deviceWidth! * 0.6,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: colors.primary,
                  borderRadius: BorderRadius.circular(7.0)),
              child: Text(
                getTranslated(context, 'submit_btn')!,
                style: Theme.of(this.context).textTheme.headline6?.copyWith(
                    color: colors.tempboxColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 21,
                    letterSpacing: 0.5),
              ),
            ),
            onTap: () async {
              navigationPage();
            }));
  }

  //set term and policy text
  termPolicyTxt() {
    return Padding(
        padding: EdgeInsets.only(bottom: 30.0, top: 45.0),
        child: Column(children: <Widget>[
          Text(
            getTranslated(context, 'agreeTermPolicy_lbl')!,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color:
                      Theme.of(context).colorScheme.fontColor.withOpacity(0.7),
                ),
            textAlign: TextAlign.center,
          ),
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: Text(
                    getTranslated(context, 'term_lbl')!,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: colors.primary,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => PrivacyPolicy(
                                  title: getTranslated(context, 'term_cond')!,
                                  from:
                                      getTranslated(context, 'otpVerify_lbl')!,
                                )));
                  },
                ),
                Text(
                  getTranslated(context, 'and_lbl')!,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .fontColor
                            .withOpacity(0.7),
                      ),
                ),
                InkWell(
                  child: Text(
                    getTranslated(context, 'pri_policy')!,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: colors.primary,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => PrivacyPolicy(
                                  title:
                                      getTranslated(context, 'privacy_policy')!,
                                  from:
                                      getTranslated(context, 'otpVerify_lbl')!,
                                )));
                  },
                ),
              ])
        ]));
  }
}
