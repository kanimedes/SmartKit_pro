import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Color.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Session.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/String.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/VerifyOtp.dart';

import 'Privacy.dart';

class RequestOtp extends StatefulWidget {
  @override
  RequestOtpState createState() => RequestOtpState();
}

class RequestOtpState extends State<RequestOtp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController phoneC = TextEditingController();
  String? phone, conCode, conName;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  CountryCode? code;
  String? verificationId;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                  enterMblSet(),
                  receiveDigitSet(),
                  setCodeWithMono(),
                  reqOtpBtn(),
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

  enterMblSet() {
    return Padding(
      padding: EdgeInsets.only(top: 35.0),
      child: Text(
        getTranslated(context, 'enterMbl_lbl')!,
        style: Theme.of(context).textTheme.headline6?.copyWith(
              color: Theme.of(context).colorScheme.fontColor,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  receiveDigitSet() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(
        getTranslated(context, 'receiveDigit_lbl')!,
        style: Theme.of(context).textTheme.subtitle2?.copyWith(
            color: Theme.of(context).colorScheme.fontColor.withOpacity(0.8),
            fontSize: 14),
      ),
    );
  }

  setCodeWithMono() {
    return Padding(
        padding: EdgeInsets.only(top: 30.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Theme.of(context).colorScheme.boxColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                setCountryCode(),
                setMono(),
              ],
            )));
  }

  setCountryCode() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
        height: 55,
        child: CountryCodePicker(
            boxDecoration: BoxDecoration(
              color: Theme.of(context).colorScheme.boxColor,
            ),
            searchDecoration: InputDecoration(
              hintStyle:
                  TextStyle(color: Theme.of(context).colorScheme.fontColor),
              fillColor: Theme.of(context).colorScheme.fontColor,
            ),
            initialSelection: 'IN',
            dialogSize: Size(width - 50, height - 50),
            builder: (CountryCode? code) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: 10.0, bottom: 10.0, start: 10.0, end: 4.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            code!.flagUri.toString(),
                            package: 'country_code_picker',
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ))),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 21,
                    color: Theme.of(context)
                        .colorScheme
                        .fontColor
                        .withOpacity(0.7),
                  ),
                  SizedBox(
                      width: 5.0,
                      height: 35.0,
                      child: VerticalDivider(
                        color: Theme.of(context)
                            .colorScheme
                            .fontColor
                            .withOpacity(0.7),
                        thickness: 2.0,
                      )),
                  Container(
                      width: 55.0,
                      padding: EdgeInsetsDirectional.only(start: 5.0),
                      alignment: Alignment.center,
                      child: Text(
                        code.dialCode.toString(),
                        style: Theme.of(this.context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .fontColor
                                  .withOpacity(0.7),
                            ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      )),
                ],
              );
            },
            onChanged: (CountryCode countryCode) {
              conCode = countryCode.dialCode;
              conName = countryCode.name;
            },
            onInit: (CountryCode? code) {
              conCode = code?.dialCode;
            }));
  }

  setMono() {
    double width = MediaQuery.of(context).size.width;
    return Container(
        height: 55,
        width: width - 245,
        alignment: Alignment.centerLeft,
        padding: EdgeInsetsDirectional.only(start: 2.0),
        child: TextFormField(
            keyboardType: TextInputType.phone,
            controller: phoneC,
            style: Theme.of(this.context).textTheme.subtitle1?.copyWith(
                  color:
                      Theme.of(context).colorScheme.fontColor.withOpacity(0.7),
                ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onSaved: (String? value) {
              phone = value;
            },
            decoration: InputDecoration(
              hintText: '999-999-9999',
              hintStyle: Theme.of(this.context).textTheme.subtitle1?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .fontColor
                        .withOpacity(0.7),
                  ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            )));
  }

  Future<void> verifyPhone() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => VerifyOtp(
                  verifyId: verificationId,
                  countryCode: conCode,
                  mono: phoneC.text.trim(),
                )));
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

  reqOtpBtn() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 120.0),
      child: InkWell(
        child: Container(
          height: 48.0,
          width: deviceWidth! * 0.6,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(7.0)),
          child: Text(
            getTranslated(context, 'reqOtp_lbl')!,
            style: Theme.of(this.context).textTheme.headline6?.copyWith(
                color: colors.tempboxColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontSize: 21),
          ),
        ),
        onTap: () async {
          verifyPhone();
        },
      ),
    );
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
                                  from: getTranslated(context, 'reqOtp_lbl')!,
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
                                  from: getTranslated(context, 'reqOtp_lbl')!,
                                )));
                  },
                ),
              ])
        ]));
  }
}
