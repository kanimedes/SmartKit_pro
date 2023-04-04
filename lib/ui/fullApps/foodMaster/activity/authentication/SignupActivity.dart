import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/TermsConditionActivity.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';

import '../MainHomePage.dart';
import 'LoginActivity.dart';

class SignupActivity extends StatefulWidget {
  final String? from;
  const SignupActivity({
    Key? key,
    this.from,
  }) : super(key: key);
  @override
  _SignupActivityState createState() => _SignupActivityState();
}

class _SignupActivityState extends State<SignupActivity> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtname = TextEditingController();
  TextEditingController edtphone = TextEditingController();
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController edtcpsw = TextEditingController();
  TextEditingController forgotedtemail = TextEditingController();
  GlobalKey<ScaffoldState>? scaffoldKey;
  bool _obscureText = true, _conobscureText = true;
  bool acceptterms = false;
  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  Future<bool> _backPress() {
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _backPress,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: ColorsRes.backgroundColor,
          body: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 15,
                        left: 15,
                        right: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Card(
                          shape: DesignConfig.setRoundedBorder(
                              ColorsRes.white, 8, false),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: ColorsRes.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
                        padding:
                            EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.lblsignup,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .merge(TextStyle(
                                          color: ColorsRes.black,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              SizedBox(height: 15),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.lblname,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: ColorsRes.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                decoration:
                                    DesignConfig.boxDecorationContainerShadow(
                                        ColorsRes.containerShadowColor,
                                        14,
                                        14,
                                        14,
                                        14),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.lblname,
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: ColorsRes.grayColor
                                            .withOpacity(0.5)),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.text,
                                  controller: edtname,
                                ),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.lblemail,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: ColorsRes.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                decoration:
                                    DesignConfig.boxDecorationContainerShadow(
                                        ColorsRes.containerShadowColor,
                                        14,
                                        14,
                                        14,
                                        14),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.youremail,
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: ColorsRes.grayColor
                                            .withOpacity(0.5)),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: edtemail,
                                ),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.lblmobileno,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: ColorsRes.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                decoration:
                                    DesignConfig.boxDecorationContainerShadow(
                                        ColorsRes.containerShadowColor,
                                        14,
                                        14,
                                        14,
                                        14),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.lblmobileno,
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: ColorsRes.grayColor
                                            .withOpacity(0.5)),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.phone,
                                  controller: edtphone,
                                ),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.password,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: ColorsRes.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                decoration:
                                    DesignConfig.boxDecorationContainerShadow(
                                        ColorsRes.containerShadowColor,
                                        14,
                                        14,
                                        14,
                                        14),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  obscureText: _obscureText,
                                  controller: edtpsw,
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.password,
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: ColorsRes.grayColor
                                            .withOpacity(0.5)),
                                    border: InputBorder.none,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Icon(
                                        _obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: ColorsRes.grayColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.confirmpassword,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: ColorsRes.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                              Container(
                                decoration:
                                    DesignConfig.boxDecorationContainerShadow(
                                        ColorsRes.containerShadowColor,
                                        14,
                                        14,
                                        14,
                                        14),
                                margin: EdgeInsets.only(top: 2),
                                padding: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  obscureText: _conobscureText,
                                  controller: edtcpsw,
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.password,
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: ColorsRes.grayColor
                                            .withOpacity(0.5)),
                                    border: InputBorder.none,
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _conobscureText = !_conobscureText;
                                        });
                                      },
                                      child: Icon(
                                        _conobscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: ColorsRes.grayColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Transform.scale(
                                    scale: 0.9,
                                    child: Checkbox(
                                        value: acceptterms,
                                        onChanged: (value) => setState(() {
                                              acceptterms = !acceptterms;
                                            })),
                                  ),
                                  Flexible(
                                    child: RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: ColorsRes.grayColor),
                                            text: StringsRes.i_accept,
                                            children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  StringsRes.termsandcondition,
                                              style: TextStyle(
                                                  color: ColorsRes.orangeColor,
                                                  decoration:
                                                      TextDecoration.underline),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.of(context).push(
                                                      CupertinoPageRoute(
                                                          builder: (context) =>
                                                              TermsConditionActivity()));
                                                }),
                                          TextSpan(
                                              text:
                                                  "\t${StringsRes.Lbl_AND}\t"),
                                          TextSpan(
                                              text: StringsRes.privacypolicy,
                                              style: TextStyle(
                                                  color: ColorsRes.orangeColor,
                                                  decoration:
                                                      TextDecoration.underline),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  Navigator.of(context).push(
                                                      CupertinoPageRoute(
                                                          builder: (context) =>
                                                              TermsConditionActivity()));
                                                }),
                                        ])),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10, top: 20),
                                child: ButtonClickAnimation(
                                  onTap: () async {
                                    Constant.goToMainPage("login", context);
                                  },
                                  child: IntrinsicHeight(
                                    child: Container(
                                      height: 67.0,
                                      padding:
                                          EdgeInsets.only(top: 13, bottom: 13),
                                      //margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                      alignment: Alignment.center,
                                      decoration: DesignConfig.buttonShadowColor(
                                          ColorsRes
                                              .continueShoppingGradient1Color,
                                          37,
                                          ColorsRes
                                              .continueShoppingGradient2Color),
                                      child: Text(
                                        StringsRes.lblsignup,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: ColorsRes.white,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: "Poppins"),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(color: ColorsRes.black),
                                      text: StringsRes.alreadyhvac,
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: StringsRes.lblsignin,
                                        style: TextStyle(
                                            color: ColorsRes.orangeColor),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            if (widget.from == 'loginhome') {
                                              Navigator.of(context).push(
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          LoginActivity()));
                                            } else {
                                              Navigator.of(context).pop();
                                            }
                                          }),
                                  ])),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(children: [
                    Expanded(
                        child: Divider(
                      color: ColorsRes.black,
                      indent: 15,
                      endIndent: 15,
                    )),
                    Text(
                      StringsRes.signinwith,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .merge(TextStyle(color: ColorsRes.black)),
                    ),
                    Expanded(
                        child: Divider(
                      color: ColorsRes.black,
                      indent: 15,
                      endIndent: 15,
                    )),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      CupertinoPageRoute(
                                          builder: (context) => MainHomePage(
                                                from: "pagefrom",
                                              )),
                                      (Route<dynamic> route) => false);
                                },
                                child: Image.asset(
                                  "assets/images/fullApps/foodMaster/button__facebook.png",
                                ))),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      CupertinoPageRoute(
                                          builder: (context) => MainHomePage(
                                                from: "pagefrom",
                                              )),
                                      (Route<dynamic> route) => false);
                                },
                                child: Image.asset(
                                    "assets/images/fullApps/foodMaster/button_google.png"))),
                        //if (Platform.isIOS)
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      CupertinoPageRoute(
                                          builder: (context) => MainHomePage(
                                                from: "pagefrom",
                                              )),
                                      (Route<dynamic> route) => false);
                                },
                                child: Image.asset(
                                    "assets/images/fullApps/foodMaster/button_apple.png"))),
                      ]),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
