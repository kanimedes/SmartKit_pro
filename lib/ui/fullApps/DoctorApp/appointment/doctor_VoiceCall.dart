import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helper/ColorRes.dart';
import '../helper/doctore_DesignConfig.dart';
import 'doctor_messag_call_End.dart';

class DoctorVoiceCall extends StatefulWidget {
  final String? image, name;
  const DoctorVoiceCall({Key? key, this.image, this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DoctorVoiceCallState();
  }
}

class DoctorVoiceCallState extends State<DoctorVoiceCall> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Stack(
                alignment: Alignment.bottomCenter,
                fit: StackFit.passthrough,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                      child: Container(
                        height: size.height,
                        width: size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                              Color(0xffeeb311).withOpacity(0.9),
                              Color(0xffeeb311).withOpacity(0.5),
                              Colors.white,
                              Colors.white,
                              Colors.white,
                              Colors.white,
                              Colors.white,
                            ])),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: size.height * .25,
                        width: size.width * .4,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(widget.image!))),
                      ),
                      Text(
                        widget.name!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Text(
                        "Ringing...",
                        style: TextStyle(
                            fontSize: 14,
                            color: ColorRes.fontColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: size.height * .04,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DoctorMessageEnd(
                                          title: widget.name,
                                          image: widget.image,
                                          callType: "Voice call"),
                                ),
                              );
                            },
                            heroTag: "d",
                            backgroundColor: Colors.redAccent,
                            child: SvgPicture.asset(
                              DoctorDesignConfig.getImagePath(
                                  "cross_circel.svg"),
                              color: ColorRes.white,
                            )),
                        SizedBox(
                          width: size.width * .06,
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    DoctorMessageEnd(
                                        title: widget.name,
                                        image: widget.image,
                                        callType: "Voice call"),
                              ),
                            );
                          },
                          heroTag: "d1",
                          backgroundColor: ColorRes.blue,
                          child: SvgPicture.asset(
                            DoctorDesignConfig.getImagePath("call_02.svg"),
                            color: ColorRes.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ])));
  }
}
