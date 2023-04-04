import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/GoRideEndRide.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'GoRideDrawerHome.dart';
import 'GoRideHomeScreen.dart';

class GoRideBookLater extends StatefulWidget {
  const GoRideBookLater({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideBookLaterState();
  }
}

class GoRideBookLaterState extends State<GoRideBookLater> {
  final _formKeyDialog = GlobalKey<FormState>();
  bool a = true, b = false, c = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          xOffset = 0;
          yOffset = 0;
          scaleFactor = 1;
          isDrawerOpen = false;
          return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          ) as Future<bool>;
        },
        child: Scaffold(
            backgroundColor: GoRideColors.yellow,
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(
              preferredSize: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * .15,
              ),
              child: Container(
                  height: MediaQuery.of(context).size.height * .15,
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .02),
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05,
                          top: MediaQuery.of(context).size.height * .05),
                      child: CircleAvatar(
                        radius: 15,
                        child: FloatingActionButton(
                          onPressed: () {
                            xOffset = 0;
                            yOffset = 0;
                            scaleFactor = 1;
                            isDrawerOpen = false;
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          mini: true,
                          backgroundColor: GoRideColors.white,
                          elevation: 3,
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: GoRideColors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .27,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .05,
                      ),
                      child: Text(
                        GoRideStringRes.BookLater,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    )
                  ])),
            ),
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: GoRideConstant.boxDecorationContainer(
                    GoRideColors.white, false),
                child: Column(children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 30, top: 30),
                      child: Text(
                        GoRideStringRes.selectShe,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                  scheduleList(),
                  Container(
                      height: MediaQuery.of(context).size.height * .3,
                      margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x66c4c8d0),
                            blurRadius: 20.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SfCalendar(
                          view: CalendarView.month,
                          showNavigationArrow: true,
                          todayHighlightColor: GoRideColors.yellow,
                          headerStyle: CalendarHeaderStyle(
                              textAlign: TextAlign.center,
                              textStyle: TextStyle(
                                  color: GoRideColors.yellow,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          monthViewSettings: const MonthViewSettings(
                              appointmentDisplayMode:
                                  MonthAppointmentDisplayMode.appointment,
                              agendaStyle: AgendaStyle(
                                  backgroundColor: GoRideColors.yellow),
                              monthCellStyle: MonthCellStyle(
                                todayBackgroundColor: GoRideColors.yellow,
                              )),
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x66c4c8d0),
                            blurRadius: 20.0,
                          ),
                        ],
                      ),
                      child: TimePickerSpinner(
                        is24HourMode: false,
                        normalTextStyle:
                            TextStyle(fontSize: 14, color: Color(0xffb3b8bd)),
                        highlightedTextStyle:
                            TextStyle(fontSize: 19, color: Colors.black),
                        spacing: 50,
                        itemHeight: 50,
                        isForce2Digits: true,
                        onTimeChange: (time) {},
                      )),
                  bookRideBtn()
                ]))));
  }

  Widget scheduleList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.only(left: 30, top: 10),
              alignment: Alignment.topLeft,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    a = true;
                    b = false;
                    c = false;
                  });
                  //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                },
                child: Text(
                  "Today",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: GoRideColors.black,
                      fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 40),
                  primary: a ? Color(0xfffcf8e5) : GoRideColors.white,
                  side: BorderSide(
                    width: 1.0,
                    color: a ? GoRideColors.yellow : Colors.black,
                  ),
                ),
              )),
          Container(
              padding: EdgeInsets.only(left: 20, top: 10),
              alignment: Alignment.topLeft,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    a = false;
                    b = true;
                    c = false;
                  });
                  //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                },
                child: Text(
                  "Tomorrow",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: GoRideColors.black,
                      fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(40, 40),
                  primary: b ? Color(0xfffcf8e5) : GoRideColors.white,
                  side: BorderSide(
                    width: 1.0,
                    color: b ? GoRideColors.yellow : Colors.black,
                  ),
                ),
              )),
          Container(
              padding: EdgeInsets.only(left: 20, top: 10),
              alignment: Alignment.topLeft,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    a = false;
                    b = false;
                    c = true;
                  });
                  //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                },
                label: Text(
                  "April",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: GoRideColors.black,
                      fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 40),
                  primary: c ? Color(0xfffcf8e5) : GoRideColors.white,
                  side: BorderSide(
                    width: 1.0,
                    color: c ? GoRideColors.yellow : Colors.black,
                  ),
                ),
                icon: SvgPicture.asset(
                    GoRideConstant.getSvgImagePath("calendar.svg")),
              )),
        ],
      ),
    );
  }

  Widget bookRideBtn() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .07),
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(70.0),
              )),
              context: context,
              builder: (context) => BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: Container(
                        decoration: BoxDecoration(
                            // gradient: UiUtils.buildLinerGradient([Theme.of(context).scaffoldBackgroundColor, Theme.of(context).canvasColor], Alignment.topCenter, Alignment.bottomCenter),
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(70))),
                        constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * (0.4)),
                        child: Form(
                          key: _formKeyDialog,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              SvgPicture.asset(GoRideConstant.getSvgImagePath(
                                  "booking_confirmed.svg")),
                              Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 20, end: 20, top: 20),
                                  child: Text(
                                    "Booking Confirmed!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  )),
                              Container(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 20, end: 20, top: 20),
                                  child: Text(
                                    "Your booking has been confirmed Successfully, your ride will arriving in 10 mins",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xff707070)),
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          GoRideEndRide(),
                                    ),
                                  );
                                },
                                child: Text(
                                  GoRideStringRes.Done,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: GoRideColors.black,
                                      fontSize: 16),
                                ),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(290, 45),
                                  primary: GoRideColors.yellow,
                                ),
                              )
                            ],
                          ),
                        ),
                      ))));
        },
        child: Text(
          GoRideStringRes.bookRideBtn.toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: GoRideColors.black,
              fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(290, 45),
          primary: GoRideColors.yellow,
        ),
      ),
    );
  }
}
