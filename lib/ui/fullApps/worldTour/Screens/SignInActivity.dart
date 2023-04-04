import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/MainActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/SignUpActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBoxCurve.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/StringsRes.dart';

class SignInActivity extends StatefulWidget {
  const SignInActivity({Key? key}) : super(key: key);

  @override
  SignInActivityState createState() => SignInActivityState();
}

class SignInActivityState extends State<SignInActivity> {
  bool descTextShowFlag = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget showUsername() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
      decoration: DesignConfig.boxDecorationButtonColor(
          Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.8), 50),
      padding: const EdgeInsets.only(left: 20.0),
      child: TextFormField(
        style: TextStyle(color: ColorsRes.black),
        cursorColor: ColorsRes.black,
        decoration: InputDecoration(
          hintText: StringsRes.userNameText,
          hintStyle: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: ColorsRes.grayColor)),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.name,
      ),
    );
  }

  Widget showPassword() {
    return Container(
      margin: EdgeInsets.only(
        top: 15.0,
        left: 30.0,
        right: 30.0,
      ),
      decoration: DesignConfig.boxDecorationButtonColor(
          Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.8), 50),
      padding: const EdgeInsets.only(left: 20.0),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(color: ColorsRes.black),
        cursorColor: ColorsRes.black,
        decoration: InputDecoration(
          hintText: StringsRes.passwordText,
          hintStyle: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: ColorsRes.grayColor)),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: OctoImage(
                  image: CachedNetworkImageProvider(
                      'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fimage_b.jpg?alt=media&token=2279a2b7-205e-4543-8260-b379377c5ba4'),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    'LA7{HstRnNyEK-.SkDkWMJXT%zWB',
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  errorBuilder: OctoError.icon(color: ColorsRes.bottomColor),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.5),
            height: MediaQuery.of(context).size.height,
            child: GlassBoxCurve(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(
                        StringsRes.welcomeText,
                        style: TextStyle(
                            fontSize: 35,
                            color: ColorsRes.black,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    showUsername(),
                    showPassword(),
                    Container(
                      margin: EdgeInsets.only(
                          left: 30.0,
                          top: MediaQuery.of(context).size.height / 45,
                          right: 30.0,
                          bottom: MediaQuery.of(context).size.height / 45),
                      child: Row(children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                descTextShowFlag = !descTextShowFlag;
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.all(5.0),
                                decoration:
                                    DesignConfig.boxDecorationButtonColor(
                                        Colors.white.withOpacity(0.8),
                                        Colors.white.withOpacity(0.8),
                                        10),
                                child: Icon(Icons.done,
                                    color: descTextShowFlag
                                        ? ColorsRes.grayColor
                                        : Colors.transparent))),
                        SizedBox(width: 10.0),
                        Text(
                          StringsRes.rememberMeText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorsRes.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ]),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainActivity(),
                          ),
                        );
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: DesignConfig.boxDecorationButtonColor(
                                ColorsRes.blueColor, ColorsRes.blueColor, 25),
                            alignment: AlignmentDirectional.center,
                            margin: EdgeInsets.only(
                                left: 30.0,
                                top: MediaQuery.of(context).size.height / 99,
                                right: 30.0),
                            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  StringsRes.loginText,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorsRes.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.arrow_forward,
                                    color: ColorsRes.white),
                              ],
                            )),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Divider(
                      color: ColorsRes.white.withOpacity(0.7),
                      thickness: 2,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 24,
                          bottom: MediaQuery.of(context).size.height / 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                StringsRes.doNotHaveAccountText,
                                style: TextStyle(
                                    fontSize: 15, color: ColorsRes.white),
                              )),
                          SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpActivity(),
                                ),
                              );
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                padding: EdgeInsets.only(
                                  bottom: 1, // Space between underline and text
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  color: ColorsRes.black,
                                  width: 1.0, // Underline thickness
                                ))),
                                child: Text(
                                  StringsRes.signUpText,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: ColorsRes.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
