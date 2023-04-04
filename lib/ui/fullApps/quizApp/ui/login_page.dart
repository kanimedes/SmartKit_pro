import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/ui/registration_page.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/utils/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/animation/showdown.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/app_text.dart';

import 'home_page.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  late AnimationController _controllerRegistration;
  late Animation<Offset> _animationRegistration;
  late AnimationController _controllergoogle;
  late Animation<Offset> _animationgoogle;

  late AnimationController _controllerFb;
  late Animation<Offset> _animationFb;

  bool _isObscure = true;
  List boxColors = [Color(0xffB6DADF), Color(0xff9fd6b6), Color(0xffefbdc1)];

  List boxdarkColors = [
    Color(0xff0fa3b8),
    Color(0xff24ad5f),
    Color(0xffdb606a)
  ];

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 120),
    );
    _animation = Tween<Offset>(begin: Offset(0, 0), end: Offset(0.025, 0.1))
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInQuad));
    _controllerRegistration = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 120),
    );
    _animationRegistration =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0.025, 0.1)).animate(
            CurvedAnimation(
                parent: _controllerRegistration, curve: Curves.easeInQuad));

    _controllergoogle = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 120),
    );
    _animationgoogle =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0.015, 0.1)).animate(
            CurvedAnimation(
                parent: _controllergoogle, curve: Curves.easeInQuad));

    _controllerFb = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 120),
    );
    _animationFb = Tween<Offset>(begin: Offset(0, 0), end: Offset(0.015, 0.1))
        .animate(
            CurvedAnimation(parent: _controllerFb, curve: Curves.easeInQuad));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerFb.dispose();
    _controllergoogle.dispose();
    _controllerRegistration.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f2f8),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShowDown(
                delay: 300,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20, top: MediaQuery.of(context).size.height * 0.14),
                  child: AppLargeText(
                    text: "Let login to QuizApp",
                    size: 22,
                  ),
                ),
              ),
              ShowDown(
                delay: 400,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20, top: MediaQuery.of(context).size.height * 0.01),
                  child: AppText(
                    text: "We cover all categories",
                    size: 14,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              ShowDown(
                delay: 500,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03,
                          left: 20,
                          right: 15),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.068,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 2)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          left: 20,
                          right: 20),
                      padding: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          border: Border.all(color: Colors.black, width: 2)),
                      child: Center(
                        child: TextFormField(
                          validator: (value) => validateEmail(value),
                          decoration: InputDecoration.collapsed(
                            hintText: "E-mail Address",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                              fontFamily: "ganiser",
                              color: Theme.of(context).colorScheme.outline),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.009,
              ),
              ShowDown(
                delay: 600,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03,
                          left: 20,
                          right: 15),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.068,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 2)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          left: 20,
                          right: 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          border: Border.all(color: Colors.black, width: 2)),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Center(
                                child: TextFormField(
                                  obscureText: _isObscure,
                                  validator: (value) => validateEmail(value),
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                      fontFamily: "ganiser",
                                      color: Theme.of(context)
                                          .colorScheme
                                          .outline),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                _isObscure
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ShowDown(
                delay: 700,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.03,
                              left: 20,
                              right: 20),
                          width: MediaQuery.of(context).size.width * 0.40,
                          height: MediaQuery.of(context).size.height * 0.068,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                        ),
                        GestureDetector(
                          onTapDown: (ontapdetails) {
                            _controllerRegistration.forward();
                            vibrate();
                            // _controller.reverse();
                          },
                          onTap: () {
                            _controllerRegistration.reverse().then((value) =>
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            registrationPage())));
                          },
                          onTapCancel: () {
                            _controllerRegistration.reverse();
                          },
                          child: SlideTransition(
                            position: _animationRegistration,
                            child: Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.02,
                                    left: 20,
                                    right: 20),
                                width: MediaQuery.of(context).size.width * 0.38,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: boxColors[1],
                                    border: Border.all(
                                        color: Colors.black, width: 2)),
                                child: Center(
                                  child: AppLargeText(
                                    text: "Registration",
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.03,
                            ),
                            width: MediaQuery.of(context).size.width * 0.40,
                            height: MediaQuery.of(context).size.height * 0.068,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                          ),
                          GestureDetector(
                            onTapDown: (ontapdetails) {
                              _controller.forward();
                              vibrate();
                              // _controller.reverse();
                            },
                            onTap: () {
                              _controller.reverse().then((value) =>
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => homePage())));
                            },
                            onTapCancel: () {
                              _controller.reverse();
                            },
                            child: SlideTransition(
                              position: _animation,
                              child: Container(
                                  margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.38,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xffc6bbfa),
                                      border: Border.all(
                                          color: Colors.black, width: 2)),
                                  child: Center(
                                    child: AppLargeText(
                                      text: "Login",
                                      size: 18,
                                      color: Colors.black,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.32,
                color:
                    Theme.of(context).colorScheme.onSecondary.withOpacity(0.2),
                child: Column(
                  children: [
                    ShowDown(
                      delay: 800,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.03,
                                  left: 20,
                                  right: 15),
                              width: MediaQuery.of(context).size.width,
                              height:
                                  MediaQuery.of(context).size.height * 0.068,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
                            ),
                            GestureDetector(
                              onTapDown: (ontapdetails) {
                                _controllergoogle.forward();
                                vibrate();

                                // _controller.reverse();
                              },
                              onTap: () {
                                _controllergoogle.reverse().then((value) =>
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (contex) => homePage())));
                              },
                              onTapCancel: () {
                                _controllergoogle.reverse();
                              },
                              child: SlideTransition(
                                position: _animationgoogle,
                                child: Container(
                                    margin: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                        left: 20,
                                        right: 20),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: boxColors[2],
                                        border: Border.all(
                                            color: Colors.black, width: 2)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.07,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.07,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 2),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      QuizappConstant
                                                          .getImagePath(
                                                              "google.jpg")))),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        AppText(
                                          text: "Continue with Google",
                                          size: 18,
                                          color: Colors.black,
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ShowDown(
                      delay: 800,
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.03,
                                left: 20,
                                right: 15),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.068,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                          ),
                          GestureDetector(
                            onTapDown: (ontapdetails) {
                              _controllerFb.forward();
                              vibrate();
                              // _controller.reverse();
                            },
                            onTap: () {
                              _controllerFb.reverse().then((value) =>
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (contex) => homePage())));
                            },
                            onTapCancel: () {
                              _controllerFb.reverse();
                            },
                            child: SlideTransition(
                              position: _animationFb,
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.02,
                                      left: 20,
                                      right: 20),
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: boxColors[0],
                                      border: Border.all(
                                          color: Colors.black, width: 2)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.07,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.07,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.black, width: 2),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    QuizappConstant
                                                        .getImagePath(
                                                            "fb.jpg")))),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      AppText(
                                        text: "Continue with Facebook",
                                        size: 18,
                                        color: Colors.black,
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    ShowDown(
                      delay: 900,
                      child: Text(
                        "by Continuing, you accept our Term and\ncondition,Privacy policy",
                        style: TextStyle(
                          fontFamily: "ganiser",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void vibrate() {
    HapticFeedback.heavyImpact();
    HapticFeedback.vibrate();
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }
}
