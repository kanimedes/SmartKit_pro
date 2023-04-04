import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/IntroSliderActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';

class CryptoSplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CryptoSplashScreenState();
  }
}

class CryptoSplashScreenState extends State<CryptoSplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroSliderActivity()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: DesignConfig.gradient,
          ),
          child: Center(
            child: Image.asset(
              'assets/images/fullApps/cryptotech/logo.png',
              height: MediaQuery.of(context).size.width - 130,
            ),
          ),
        ),
      ),
    );
  }
}
