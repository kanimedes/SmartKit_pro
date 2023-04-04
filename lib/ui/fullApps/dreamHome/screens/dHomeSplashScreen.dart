import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../helper/DHomeconstant.dart';
import '../helper/DHomeColors.dart';
import '../helper/DHomeSplashAnimation.dart';

import 'dHomeIntroSlider.dart';

class DHomeSplashScreen extends StatefulWidget {
  const DHomeSplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DHomeSplashScreenState();
  }
}

class DHomeSplashScreenState extends State<DHomeSplashScreen>
    with TickerProviderStateMixin {
  Size size = Size.zero;
  late AnimationController _controller;
  late DHomeSplashAnimation _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animations = DHomeSplashAnimation(_controller);
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });

    startTime();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      size = MediaQuery.of(context).size;
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  startTime() async {
    var _duration = const Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DHomeIntroSlider(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: DHomeColors.black,
      child: Stack(children: [
        SizedBox(
            width: size.width,
            height: size.height,
            child: CustomPaint(
                painter: DHomeHolePainter(
                    color: DHomeColors.bgColor,
                    holeSize: _animations.holeSize.value * size.width))),
        Center(
            child: SvgPicture.asset(
          DHomeConstant.getSvgImagePath("logo.svg"),
          fit: BoxFit.contain,
        )),
      ]),
    ));
  }
}
