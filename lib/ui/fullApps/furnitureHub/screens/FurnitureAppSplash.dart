// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';

import '../../widgets/slideAnimation.dart';
import 'IntroductionActivity.dart';

class FurnitureAppSplash extends StatefulWidget {
  FurnitureAppSplash({Key? key}) : super(key: key);

  @override
  _FurnitureAppSplashState createState() => _FurnitureAppSplashState();
}

class _FurnitureAppSplashState extends State<FurnitureAppSplash>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    startTime();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: ColorsRes.backgroundColor,
        shadowColor: Colors.transparent,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: ColorsRes.backgroundColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideAnimation(
                    position: 1,
                    itemCount: 8,
                    slideDirection: SlideDirection.fromBottom,
                    animationController: _animationController,
                    child: SvgPicture.asset(
                      'assets/images/fullApps/furnitureHub/app_logo.svg',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  startTime() async {
    var _duration = Duration(milliseconds: 1000);
    return Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => IntroductionActivity(),
      ),
    );
  }
}
