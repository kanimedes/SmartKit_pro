import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/DesignConfig.dart';

import 'IntroSliderActivity.dart';

class NewsSplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new NewsSplashScreenState();
  }
}

class NewsSplashScreenState extends State<NewsSplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    callNextPage();
  }

  callNextPage() {
    Timer(Duration(seconds: 3), () async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroSliderActivity()),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        decoration: BoxDecoration(
          gradient: DesignConfig.gradient,
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/images/fullApps/newsapp/svg/logo.svg',
            width: MediaQuery.of(context).size.width / 2,
          ),
        ),
      ),
    );
  }
}
