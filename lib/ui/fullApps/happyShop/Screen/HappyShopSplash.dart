import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopString.dart';

import 'HappyShopOnbording.dart';

class HappyShopSplash extends StatefulWidget {
  const HappyShopSplash({Key? key}) : super(key: key);

  @override
  _HappyShopSplashState createState() => _HappyShopSplashState();
}

class _HappyShopSplashState extends State<HappyShopSplash> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: back(),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/fullApps/happyshop/happyshopwhitelogo.svg',
                      width: 150.0,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "HAPPYSHOP",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'open sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 28),
                    )
                  ],
                ),
              ),
            ),
            Image.asset(
              'assets/images/fullApps/happyshop/doodle.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  back() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [primaryLight2, primaryLight3],
          stops: const [0, 1]),
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
          builder: (context) => HappyShopOnbording(),
        ));
  }
}
