// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/Widget/AppBar.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/Widget/animatedFadeAnimation.dart';

import '../GoRideDrawerHome.dart';
import '../GoRideHomeScreen.dart';

class GoRideAddNewAddress extends StatefulWidget {
  const GoRideAddNewAddress({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideAddNewAddressState();
  }
}

class GoRideAddNewAddressState extends State<GoRideAddNewAddress> {
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
              title: GoRideStringRes.Addnewaddress,
            )),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
                top: 20,
                left: MediaQuery.of(context).size.width * .1,
                right: MediaQuery.of(context).size.width * .1),
            decoration: GoRideConstant.boxDecorationContainer(
                GoRideColors.white, false),
            child: Column(children: [
              AnimatedFadeAnimation(
                  1,
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    alignment: Alignment.topLeft,
                    child: Text(
                      GoRideStringRes.typeAdd,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  )),
              AnimatedFadeAnimation(1.3, addressList()),
              AnimatedFadeAnimation(1.6, pinCOdeAndLocation()),
              AnimatedFadeAnimation(1.9, stateAndCity()),
              AnimatedFadeAnimation(
                  1.12,
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        GoRideStringRes.houseNo,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color(0xffababab),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ))),
              SizedBox(
                height: 10,
              ),
              AnimatedFadeAnimation(1.12, houseNoEnter()),
              AnimatedFadeAnimation(
                  1.15,
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        GoRideStringRes.StreetName,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color(0xffababab),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ))),
              AnimatedFadeAnimation(1.15, streetNameEnter()),
              AnimatedFadeAnimation(1.30, saveAddBtn())
            ])));
  }

  Widget addressList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.only(top: 10),
              alignment: Alignment.topLeft,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    a = true;
                    b = false;
                    c = false;
                    d = false;
                  });
                  //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                },
                label: Text(
                  "Home",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: GoRideColors.black,
                      fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(30, 40),
                  primary: a ? Color(0xfffcf8e5) : GoRideColors.white,
                  side: BorderSide(
                    width: 1.0,
                    color: a ? GoRideColors.yellow : Colors.black,
                  ),
                ),
                icon: SvgPicture.asset(
                    GoRideConstant.getSvgImagePath("add.home.svg")),
              )),
          Container(
              padding: EdgeInsets.only(left: 20, top: 10),
              alignment: Alignment.topLeft,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    a = false;
                    b = true;
                    c = false;
                    d = false;
                  });
                  //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                },
                label: Text(
                  "Work",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: GoRideColors.black,
                      fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(30, 40),
                  primary: b ? Color(0xfffcf8e5) : GoRideColors.white,
                  side: BorderSide(
                    width: 1.0,
                    color: b ? GoRideColors.yellow : Colors.black,
                  ),
                ),
                icon: SvgPicture.asset(
                    GoRideConstant.getSvgImagePath("add.work.svg")),
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
                    d = false;
                  });
                  //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                },
                label: Text(
                  "Coffee",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: GoRideColors.black,
                      fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(30, 40),
                  primary: c ? Color(0xfffcf8e5) : GoRideColors.white,
                  side: BorderSide(
                    width: 1.0,
                    color: c ? GoRideColors.yellow : Colors.black,
                  ),
                ),
                icon: SvgPicture.asset(
                    GoRideConstant.getSvgImagePath("add.coffee.svg")),
              )),
          Container(
              padding: EdgeInsets.only(left: 20, top: 10),
              alignment: Alignment.topLeft,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    a = false;
                    b = false;
                    c = false;
                    d = true;
                  });
                  //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                },
                label: Text(
                  "Shopping",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: GoRideColors.black,
                      fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(30, 40),
                  /* primary: Color(0xfffcf8e5),
                  side: BorderSide(
                    width: 1.0,
                    color: GoRideColors.yellow,
                  ),*/
                  primary: d ? Color(0xfffcf8e5) : GoRideColors.white,
                  side: BorderSide(
                    width: 1.0,
                    color: a ? GoRideColors.yellow : Colors.black,
                  ),
                ),
                icon: SvgPicture.asset(
                    GoRideConstant.getSvgImagePath("add.shop.svg")),
              )),
        ],
      ),
    );
  }

  Widget pinCOdeAndLocation() {
    return Container(
        height: 85,
        // alignment: Alignment.topLeft,
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      // padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.05),
                      child: Text(
                        GoRideStringRes.Pincode,
                        style: TextStyle(
                            color: Color(0xffababab),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )),
                  TextFormField(
                      cursorColor: Color(0xffa2a2a2),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "400068",
                        hintStyle: TextStyle(
                            color: GoRideColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffababab)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffababab)),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  alignment: Alignment.topLeft,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                    },
                    label: Text(
                      "Use my location",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: GoRideColors.black,
                          fontSize: 14),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(30, 40),
                      primary: GoRideColors.yellow,
                    ),
                    icon: SvgPicture.asset(
                        GoRideConstant.getSvgImagePath("add.location.svg")),
                  )),
            )
          ],
        ));
  }

  Widget stateAndCity() {
    return Container(
        height: 85,
        // alignment: Alignment.topLeft,
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      // padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.05),
                      child: Text(
                        GoRideStringRes.State,
                        style: TextStyle(
                            color: Color(0xffababab),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )),
                  TextFormField(
                      cursorColor: Color(0xffa2a2a2),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: "Maharashtra",
                        hintStyle: TextStyle(
                            color: GoRideColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffababab)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffababab)),
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .05),
                      child: Text(
                        GoRideStringRes.City,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color(0xffababab),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )),
                  Container(
                    //alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .05,
                    ),
                    child: TextFormField(
                        cursorColor: Color(0xffa2a2a2),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintText: "Mumbai",
                          hintStyle: TextStyle(
                              color: GoRideColors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffababab)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffababab)),
                          ),
                        )),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget houseNoEnter() {
    return Container(
      alignment: Alignment.topLeft,
      // padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.05,right:MediaQuery.of(context).size.width*.08,),
      child: TextFormField(
          cursorColor: Color(0xffa2a2a2),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: "C - 116, Ambaa Nivas ",
            hintStyle: TextStyle(
                color: GoRideColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffa2a2a2)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffa2a2a2)),
            ),
          )),
    );
  }

  Widget streetNameEnter() {
    return Container(
      alignment: Alignment.topLeft,
      // padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.05,right:MediaQuery.of(context).size.width*.08,),
      child: TextFormField(
          cursorColor: Color(0xffa2a2a2),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: "Y.r. Tawde Road, S V Road, Dahisar ",
            hintStyle: TextStyle(
                color: GoRideColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffa2a2a2)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffa2a2a2)),
            ),
          )),
    );
  }

  Widget saveAddBtn() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .18),
      child: ElevatedButton(
        onPressed: () {
          xOffset = 0;
          yOffset = 0;
          scaleFactor = 1;
          isDrawerOpen = false;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomePage(),
            ),
          );
        },
        child: Text(
          GoRideStringRes.SaveAddress,
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
