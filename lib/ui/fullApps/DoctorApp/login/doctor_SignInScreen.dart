import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/SlideAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import '../helper/textFieldShadow.dart';
import '../home/doctor_HomePageScreen.dart';
import 'doctor_forgotPwd.dart';
import 'doctore_SignUpScreen.dart';

class DoctorSignInScreen extends StatefulWidget {
  const DoctorSignInScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DoctorSignInScreenState();
  }
}

class DoctorSignInScreenState extends State<DoctorSignInScreen>
    with SingleTickerProviderStateMixin {
  bool _obscureText = true, check = true, process = false;
  final _formKey = GlobalKey<FormState>();
  AnimationController? _animationController;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
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
      resizeToAvoidBottomInset: true,
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
                    child: const Text(
                      DoctorStringRes.signInText,
                      style: TextStyle(
                          color: ColorRes.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                DoctorAnimation(
                  delay: 300,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05),
                    child: DoctorDesignConfig.name(DoctorStringRes.email),
                  ),
                ),
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
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        {
                          await Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DoctorHomeScreen(),
                            ),
                          );
                        }
                      }
                    },
                    child: process
                        ? const CircularProgressIndicator(
                            color: ColorRes.white,
                          )
                        : const Text(
                            DoctorStringRes.signin,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: ColorRes.white,
                                fontSize: 16),
                          ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(330, 50),
                      primary: ColorRes.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  /*DoctorDesignConfig.Button(onpress: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const DoctorProfileScreen(),),);
                      }, name: DoctorStringRes.signin,foreground: ColorRes.blue, TextColor: ColorRes.white)*/
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                DoctorAnimation(
                    delay: 550,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const DoctorForgotPass(),
                            ),
                          );
                        },
                        child: const Text(
                          DoctorStringRes.forgotPwd,
                          style: TextStyle(
                              color: ColorRes.blue,
                              fontWeight: FontWeight.w700),
                        ))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                DoctorAnimation(
                    delay: 550,
                    child: const Text(DoctorStringRes.continueWith)),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(DoctorStringRes.notacc + " ",
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
                                  DoctorSignUpScreen(),
                            ),
                          );
                        },
                        padding: const EdgeInsets.all(0),
                        child: const Text(DoctorStringRes.signup,
                            style: TextStyle(
                                color: ColorRes.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),

                  /* GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoctorSignUpScreen(),),);
                      },
                      child: RichText(textAlign: TextAlign.center,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: DoctorStringRes.notacc+" ", style: TextStyle(color:Color(0xffa2a2a2),fontSize: 12,fontWeight: FontWeight.w600)),
                            TextSpan(text:DoctorStringRes.signup,style: TextStyle(color:ColorRes.blue,fontSize: 12,fontWeight: FontWeight.w600)),
                      ],
                  ),
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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (input) => input!.isEmpty
              ? "Enter valid email"
              : null /*DoctorDesignConfig.validateEmail(input)*/,
          controller: controllerEmail,
          cursorColor: const Color(0xffa2a2a2),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorRes.blue, width: 2.0),
              borderRadius: BorderRadius.circular(30.0),
            ),
            contentPadding: const EdgeInsets.only(left: 20),
            // isDense: true,
            hintText: "Email",
            hintStyle: const TextStyle(
              color: Colors.black12,
            ),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.emailAddress,
        ));
  }

  Widget pwdEnter() {
    return TextFieldWithBoxShadow(
        errorText: "Enter valid Password",
        height: MediaQuery.of(context).size.height * .06,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscuringCharacter: '.',
          obscureText: true,
          cursorColor: const Color(0xffa2a2a2),
          validator: (text) => text!.isEmpty ? "Enter valid Password!" : null,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorRes.blue, width: 2.0),
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
            contentPadding: const EdgeInsets.only(left: 20, top: 12),
            // isDense: true,
            hintText: "Password",
            hintStyle: const TextStyle(
              color: Colors.black12,
            ),
            border: InputBorder.none,
          ),
        ));
  }

  Widget rememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
            value: check,
            activeColor: ColorRes.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            side: MaterialStateBorderSide.resolveWith(
              (states) => const BorderSide(width: 1.0, color: ColorRes.blue),
            ),
            onChanged: (value) {
              setState(() {
                check = !check;
              });
            }),
        const Text(DoctorStringRes.rememberMe)
      ],
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
                    builder: (BuildContext context) => DoctorHomeScreen(),
                  ),
                );
              },
              icon: SvgPicture.asset(
                DoctorDesignConfig.getImagePath("fb.svg"),
                width: 30,
                height: 30,
              ),
              label: const Text(
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
              label: const Text(
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
