import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/Address/GoRideMyAddress.dart';

import '../GoRideDrawerHome.dart';
import '../GoRideHomeScreen.dart';
import 'GoRIdeNewPwd.dart';
import 'GoRideEditProfile.dart';

class GoRideEditProfileShow extends StatefulWidget {
  const GoRideEditProfileShow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideEditProfileShowState();
  }
}

class GoRideEditProfileShowState extends State<GoRideEditProfileShow> {
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
                      width: MediaQuery.of(context).size.width * .2,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .05,
                      ),
                      child: Text(
                        GoRideStringRes.editProfile,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    )
                  ])),

              //  PreferredSizeAppBar(title: GoRideStringRes.editProfile,)
            ),
            body: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: 30),
                decoration: GoRideConstant.boxDecorationContainer(
                    GoRideColors.white, false),
                child: Column(children: [
                  imageAndText(),
                  Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .1,
                          right: MediaQuery.of(context).size.width * .1,
                          top: 5),
                      child: Divider(
                        color: Color(0x25707070),
                        thickness: 2,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .1),
                        child: Text(
                          GoRideStringRes.personalDetail,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 22.0),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      GoRideEditProfile(),
                                ),
                              );
                            },
                            child: Text(
                              GoRideStringRes.Edit,
                              style: TextStyle(
                                  color: GoRideColors.yellow,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            )),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .1),
                        child: SvgPicture.asset(
                            GoRideConstant.getSvgImagePath("pro.user.svg")),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Divy Jani",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .1),
                        child: SvgPicture.asset(
                            GoRideConstant.getSvgImagePath("pro.mail.svg")),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "abcd2021@gmail.com",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .1),
                        child: SvgPicture.asset(
                            GoRideConstant.getSvgImagePath("pro.phone.svg")),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "0123456789",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .1),
                        child: SvgPicture.asset(
                            GoRideConstant.getSvgImagePath("pro.gender.svg")),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Male",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .1),
                        child: SvgPicture.asset(
                            GoRideConstant.getSvgImagePath("pro.password.svg")),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "●●●●●●●",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => GoRideNewPwd(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .5),
                          child: SvgPicture.asset(
                              GoRideConstant.getSvgImagePath(
                                  "pro.right_arrow.svg")),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .1),
                        child: Text(
                          GoRideStringRes.Address,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  GoRideMyAddress(),
                            ),
                          );
                        },
                        child: Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * .1),
                            child: SvgPicture.asset(
                                GoRideConstant.getSvgImagePath(
                                    "pro.right_arrow.svg"))),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .1,
                      ),
                      SvgPicture.asset(
                          GoRideConstant.getSvgImagePath("pro.address.svg")),
                      // SizedBox(width: MediaQuery.of(context).size.width*.1,),
                      Container(
                        width: 270,
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.only(left: 8.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Nr Hotel Vrinadavan, Hari Niwas Circle, Opp Manalisa Blg, Thane (west)",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .15,
                  ),
                  ElevatedButton(
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
                      GoRideStringRes.SaveProfile,
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
                ]))));
  }

  Widget imageAndText() {
    return Row(
      children: [
        Stack(
          children: [
            Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .12, top: 20),
                height: MediaQuery.of(context).size.height * .08,
                width: MediaQuery.of(context).size.width * .19,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      blurRadius: 8.0, // soften the shadow
                      spreadRadius: 0.0, //extend the shadow
                    )
                  ],
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
                    ))),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .24,
                top: MediaQuery.of(context).size.height * .09,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 18,
                child: SvgPicture.asset(
                  GoRideConstant.getSvgImagePath("pro.edit_image.svg"),
                ),
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(
            bottom: 30,
            left: MediaQuery.of(context).size.width * .02,
            top: MediaQuery.of(context).size.height * .03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "JOHN DOE",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "abcd2021@gmail.com",
                style: TextStyle(fontSize: 12, color: Color(0xff818181)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
