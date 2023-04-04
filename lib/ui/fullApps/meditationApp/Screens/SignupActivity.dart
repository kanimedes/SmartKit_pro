import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/CategoryActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/StringsRes.dart';

class SignupActivity extends StatefulWidget {
  const SignupActivity({Key? key}) : super(key: key);

  @override
  SignupActivityState createState() => SignupActivityState();
}

class SignupActivityState extends State<SignupActivity> {
  bool _obscureTextPassword = true, _obscureTextRePassword = true;

  Widget showEmail() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 12, vertical: 5),
      child: TextFormField(
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: ColorsRes.black,
          fontFamily: "TrebuchetMS",
        ),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            labelText: StringsRes.email,
            prefixIcon: SvgPicture.asset(
                "assets/images/fullApps/meditationApp/mail.svg",
                height: 20.0,
                width: 20.0,
                fit: BoxFit
                    .scaleDown), //Icon(Icons.email_outlined, color: ColorsRes.textBorderColor),
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontFamily: "TrebuchetMS",
            ),
            hintText: StringsRes.email,
            hintStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontFamily: "TrebuchetMS",
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.textBorderColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.textBorderColor),
            )),
      ),
    );
  }

  Widget showName() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 12, vertical: 5),
      child: TextFormField(
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          fontFamily: "TrebuchetMS",
          color: ColorsRes.black,
        ),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            labelText: StringsRes.name,
            prefixIcon: SvgPicture.asset(
                "assets/images/fullApps/meditationApp/name.svg",
                height: 20.0,
                width: 20.0,
                fit: BoxFit
                    .scaleDown), //Icon(Icons.perm_identity, color: ColorsRes.textBorderColor),
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontFamily: "TrebuchetMS",
            ),
            hintText: StringsRes.name,
            hintStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontFamily: "TrebuchetMS",
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.textBorderColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.textBorderColor),
            )),
      ),
    );
  }

  Widget showPassword() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 12, vertical: 5),
      child: TextFormField(
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          fontFamily: "TrebuchetMS",
        ),
        keyboardType: TextInputType.text,
        obscureText: _obscureTextPassword,
        decoration: InputDecoration(
            prefixIcon: SvgPicture.asset(
                "assets/images/fullApps/meditationApp/password.svg",
                height: 20.0,
                width: 20.0,
                fit: BoxFit
                    .scaleDown), //Icon(Icons.vpn_key_outlined, color: ColorsRes.textBorderColor),
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
            labelText: StringsRes.password,
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontFamily: "TrebuchetMS",
            ),
            hintText: StringsRes.password,
            hintStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontFamily: "TrebuchetMS",
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.textBorderColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.textBorderColor),
            )),
      ),
    );
  }

  Widget showRePassword() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 12, vertical: 5),
      child: TextFormField(
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          fontFamily: "TrebuchetMS",
        ),
        keyboardType: TextInputType.text,
        obscureText: _obscureTextRePassword,
        decoration: InputDecoration(
            prefixIcon: SvgPicture.asset(
                "assets/images/fullApps/meditationApp/password.svg",
                height: 20.0,
                width: 20.0,
                fit: BoxFit
                    .scaleDown), //Icon(Icons.vpn_key_outlined, color: ColorsRes.textBorderColor),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureTextRePassword = !_obscureTextRePassword;
                });
              },
              child: Icon(
                _obscureTextRePassword
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: ColorsRes.black,
              ),
            ),
            labelText: StringsRes.rePassword,
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontFamily: "TrebuchetMS",
            ),
            hintText: StringsRes.password,
            hintStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontFamily: "TrebuchetMS",
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.textBorderColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.textBorderColor),
            )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 15.0),
                  child: Text(StringsRes.skip.toUpperCase(),
                      style: TextStyle(
                        color: ColorsRes.black,
                        fontSize: 18,
                        fontFamily: "TrebuchetMS",
                      )),
                )
              ],
              leading: BackButton(color: ColorsRes.black)),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 15.0,
                              left: MediaQuery.of(context).size.height / 18,
                              right: MediaQuery.of(context).size.height / 18,
                              bottom: 10.0),
                          child: Text(
                            StringsRes.createAnAccount,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorsRes.black,
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                              fontFamily: "TrebuchetMS",
                            ),
                          ),
                        ),
                      ),
                      showEmail(),
                      showName(),
                      showPassword(),
                      showRePassword(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryActivity(),
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 22.2,
                              right: MediaQuery.of(context).size.width / 12,
                              left: MediaQuery.of(context).size.width / 12),
                          height: MediaQuery.of(context).size.height / 14,
                          width: MediaQuery.of(context).size.width,
                          decoration: DesignConfig.buttonShadowColor(
                              ColorsRes.gradientColor1,
                              30.0,
                              ColorsRes.gradientColor2,
                              ColorsRes.gradientColor3),
                          child: Text(
                            StringsRes.getStarted,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsRes.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              fontFamily: "TrebuchetMS",
                            ),
                          ),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height / 28.0,
                                  left: MediaQuery.of(context).size.width / 12,
                                  right: 10.0),
                              child: Text(
                                StringsRes.orSignInWith,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorsRes.textColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "TrebuchetMS",
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height /
                                        28.0,
                                    right:
                                        MediaQuery.of(context).size.width / 12),
                                child: Divider(
                                    height: 2,
                                    color: ColorsRes.textBorderColor),
                              ),
                            ),
                          ]),
                      GestureDetector(
                        onTap: () {
                          /*Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MainActivity(),
                                      ),
                                    );*/
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 28.2,
                              right: MediaQuery.of(context).size.width / 12,
                              left: MediaQuery.of(context).size.width / 12),
                          height: MediaQuery.of(context).size.height / 14,
                          width: MediaQuery.of(context).size.width,
                          decoration: DesignConfig.boxDecorationContainer(
                            ColorsRes.blueColor,
                            30.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  "assets/images/fullApps/meditationApp/google.svg",
                                  height: 20.0,
                                  width: 20.0,
                                  fit: BoxFit.scaleDown),
                              SizedBox(width: 10.0),
                              Text(
                                StringsRes.signUpWithGoogle,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorsRes.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "TrebuchetMS",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          /*Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MainActivity(),
                                      ),
                                    );*/
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 40.2,
                              right: MediaQuery.of(context).size.width / 12,
                              left: MediaQuery.of(context).size.width / 12),
                          height: MediaQuery.of(context).size.height / 14,
                          width: MediaQuery.of(context).size.width,
                          decoration: DesignConfig.boxDecorationContainer(
                            ColorsRes.redColor,
                            30.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  "assets/images/fullApps/meditationApp/facebook.svg",
                                  height: 20.0,
                                  width: 20.0,
                                  fit: BoxFit.scaleDown),
                              SizedBox(width: 10.0),
                              Text(
                                StringsRes.signUpWithFacebook,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorsRes.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "TrebuchetMS",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15.0,
                                  left: MediaQuery.of(context).size.width / 12,
                                  right: 10.0),
                              child: Text(
                                StringsRes.haveAnAccount,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorsRes.textColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "TrebuchetMS",
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginActivity(),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15.0,
                                    right:
                                        MediaQuery.of(context).size.width / 12),
                                child: Text(
                                  StringsRes.signIn,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorsRes.skyColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.underline,
                                    fontFamily: "TrebuchetMS",
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
