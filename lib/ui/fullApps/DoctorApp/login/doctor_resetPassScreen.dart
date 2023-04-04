import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import '../helper/textFieldShadow.dart';
import 'doctor_SignInScreen.dart';

class DoctorResetPassScreen extends StatefulWidget {
  const DoctorResetPassScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DoctorResetPassScreenState();
  }
}

class DoctorResetPassScreenState extends State<DoctorResetPassScreen> {
  bool _obscureText = false, check = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: DoctorDesignConfig.appBar(
          context: context,
          isIcon: false,
          textColor: Colors.black,
          iconColor: ColorRes.blue,
          title: DoctorStringRes.resetPass,
          size: size),
      bottomNavigationBar: DoctorAnimation(
          delay: 500,
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * .06,
                right: size.width * .06,
                bottom: size.width * .06),
            child: DoctorDesignConfig.Button(
                onpress: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => DoctorSignInScreen(),
                      ),
                    );
                  }
                },
                name: DoctorStringRes.save,
                foreground: ColorRes.blue,
                TextColor: ColorRes.white),
          )),
      body: Container(
          alignment: Alignment.topLeft,
          padding:
              EdgeInsets.only(left: size.width * .06, right: size.width * .06),
          height: size.height,
          width: size.width,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * .03,
                  ),
                  DoctorAnimation(
                      delay: 100, child: Text(DoctorStringRes.createNewPass)),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  DoctorAnimation(
                      delay: 200,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .03),
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                text: DoctorStringRes.newPwd,
                                children: const [
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(color: Colors.red))
                            ])),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  DoctorAnimation(delay: 200, child: pwdEnter()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  DoctorAnimation(
                      delay: 300,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .03),
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                text: DoctorStringRes.cnfPwd,
                                children: const [
                              TextSpan(
                                  text: '*',
                                  style: TextStyle(color: Colors.red))
                            ])),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  DoctorAnimation(delay: 300, child: cnfPwdEnter()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  DoctorAnimation(delay: 400, child: rememberMe()),
                ],
              ),
            ),
          )),
    );
  }

  Widget pwdEnter() {
    return TextFieldWithBoxShadow(
        errorText: "Enter valid password",
        height: MediaQuery.of(context).size.height * .06,
        child: TextFormField(
          obscuringCharacter: '.',
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (val) => val!.isEmpty ? "Enter valid password" : null,
          obscureText: true,
          cursorColor: Color(0xffa2a2a2),
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
            contentPadding: EdgeInsets.only(left: 20, top: 12),
            // isDense: true,
            hintText: "New Password",
            hintStyle: TextStyle(
              color: Colors.black12,
            ),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.emailAddress,
        ));
  }

  Widget cnfPwdEnter() {
    return TextFieldWithBoxShadow(
        errorText: "Enter valid password",
        height: MediaQuery.of(context).size.height * .06,
        child: TextFormField(
          obscuringCharacter: '.',
          obscureText: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (val) => val!.isEmpty ? "Enter valid password" : null,
          cursorColor: Color(0xffa2a2a2),
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
            contentPadding: EdgeInsets.only(left: 20, top: 12),
            //isDense: true,
            hintText: "Confirm New Password",
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
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Checkbox(
              value: check,
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
          Text(
            DoctorStringRes.rememberMe,
            style: TextStyle(fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
