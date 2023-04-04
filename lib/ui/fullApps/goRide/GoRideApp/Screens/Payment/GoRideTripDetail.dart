import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/Payment/GoRideCancleTrip.dart';

import '../GoRideEndRide.dart';
import '../Widget/AppBar.dart';

class GoRideTripDetail extends StatefulWidget {
  const GoRideTripDetail({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideTripDetailState();
  }
}

class GoRideTripDetailState extends State<GoRideTripDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GoRideColors.yellow,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * .15,
            ),
            child: PreferredSizeAppBar(
              title: GoRideStringRes.TripDetails,
            )),
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: GoRideConstant.boxDecorationContainer(
                GoRideColors.white, false),
            child: Column(children: [
              Stack(
                children: [
                  image(),
                  arriveTimeText(),
                ],
              )
            ])));
  }

  Widget image() {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
        child: OctoImage(
          image: CachedNetworkImageProvider(
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Fmap.jpg?alt=media&token=39013a81-98ea-4e47-aea4-919963651f0e"),
          placeholderBuilder: OctoPlaceholder.blurHash(
            "L2Pt0\$S;F_Y83N];^8I+3p9_[dD~",
          ),
          errorBuilder: OctoError.icon(color: GoRideColors.black),
          fit: BoxFit.fill,
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => GoRideEndRide(),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .15,
              left: MediaQuery.of(context).size.width * .5),
          width: 100,
          alignment: Alignment.center,
          height: 30,
          color: Colors.white,
          child: Text("Coffee Shop"),
        ),
      )
    ]);
  }

  Widget arriveTimeText() {
    return Container(
        height: MediaQuery.of(context).size.height * .6,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .22),
        width: MediaQuery.of(context).size.width,
        decoration:
            GoRideConstant.boxDecorationContainer(GoRideColors.white, false),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  top: 30,
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1),
              child: Text(
                GoRideStringRes.arriveTime,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              )),
          Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  right: MediaQuery.of(context).size.width * .1,
                  top: 5),
              child: Divider(
                color: Color(0x25707070),
                thickness: 2,
              )),
          useDetail(),
          Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .1,
                right: MediaQuery.of(context).size.width * .1,
              ),
              child: Divider(
                color: Color(0x25707070),
                thickness: 2,
              )),
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  top: 5,
                  bottom: 5),
              child: Text(
                GoRideStringRes.TripRoute,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              )),
          Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .1,
                right: MediaQuery.of(context).size.width * .1,
              ),
              child: Divider(
                color: Color(0x25707070),
                thickness: 2,
              )),
          picUpDrop(),
          Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .1,
                right: MediaQuery.of(context).size.width * .1,
              ),
              child: Divider(
                color: Color(0x25707070),
                thickness: 2,
              )),
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1,
                  top: 5,
                  bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    GoRideStringRes.Payment,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * .1),
                    child: Text(
                      "\$50",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                  ),
                ],
              )),
          Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .1,
                right: MediaQuery.of(context).size.width * .1,
              ),
              child: Divider(
                color: Color(0x25707070),
                thickness: 2,
              )),
          Container(
              alignment: Alignment.topLeft,
              padding:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width * .1),
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OctoImage(
                      image: CachedNetworkImageProvider(
                          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Fmaster_card.png?alt=media&token=b58d63b0-7df3-4934-a1b9-c98c633647c6"),
                      placeholderBuilder: OctoPlaceholder.blurHash(
                        "LGJP-}5aLg?D%MOFxuM{0.?D^+a2",
                      ),
                      errorBuilder: OctoError.icon(color: GoRideColors.black),
                      fit: BoxFit.scaleDown,
                      height: 25,
                      width: 42,
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 120),
                        child: Text(
                          '   **** **** 0568',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .06),
                        child: SvgPicture.asset(
                          GoRideConstant.getSvgImagePath("check_icon.svg"),
                          fit: BoxFit.scaleDown,
                        )),
                  ])),
          cancelBtn()
        ]));
  }

  Widget useDetail() {
    return Row(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                    height: 60,
                    width: 100,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * .1, top: 10),
                    decoration: BoxDecoration(
                      color: Color(0xffefefef),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x1A212121),
                          blurRadius: 5.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: OctoImage(
                        image: CachedNetworkImageProvider(
                            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Feconomy_car.png?alt=media&token=39d2ca2d-5d30-4906-8e69-13db2e2bb5bb"),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          "LGCs%Dx].TRiJBtRo#Rj_Nj[tRxZ",
                        ),
                        errorBuilder: OctoError.icon(color: GoRideColors.black),
                        fit: BoxFit.scaleDown,
                      ),
                    )),
                Container(
                  height: 60,
                  width: 65,
                  margin: EdgeInsets.only(left: 80, top: 10),
                  decoration: BoxDecoration(
                    color: Color(0xffefefef),
                  ),
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
          ],
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                "JOHN DOE",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 05,
              ),
              Text(
                "Mercedes A - 6250",
                style: TextStyle(fontSize: 12, color: Color(0xff676767)),
              ),
              SizedBox(
                height: 05,
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
          padding: EdgeInsets.only(left: 12),
          child: ElevatedButton(
            onPressed: () {
              //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
            },
            child: Text(
              GoRideStringRes.CallDriver,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: GoRideColors.black,
                  fontSize: 12),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(30, 40),
              primary: GoRideColors.yellow,
            ),
          ),
        )
      ],
    );
  }

  Widget picUpDrop() {
    return Container(
      height: MediaQuery.of(context).size.height * .135,
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .08,
          right: MediaQuery.of(context).size.width * .12,
          top: 10),
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
                  height: 25,
                  padding: EdgeInsets.only(left: 16),
                  child: DottedLine(
                    dashLength: 3,
                    direction: Axis.vertical,
                    lineThickness: 1.0,
                    dashColor: Colors.black38,
                  )),
              Container(
                  margin: EdgeInsets.only(left: 50, right: 50, top: 5),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .005,
                  ),
                  Text(
                    "80, Vile Parle Eest",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget cancelBtn() {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .02),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => GoRideCancelTrip(),
            ),
          );
        },
        child: Text(
          GoRideStringRes.Cancelride,
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
