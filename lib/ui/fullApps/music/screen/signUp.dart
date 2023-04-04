import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/music/widgets/customBottomNavigation.dart';
import 'package:smartkit_pro/ui/fullApps/music/widgets/customButtons.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/string.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/constanat.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getLogo(),
              getText(),
              getUserNameField(),
              getEmailField(),
              getPasswordField(),
              getContinueButton(),
              Row(
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 15.0),
                      child: Divider(
                          indent: 20.0,
                          endIndent: 5.0,
                          thickness: 1,
                          color: Colors.black45),
                    ),
                  ),
                  Text(orText,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 12,
                          color: black)),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: 15.0),
                      child: Divider(
                          indent: 5.0,
                          endIndent: 20.0,
                          thickness: 1,
                          color: Colors.black45),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(end: 15),
                      child: Container(
                        child: FittedBox(
                            child: Image.asset("${imagePath}apple_logo.png")),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black87)),
                      ),
                    ),
                    Container(
                      child: FittedBox(
                          child: Image.asset("${imagePath}google_logo.png")),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black87)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getLogo() {
    return SvgPicture.asset("${imagePath}logo.svg",
        width: 150, height: 150, color: primary);
  }

  getText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(signUp,
          style: TextStyle(
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: black)),
    );
  }

  getContinueButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: SimpleButton(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.13,
        borderRadius: 10,
        backgroundColor: primary,
        buttonText: keepContinue,
        textColor: white,
        textFontSize: 16,
        onButtonPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => CustomBottomNavigationBar()));
        },
      ),
    );
  }

  getEmailField() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.13,
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          // focusNode: emailFocus,
          textInputAction: TextInputAction.next,
          // controller: emailController,
          style: TextStyle(color: black, fontWeight: FontWeight.normal),

          onSaved: (String? value) {
            //email = value;
          },
          onFieldSubmitted: (v) {
            //_fieldFocusChange(context, emailFocus!, nameFocus);
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.email_outlined),
            hintText: enterYourEmail,
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: black),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  getUserNameField() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.13,
        child: TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          style: TextStyle(color: black, fontWeight: FontWeight.normal),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person_outlined),
            hintText: enterYourName,
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: black),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  getPhoneNumberField() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.13,
        child: TextFormField(
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          style: TextStyle(color: black, fontWeight: FontWeight.normal),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone_android_sharp),
            hintText: enterYourPhone,
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: black),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  getPasswordField() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.13,
        child: TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          style: TextStyle(color: black, fontWeight: FontWeight.normal),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.password_outlined),
            hintText: enterYourPassword,
            filled: true,
            fillColor: Colors.grey[200],
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: black),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
