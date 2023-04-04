import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/Payment/GoRideRating.dart';

import '../Widget/AppBar.dart';

class GoRideCancelTrip extends StatefulWidget {
  const GoRideCancelTrip({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideCancelTripState();
  }
}

class GoRideCancelTripState extends State<GoRideCancelTrip> {
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
              title: GoRideStringRes.CancelTrip,
            )),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
    return ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
        child: OctoImage(
          image: CachedNetworkImageProvider(
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Fmap.jpg?alt=media&token=39013a81-98ea-4e47-aea4-919963651f0e"),
          placeholderBuilder: OctoPlaceholder.blurHash(
            "L2Pt0\$S;F_Y83N];^8I+3p9_[dD~",
          ),
          errorBuilder: OctoError.icon(color: GoRideColors.black),
          fit: BoxFit.fill,
        ));
  }

  bool a = false, b = false, c = false;
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
                GoRideStringRes.CancelMyRide,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
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
          GestureDetector(
            onTap: () {
              setState(() {
                a = true;
                b = false;
                c = false;
              });
            },
            child: Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .1,
                    top: 10,
                    right: MediaQuery.of(context).size.width * .1),
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "I got lift",
                      style: TextStyle(fontSize: 14),
                    ),
                    a
                        ? SvgPicture.asset(
                            GoRideConstant.getSvgImagePath("cancel_tick.svg"),
                          )
                        : Container()
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                a = false;
                b = true;
                c = false;
              });
            },
            child: Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .1,
                    right: 40,
                    top: 13),
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Driver is late",
                      style: TextStyle(fontSize: 14),
                    ),
                    b
                        ? SvgPicture.asset(
                            GoRideConstant.getSvgImagePath("cancel_tick.svg"),
                          )
                        : Container()
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                a = false;
                b = false;
                c = true;
              });
            },
            child: Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .1,
                    right: 40,
                    top: 13),
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Change My Mind",
                      style: TextStyle(fontSize: 14),
                    ),
                    c
                        ? SvgPicture.asset(
                            GoRideConstant.getSvgImagePath("cancel_tick.svg"),
                          )
                        : Container()
                  ],
                )),
          ),
          Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .1, top: 13),
              alignment: Alignment.topLeft,
              child: Text(
                "Other",
                style: TextStyle(fontSize: 14),
              )),
          Container(
            decoration: BoxDecoration(
                color: Color(0xffebebeb),
                borderRadius: BorderRadius.circular(10)),
            height: MediaQuery.of(context).size.height * .17,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .1,
                right: 40,
                top: 13),
            child: TextFormField(
              cursorColor: GoRideColors.black,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: ' Give a Reason',
                  hintStyle: TextStyle(color: Color(0xff888888), fontSize: 14)),
            ),
          ),
          cancelRideBtn()
        ]));
  }

  Widget cancelRideBtn() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => GoRideRating(),
            ),
          );
        },
        child: Text(
          GoRideStringRes.Cancelride.toUpperCase(),
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
