import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Color.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/String.dart';

import 'Helper/Session.dart';
import 'Helper/Slideanimation.dart';
import 'IntroPage.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> with TickerProviderStateMixin {
  AnimationController? _slideController;
  AnimationController? _slideController1;
  AnimationController? _slideController2;
  AnimationController? controller;
  double scaleFactor = 1;
  Animation<Offset>? offset;
  Animation<int>? _characterCount;
  int? _stringIndex;
  static late final List<String> _kStrings = <String>[fast_trend_news_lbl];
  bool isFirst = true;

  String get _currentString => _kStrings[_stringIndex! % _kStrings.length];

  @override
  void initState() {
    super.initState();
    scale();
    _slideController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _slideController1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _slideController2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _slideController2!.forward();
    offset = Tween<Offset>(begin: Offset(0.0, 0.6), end: Offset.zero)
        .animate(_slideController2!);
    controller = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          navigationPage();
        }
      });
    _stringIndex = _stringIndex == null ? 0 : _stringIndex! + 1;
    _characterCount = new StepTween(begin: 0, end: _currentString.length)
        .animate(
            new CurvedAnimation(parent: controller!, curve: Curves.easeIn));
    _slideController1!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller!.forward();
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    _slideController!.dispose();
    _slideController1!.dispose();
    _slideController2!.dispose();
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(body: buildScale());
  }

  scale() async {
    for (var i = 0; i < 15; i++) {
      await Future.delayed(Duration(milliseconds: 50), () {
        setState(() {
          scaleFactor += 0.05;
          isFirst = false;
        });
      });
    }
    for (var i = 0; i < 15; i++) {
      await Future.delayed(Duration(milliseconds: 50), () {
        setState(() {
          scaleFactor -= 0.05;
          isFirst = false;
        });
      });
    }
  }

  //navigate page route
  Future<void> navigationPage() async {
    bool isFirstTime = await getPrefrenceBool(ISFIRSTTIME);
    if (isFirstTime) {
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => IntroSliderScreen(),
          ));
    }
  }

  Widget buildScale() {
    return Stack(children: [
      Positioned.directional(
          textDirection: Directionality.of(context),
          bottom: 0,
          start: 0,
          end: 0,
          child: Transform.scale(
              scale: scaleFactor,
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/fullApps/modernNews/read.png",
                width: double.maxFinite,
                //height: scaleFactor == 1 ? deviceHeight! * 0.4 : deviceHeight,
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ))),
      scaleFactor == 1 && !isFirst
          ? Positioned.directional(
              textDirection: Directionality.of(context),
              bottom: 0,
              start: 0,
              end: 0,
              height: deviceHeight! / 1.35,
              child: SlideTransition(
                  position: offset!,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(280.0)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(
                          padding: EdgeInsetsDirectional.only(top: 60.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(280.0)),
                              color: colors.tempboxColor.withOpacity(0.4)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(end: 50.0),
                                  child: SlideAnimation(
                                      position: 2,
                                      itemCount: 3,
                                      slideDirection: SlideDirection.fromLeft,
                                      animationController: _slideController!,
                                      child: Image.asset(
                                        "assets/images/fullApps/modernNews/splash_Icon.png",
                                        height: 60.0,
                                        fit: BoxFit.fill,
                                      ))),
                              Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(end: 30.0),
                                  child: Padding(
                                      padding: EdgeInsets.only(top: 7.0),
                                      child: SlideAnimation(
                                          position: 2,
                                          itemCount: 2,
                                          slideDirection:
                                              SlideDirection.fromBottom,
                                          animationController:
                                              _slideController1!,
                                          child: Image.asset(
                                            "assets/images/fullApps/modernNews/NEWs.png",
                                            height: 45.0,
                                            fit: BoxFit.fill,
                                          )))),
                              Container(
                                margin:
                                    new EdgeInsetsDirectional.only(top: 25.0),
                                child: _characterCount == null
                                    ? null
                                    : new AnimatedBuilder(
                                        animation: _characterCount!,
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          String text =
                                              _currentString.substring(
                                                  0, _characterCount!.value);
                                          return new Text(text,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .copyWith(
                                                    color: colors.tempdarkColor,
                                                  ));
                                        },
                                      ),
                              ),
                            ],
                          )),
                    ),
                  )))
          : Container()
    ]);
  }
}
