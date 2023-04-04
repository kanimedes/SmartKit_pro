import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/SlideAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import 'doctor_VideoCall.dart';
import 'doctor_VoiceCall.dart';
import 'doctor_messaging.dart';

class MyAppointmentDetail extends StatefulWidget {
  final String? title, image, callType, status, time;
  final String? icon;
  const MyAppointmentDetail(
      {Key? key,
      this.title,
      this.image,
      this.callType,
      this.status,
      this.time,
      this.icon})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppointmentDetailState();
  }
}

class MyAppointmentDetailState extends State<MyAppointmentDetail>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  AnimationController? rotationController;
  @override
  void dispose() {
    _animationController!.dispose();
    rotationController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    rotationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    rotationController!.forward(from: 0.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String buttonName = widget.callType == "Voice call -"
        ? "Voice call"
        : widget.callType == "Messaging -"
            ? "Message"
            : "Video call";
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      bottomNavigationBar: DoctorAnimation(
          delay: 400,
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * .06,
                right: size.width * .06,
                bottom: size.width * .06),
            child: DoctorDesignConfig.Button(
                onpress: () {
                  if (widget.callType == "Messaging -") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => DoctorMessaging(
                            title: widget.title,
                            image: widget.image,
                            time: widget.time),
                      ),
                    );
                  } else if (widget.callType == "Voice call -") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => DoctorVoiceCall(
                          name: widget.title,
                          image: widget.image,
                        ),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => DoctorVideoCall(
                          name: widget.title,
                          image: widget.image,
                        ),
                      ),
                    );
                  }
                },
                name: "$buttonName Now (Start at 10:00 AM)",
                foreground: ColorRes.blue,
                TextColor: ColorRes.white),
          )),
      appBar: DoctorDesignConfig.appBar(
        isSvg: false,
        context: context,
        isIcon: false,
        size: size,
        textColor: ColorRes.black,
        iconColor: ColorRes.blue,
        title: DoctorStringRes.myAppointment,
      ),
      body: Container(
        margin:
            EdgeInsets.only(left: size.width * .06, right: size.width * .06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SlideAnimation(
                position: 10,
                itemCount: 20,
                slideDirection: SlideDirection.fromRight,
                animationController: _animationController,
                child: Container(
                    height: size.height * .11,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomLeft: Radius.circular(15)),
                                  child: Image.asset(
                                    widget.image!,
                                    height: size.height * .13,
                                    width: size.width * .2,
                                    fit: BoxFit.fill,
                                  )),
                              Positioned(
                                bottom: 0,
                                right: 2,
                                child: Container(
                                    height: size.height * .045,
                                    width: size.width * .1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10)),
                                      color: ColorRes.blue,
                                    ),
                                    // /margin: EdgeInsets.only(left: 18,right: 18,top: 20,bottom: 20),
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: SvgPicture.asset(
                                        widget.icon!,
                                        color: Colors.white,
                                      ),
                                      /* Icon(
                                      widget.icon,size: 20,
                                      color: Colors.white,
                                    ),*/
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * .05,
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              /*  RichText(
                                        text: TextSpan(
                                          children:highlightOccurrences(appointment.title!, query),*/

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
                                  text: widget.callType!,
                                  style: TextStyle(
                                      color: ColorRes.black, fontSize: 10),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: widget.status,
                                        style: TextStyle(
                                            color: ColorRes.blue,
                                            fontSize: 10)),
                                  ],
                                ),
                              ),
                              // Icon(Icons.star_half,color: ColorRes.blue,size: 12,),

                              SizedBox(
                                height: size.height * .01,
                              ),
                              Text(
                                widget.time!,
                                style: TextStyle(
                                    fontSize: 10,
                                    color: ColorRes.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(width: size.width*.05,),
                        Expanded(
                          flex: 3,
                          child: Card(
                              color: Color(0xffe9f0ff),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              margin: EdgeInsets.only(
                                  left: 18, right: 18, top: 20, bottom: 20),
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  widget.icon!,
                                  color: ColorRes.blue,
                                ),
                                /*  Icon(
                                widget.icon,size: 20,
                                color: Colors.blue,
                              ),*/
                              )),
                        ),
                      ],
                    ))),
            DoctorDesignConfig.designCard(
                size: size, rotationController: rotationController),
            /*   SlideAnimation(
                position: 10,
                itemCount: 20,
                slideDirection: SlideDirection.fromLeft,
                animationController: _animationController,
                child: Container(
                    height: size.height * .15,
                    padding: EdgeInsets.only(top: size.height * .015),
                    margin: EdgeInsets.only(top: size.height * .03),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorRes.blue,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Card(
                                color: Color(0xffe9f0ff),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: SvgPicture.asset(
                                      DoctorDesignConfig.getImagePath(
                                          "invite.svg"),
                                      color: ColorRes.blue),
                                  */ /*Icon(
                                  Icons.supervisor_account,size: 20,
                                  color: Colors.blue,
                                ),*/ /*
                                )),
                            SizedBox(
                              height: size.height * .005,
                            ),
                            Text(
                              "5000+",
                              style: TextStyle(
                                  color: ColorRes.blue,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: size.height * .005,
                            ),
                            Text(
                              "Patients",
                              style: TextStyle(
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Card(
                                color: Color(0xffe9f0ff),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: SvgPicture.asset(
                                      DoctorDesignConfig.getImagePath(
                                          "user_active.svg"),
                                      color: ColorRes.blue),
                                  */ /* Icon(
                                  Icons.person,size: 20,
                                  color: Colors.blue,
                                ),*/ /*
                                )),
                            SizedBox(
                              height: size.height * .005,
                            ),
                            Text(
                              "15+",
                              style: TextStyle(
                                  color: ColorRes.blue,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: size.height * .005,
                            ),
                            Text(
                              "Years experiences",
                              style: TextStyle(
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Card(
                                color: Color(0xffe9f0ff),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: SvgPicture.asset(
                                      DoctorDesignConfig.getImagePath(
                                          "message.svg"),
                                      color: ColorRes.blue),
                                  */ /*Icon(
                                  Icons.chat,size: 20,
                                  color: Colors.blue,
                                ),*/ /*
                                )),
                            SizedBox(
                              height: size.height * .005,
                            ),
                            Text(
                              "3800+",
                              style: TextStyle(
                                  color: ColorRes.blue,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: size.height * .005,
                            ),
                            Text(
                              "Reviews",
                              style: TextStyle(
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        )
                      ],
                    ))),*/
            line(),
            SizedBox(
              height: size.height * .02,
            ),
            DoctorAnimation(
                delay: 100,
                child: Text(
                  "Visit Time",
                  style: TextStyle(
                      color: ColorRes.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                )),
            SizedBox(
              height: size.height * .01,
            ),
            DoctorAnimation(
                delay: 100,
                child: Text(
                  "Morning",
                  style: TextStyle(
                      color: ColorRes.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                )),
            SizedBox(
              height: size.height * .01,
            ),
            DoctorAnimation(
                delay: 100,
                child: Text(
                  "Monday,27 March 2022",
                  style: TextStyle(
                      color: ColorRes.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                )),
            SizedBox(
              height: size.height * .01,
            ),
            DoctorAnimation(
                delay: 100,
                child: Text(
                  "10:00 AM-10:30 AM",
                  style: TextStyle(
                      color: ColorRes.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                )),
            line(),
            SizedBox(
              height: size.height * .02,
            ),
            DoctorAnimation(
                delay: 200,
                child: Text(
                  "Patient Information",
                  style: TextStyle(
                      color: ColorRes.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                )),
            DoctorAnimation(
                delay: 200,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Text(
                          "Full Name",
                          style: TextStyle(
                              color: ColorRes.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Text(
                          "Age",
                          style: TextStyle(
                              color: ColorRes.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Text(
                          "Phone ",
                          style: TextStyle(
                              color: ColorRes.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(width: size.width * .07),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              color: ColorRes.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              color: ColorRes.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                              color: ColorRes.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * .07,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Text(
                          "Adam Smith",
                          style: TextStyle(
                              color: ColorRes.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Text(
                          "30+",
                          style: TextStyle(
                              color: ColorRes.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Text(
                          "+91 9995623147",
                          style: TextStyle(
                              color: ColorRes.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14),
                        ),
                      ],
                    )
                  ],
                )),
            line(),
            SizedBox(
              height: size.height * .02,
            ),
            DoctorAnimation(
                delay: 300,
                child: Text(
                  "Free Information",
                  style: TextStyle(
                      color: ColorRes.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                )),
            SizedBox(
              height: size.height * .01,
            ),
            DoctorAnimation(
                delay: 300,
                child: Text(
                  "\$5 (Paid)",
                  style: TextStyle(
                      color: ColorRes.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                )),
          ],
        ),
      ),
    );
  }

  Widget line() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Divider(
        height: 1,
        color: Color(0xffacacac),
      ),
    );
  }
}
