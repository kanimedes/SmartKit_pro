import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/ui/login_page.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/animation/showdown.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/app_text.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/custom_box.dart';

class registrationPage extends StatefulWidget {
  const registrationPage({Key? key}) : super(key: key);

  @override
  State<registrationPage> createState() => _registrationPageState();
}

class _registrationPageState extends State<registrationPage>
    with TickerProviderStateMixin {
  bool _isObscure = true;
  bool _isConfirm = true;
  late AnimationController _controllerFb;
  late Animation<Offset> _animationFb;

  @override
  void initState() {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShowDown(
                delay: 300,
                child: customBox(
                  borderRadius: 20,
                  borderWidth: 1,
                  width: MediaQuery.of(context).size.width * 0.12,
                  height: MediaQuery.of(context).size.height * 0.06,
                  btnpress: true,
                  childContainerColor: Color(0xff9fd6b6),
                  mainContainerColor: Theme.of(context).scaffoldBackgroundColor,
                  child: Icon(
                    Icons.arrow_back,
                  ),
                  topmargin: 0,
                  leftmargin: 10,
                  rightmargin: 0,
                  offsetAnimation: Offset(0, 0.070),
                  bottomPadding: 5,
                  rightPadding: 0,
                  bottomargin: 0,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              ShowDown(
                delay: 400,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20, top: MediaQuery.of(context).size.height * 0.10),
                  child: AppLargeText(
                    text: "Let sign up to QuizApp",
                    size: 22,
                  ),
                ),
              ),
              ShowDown(
                delay: 500,
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
                      padding: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          border: Border.all(color: Colors.black, width: 2)),
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(
                            hintText: "Name",
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
              ShowDown(
                delay: 700,
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
                                color: Color(0xff0fa3b8),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ShowDown(
                delay: 900,
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
                                  obscureText: _isConfirm,
                                  validator: (value) => validateEmail(value),
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Confirm Password",
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
                                _isConfirm = !_isConfirm;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                _isConfirm
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xff0fa3b8),
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
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              ShowDown(
                delay: 1000,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03,
                          left: 60,
                          right: 55),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.068,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 2)),
                    ),
                    GestureDetector(
                      onTapDown: (ontapdetails) {
                        _controllerFb.forward();
                        vibrate();
                        // _controller.reverse();
                      },
                      onTap: () {
                        _controllerFb.reverse().then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contex) => loginPage())));
                      },
                      onTapCancel: () {
                        _controllerFb.reverse();
                      },
                      child: SlideTransition(
                        position: _animationFb,
                        child: Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02,
                                left: 60,
                                right: 60),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffB6DADF),
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                AppLargeText(
                                  text: "Login",
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
            ],
          ),
        ),
      ),
    );
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

  void vibrate() {
    HapticFeedback.heavyImpact();
    HapticFeedback.vibrate();
  }
}
