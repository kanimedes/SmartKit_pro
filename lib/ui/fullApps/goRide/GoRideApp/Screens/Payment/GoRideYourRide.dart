import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';

import '../GoRideDrawerHome.dart';
import '../GoRideHomeScreen.dart';
import '../Widget/AppBar.dart';

class GoRideYourRide extends StatefulWidget {
  const GoRideYourRide({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideYourRideState();
  }
}

class GoRideYourRideState extends State<GoRideYourRide> {
  bool a = true, b = false, c = false, d = false;
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
              title: GoRideStringRes.YourRide,
            )),
        body: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: 30),
            decoration: GoRideConstant.boxDecorationContainer(
                GoRideColors.white, false),
            child: Column(children: [
              Text(
                GoRideStringRes.rateText,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .1,
                      right: MediaQuery.of(context).size.width * .1,
                      top: 5),
                  child: Divider(
                    color: Color(0x25707070),
                    thickness: 2,
                  )),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .09,
                width: MediaQuery.of(context).size.width * .19,
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
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "JOHN DOE",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                GoRideStringRes.Rateyourdriver,
                style: TextStyle(fontSize: 14, color: Color(0xff888888)),
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .1,
                      right: MediaQuery.of(context).size.width * .1,
                      top: 5),
                  child: Divider(
                    color: Color(0x25707070),
                    thickness: 2,
                  )),
              SizedBox(
                height: 8,
              ),
              GoRideConstant.displayRating("5", true),
              SizedBox(
                height: 8,
              ),
              Text(
                "You rated 5 star to Jhon Doe",
                style: TextStyle(fontSize: 14, color: Color(0xff888888)),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffebebeb),
                    borderRadius: BorderRadius.circular(10)),
                height: MediaQuery.of(context).size.height * .17,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .1,
                    right: MediaQuery.of(context).size.width * .1,
                    top: 10),
                child: TextFormField(
                  cursorColor: GoRideColors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: ' Type Your Review',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Add a tip to Jhon Doe",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .1,
                      right: MediaQuery.of(context).size.width * .1,
                      top: 5),
                  child: Divider(
                    color: Color(0x25707070),
                    thickness: 2,
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        a = true;
                        b = false;
                        c = false;
                        d = false;
                      });
                    },
                    child: Container(
                      height: 55,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: a ? GoRideColors.yellow : Color(0xffebebeb),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "\$10",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        b = true;
                        a = false;
                        c = false;
                        d = false;
                      });
                    },
                    child: Container(
                      height: 55,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: b ? GoRideColors.yellow : Color(0xffebebeb),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "\$20",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        c = true;
                        a = false;
                        b = false;
                        d = false;
                      });
                    },
                    child: Container(
                      height: 55,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: c ? GoRideColors.yellow : Color(0xffebebeb),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "\$30",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        d = true;
                        a = false;
                        b = false;
                        c = false;
                      });
                    },
                    child: Container(
                      height: 55,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: d ? GoRideColors.yellow : Color(0xffebebeb),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "\$40",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              ElevatedButton(
                onPressed: () {
                  xOffset = 0;
                  yOffset = 0;
                  scaleFactor = 1;
                  isDrawerOpen = false;
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false);
                  //Navigator.pushNamedAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => HomePage(),),);
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
            ])));
  }
}
