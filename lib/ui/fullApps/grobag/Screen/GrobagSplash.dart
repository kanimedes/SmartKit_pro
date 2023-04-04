import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagOnboarding.dart';

class GrobagSplash extends StatefulWidget {
  const GrobagSplash({Key? key}) : super(key: key);

  @override
  _GrobagSplashState createState() => _GrobagSplashState();
}

class _GrobagSplashState extends State<GrobagSplash> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: grobaggradient),
          child: Center(
            child: SvgPicture.asset(
              'assets/images/fullApps/grobag/splashlogo.svg',
            ),
          ),
        ),
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
          builder: (context) => GrobagOnbording(),
        ));
  }
}
