import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/IntroductionActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';

class TravelAppSplash extends StatefulWidget {
  const TravelAppSplash({Key? key}) : super(key: key);

  @override
  _TravelAppSplashState createState() => _TravelAppSplashState();
}

class _TravelAppSplashState extends State<TravelAppSplash>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    startTime();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: ColorsRes.splashBackgroundColor,
        shadowColor: Colors.transparent,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: ColorsRes.splashBackgroundColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/fullApps/worldTour/appLogo.png',
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
