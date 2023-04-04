import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/StringsRes.dart';

class ForgotPasswordActivity extends StatefulWidget {
  const ForgotPasswordActivity({Key? key}) : super(key: key);

  @override
  ForgotPasswordActivityState createState() => ForgotPasswordActivityState();
}

class ForgotPasswordActivityState extends State<ForgotPasswordActivity> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> _buildIndicatorEmail() {
    List<Widget> indicators = [];
    for (int i = 0; i < 5; i++) {
      indicators.add(Container(
          height: 8,
          width: 8,
          margin: EdgeInsets.only(right: 3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsRes.black,
          )));
    }

    return indicators;
  }

  List<Widget> _buildIndicatorPhone() {
    List<Widget> indicators = [];
    for (int i = 0; i < 8; i++) {
      indicators.add(Container(
          height: 8,
          width: 8,
          margin: EdgeInsets.only(
            right: i == 4 ? 12 : 3,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorsRes.black,
          )));
    }

    return indicators;
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
              leading: BackButton(color: ColorsRes.black)),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 15.0,
                          left: MediaQuery.of(context).size.height / 20,
                          right: MediaQuery.of(context).size.height / 18,
                          bottom: 10.0),
                      child: Text(
                        StringsRes.forgotPassword,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorsRes.black,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          fontFamily: "TrebuchetMS",
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 15.0,
                          left: MediaQuery.of(context).size.height / 20,
                          right: MediaQuery.of(context).size.height / 18,
                          bottom: 10.0),
                      child: Text(
                        StringsRes.forgotPasswordSubTitle,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorsRes.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Lato",
                        ),
                      ),
                    ),
                    Container(
                        decoration: DesignConfig.boxDecorationContainer(
                            ColorsRes.cardColor, 18.0),
                        margin: EdgeInsets.only(
                            top: 20.0,
                            left: MediaQuery.of(context).size.height / 20,
                            right: MediaQuery.of(context).size.height / 20),
                        padding: EdgeInsets.all(20.0),
                        child: Row(children: [
                          Expanded(
                              flex: 2,
                              child: SvgPicture.asset(
                                  "assets/images/fullApps/meditationApp/mobile_verification.svg",
                                  height: 44.0,
                                  width: 44.0)),
                          Expanded(
                            flex: 12,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                25,
                                        right:
                                            MediaQuery.of(context).size.height /
                                                18,
                                        bottom: 10.0),
                                    child: Text(
                                      StringsRes.vieSMS,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: ColorsRes.textColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "TrebuchetMS",
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                25,
                                        right:
                                            MediaQuery.of(context).size.height /
                                                18,
                                        bottom: 10.0),
                                    child: Row(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: _buildIndicatorPhone(),
                                        ),
                                        Text(
                                          " 210",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: ColorsRes.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: "TrebuchetMS",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          )
                        ])),
                    Container(
                        decoration: DesignConfig.boxDecorationContainer(
                            ColorsRes.cardColor, 18.0),
                        margin: EdgeInsets.only(
                            top: 20.0,
                            left: MediaQuery.of(context).size.height / 22,
                            right: MediaQuery.of(context).size.height / 22),
                        padding: EdgeInsets.only(
                            left: 20.0, top: 20.0, bottom: 20.0),
                        child: Row(children: [
                          Expanded(
                              flex: 2,
                              child: SvgPicture.asset(
                                  "assets/images/fullApps/meditationApp/mail_verification.svg",
                                  height: 44.0,
                                  width: 44.0)),
                          Expanded(
                            flex: 12,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                25,
                                        right:
                                            MediaQuery.of(context).size.height /
                                                18,
                                        bottom: 10.0),
                                    child: Text(
                                      StringsRes.vieSMS,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: ColorsRes.textColor,
                                        fontSize: 16,
                                        fontFamily: "TrebuchetMS",
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                25,
                                        right:
                                            MediaQuery.of(context).size.height /
                                                18,
                                        bottom: 10.0),
                                    child: Row(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: _buildIndicatorEmail(),
                                        ),
                                        Text(
                                          "th_as@gmail.com",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: ColorsRes.black,
                                            fontSize: 15,
                                            fontFamily: "TrebuchetMS",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          )
                        ])),
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
                          StringsRes.send.toUpperCase(),
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
