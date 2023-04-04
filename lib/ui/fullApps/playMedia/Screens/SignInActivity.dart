import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/MainActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/SignUpActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class SignInActivity extends StatefulWidget {
  const SignInActivity({Key? key}) : super(key: key);

  @override
  _SignInActivityState createState() => _SignInActivityState();
}

class _SignInActivityState extends State<SignInActivity> {
  String status = StringsRes.signInText;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  Widget showUserName() {
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
            labelText: StringsRes.userNameText,
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

  Widget showSignInButton() {
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
          decoration: DesignConfig.boxDecorationButtonColor(
              ColorsRes.yellowColor, ColorsRes.yellowColor, 50),
          child: Text(
            StringsRes.signInText,
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
                        child: Text(StringsRes.helloSignInText,
                            style: TextStyle(
                                fontSize: 30,
                                color: ColorsRes.yellowColor,
                                fontWeight: FontWeight.normal)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 6),
                    showUserName(),
                    showPassword(),
                    Row(
                      children: [
                        Expanded(flex: 1, child: showSignInButton()),
                        Expanded(flex: 1, child: showForgotLink()),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 6),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(StringsRes.doNotHaveAccountText,
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
                            builder: (context) => SignUpActivity(),
                          ),
                        );
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 20.0, top: 10.0),
                          child: Text(StringsRes.signUpText,
                              style: TextStyle(
                                  fontSize: 22,
                                  color: ColorsRes.white,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.underline)),
                        ),
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
