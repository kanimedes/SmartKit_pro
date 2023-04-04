import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';

import '../../widgets/slideAnimation.dart';
import 'ForgotPasswordActivity.dart';
import 'MainActivity.dart';
import 'SignUpActivity.dart';

class SignInActivity extends StatefulWidget {
  const SignInActivity({Key? key}) : super(key: key);

  @override
  SignInActivityState createState() => SignInActivityState();
}

class SignInActivityState extends State<SignInActivity>
    with SingleTickerProviderStateMixin {
  bool _obscureTextPassword = true;
  AnimationController? _animationController;
  late TextEditingController emailController, passwordController;

  Widget showEmail() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 12,
          vertical: MediaQuery.of(context).size.width / 40),
      child: SlideAnimation(
        position: 3,
        itemCount: 10,
        slideDirection: SlideDirection.fromRight,
        animationController: _animationController,
        child: TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15.0),
            hintStyle: TextStyle(
                color: ColorsRes.purpalColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            labelStyle: TextStyle(
                color: ColorsRes.greyColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            filled: false,
            focusColor: ColorsRes.warmGreyColor,
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: ColorsRes.warmGreyColor,
              ),
            ),
            border: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: ColorsRes.warmGreyColor,
                width: 1,
              ),
            ),
            labelText: StringsRes.emailText,
            hintText: StringsRes.emailAddressText,
          ),
        ),
      ),
    );
  }

  Widget showPassword() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 12,
          vertical: MediaQuery.of(context).size.width / 40),
      child: SlideAnimation(
        position: 4,
        itemCount: 10,
        slideDirection: SlideDirection.fromRight,
        animationController: _animationController,
        child: TextField(
          obscureText: _obscureTextPassword,
          controller: passwordController,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15.0),
            hintStyle: TextStyle(
                color: ColorsRes.purpalColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            labelStyle: TextStyle(
                color: ColorsRes.greyColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            filled: false,
            focusColor: ColorsRes.warmGreyColor,
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: ColorsRes.warmGreyColor,
              ),
            ),
            border: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: ColorsRes.warmGreyColor,
                width: 1,
              ),
            ),
            labelText: StringsRes.passwordText,
            hintText: StringsRes.enterPasswordText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureTextPassword = !_obscureTextPassword;
                });
              },
              child: Icon(
                _obscureTextPassword ? Icons.visibility : Icons.visibility_off,
                color: ColorsRes.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    emailController = TextEditingController(text: "blacksmith@gmail.com");
    passwordController = TextEditingController(text: "1234567890");
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController!.repeat();
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: ColorsRes.backgroundColor,
          appBar: AppBar(
              backgroundColor: ColorsRes.backgroundColor,
              shadowColor: Colors.transparent,
              leading: SlideAnimation(
                  position: 1,
                  itemCount: 8,
                  slideDirection: SlideDirection.fromTop,
                  animationController: _animationController,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 20),
                        child: Icon(Icons.close, color: ColorsRes.purpalColor),
                      )))),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 10,
                            left: MediaQuery.of(context).size.height / 22,
                            right: MediaQuery.of(context).size.height / 18,
                            bottom: 10.0),
                        child: SlideAnimation(
                          position: 2,
                          itemCount: 10,
                          slideDirection: SlideDirection.fromRight,
                          animationController: _animationController,
                          child: Text(
                            StringsRes.loginText,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorsRes.purpalColor,
                              fontSize: 28,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    showEmail(),
                    showPassword(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordActivity(),
                          ),
                        );
                      },
                      child: SlideAnimation(
                        position: 5,
                        itemCount: 10,
                        slideDirection: SlideDirection.fromRight,
                        animationController: _animationController,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 99,
                              right: MediaQuery.of(context).size.width / 12,
                            ),
                            child: Text(
                              StringsRes.forgotPasswordText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorsRes.purpalColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    SlideAnimation(
                        position: 6,
                        itemCount: 10,
                        slideDirection: SlideDirection.fromRight,
                        animationController: _animationController,
                        child: Align(
                            alignment: Alignment.topRight,
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
                                    margin: EdgeInsets.only(
                                        right:
                                            MediaQuery.of(context).size.width /
                                                15),
                                    padding: EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                        color: ColorsRes.greenColor,
                                        shape: BoxShape.circle),
                                    child: Icon(Icons.arrow_forward,
                                        color: ColorsRes.white))))),
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 15,
                      ),
                      child: Column(
                        children: [
                          SlideAnimation(
                            position: 7,
                            itemCount: 10,
                            slideDirection: SlideDirection.fromRight,
                            animationController: _animationController,
                            child: Text(
                              StringsRes.loginWithSocialMediaText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorsRes.purpalColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 99),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SlideAnimation(
                                position: 8,
                                itemCount: 10,
                                slideDirection: SlideDirection.fromRight,
                                animationController: _animationController,
                                child: Container(
                                  decoration: DesignConfig.buttonShadowColor(
                                      ColorsRes.greyColor, 10.0),
                                  child: SvgPicture.asset(
                                    "assets/images/fullApps/furnitureHub/fb.svg",
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              SlideAnimation(
                                position: 9,
                                itemCount: 10,
                                slideDirection: SlideDirection.fromRight,
                                animationController: _animationController,
                                child: Container(
                                  decoration: DesignConfig.buttonShadowColor(
                                      ColorsRes.greyColor, 10.0),
                                  child: SvgPicture.asset(
                                    "assets/images/fullApps/furnitureHub/google.svg",
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 25),
                    SlideAnimation(
                      position: 10,
                      itemCount: 10,
                      slideDirection: SlideDirection.fromBottom,
                      animationController: _animationController,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15.0,
                                  left: MediaQuery.of(context).size.width / 12,
                                  right: 10.0),
                              child: Text(
                                StringsRes.doNotHaveAccountText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorsRes.greyColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupActivity(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15.0,
                                    right:
                                        MediaQuery.of(context).size.width / 12),
                                child: Text(
                                  StringsRes.signUpText,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorsRes.purpalColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
