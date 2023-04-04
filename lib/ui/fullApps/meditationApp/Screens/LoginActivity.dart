import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/CategoryActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/ForgotPasswordActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/SignupActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/BackgroundClipper.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/StringsRes.dart';

class LoginActivity extends StatefulWidget {
  const LoginActivity({Key? key}) : super(key: key);

  @override
  LoginActivityState createState() => LoginActivityState();
}

class LoginActivityState extends State<LoginActivity> {
  bool _obscureTextold = true;
  late TextEditingController emailController, passwordController;

  final Shader linearGradient = LinearGradient(
    colors: const <Color>[
      ColorsRes.gradientColor1,
      ColorsRes.gradientColor2,
      ColorsRes.gradientColor3
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  Widget showEmail() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 12, vertical: 5),
      child: TextFormField(
        controller: emailController,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: ColorsRes.black,
          fontFamily: "TrebuchetMS",
        ),
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

  Widget showPassword() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 12, vertical: 5),
      child: TextFormField(
        controller: passwordController,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.black,
          fontFamily: "TrebuchetMS",
        ),
        obscureText: _obscureTextold,
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
                  _obscureTextold = !_obscureTextold;
                });
              },
              child: Icon(
                _obscureTextold ? Icons.visibility : Icons.visibility_off,
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

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: "blacksmith_as@gmail.com");
    passwordController = TextEditingController(text: "123456");
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            OctoImage(
              image: CachedNetworkImageProvider(
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Floginback.jpg?alt=media&token=bead7fdf-e321-4308-8570-e91701be1885"),
              placeholderBuilder: OctoPlaceholder.blurHash(
                "LMQk4p?@4VxV]\$Q.f-X800n5lRV[",
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              errorBuilder: OctoError.icon(color: ColorsRes.black),
              fit: BoxFit.fill,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryActivity(),
                    ),
                  );
                },
                child: Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 15.9,
                        right: MediaQuery.of(context).size.width / 16),
                    child: Text(StringsRes.skip.toUpperCase(),
                        style: TextStyle(
                          color: ColorsRes.white,
                          fontSize: 18,
                          fontFamily: "TrebuchetMS",
                        )))),
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 15.9,
                    left: MediaQuery.of(context).size.width / 16),
                child: Icon(Icons.arrow_back, color: ColorsRes.white)),
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4.9,
                    left: MediaQuery.of(context).size.width / 14),
                child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: const <Color>[
                          ColorsRes.gradientColor1,
                          ColorsRes.gradientColor2,
                          ColorsRes.gradientColor3
                        ],
                        tileMode: TileMode.repeated,
                      ).createShader(bounds);
                    },
                    child: Text(StringsRes.welcomeBack,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = linearGradient)))),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Stack(
                    children: [
                      ClipPath(
                          clipper: RoundedDiagonalShape(),
                          child: Container(
                            color: ColorsRes.backgroundColor,
                            height: MediaQuery.of(context).size.height / 1.9,
                            width: MediaQuery.of(context).size.width,
                          )),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryActivity(),
                                  ),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height /
                                        10.2,
                                    right:
                                        MediaQuery.of(context).size.width / 10),
                                height: MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 6.4,
                                decoration: DesignConfig.buttonShadowColor(
                                    ColorsRes.gradientColor1,
                                    30.0,
                                    ColorsRes.gradientColor2,
                                    ColorsRes.gradientColor3),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: ColorsRes.white,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 15.0,
                                  left: MediaQuery.of(context).size.height / 18,
                                  right:
                                      MediaQuery.of(context).size.height / 18,
                                  bottom: 10.0),
                              child: Text(
                                StringsRes.pleaseSignIn,
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
                          showPassword(),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordActivity(),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 15.0,
                                      left: MediaQuery.of(context).size.width /
                                          12,
                                    ),
                                    child: Text(
                                      StringsRes.forgotPassword,
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
                                            MediaQuery.of(context).size.width /
                                                12),
                                    child: Text(
                                      StringsRes.signUp,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
