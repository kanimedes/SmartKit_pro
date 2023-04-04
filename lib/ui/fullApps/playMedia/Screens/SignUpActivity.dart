import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/MainActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/SignInActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class SignUpActivity extends StatefulWidget {
  const SignUpActivity({Key? key}) : super(key: key);

  @override
  _SignUpActivityState createState() => _SignUpActivityState();
}

class _SignUpActivityState extends State<SignUpActivity> {
  String status = StringsRes.signInText;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  Widget showFullName() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        decoration: InputDecoration(
            labelText: StringsRes.fullNameText,
            suffixIcon: Icon(Icons.person_rounded, color: ColorsRes.white),
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            )),
      ),
    );
  }

  Widget showEmail() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        decoration: InputDecoration(
            labelText: StringsRes.phoneOrEmailText,
            suffixIcon: Icon(Icons.email, color: ColorsRes.white),
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            )),
      ),
    );
  }

  Widget showPassword() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        obscureText: true,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.lock, color: ColorsRes.white),
            labelText: StringsRes.passwordText,
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            )),
      ),
    );
  }

  Widget showConfirmPassword() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        obscureText: true,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.lock, color: ColorsRes.white),
            labelText: StringsRes.confirmPasswordText,
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            )),
      ),
    );
  }

  Widget showSignUpButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainActivity(),
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: DesignConfig.boxDecorationBorderButtonColor(
              ColorsRes.yellowColor, 50),
          child: Text(
            StringsRes.signUpText,
            style: TextStyle(
              color: ColorsRes.white,
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget showForgotLink() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
        onTap: () {},
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text(StringsRes.forgetPasswordText,
              style: TextStyle(
                  fontSize: 15,
                  color: ColorsRes.white,
                  fontWeight: FontWeight.normal)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        toolbarHeight: 0,
        backgroundColor: ColorsRes.backgroundColor,
      ),
      backgroundColor: ColorsRes.backgroundColor,
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(
              "assets/images/fullApps/playMedia/svg/BG02.svg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(StringsRes.createYourAccountText,
                            style: TextStyle(
                                fontSize: 30,
                                color: ColorsRes.yellowColor,
                                fontWeight: FontWeight.normal)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 14),
                    showFullName(),
                    showEmail(),
                    showPassword(),
                    showConfirmPassword(),
                    Row(
                      children: [
                        Expanded(flex: 1, child: showSignUpButton()),
                        Expanded(flex: 1, child: Container()),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 14),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(StringsRes.alreadyHaveAnAccountText,
                            style: TextStyle(
                                fontSize: 15,
                                color: ColorsRes.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInActivity(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignInActivity(),
                                      ),
                                    );
                                  },
                                  child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: DesignConfig
                                              .boxDecorationBorderButtonColor(
                                                  ColorsRes.white, 50),
                                          child: Icon(Icons.arrow_forward_ios,
                                              color: ColorsRes.white))))),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, top: 10.0),
                                child: Text(StringsRes.signInText,
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: ColorsRes.white,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.underline)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          )
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
