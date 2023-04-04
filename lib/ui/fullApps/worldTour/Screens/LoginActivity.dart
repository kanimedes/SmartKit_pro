import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/SignInActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/SignUpActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBoxCurve.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/StringsRes.dart';

class LoginActivity extends StatefulWidget {
  const LoginActivity({Key? key}) : super(key: key);

  @override
  LoginActivityState createState() => LoginActivityState();
}

class LoginActivityState extends State<LoginActivity> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: OctoImage(
                  image: CachedNetworkImageProvider(
                      'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fimage_a.jpg?alt=media&token=a7b114fa-1c05-4f75-8a48-8adff5dd915b'),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    'LFEpfu00y@_N=#tPEer]JF%2V=IV',
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
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.7),
            child: GlassBoxCurve(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpActivity(),
                          ),
                        );
                      },
                      child: Container(
                          decoration: DesignConfig.boxDecorationButtonColor(
                              ColorsRes.blueColor, ColorsRes.blueColor, 25),
                          alignment: AlignmentDirectional.center,
                          margin: EdgeInsets.only(
                              left: 30.0, top: 50.0, right: 30.0),
                          padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  "assets/images/fullApps/worldTour/svg/mail_icon.svg"),
                              SizedBox(width: 10),
                              Text(
                                StringsRes.signUpText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: ColorsRes.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                        bottom: 30.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 70, height: 45,
                            decoration: DesignConfig.boxDecorationButtonColor(
                                Colors.white.withOpacity(0.7),
                                Colors.white.withOpacity(0.6),
                                50),
                            alignment: AlignmentDirectional.center,
                            //padding: EdgeInsets.only(left: 25.0, top: 15.0, right: 25.0, bottom: 15.0),
                            child: SvgPicture.asset(
                                "assets/images/fullApps/worldTour/svg/fb.svg"),
                          ),
                          Container(
                            width: 70, height: 45,
                            decoration: DesignConfig.boxDecorationButtonColor(
                                Colors.white.withOpacity(0.7),
                                Colors.white.withOpacity(0.6),
                                50),
                            alignment: AlignmentDirectional.center,
                            //padding: EdgeInsets.only(left: 25.0, top: 15.0, right: 25.0, bottom: 15.0),
                            child: SvgPicture.asset(
                                "assets/images/fullApps/worldTour/svg/twitter.svg"),
                          ),
                          Container(
                            width: 70, height: 45,
                            decoration: DesignConfig.boxDecorationButtonColor(
                                Colors.white.withOpacity(0.7),
                                Colors.white.withOpacity(0.6),
                                50),
                            alignment: AlignmentDirectional.center,
                            //padding: EdgeInsets.only(left: 25.0, top: 15.0, right: 25.0, bottom: 15.0),
                            child: SvgPicture.asset(
                                "assets/images/fullApps/worldTour/svg/google.svg"),
                          ),
                          Container(
                            width: 70, height: 45,
                            decoration: DesignConfig.boxDecorationButtonColor(
                                Colors.white.withOpacity(0.7),
                                Colors.white.withOpacity(0.6),
                                50),
                            alignment: AlignmentDirectional.center,
                            //padding: EdgeInsets.only(left: 25.0, top: 15.0, right: 25.0, bottom: 15.0),
                            child: SvgPicture.asset(
                                "assets/images/fullApps/worldTour/svg/apple.svg"),
                          ),
                        ],
                      ),
                    ),
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
                                StringsRes.alreadyHaveAnAccountText,
                                style: TextStyle(
                                    fontSize: 15, color: ColorsRes.white),
                              )),
                          SizedBox(width: 10.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInActivity(),
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
                                  StringsRes.loginText,
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
