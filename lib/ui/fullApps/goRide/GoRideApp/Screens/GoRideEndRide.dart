import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/Payment/GoRideRating.dart';

class GoRideEndRide extends StatefulWidget {
  const GoRideEndRide({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideEndRideState();
  }
}

class GoRideEndRideState extends State<GoRideEndRide>
    with TickerProviderStateMixin {
  late AnimationController timerAnimationController =
      AnimationController(vsync: this, duration: Duration(seconds: 10));
  @override
  void initState() {
    timerAnimationController.forward(from: timerAnimationController.value);
    super.initState();
  }

  @override
  void dispose() {
    timerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: GoRideConstant.boxDecorationContainer(
                GoRideColors.white, false),
            child: Column(children: [
              Stack(
                children: [imageShow(), bodyDataShow()],
              ),
            ])));
  }

  Widget imageShow() {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
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
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .07,
                  top: MediaQuery.of(context).size.height * .07),
              child: CircleAvatar(
                radius: 15,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
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
            Container(
              height: 80,
              margin: EdgeInsets.only(left: 30, top: 100, right: 30),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        GoRideStringRes.reachDes,
                        style:
                            TextStyle(fontSize: 12, color: GoRideColors.white),
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "25 Mins",
                        style: TextStyle(
                            fontSize: 16,
                            color: GoRideColors.white,
                            fontWeight: FontWeight.w600),
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: GoRideColors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            alignment: Alignment.topCenter,
                            height: 10.0,
                            width: MediaQuery.of(context).size.width,
                          ),
                          AnimatedBuilder(
                            animation: timerAnimationController,
                            builder: (context, child) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: GoRideColors.yellow,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                alignment: Alignment.topCenter,
                                height: 10.0,
                                width: MediaQuery.of(context).size.width *
                                    timerAnimationController.value,
                              );
                            },
                          ),
                        ],
                      )),
                ],
              ),
            )
          ],
        ));
  }

  Widget bodyDataShow() {
    return Container(
        height: MediaQuery.of(context).size.height * .6,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .4),
        decoration:
            GoRideConstant.boxDecorationContainer(GoRideColors.white, false),
        child: Column(children: [
          Container(
              padding: EdgeInsets.only(top: 30, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        GoRideStringRes.OnTrip,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      )),
                  Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(right: 30),
                      child: Text(
                        "Coffee Shop",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      )),
                ],
              )),
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 5),
              child: Divider(
                color: Color(0x25707070),
                thickness: 2,
              )),
          useDetail(),
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 5),
              child: Divider(
                color: Color(0x25707070),
                thickness: 2,
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * .26,
          ),
          endRideBtn(),
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
                  height: 70,
                  width: 100,
                  margin: EdgeInsets.only(left: 30, top: 10),
                  decoration: BoxDecoration(
                    color: Color(0xffefefef),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x1A212121),
                        blurRadius: 5.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                      )
                    ],
                  ),
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Feconomy_car.png?alt=media&token=39d2ca2d-5d30-4906-8e69-13db2e2bb5bb"),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      "LGCs%Dx].TRiJBtRo#Rj_Nj[tRxZ",
                    ),
                    errorBuilder: OctoError.icon(color: GoRideColors.black),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(
                  height: 70,
                  width: 60,
                  margin: EdgeInsets.only(left: 70, top: 10),
                  decoration: BoxDecoration(
                    color: Color(0xffefefef),
                  ),
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fprofilepic.png?alt=media&token=af80c7e4-e14d-4645-b706-c651fb08116e"),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      "LRHe%pIA.m_2KjxawKNGIWkWD*M{",
                    ),
                    errorBuilder: OctoError.icon(color: GoRideColors.black),
                    fit: BoxFit.scaleDown,
                  ),
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

  Widget endRideBtn() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => GoRideRating(),
          ),
        );
      },
      child: Text(
        GoRideStringRes.endRide,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: GoRideColors.black,
            fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(280, 45),
        primary: GoRideColors.yellow,
      ),
    );
  }
}
