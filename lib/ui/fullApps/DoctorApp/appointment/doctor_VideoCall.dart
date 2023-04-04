import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helper/ColorRes.dart';
import '../helper/doctore_DesignConfig.dart';
import 'doctor_messag_call_End.dart';

class DoctorVideoCall extends StatefulWidget {
  final String? image, name;
  const DoctorVideoCall({Key? key, this.image, this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DoctorVideoCallState();
  }
}

class DoctorVideoCallState extends State<DoctorVideoCall> {
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
                  BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        height: size.height,
                        width: size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.image!),
                                fit: BoxFit.fill)),
                        child: new BackdropFilter(
                          filter:
                              new ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                          child: new Container(
                            decoration: new BoxDecoration(
                                color: Colors.white.withOpacity(0.0)),
                          ),
                        ),
                      )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                      child: Container(
                        height: size.height * .4,
                        // width: size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                              Color(0xffeeb311).withOpacity(0.9),
                              Color(0xffeeb311).withOpacity(0.5),
                              Colors.transparent,
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
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Text(
                        "Ringing...",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
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
                                        callType: "Video call"),
                              ),
                            );
                          },
                          heroTag: "data",
                          backgroundColor: Colors.redAccent,
                          child: CircleAvatar(
                              radius: 12,
                              backgroundColor: ColorRes.white,
                              child: Icon(
                                Icons.clear,
                                color: Colors.red,
                              )),
                        ),
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
                                        callType: "Video call"),
                              ),
                            );
                          },
                          heroTag: "data1",
                          backgroundColor: ColorRes.blue,
                          child: SvgPicture.asset(
                            DoctorDesignConfig.getImagePath("video_call.svg"),
                            color: ColorRes.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ])
            /* ],
        ),
      ),*/

            ));
  }
}
