import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/imageAsset.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnBoarding();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenWidget();
  }

  _navigateToOnBoarding() async {
    await Future.delayed(Duration(seconds: 2), () {
      // Navigator.pushReplacementNamed(context, signInScreen);
      Navigator.pushReplacementNamed(context, introSliderScreen);
    });
  }
}

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: imageAsset(
          fileName: "logo.svg",
          imgWidth: MediaQuery.of(context).size.width,
          imgHeight: MediaQuery.of(context).size.width,
          isNormalImage: false,
        ),
      ),
    );
  }
}
