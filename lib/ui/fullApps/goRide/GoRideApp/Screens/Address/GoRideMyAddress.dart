// ignore_for_file: unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';

import '../../../../widgets/slideAnimation.dart';
import '../GoRideDrawerHome.dart';
import '../GoRideHomeScreen.dart';
import 'GoRideAddNewAddress.dart';

class GoRideMyAddress extends StatefulWidget {
  const GoRideMyAddress({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideMyAddressState();
  }
}

class GoRideMyAddressState extends State<GoRideMyAddress>
    with SingleTickerProviderStateMixin {
  bool a = true, b = false, c = false;
  AnimationController? _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
  }

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
                        GoRideStringRes.MyAddress,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    )
                  ])),

              // PreferredSizeAppBar(title: GoRideStringRes.MyAddress,)
            ),
            body: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(
                    top: 20,
                    left: MediaQuery.of(context).size.width * .1,
                    right: MediaQuery.of(context).size.width * .1),
                decoration: GoRideConstant.boxDecorationContainer(
                    GoRideColors.white, false),
                child: SlideAnimation(
                    position: 5,
                    itemCount: 15,
                    slideDirection: SlideDirection.fromTop,
                    animationController: _animationController,
                    child: Column(children: [
                      firstAddress(),
                      secondAddress(),
                      thirdAddress(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .09,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  GoRideAddNewAddress(),
                            ),
                          );
                        },
                        child: Text(
                          GoRideStringRes.Addnewaddress.toUpperCase(),
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
                    ])))));
  }

  Widget firstAddress() {
    return GestureDetector(
      onTap: () {
        setState(() {
          a = true;
          b = false;
          c = false;
        });
      },
      child: Container(
          height: MediaQuery.of(context).size.height * .21,
          //  padding: EdgeInsets.only(top: 10,left: 30,right: 30),
          margin: EdgeInsets.only(
            top: 10, /*left: 20,right: 30*/
          ),
          decoration: BoxDecoration(
            border: Border.all(color: a ? GoRideColors.yellow : Colors.white),
            borderRadius: BorderRadius.circular(10),
            color: a ? Color(0xfffcf8e5) : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 2.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 40),
                      child: Text(
                        "Divy Jani",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                      },
                      child: Text(
                        "Home",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: GoRideColors.black,
                            fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(30, 30),
                        primary: GoRideColors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    margin: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    //padding: EdgeInsets.only(left: 30),
                    child: SvgPicture.asset(
                        GoRideConstant.getSvgImagePath("pro.address.svg")),
                  ),
                  Container(
                    width: 200,
                    margin: EdgeInsets.only(right: 10, left: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Nr Hotel Vrinadavan, Hari Niwas Circle, Opp Manalisa Blg, Thane (west)",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff828282)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 50, top: 10),
                    alignment: Alignment.topLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                      },
                      child: Text(
                        "Edit",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff828282),
                            fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(70, 40),
                        primary: GoRideColors.white,
                        side: BorderSide(
                          width: 1.0,
                          color: Color(0xffc4c4c4),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      alignment: Alignment.topLeft,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                        },
                        label: Text(
                          "Delete",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: GoRideColors.white,
                              fontSize: 14),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(30, 40),
                          primary: GoRideColors.red,
                        ),
                        icon: SvgPicture.asset(
                            GoRideConstant.getSvgImagePath("delete_icon.svg")),
                      )),
                ],
              )
            ],
          )),
    );
  }

  Widget secondAddress() {
    return GestureDetector(
      onTap: () {
        setState(() {
          a = false;
          b = true;
          c = false;
        });
      },
      child: Container(
          height: MediaQuery.of(context).size.height * .21,
          //  padding: EdgeInsets.only(top: 10,left: 30,right: 30),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            border: Border.all(color: b ? GoRideColors.yellow : Colors.white),
            borderRadius: BorderRadius.circular(10),
            color: b ? Color(0xfffcf8e5) : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 2.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 40),
                      child: Text(
                        "Divy Jani",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                      },
                      child: Text(
                        "Work",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: GoRideColors.black,
                            fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(30, 30),
                        primary: GoRideColors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    margin: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    //padding: EdgeInsets.only(left: 30),
                    child: SvgPicture.asset(
                        GoRideConstant.getSvgImagePath("pro.address.svg")),
                  ),
                  Container(
                    width: 200,
                    margin: EdgeInsets.only(right: 10, left: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Gala No 132, 6,mittal Indl Estate, Andheri Kurla Rd, Andheri (west)",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff828282)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 50, top: 10),
                    alignment: Alignment.topLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                      },
                      child: Text(
                        "Edit",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff828282),
                            fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(70, 40),
                        primary: GoRideColors.white,
                        side: BorderSide(
                          width: 1.0,
                          color: Color(0xffc4c4c4),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      alignment: Alignment.topLeft,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                        },
                        label: Text(
                          "Delete",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: GoRideColors.white,
                              fontSize: 14),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(30, 40),
                          primary: GoRideColors.red,
                        ),
                        icon: SvgPicture.asset(
                            GoRideConstant.getSvgImagePath("delete_icon.svg")),
                      )),
                ],
              )
            ],
          )),
    );
  }

  Widget thirdAddress() {
    return GestureDetector(
      onTap: () {
        setState(() {
          a = false;
          b = false;
          c = true;
        });
      },
      child: Container(
          height: MediaQuery.of(context).size.height * .2,
          //  padding: EdgeInsets.only(top: 10,left: 30,right: 30),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            border: Border.all(color: c ? GoRideColors.yellow : Colors.white),
            borderRadius: BorderRadius.circular(10),
            color: c ? Color(0xfffcf8e5) : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 2.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 40),
                      child: Text(
                        "Divy Jani",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                      },
                      child: Text(
                        "Coffee",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: GoRideColors.black,
                            fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(30, 30),
                        primary: GoRideColors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    margin: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    //padding: EdgeInsets.only(left: 30),
                    child: SvgPicture.asset(
                        GoRideConstant.getSvgImagePath("pro.address.svg")),
                  ),
                  Container(
                    width: 200,
                    margin: EdgeInsets.only(right: 10, left: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Botawala Bldg, Kalbadevi, 4 8 1 Kalbadevi Road",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff828282)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 50, top: 10),
                    alignment: Alignment.topLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                      },
                      child: Text(
                        "Edit",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff828282),
                            fontSize: 14),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(70, 40),
                        primary: GoRideColors.white,
                        side: BorderSide(
                          width: 1.0,
                          color: Color(0xffc4c4c4),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      alignment: Alignment.topLeft,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRidePaymentMethod(),),);
                        },
                        label: Text(
                          "Delete",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: GoRideColors.white,
                              fontSize: 14),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(30, 40),
                          primary: GoRideColors.red,
                        ),
                        icon: SvgPicture.asset(
                            GoRideConstant.getSvgImagePath("delete_icon.svg")),
                      )),
                ],
              )
            ],
          )),
    );
  }
}
