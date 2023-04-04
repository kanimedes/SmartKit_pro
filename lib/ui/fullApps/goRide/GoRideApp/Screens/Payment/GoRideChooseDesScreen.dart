import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/Payment/GoRidePlaymentMehod.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/Payment/GoRideTripDetail.dart';

import '../../../../widgets/slideAnimation.dart';
import '../Widget/AppBar.dart';

class GoRideChooseDesScreen extends StatefulWidget {
  const GoRideChooseDesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideChooseDesScreenState();
  }
}

class GoRideChooseDesScreenState extends State<GoRideChooseDesScreen>
    with SingleTickerProviderStateMixin {
  final _formKeyDialog = GlobalKey<FormState>();
  bool a = true, b = false, c = false;
  List<ListDataView> rides = [];
  AnimationController? _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    _animationController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    rides = [
      ListDataView(
          title: GoRideStringRes.Economy,
          localImage: GoRideConstant.getPngImagePath("economy_car.png"),
          blurUrl: "LGCs%Dx].TRiJBtRo#Rj_Nj[tRxZ",
          imageUrl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Feconomy_car.png?alt=media&token=39d2ca2d-5d30-4906-8e69-13db2e2bb5bb",
          price: "\$50",
          check: a),
      ListDataView(
          title: GoRideStringRes.Standart,
          localImage: GoRideConstant.getPngImagePath("standart_car.png"),
          blurUrl: "LJBzX,oz?vjEE3tRozRj~qt6tRs:",
          imageUrl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Fstandart_car.png?alt=media&token=490e61ae-73fb-4d78-bd84-ebc5fd574370",
          price: "\$70",
          check: b),
      ListDataView(
          title: GoRideStringRes.Deluxe,
          localImage: GoRideConstant.getPngImagePath("deluxe_car.png"),
          blurUrl: "LHIDp\$Bpu6j1?GX9g4Io1A-A.7\${",
          imageUrl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Fdeluxe_car.png?alt=media&token=0e308182-4ccc-41a3-a3b5-6bd501d54c95",
          price: "\$80",
          check: c)
    ];
    return Scaffold(
      backgroundColor: GoRideColors.yellow,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * .15,
          ),
          child: PreferredSizeAppBar(
            title: GoRideStringRes.chooseDes,
          )),
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration:
              GoRideConstant.boxDecorationContainer(GoRideColors.white, false),
          child: Column(children: [
            picUpDrop(),
            SizedBox(
              height: 17,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                SvgPicture.asset(
                    GoRideConstant.getSvgImagePath("clock_icon.svg")),
                SizedBox(
                  width: 20,
                ),
                Text(
                  GoRideStringRes.path1,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                SvgPicture.asset(
                    GoRideConstant.getSvgImagePath("clock_icon.svg")),
                SizedBox(
                  width: 20,
                ),
                Text(
                  GoRideStringRes.path2,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                SvgPicture.asset(
                    GoRideConstant.getSvgImagePath("clock_icon.svg")),
                SizedBox(
                  width: 20,
                ),
                Text(
                  GoRideStringRes.path3,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                SvgPicture.asset(
                    GoRideConstant.getSvgImagePath("clock_icon.svg")),
                SizedBox(
                  width: 20,
                ),
                Text(
                  GoRideStringRes.path4,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  GoRideStringRes.suggestRide,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
            listData(),
            SizedBox(
              height: 5,
            ),
            cardDetail(),
            bookRideBtn(),
          ])),
    );
  }

  Widget picUpDrop() {
    return Container(
      height: MediaQuery.of(context).size.height * .19,
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .1,
          top: MediaQuery.of(context).size.height * .06,
          right: MediaQuery.of(context).size.width * .1),
      decoration: BoxDecoration(
        color: GoRideColors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A212121),
            blurRadius: 5.0,
            spreadRadius: 0.0,
          )
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Column(
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
                children: [
                  Text(
                    GoRideStringRes.pickUp,
                    style: TextStyle(color: Color(0xff959595)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .005,
                  ),
                  Text(
                    "80, Vile Parle West",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                  height: 40,
                  padding: EdgeInsets.only(left: 25),
                  child: DottedLine(
                    dashLength: 3,
                    direction: Axis.vertical,
                    lineThickness: 1.0,
                    dashColor: Colors.black38,
                  )),
              Container(
                  margin: EdgeInsets.only(left: 60, right: 50, top: 10),
                  child: Divider(
                    color: Color(0x25707070),
                    thickness: 2,
                  )),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
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
                  Text(
                    "80, Vile Parle Eest",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget listData() {
    return SlideAnimation(
        position: 5,
        itemCount: 15,
        slideDirection: SlideDirection.fromRight,
        animationController: _animationController,
        child: Container(
          height: MediaQuery.of(context).size.height * .19,
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .07, top: 5),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: rides.length,
              scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      setState(() {
                        a = true;
                        b = false;
                        c = false;
                      });
                    } else if (index == 1) {
                      setState(() {
                        a = false;
                        b = true;
                        c = false;
                      });
                    }
                    if (index == 2) {
                      setState(() {
                        a = false;
                        b = false;
                        c = true;
                      });
                    }
                  },
                  child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: rides[index].check
                            ? GoRideColors.yellow
                            : Color(0xffefefef),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x1A212121),
                            blurRadius: 5.0, // soften the shadow
                            spreadRadius: 0.0, //extend the shadow
                          )
                        ],
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        .09,
                                    width:
                                        MediaQuery.of(context).size.width * .3,
                                    margin: EdgeInsets.all(8),
                                    child: OctoImage(
                                      image: CachedNetworkImageProvider(
                                          rides[index].imageUrl),
                                      placeholderBuilder:
                                          OctoPlaceholder.blurHash(
                                        rides[index].blurUrl,
                                      ),
                                      errorBuilder: OctoError.icon(
                                          color: GoRideColors.black),
                                      fit: BoxFit.scaleDown,
                                    )),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .05,
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      rides[index].title,
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff6b6b6b)),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      rides[index].price,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ])),
                );
              }),
        ));
  }

  Widget cardDetail() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => GoRidePaymentMethod(),
          ),
        );
      },
      child: Container(
          decoration: BoxDecoration(
              color: Color(0xfff6f6f6),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .1,
              right: MediaQuery.of(context).size.width * .1),
          child: ListTile(
            leading: OctoImage(
              image: CachedNetworkImageProvider(
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Fmaster_card.png?alt=media&token=b58d63b0-7df3-4934-a1b9-c98c633647c6"),
              placeholderBuilder: OctoPlaceholder.blurHash(
                "LGJP-}5aLg?D%MOFxuM{0.?D^+a2",
              ),
              errorBuilder: OctoError.icon(color: GoRideColors.black),
              fit: BoxFit.scaleDown,
            ),
            title: Text(
              "**** **** 0568",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: GoRideColors.black),
            ),
            trailing: SvgPicture.asset(
              GoRideConstant.getSvgImagePath("check_icon.svg"),
              fit: BoxFit.scaleDown,
            ),
          )),
    );
  }

  Widget bookRideBtn() {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .017),
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
                                height: 30,
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
                                  alignment: Alignment.center,
                                  margin: EdgeInsetsDirectional.only(
                                      start: 40, end: 40, top: 20),
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
                                          GoRideTripDetail(),
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
                                  minimumSize: Size(310, 50),
                                  primary: GoRideColors.yellow,
                                ),
                              )
                            ],
                          ),
                        ),
                      ))));
        },
        child: Text(
          GoRideStringRes.bookRideBtn,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: GoRideColors.black,
              fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(310, 50),
          primary: GoRideColors.yellow,
        ),
      ),
    );
  }
}

class ListDataView {
  late final String imageUrl;
  late final String blurUrl;
  late final String title;
  late final String price;
  late final String localImage;
  late final bool check;

  ListDataView(
      {required this.imageUrl,
      required this.blurUrl,
      required this.title,
      required this.price,
      required this.localImage,
      required this.check});
}
