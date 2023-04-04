import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/IntroSliderScreens.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';

class FoodMasterSplashScreen extends StatefulWidget {
  const FoodMasterSplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FoodMasterSplashScreenState();
  }
}

class FoodMasterSplashScreenState extends State<FoodMasterSplashScreen> {
  @override
  initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => IntroSliderScreens()));
    });
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.splashbackgroundColor,
      body: Container(
        color: ColorsRes.splashbackgroundColor,
        alignment: Alignment.center,
        child: Lottie.asset(
          'assets/images/fullApps/foodMaster/json/Foodmaster.json',
        ),
      ),
    );
  }
}
