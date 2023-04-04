import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/Widget/animatedFadeAnimation.dart';

import '../GoRideDrawerHome.dart';
import '../GoRideHomeScreen.dart';

class GoRideMyTrips extends StatefulWidget {
  const GoRideMyTrips({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideMyTripsState();
  }
}

class GoRideMyTripsState extends State<GoRideMyTrips> {
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
                        GoRideStringRes.MyTrips,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    )
                  ])),

              // PreferredSizeAppBar(title: GoRideStringRes.MyTrips,)
            ),
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 30),
                decoration: GoRideConstant.boxDecorationContainer(
                    GoRideColors.white, false),
                child: DefaultTabController(
                    length: 3,
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.only(left: 30, right: 30),
                        decoration: BoxDecoration(
                          color: GoRideColors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x14212121),
                              blurRadius: 15.0,
                            ),
                          ],
                        ),
                        child: TabBar(
                          indicatorWeight: 0,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorPadding: EdgeInsets.all(10),
                          padding: EdgeInsets.all(8),
                          labelColor: GoRideColors.black,
                          unselectedLabelColor: Color(0xff8c989a),
                          labelStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: GoRideColors.yellow),
                          tabs: const [
                            Tab(text: "Upcoming"),
                            Tab(text: "Completed"),
                            Tab(text: "Canceled"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                            children: [upcoming(), completed(), canceled()]),
                      )
                    ])))));
  }

  Widget upcoming() {
    return ListView(
      children: [
        AnimatedFadeAnimation(
            1,
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1, top: 20),
              child: Text(
                "Today - 9:30 AM ",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            )),
        AnimatedFadeAnimation(
            1,
            Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: 30,
                ),
                child: Divider(
                  color: Color(0x25707070),
                  thickness: 2,
                ))),
        AnimatedFadeAnimation(1, picUpDrop1()),
        AnimatedFadeAnimation(
            1.5,
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1, top: 20),
              child: Text(
                "Today - 11:30 AM",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            )),
        AnimatedFadeAnimation(
            1.5,
            Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1,
                ),
                child: Divider(
                  color: Color(0x25707070),
                  thickness: 2,
                ))),
        AnimatedFadeAnimation(1.5, picUpDrop2()),
        AnimatedFadeAnimation(
            2,
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1, top: 20),
              child: Text(
                "Today - 11:30 AM",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            )),
        AnimatedFadeAnimation(
            2,
            Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1,
                ),
                child: Divider(
                  color: Color(0x25707070),
                  thickness: 2,
                ))),
        AnimatedFadeAnimation(2, picUpDrop2())
      ],
    );
  }

  Widget completed() {
    return ListView(
      children: [
        AnimatedFadeAnimation(
            1,
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1, top: 20),
              child: Text(
                "Today - 9:30 AM ",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            )),
        AnimatedFadeAnimation(
            1,
            Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: 30,
                ),
                child: Divider(
                  color: Color(0x25707070),
                  thickness: 2,
                ))),
        AnimatedFadeAnimation(
            1,
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1, right: 30),
              decoration: BoxDecoration(
                color: GoRideColors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14212121),
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  useDetail1(),
                  Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05,
                          right: MediaQuery.of(context).size.width * .05,
                          top: 5),
                      child: Divider(
                        color: Color(0x25707070),
                        thickness: 2,
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        GoRideStringRes.TripRoute,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      )),
                  Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                        right: MediaQuery.of(context).size.width * .05,
                      ),
                      child: Divider(
                        color: Color(0x25707070),
                        thickness: 2,
                      )),
                  picUpDropCan1(),
                ],
              ),
            )),
        AnimatedFadeAnimation(
            1.5,
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1, top: 20),
              child: Text(
                "Yesterday - 11:30 AM",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            )),
        AnimatedFadeAnimation(
            1.5,
            Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1,
                ),
                child: Divider(
                  color: Color(0x25707070),
                  thickness: 2,
                ))),
        AnimatedFadeAnimation(
            1.5,
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1),
              decoration: BoxDecoration(
                color: GoRideColors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14212121),
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  useDetail2(),
                  Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05,
                          right: MediaQuery.of(context).size.width * .05,
                          top: 5),
                      child: Divider(
                        color: Color(0x25707070),
                        thickness: 2,
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .1),
                      child: Text(
                        GoRideStringRes.TripRoute,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      )),
                  Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                        right: MediaQuery.of(context).size.width * .05,
                      ),
                      child: Divider(
                        color: Color(0x25707070),
                        thickness: 2,
                      )),
                  picUpDropCan1(),
                ],
              ),
            )),
        AnimatedFadeAnimation(
            2,
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1, top: 20),
              child: Text(
                "Yesterday - 10:30 AM",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            )),
        AnimatedFadeAnimation(
            2,
            Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1,
                ),
                child: Divider(
                  color: Color(0x25707070),
                  thickness: 2,
                ))),
        AnimatedFadeAnimation(
            2,
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1),
              decoration: BoxDecoration(
                color: GoRideColors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14212121),
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  useDetail2(),
                  Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05,
                          right: MediaQuery.of(context).size.width * .05,
                          top: 5),
                      child: Divider(
                        color: Color(0x25707070),
                        thickness: 2,
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .1),
                      child: Text(
                        GoRideStringRes.TripRoute,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      )),
                  Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                        right: MediaQuery.of(context).size.width * .05,
                      ),
                      child: Divider(
                        color: Color(0x25707070),
                        thickness: 2,
                      )),
                  picUpDropCan1(),
                ],
              ),
            )),
      ],
    );
  }

  Widget canceled() {
    return ListView(
      children: [
        AnimatedFadeAnimation(
            1,
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1, top: 20),
              child: Text(
                "Today - 9:30 AM ",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            )),
        AnimatedFadeAnimation(
            1,
            Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1,
                ),
                child: Divider(
                  color: Color(0x25707070),
                  thickness: 2,
                ))),
        AnimatedFadeAnimation(
            1,
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1),
              decoration: BoxDecoration(
                color: GoRideColors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14212121),
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  useDetailCancel(),
                  Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05,
                          right: MediaQuery.of(context).size.width * .05,
                          top: 5),
                      child: Divider(
                        color: Color(0x25707070),
                        thickness: 2,
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .1),
                      child: Text(
                        GoRideStringRes.TripRoute,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      )),
                  Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                        right: MediaQuery.of(context).size.width * .05,
                      ),
                      child: Divider(
                        color: Color(0x25707070),
                        thickness: 2,
                      )),
                  picUpDropCan1(),
                ],
              ),
            )),
        AnimatedFadeAnimation(
            1.5,
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1, top: 20),
              child: Text(
                "Yesterday - 11:30 AM",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            )),
        AnimatedFadeAnimation(
            1.5,
            Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1,
                ),
                child: Divider(
                  color: Color(0x25707070),
                  thickness: 2,
                ))),
        AnimatedFadeAnimation(
            1.5,
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1),
              decoration: BoxDecoration(
                color: GoRideColors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14212121),
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  useDetailCancel(),
                  Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05,
                          right: MediaQuery.of(context).size.width * .05,
                          top: 5),
                      child: Divider(
                        color: Color(0x25707070),
                        thickness: 2,
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .1),
                      child: Text(
                        GoRideStringRes.TripRoute,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      )),
                  Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                        right: MediaQuery.of(context).size.width * .05,
                      ),
                      child: Divider(
                        color: Color(0x25707070),
                        thickness: 2,
                      )),
                  picUpDropCan1(),
                ],
              ),
            )),
        AnimatedFadeAnimation(
            2,
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1, top: 20),
              child: Text(
                "Yesterday - 10:30 AM",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            )),
        AnimatedFadeAnimation(
            2,
            Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1,
                ),
                child: Divider(
                  color: Color(0x25707070),
                  thickness: 2,
                ))),
        AnimatedFadeAnimation(
            2,
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1),
              decoration: BoxDecoration(
                color: GoRideColors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14212121),
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  useDetailCancel(),
                  Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05,
                          right: MediaQuery.of(context).size.width * .05,
                          top: 5),
                      child: Divider(
                        color: Color(0x25707070),
                        thickness: 2,
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .1),
                      child: Text(
                        GoRideStringRes.TripRoute,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      )),
                  Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .05,
                        right: MediaQuery.of(context).size.width * .05,
                      ),
                      child: Divider(
                        color: Color(0x25707070),
                        thickness: 2,
                      )),
                  picUpDropCan1(),
                ],
              ),
            )),
      ],
    );
  }

  Widget picUpDrop1() {
    return Container(
      height: MediaQuery.of(context).size.height * .25,
      decoration: BoxDecoration(
        color: GoRideColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14212121),
            blurRadius: 20.0,
          ),
        ],
      ),
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .08,
          right: MediaQuery.of(context).size.width * .08),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Stack(
                alignment: Alignment.center,
                children: const [
                  Icon(
                    Icons.circle,
                    size: 25,
                    color: Colors.black38,
                  ),
                  Icon(
                    Icons.circle,
                    size: 15,
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    GoRideStringRes.pickUp,
                    style: TextStyle(color: Color(0xff959595)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .005,
                  ),
                  Row(
                    children: [
                      Text(
                        "80, Vile Parle West",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .18),
                        child: Text(
                          "9:30 PM",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(height: 10),
          Stack(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  height: 25,
                  padding: EdgeInsets.only(left: 15),
                  child: DottedLine(
                    dashLength: 3,
                    direction: Axis.vertical,
                    dashColor: Colors.black38,
                  )),
              Container(
                  margin: EdgeInsets.only(left: 40, top: 5, right: 20),
                  child: Divider(
                    color: Color(0x25707070),
                    thickness: 2,
                  )),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 25,
                        color: GoRideColors.yellow.withOpacity(0.5),
                      ),
                      Icon(Icons.circle, size: 15, color: GoRideColors.yellow),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    GoRideStringRes.dropOff,
                    style: TextStyle(color: Color(0xff959595)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .005,
                  ),
                  Row(
                    children: [
                      Text(
                        "80, Vile Parle Eest",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .18),
                        child: Text(
                          "10:10 PM",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
              margin: EdgeInsets.only(left: 40, right: 20),
              child: Divider(
                color: Color(0x25707070),
                thickness: 2,
              )),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 40),
                  child: Text(
                    "Ride Cost",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  )),
              Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Text(
                    "\$50",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget picUpDrop2() {
    return Container(
      height: MediaQuery.of(context).size.height * .25,
      decoration: BoxDecoration(
        color: GoRideColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14212121),
            blurRadius: 20.0,
          ),
        ],
      ),
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .08,
          right: MediaQuery.of(context).size.width * .08),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: const [
                      Icon(
                        Icons.circle,
                        size: 25,
                        color: Colors.black38,
                      ),
                      Icon(
                        Icons.circle,
                        size: 15,
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    GoRideStringRes.pickUp,
                    style: TextStyle(color: Color(0xff959595)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .005,
                  ),
                  Row(
                    children: [
                      Text(
                        "80, Vile Parle West",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .18),
                        child: Text(
                          "11:30 AM",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(height: 10),
          Stack(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  height: 25,
                  padding: EdgeInsets.only(left: 20),
                  child: DottedLine(
                    dashLength: 3,
                    direction: Axis.vertical,
                    lineThickness: 1.0,
                    dashColor: Colors.black38,
                  )),
              Container(
                  margin: EdgeInsets.only(left: 40, top: 5, right: 20),
                  child: Divider(
                    color: Color(0x25707070),
                    thickness: 2,
                  )),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 25,
                        color: GoRideColors.yellow.withOpacity(0.5),
                      ),
                      Icon(Icons.circle, size: 15, color: GoRideColors.yellow),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    GoRideStringRes.dropOff,
                    style: TextStyle(color: Color(0xff959595)),
                  ),
                  Row(
                    children: [
                      Text(
                        "80, Vile Parle Eest",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .18),
                        child: Text(
                          "12:30 PM",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
              margin: EdgeInsets.only(left: 40, right: 20),
              child: Divider(
                color: Color(0x25707070),
                thickness: 2,
              )),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 40),
                  child: Text(
                    "Ride Cost",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  )),
              Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Text(
                    "\$80",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget useDetail1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              height: 50,
              width: 55,
              margin: EdgeInsets.only(left: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Ftoptrip_b.jpg?alt=media&token=cd01d6b2-2892-4da7-bfee-4069e2e4f7e8"),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      "L5Jk_:009FDi00oJ-oRj00~VMwM{",
                    ),
                    errorBuilder: OctoError.icon(color: GoRideColors.black),
                    fit: BoxFit.contain,
                  )),
            )
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "JOHN DOE",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "Mercedes A - 6250",
                style: TextStyle(fontSize: 12, color: Color(0xff676767)),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: const <TextSpan>[
                    TextSpan(
                        text: "OTP :",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff676767))),
                    TextSpan(
                      text: "3653",
                      style:
                          TextStyle(fontSize: 12, color: GoRideColors.yellow),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                GoRideStringRes.FinalCost,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                "\$50.00",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff676767),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                GoRideStringRes.time,
                style: TextStyle(fontSize: 12),
              ),
              Text(
                "40.00",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff676767),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget picUpDropCan1() {
    return Container(
      height: MediaQuery.of(context).size.height * .135,
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * .05),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: const [
                      Icon(
                        Icons.circle,
                        size: 25,
                        color: Colors.black38,
                      ),
                      Icon(
                        Icons.circle,
                        size: 15,
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    GoRideStringRes.pickUp,
                    style: TextStyle(color: Color(0xff959595)),
                  ),
                  Row(
                    children: [
                      Text(
                        "80, Vile Parle West",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .005,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .1),
                        child: Text(
                          "9:30 PM",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  height: 25,
                  padding: EdgeInsets.only(left: 17),
                  child: DottedLine(
                    dashLength: 3,
                    direction: Axis.vertical,
                    lineThickness: 1.0,
                    dashColor: Colors.black38,
                  )),
              Container(
                  margin: EdgeInsets.only(left: 40, top: 5, right: 20),
                  child: Divider(
                    color: Color(0x25707070),
                    thickness: 2,
                  )),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        size: 25,
                        color: GoRideColors.yellow.withOpacity(0.5),
                      ),
                      Icon(Icons.circle, size: 15, color: GoRideColors.yellow),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    GoRideStringRes.dropOff,
                    style: TextStyle(color: Color(0xff959595)),
                  ),
                  Row(
                    children: [
                      Text(
                        "80, Vile Parle Eest",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .1),
                        child: Text(
                          "10:10 PM",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget useDetail2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              height: 50,
              width: 55,
              margin: EdgeInsets.only(left: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Ftoptrip_b.jpg?alt=media&token=cd01d6b2-2892-4da7-bfee-4069e2e4f7e8"),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      "L5Jk_:009FDi00oJ-oRj00~VMwM{",
                    ),
                    errorBuilder: OctoError.icon(color: GoRideColors.black),
                    fit: BoxFit.contain,
                  )),
            )
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "JOHN DOE",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "Mercedes A - 6250",
                style: TextStyle(fontSize: 12, color: Color(0xff676767)),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: const <TextSpan>[
                    TextSpan(
                        text: "OTP :",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff676767))),
                    TextSpan(
                      text: "3653",
                      style:
                          TextStyle(fontSize: 12, color: GoRideColors.yellow),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                GoRideStringRes.FinalCost,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                "\$80.00",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff676767),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                GoRideStringRes.time,
                style: TextStyle(fontSize: 12),
              ),
              Text(
                "60.00",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff676767),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget useDetailCancel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              height: 50,
              width: 55,
              margin: EdgeInsets.only(left: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Ftoptrip_b.jpg?alt=media&token=cd01d6b2-2892-4da7-bfee-4069e2e4f7e8"),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      "L5Jk_:009FDi00oJ-oRj00~VMwM{",
                    ),
                    errorBuilder: OctoError.icon(color: GoRideColors.black),
                    fit: BoxFit.contain,
                  )),
            )
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "JOHN DOE",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "Mercedes A - 6250",
                style: TextStyle(fontSize: 12, color: Color(0xff676767)),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: const <TextSpan>[
                    TextSpan(
                        text: "OTP :",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff676767))),
                    TextSpan(
                      text: "3653",
                      style:
                          TextStyle(fontSize: 12, color: GoRideColors.yellow),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: 50),
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: GoRideColors.white,
                    fontSize: 9),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(25, 30),
                primary: GoRideColors.red,
              ),
            )),
      ],
    );
  }
}
