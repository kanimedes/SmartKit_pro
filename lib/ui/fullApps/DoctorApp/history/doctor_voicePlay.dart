import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/SlideAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import '../helper/wave_slider.dart';

class DoctorVoicePlay extends StatefulWidget {
  final String? image, title, time, status;
  const DoctorVoicePlay(
      {Key? key, this.image, this.title, this.time, this.status})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DoctorVoicePlayState();
  }
}

class DoctorVoicePlayState extends State<DoctorVoicePlay>
    with TickerProviderStateMixin {
  bool pause = true, play = false;
  AnimationController? _animationController;
  AnimationController? rotationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    rotationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    rotationController!.forward(from: 0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    rotationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorRes.white,
        appBar: DoctorDesignConfig.appBar(
          context: context,
          isIcon: true,
          icon: Icons.more_vert,
          title: DoctorStringRes.voiceCall,
          iconColor: ColorRes.blue,
          textColor: ColorRes.black,
          size: size,
        ),
        body: Container(
            margin: EdgeInsets.only(
                left: size.width * .06, right: size.width * .06),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DoctorAnimation(
                  delay: 100,
                  child: SlideAnimation(
                      position: 10,
                      itemCount: 20,
                      slideDirection: SlideDirection.fromLeft,
                      animationController: _animationController,
                      child: Container(
                        height: size.height * .12,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Color(0xffedf0f1), width: 1),
                          boxShadow: [
                            new BoxShadow(
                                color: Color(0xfff7faff),
                                blurRadius: 20.0,
                                blurStyle: BlurStyle.outer),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15)),
                                        child: Image.asset(
                                          widget.image!,
                                          height: size.height * .13,
                                          width: size.width * .3,
                                          fit: BoxFit.fill,
                                        )),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                          height: size.height * .045,
                                          width: size.width * .1,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10)),
                                            color: ColorRes.blue,
                                          ),
                                          child: RotationTransition(
                                              turns: Tween(begin: 0.0, end: 1.0)
                                                  .animate(rotationController!),
                                              child: Padding(
                                                padding: EdgeInsets.all(8),
                                                child: SvgPicture.asset(
                                                  DoctorDesignConfig
                                                      .getImagePath(
                                                          "call_02.svg"),
                                                  color: ColorRes.white,
                                                ),
                                                /*Icon(
                                          Icons.call,size: 20,
                                          color: Colors.white,
                                        ),*/
                                              ))),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Expanded(
                              flex: 9,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    widget.title!,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: size.height * .01,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Voice call -",
                                      style: TextStyle(
                                          color: ColorRes.black, fontSize: 10),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: widget.status!,
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 10)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * .01,
                                  ),
                                  Text(
                                    widget.time!,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))),
              DoctorDesignConfig.line(),
              SizedBox(
                height: size.height * .02,
              ),
              DoctorAnimation(
                  delay: 200,
                  child: SlideAnimation(
                      position: 10,
                      itemCount: 20,
                      slideDirection: SlideDirection.fromRight,
                      animationController: _animationController,
                      child: Text(
                        "30 minuts of voice call have been recorded",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ))),
              SizedBox(
                height: size.height * .02,
              ),
              DoctorAnimation(
                  delay: 200,
                  child: SlideAnimation(
                      position: 10,
                      itemCount: 20,
                      slideDirection: SlideDirection.fromRight,
                      animationController: _animationController,
                      child: MusicSlider(
                        emptyColors: [Colors.blue.shade100],
                        fillColors: const [Colors.blue],
                        controller: MusicSliderController(initialValue: 0.4),
                        animateWaveByTime: true,
                        initialTime: 10,
                        tickCount: Duration(seconds: 1),
                        height: 50,
                        division: 53,
                        wave: (x, t, a) =>
                            a * sin(x * 0.3 - t * 0.3) * sin(x * 0.3 + t * 0.3),
                        width: size.width * .88,
                      ))),
              SizedBox(
                height: size.height * .02,
              ),
              DoctorAnimation(
                  delay: 300,
                  child: SlideAnimation(
                      position: 10,
                      itemCount: 20,
                      slideDirection: SlideDirection.fromBottom,
                      animationController: _animationController,
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "10:07 min",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          )))),
              SizedBox(
                height: size.height * .03,
              ),
              DoctorAnimation(
                  delay: 300,
                  child: SlideAnimation(
                      position: 10,
                      itemCount: 20,
                      slideDirection: SlideDirection.fromBottom,
                      animationController: _animationController,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                pause = true;
                                play = false;
                              });
                            },
                            child: Text(
                              DoctorStringRes.pause,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: pause ? ColorRes.white : ColorRes.blue,
                                  fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(110, 40),
                              primary: pause ? ColorRes.blue : ColorRes.white,
                              alignment: Alignment.center,
                              elevation: 0,
                              side: BorderSide(
                                width: 2.0,
                                color: ColorRes.blue,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * .05,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                pause = false;
                                play = true;
                              });
                            },
                            child: Text(
                              DoctorStringRes.stop,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: play ? ColorRes.white : ColorRes.blue,
                                  fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(110, 40),
                              primary: play ? ColorRes.blue : ColorRes.white,
                              alignment: Alignment.center,
                              elevation: 0,
                              side: BorderSide(
                                width: 2.0,
                                color: ColorRes.blue,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ],
                      ))),
            ])));
  }
}
