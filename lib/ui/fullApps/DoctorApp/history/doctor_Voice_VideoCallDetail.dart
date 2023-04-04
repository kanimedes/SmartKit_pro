import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helper/ColorRes.dart';
import '../helper/SlideAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import 'doctor_videoPlay.dart';
import 'doctor_voicePlay.dart';

class DoctorVoiceCallDetail extends StatefulWidget {
  final String? title, image, time, status, cls;
  const DoctorVoiceCallDetail(
      {Key? key, this.title, this.image, this.time, this.status, this.cls})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DoctorVoiceCallDetailState();
  }
}

class DoctorVoiceCallDetailState extends State<DoctorVoiceCallDetail>
    with TickerProviderStateMixin {
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
        title: widget.cls == "voice"
            ? DoctorStringRes.voiceCall
            : DoctorStringRes.videoCall,
        iconColor: ColorRes.blue,
        textColor: ColorRes.black,
        size: size,
      ),
      body: Container(
        margin:
            EdgeInsets.only(left: size.width * .06, right: size.width * .06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SlideAnimation(
                position: 10,
                itemCount: 20,
                slideDirection: SlideDirection.fromRight,
                animationController: _animationController,
                child: Container(
                  height: size.height * .12,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xffedf0f1), width: 1),
                    boxShadow: [
                      new BoxShadow(
                          color: Color(0xfff7faff),
                          blurRadius: 20.0,
                          blurStyle: BlurStyle.outer),
                    ],
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    // /margin: EdgeInsets.only(left: 18,right: 18,top: 20,bottom: 20),
                                    child: RotationTransition(
                                        turns: Tween(begin: 0.0, end: 1.0)
                                            .animate(rotationController!),
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: SvgPicture.asset(
                                            widget.cls == "voice"
                                                ? DoctorDesignConfig
                                                    .getImagePath("call_02.svg")
                                                : DoctorDesignConfig
                                                    .getImagePath(
                                                        "video_call.svg"),
                                            color: ColorRes.white,
                                          ),

                                          /*Icon(
                                   widget.cls=="voice"?Icons.call:Icons.video_call,size: 20,
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
                                text: widget.cls == "voice"
                                    ? "Voice call -"
                                    : "Video call-",
                                style: TextStyle(
                                    color: ColorRes.black, fontSize: 10),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: widget.status!,
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 10)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * .01,
                            ),
                            Text(
                              widget.time!,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                            //Text(voice.status!,style: TextStyle(fontSize: 14,color: ColorRes.black,),),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            DoctorDesignConfig.line(),
            SizedBox(
              height: size.height * .02,
            ),
            SlideAnimation(
                position: 10,
                itemCount: 20,
                slideDirection: SlideDirection.fromLeft,
                animationController: _animationController,
                child: Text(
                  widget.cls == "voice"
                      ? "30 minutes of voice call have been recorded"
                      : "30 minutes of video call have been recorded",
                  style: TextStyle(fontWeight: FontWeight.w600),
                )),
            SizedBox(
              height: size.height * .04,
            ),
            SlideAnimation(
                position: 10,
                itemCount: 20,
                slideDirection: SlideDirection.fromLeft,
                animationController: _animationController,
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.play_circle_fill,
                    color: ColorRes.white,
                  ),
                  onPressed: () {
                    widget.cls == "voice"
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    DoctorVoicePlay(
                                      title: widget.title,
                                      status: widget.status,
                                      image: widget.image,
                                      time: widget.title,
                                    )))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    DoctorVideoPlay(image: widget.image)));
                  },
                  label: Text(
                    DoctorStringRes.playRec,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ColorRes.white,
                        fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(340, 55),
                    primary: ColorRes.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
