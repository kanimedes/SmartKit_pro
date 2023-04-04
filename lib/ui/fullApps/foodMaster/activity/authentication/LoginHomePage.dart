import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/authentication/SignupActivity.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';

import '../MainHomePage.dart';
import 'LoginActivity.dart';

class LoginHomePage extends StatefulWidget {
  final String? from;
  const LoginHomePage({
    Key? key,
    this.from,
  }) : super(key: key);

  @override
  _LoginHomePageState createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: [
          OctoImage(
            image: CachedNetworkImageProvider(
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2Fbackground_image.jpg?alt=media&token=497afce5-6eaf-4e46-a27c-215dde173485"),
            placeholderBuilder:
                OctoPlaceholder.blurHash("L^Lz]ht8j@WB~qt7j[WBR+f5j]ae"),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            errorBuilder: OctoError.icon(color: ColorsRes.black),
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                bottom: MediaQuery.of(context).padding.bottom,
                left: 15,
                right: 15),
            child: Column(children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    if (widget.from == 'splash' || widget.from == 'intro') {
                      Constant.goToMainPage(widget.from, context);
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  child: DesignConfig.shadowButton(
                      Colors.white,
                      StringsRes.lblskip,
                      ColorsRes.orangeColor,
                      20,
                      Colors.white),
                ),
              ),
              SingleChildScrollView(
                  padding: EdgeInsets.only(left: 15, top: 2 * kToolbarHeight),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringsRes.welcometitle,
                          style: Theme.of(context).textTheme.headline4!.merge(
                              TextStyle(
                                  color: ColorsRes.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          StringsRes.appname,
                          style: Theme.of(context).textTheme.headline4!.merge(
                              TextStyle(
                                  color: ColorsRes.orangeColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          StringsRes.welcomeinfo,
                          style: Theme.of(context).textTheme.subtitle1!.merge(
                              TextStyle(
                                  color: ColorsRes.black.withOpacity(0.6))),
                        ),
                      ])),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(children: [
                    Expanded(
                        child: Divider(
                      color: ColorsRes.white,
                      indent: 15,
                      endIndent: 15,
                    )),
                    Text(
                      StringsRes.signinwith,
                      style: TextStyle(color: ColorsRes.white),
                    ),
                    Expanded(
                        child: Divider(
                      color: ColorsRes.white,
                      indent: 15,
                      endIndent: 15,
                    )),
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      CupertinoPageRoute(
                                          builder: (context) => MainHomePage(
                                                from: "pagefrom",
                                              )),
                                      (Route<dynamic> route) => false);
                                },
                                child: Image.asset(
                                  "assets/images/fullApps/foodMaster/button__facebook.png",
                                  width: width / 2.5,
                                ))),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      CupertinoPageRoute(
                                          builder: (context) => MainHomePage(
                                                from: "pagefrom",
                                              )),
                                      (Route<dynamic> route) => false);
                                },
                                child: Image.asset(
                                  "assets/images/fullApps/foodMaster/button_google.png",
                                  width: width / 2.5,
                                ))),
                        //if (Platform.isIOS)
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      CupertinoPageRoute(
                                          builder: (context) => MainHomePage(
                                                from: "pagefrom",
                                              )),
                                      (Route<dynamic> route) => false);
                                },
                                child: Image.asset(
                                  "assets/images/fullApps/foodMaster/button_apple.png",
                                  width: width / 2.5,
                                ))),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) =>
                                SignupActivity(from: "loginhome")));
                      },
                      child: DesignConfig.shadowButtonFullwidgth(
                          Colors.white.withOpacity(0.1),
                          StringsRes.manuallogin,
                          ColorsRes.white,
                          28,
                          Colors.white,
                          context),
                    ),
                  ),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(color: ColorsRes.white),
                          text: StringsRes.alreadyhvac,
                          children: <TextSpan>[
                        TextSpan(
                            text: StringsRes.lblsignin,
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) => LoginActivity()));
                              }),
                      ])),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ))
            ]),
          ),
        ],
      ),
    );
  }
}
