import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/activity/IntroductionMobile.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/ColorsRes.dart';

class EstudySplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new EstudySplashScreenState();
  }
}

class EstudySplashScreenState extends State<EstudySplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => IntroductionMobile()));
    });
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: new Scaffold(
        backgroundColor: ColorsRes.appcolor,
        resizeToAvoidBottomInset: false,
        body: Center(
            child: SvgPicture.asset(
                'assets/images/fullApps/eStudy/splashlogo.svg',
                color: ColorsRes.white)),
      ),
    );
  }
}
