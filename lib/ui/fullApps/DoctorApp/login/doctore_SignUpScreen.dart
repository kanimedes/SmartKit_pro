import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/DoctorApp/home/doctor_HomePageScreen.dart';

import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/SlideAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import '../helper/textFieldShadow.dart';
import '../profile/doctor_ProfileScreen.dart';
import 'doctor_SignInScreen.dart';

class DoctorSignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DoctorSignUpScreenState();
  }
}

class DoctorSignUpScreenState extends State<DoctorSignUpScreen>
    with SingleTickerProviderStateMixin {
  bool _obscureText = true, check = true;
  AnimationController? _animationController;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .07,
            right: MediaQuery.of(context).size.width * .07),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .12,
                ),
                DoctorAnimation(
                    delay: 100,
                    child: SvgPicture.asset(
                      DoctorDesignConfig.getImagePathLogo("logo.svg"),
                      height: MediaQuery.of(context).size.height * .2,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                DoctorAnimation(
                    delay: 200,
                    child: Text(
                      DoctorStringRes.signupfree,
                      style: TextStyle(
                          color: ColorRes.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                DoctorAnimation(
                    delay: 300,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05),
                      child: DoctorDesignConfig.name(DoctorStringRes.email),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                DoctorAnimation(delay: 300, child: emailEnter()),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                DoctorAnimation(
                    delay: 400,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05),
                      child: DoctorDesignConfig.name(DoctorStringRes.pwd),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                DoctorAnimation(delay: 400, child: pwdEnter()),
                DoctorAnimation(delay: 450, child: rememberMe()),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                DoctorAnimation(
                    delay: 500,
                    child: DoctorDesignConfig.Button(
                        onpress: () async {
                          if (_formKey.currentState!.validate()) {
                            await Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    DoctorProfileScreen(),
                              ),
                            );
                          }
                        },
                        name: DoctorStringRes.signup,
                        foreground: ColorRes.blue,
                        TextColor: ColorRes.white)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                DoctorAnimation(
                    delay: 500, child: Text(DoctorStringRes.continueWith)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                DoctorAnimation(delay: 600, child: fbGoogleBtn()),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                DoctorAnimation(
                  delay: 700,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(DoctorStringRes.alreadyAcc + " ",
                          style: TextStyle(
                              color: Color(0xffa2a2a2),
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                      CupertinoButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const DoctorSignInScreen(),
                            ),
                          );
                        },
                        padding: EdgeInsets.all(0),
                        child: Text(DoctorStringRes.signin,
                            style: TextStyle(
                                color: ColorRes.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),

                  /*RichText(textAlign: TextAlign.center,
                 text: TextSpan(
                   children: <TextSpan>[
                     TextSpan(text: DoctorStringRes.alreadyAcc+" ", style: TextStyle(color:Color(0xffa2a2a2),fontSize: 12,fontWeight: FontWeight.w600)),
                     TextSpan(text:DoctorStringRes.signin,style: TextStyle(color:ColorRes.blue,fontSize: 12,fontWeight: FontWeight.w600)),
                   ],
                 ),
               )*/
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailEnter() {
    return TextFieldWithBoxShadow(
        errorText: "Enter valid email",
        height: MediaQuery.of(context).size.height * .06,
        child: TextFormField(
          controller: controllerEmail,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (input) => input!.isEmpty ? "Enter valid email" : null,
          cursorColor: const Color(0xffa2a2a2),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorRes.blue, width: 2.0),
              borderRadius: BorderRadius.circular(30.0),
            ),
            contentPadding: EdgeInsets.only(
              left: 20,
            ),
            //isDense: true,
            hintText: "Email",
            hintStyle: TextStyle(
              color: Colors.black12,
            ),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.emailAddress,
        ));
  }

  Widget pwdEnter() {
    return TextFieldWithBoxShadow(
        errorText: "Enter valid password",
        height: MediaQuery.of(context).size.height * .06,
        child: TextFormField(
          controller: controllerPass,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (input) => input!.isEmpty ? "Enter valid password" : null,
          obscuringCharacter: '.',
          obscureText: true,
          cursorColor: Color(0xffa2a2a2),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorRes.blue, width: 2.0),
              borderRadius: BorderRadius.circular(30.0),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            contentPadding: EdgeInsets.only(left: 20, top: 12),
            isDense: true,
            hintText: "Password",
            hintStyle: TextStyle(
              color: Colors.black12,
            ),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.emailAddress,
        ));
  }

  Widget rememberMe() {
    return Container(
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Checkbox(
              value: check,
              activeColor: ColorRes.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              side: MaterialStateBorderSide.resolveWith(
                (states) => BorderSide(width: 1.0, color: ColorRes.blue),
              ),
              onChanged: (value) {
                setState(() {
                  check = !check;
                });
              }),
          Text(DoctorStringRes.rememberMe)
        ],
      ),
    );
  }

  Widget fbGoogleBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SlideAnimation(
            position: 10,
            itemCount: 20,
            slideDirection: SlideDirection.fromLeft,
            animationController: _animationController,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const DoctorHomeScreen(),
                  ),
                );
              },
              icon: SvgPicture.asset(
                DoctorDesignConfig.getImagePath("fb.svg"),
                width: 30,
                height: 30,
              ),
              label: Text(
                DoctorStringRes.fb,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 60),
                primary: ColorRes.white,
                elevation: 0,
                side: BorderSide(
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.2),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            )),
        SlideAnimation(
            position: 10,
            itemCount: 20,
            slideDirection: SlideDirection.fromRight,
            animationController: _animationController,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const DoctorHomeScreen(),
                  ),
                );
              },
              icon: SvgPicture.asset(
                DoctorDesignConfig.getImagePath("google.svg"),
                width: 30,
                height: 30,
              ),
              label: Text(
                DoctorStringRes.google,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 60),
                primary: ColorRes.white,
                elevation: 0,
                side: BorderSide(
                  width: 1.0,
                  color: Colors.grey.withOpacity(0.2),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ))
      ],
    );
  }
}
