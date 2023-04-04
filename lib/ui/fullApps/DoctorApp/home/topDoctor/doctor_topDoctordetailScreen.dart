// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helper/ColorRes.dart';
import '../../helper/DoctorAnimation.dart';
import '../../helper/SlideAnimation.dart';
import '../../helper/StringRes.dart';
import '../../helper/doctore_DesignConfig.dart';
import '../../helper/src/calender.dart';
import 'doctor_BookAppointmentScreen.dart';
import 'doctor_ReviewScreen.dart';

class DoctorTopDoctorDetail extends StatefulWidget {
  final String? doctorName;
  final String? reviewText;
  final String? subTitle;
  final String? image;
  const DoctorTopDoctorDetail(
      {Key? key, this.doctorName, this.reviewText, this.subTitle, this.image})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DoctorTopDoctorDetailState();
  }
}

class DoctorTopDoctorDetailState extends State<DoctorTopDoctorDetail>
    with TickerProviderStateMixin {
  var data;
  bool like = false;
  AnimationController? rotationController;
  AnimationController? _animationController;
  @override
  void initState() {
    rotationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    rotationController!.forward(from: 0.0);
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    super.initState();
  }

  @override
  void dispose() {
    rotationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    data = dateFormatter(DateTime.now());
    return Scaffold(
      backgroundColor: ColorRes.white,
      bottomNavigationBar: DoctorAnimation(
          delay: 800,
          child: SlideAnimation(
              position: 10,
              itemCount: 20,
              slideDirection: SlideDirection.fromBottom,
              animationController: _animationController,
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width * .06,
                    right: size.width * .06,
                    bottom: size.width * .06),
                child: DoctorDesignConfig.Button(
                    onpress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              DoctorBookAppointmentScreen(date: data),
                        ),
                      );
                    },
                    name: DoctorStringRes.bookApp,
                    foreground: ColorRes.blue,
                    TextColor: ColorRes.white),
              ))),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leadingWidth: 65,
        iconTheme: IconThemeData(color: ColorRes.blue),
        title: Text(
          widget.doctorName!,
          style: TextStyle(color: ColorRes.black),
        ),
        actions: [
          Container(
            width: size.width * .135,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Card(
                color: Color(0xffe9f0ff),
                margin: EdgeInsets.all(9),
                child: IconButton(
                    icon: SvgPicture.asset(
                      like
                          ? DoctorDesignConfig.getImagePath("heart_active.svg")
                          : DoctorDesignConfig.getImagePath("heart.svg"),
                      color: ColorRes.blue,
                    ),

                    /*Icon(
                    Icons.favorite_border,size: 20,
                    color: Colors.blue,
                  ),*/
                    onPressed: () {
                      setState(() {
                        like = !like;
                      });
                    })),
          ),
          Container(
            margin: EdgeInsets.only(right: size.width * .04),
            width: size.width * .135,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Card(
                color: Color(0xffe9f0ff),
                margin: EdgeInsets.all(9),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    DoctorDesignConfig.getImagePath("share.svg"),
                    color: ColorRes.blue,
                  ),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          margin:
              EdgeInsets.only(left: size.width * .06, right: size.width * .06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorAnimation(
                  delay: 100,
                  child: Container(
                      height: size.height * .12,
                      margin: EdgeInsets.only(top: size.height * .025),
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
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                child: Image.asset(
                                  widget.image!,
                                  height: size.height * .13,
                                  width: size.width * .2,
                                  fit: BoxFit.fill,
                                )),
                          ),
                          SizedBox(
                            width: size.width * .05,
                          ),
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(widget.doctorName!,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: size.height * .005,
                                ),
                                Wrap(
                                  children: [
                                    Icon(
                                      Icons.star_half,
                                      color: ColorRes.blue,
                                      size: 12,
                                    ),
                                    Text(
                                      widget.reviewText!,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: ColorRes.fontColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * .005,
                                ),
                                Text(
                                  widget.subTitle!,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: ColorRes.fontColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))),
              DoctorDesignConfig.designCard(
                  size: size, rotationController: rotationController),
              /* DoctorAnimation(
                  delay: 200,
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
                              RotationTransition(
                                  turns: Tween(begin: 0.0, end: 1.0)
                                      .animate(rotationController!),
                                  child: Card(
                                      color: Color(0xffe9f0ff),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: SvgPicture.asset(
                                          DoctorDesignConfig.getImagePath(
                                              "invite.svg"),
                                          color: ColorRes.blue,
                                        ),
                                        */ /*Icon(
                                  Icons.supervisor_account,size: 20,
                                  color: Colors.blue,
                                ),*/ /*
                                      ))),
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
                              RotationTransition(
                                  turns: Tween(begin: 0.0, end: 1.0)
                                      .animate(rotationController!),
                                  child: Card(
                                      color: Color(0xffe9f0ff),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      */ /*user_active.svg*/ /*
                                      child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: SvgPicture.asset(
                                          DoctorDesignConfig.getImagePath(
                                              "user_active.svg"),
                                          color: ColorRes.blue,
                                        ),
                                      ))),
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
                              RotationTransition(
                                  turns: Tween(begin: 0.0, end: 1.0)
                                      .animate(rotationController!),
                                  child: Card(
                                      color: Color(0xffe9f0ff),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      */ /*message.svg*/ /*
                                      child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: SvgPicture.asset(
                                          DoctorDesignConfig.getImagePath(
                                              "message.svg"),
                                          color: ColorRes.blue,
                                        ),
                                      ))),
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
              SizedBox(
                height: size.height * .03,
              ),
              DoctorAnimation(
                  delay: 300,
                  child: SlideAnimation(
                      position: 10,
                      itemCount: 20,
                      slideDirection: SlideDirection.fromRight,
                      animationController: _animationController,
                      child: Text(
                        "About Doctor",
                        style: TextStyle(
                            color: ColorRes.fontColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ))),
              SizedBox(
                height: size.height * .01,
              ),
              DoctorAnimation(
                  delay: 300,
                  child: SlideAnimation(
                      position: 10,
                      itemCount: 20,
                      slideDirection: SlideDirection.fromRight,
                      animationController: _animationController,
                      child: Text(
                        widget.doctorName! +
                            " is a top most ${widget.subTitle} Specialist in Nanyang hospital at london. She achived several awards for her wonderful  contribution in medical field. She is available private consultation.",
                        style: TextStyle(
                            color: ColorRes.fontColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ))),
              SizedBox(
                height: size.height * .03,
              ),
              DoctorAnimation(
                  delay: 400,
                  child: SlideAnimation(
                    position: 10,
                    itemCount: 20,
                    slideDirection: SlideDirection.fromRight,
                    animationController: _animationController,
                    child: Text(
                      "Working Time",
                      style: TextStyle(
                          color: ColorRes.fontColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  )),
              SizedBox(
                height: size.height * .01,
              ),
              DoctorAnimation(
                  delay: 400,
                  child: SlideAnimation(
                    position: 10,
                    itemCount: 20,
                    slideDirection: SlideDirection.fromRight,
                    animationController: _animationController,
                    child: Text(
                      "Mon-Fri, 9:00 AM -20:00 PM",
                      style: TextStyle(
                          color: ColorRes.fontColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
              SizedBox(
                height: size.height * .03,
              ),
              DoctorAnimation(
                  delay: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reviews",
                        style: TextStyle(
                            color: ColorRes.fontColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const DoctorReviewScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "See reviews",
                            style: TextStyle(
                                color: ColorRes.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ],
                  )),
              SizedBox(
                height: size.height * .03,
              ),
              DoctorAnimation(
                delay: 600,
                child: Text(
                  "Make Appointment",
                  style: TextStyle(
                      color: ColorRes.fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              DoctorAnimation(
                  delay: 600,
                  child: SizedBox(
                    height: size.height * .13,
                    child: AnimatedHorizontalCalendar(
                      tableCalenderIcon: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                      date: DateTime.now(),
                      textColor: Colors.black45,
                      backgroundColor: Colors.white,
                      tableCalenderThemeData: ThemeData.light().copyWith(
                        primaryColor: ColorRes.blue,
                        buttonTheme:
                            ButtonThemeData(textTheme: ButtonTextTheme.primary),
                        colorScheme: ColorScheme.light(
                          primary: ColorRes.blue,
                        ).copyWith(secondary: Colors.red),
                      ),
                      selectedColor: ColorRes.blue,
                      tableCalenderButtonColor: ColorRes.blue,
                      onDateSelected: (date) {
                        var datas = DateTime.parse(date);
                        data = dateFormatter(datas);
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

String dateFormatter(DateTime date) {
  dynamic dayData =
      '{ "1" : "Monday", "2" : "Tuesday", "3" : "Wednesday", "4" : "Thursday", "5" : "Friday", "6" : "Saturday", "7" : "Sunday" }';

  dynamic monthData =
      '{ "1" : "January", "2" : "February", "3" : "March", "4" : "April", "5" : "May", "6" : "June", "7" : "July", "8" : "August", "9" : "September", "10" : "October", "11" : "November", "12" : "December" }';

  return json.decode(dayData)['${date.weekday}'] +
      ", " +
      date.day.toString() +
      " " +
      json.decode(monthData)['${date.month}'] +
      " " +
      date.year.toString();
}
