import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/music/widgets/customBottomNavigation.dart';
import 'package:smartkit_pro/ui/fullApps/music/widgets/customButtons.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/string.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/constanat.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("${imagePath}logo.svg",
                    width: 150, height: 150, color: primary),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(logIn,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: black)),
                ),
                getEmailTextFormField(),
                getPasswordTextFormField(),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SimpleButton(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.13,
                    borderRadius: 10,
                    backgroundColor: primary,
                    buttonText: keepContinue,
                    textColor: white,
                    textFontSize: 16,
                    onButtonPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => CustomBottomNavigationBar()));
                    },
                  ),
                ),
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
                )
              ],
            ),
          ),
        ));
  }

  getEmailTextFormField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
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

  getPasswordTextFormField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.13,
        child: TextFormField(
          keyboardType: TextInputType.text,
          // focusNode: emailFocus,
          textInputAction: TextInputAction.done,
          // controller: emailController,
          style: TextStyle(color: black, fontWeight: FontWeight.normal),

          onSaved: (String? value) {
            //email = value;
          },
          onFieldSubmitted: (v) {
            //_fieldFocusChange(context, emailFocus!, nameFocus);
          },
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
