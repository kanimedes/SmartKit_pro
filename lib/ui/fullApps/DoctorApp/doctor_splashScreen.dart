import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'doctor_IntroSliderScreen.dart';
import 'helper/ColorRes.dart';
import 'helper/SlideAnimation.dart';
import 'helper/doctore_DesignConfig.dart';

class DoctorSplashScreen extends StatefulWidget {
  const DoctorSplashScreen({Key? key}) : super(key: key);
  @override
  _DoctorSplashScreenState createState() => _DoctorSplashScreenState();
}

class _DoctorSplashScreenState extends State<DoctorSplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    startTime();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return /*WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SmartkitProHome(),
          ),
        ) as Future<bool>;
      } as Future<bool> Function()?,
      child:*/
        Scaffold(
            backgroundColor: ColorRes.white,
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: ColorRes.white,
              alignment: Alignment.center,
              child: SlideAnimation(
                  position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromTop,
                  animationController: _animationController,
                  child: SvgPicture.asset(
                    DoctorDesignConfig.getImagePathLogo("logo.svg"),
                  )),
            ));
  }

  startTime() async {
    var _duration = const Duration(milliseconds: 1200);
    return Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const DoctorIntroSlider(),
      ),
    );
  }
}
