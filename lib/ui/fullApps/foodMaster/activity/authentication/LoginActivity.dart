import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';

import 'SignupActivity.dart';

GlobalKey<ScaffoldState>? scaffoldKey;

class LoginActivity extends StatefulWidget {
  const LoginActivity({Key? key}) : super(key: key);

  @override
  _LoginActivityState createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController forgotedtemail = TextEditingController();
  bool _obscureText = true;
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
    var width = MediaQuery.of(context).size.width;
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
                        padding: EdgeInsets.only(
                            left: 20, right: 20, bottom: kToolbarHeight - 10),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.lbllogin,
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
                                  StringsRes.lblemail,
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
                                margin: EdgeInsets.only(top: 5),
                                padding: EdgeInsets.only(
                                    left: 10, top: 5, bottom: 5),
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
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  StringsRes.password,
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
                                margin: EdgeInsets.only(top: 5),
                                padding: EdgeInsets.only(
                                    left: 10, top: 5, bottom: 5),
                                child: TextFormField(
                                  obscureText: _obscureText,
                                  controller: edtpsw,
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: StringsRes.password,
                                    hintStyle: TextStyle(
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
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  padding: const EdgeInsets.all(5),
                                  width: double.maxFinite,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "${StringsRes.forgotpassword} ?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .merge(TextStyle(
                                            color: ColorsRes
                                                .continueShoppingGradient1Color)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 25),
                                child: ButtonClickAnimation(
                                  onTap: () async {
                                    Constant.goToMainPage("login", context);
                                  },
                                  child: IntrinsicHeight(
                                    child: Container(
                                      height: 67.0,
                                      padding:
                                          EdgeInsets.only(top: 13, bottom: 13),
                                      alignment: Alignment.center,
                                      decoration: DesignConfig.buttonShadowColor(
                                          ColorsRes
                                              .continueShoppingGradient1Color,
                                          37,
                                          ColorsRes
                                              .continueShoppingGradient2Color),
                                      child: Text(
                                        StringsRes.lbllogin,
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
                                      text: StringsRes.donthvac,
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: StringsRes.lblsignup,
                                        style: TextStyle(
                                            color: ColorsRes
                                                .continueShoppingGradient1Color),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.of(context).push(
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        SignupActivity(
                                                            from: "login")));
                                          }),
                                  ])),
                              SizedBox(
                                height: 35,
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
                                height: 20,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                        child: GestureDetector(
                                            onTap: () {
                                              Constant.goToMainPage(
                                                  "login", context);
                                            },
                                            child: Image.asset(
                                              "assets/images/fullApps/foodMaster/button__facebook.png",
                                              width: width / 2.5,
                                            ))),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                        child: GestureDetector(
                                            onTap: () {
                                              Constant.goToMainPage(
                                                  "login", context);
                                            },
                                            child: Image.asset(
                                              "assets/images/fullApps/foodMaster/button_google.png",
                                              width: width / 2.5,
                                            ))),
                                    //if (Platform.isIOS)
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                        child: GestureDetector(
                                            onTap: () {
                                              Constant.goToMainPage(
                                                  "login", context);
                                            },
                                            child: Image.asset(
                                              "assets/images/fullApps/foodMaster/button_apple.png",
                                              width: width / 2.5,
                                            ))),
                                  ]),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
