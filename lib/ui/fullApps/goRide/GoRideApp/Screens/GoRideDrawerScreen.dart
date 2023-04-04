import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';

import 'Address/GoRideMyAddress.dart';
import 'GoRideBookLater.dart';
import 'GoRideDrawerHome.dart';
import 'GoRideHomeScreen.dart';
import 'Login/GoRideLoginScreen.dart';
import 'MyTrip/GoRideMyTrips.dart';
import 'Payment/GoRidePlaymentMehod.dart';
import 'Profile/GoRideEditProfileShowData.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  List<Map> drawerItems = [
    {
      'id': 1,
      'icon': GoRideConstant.getSvgImagePath("me.home.svg"),
      'title': 'Home'
    },
    {
      'id': 2,
      'icon': GoRideConstant.getSvgImagePath("me.my_trip.svg"),
      'title': 'My Trip'
    },
    {
      'id': 3,
      'icon': GoRideConstant.getSvgImagePath("me.address.svg"),
      'title': 'Address'
    },
    {
      'id': 4,
      'icon': GoRideConstant.getSvgImagePath("me.payment.svg"),
      'title': 'Payment'
    },
    {
      'id': 5,
      'icon': GoRideConstant.getSvgImagePath("me.book_later.svg"),
      'title': 'Book Later'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: GoRideColors.yellow,
      // padding: EdgeInsets.only(top:50,bottom: 150,left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .06,
                left: MediaQuery.of(context).size.width * .07),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                        // margin:EdgeInsets.only(top: MediaQuery.of(context).size.height*.015),
                        height: MediaQuery.of(context).size.height * .17,
                        width: MediaQuery.of(context).size.width * .17,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            )),
                        child: OctoImage(
                          image: CachedNetworkImageProvider(
                              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fprofilepic.png?alt=media&token=af80c7e4-e14d-4645-b706-c651fb08116e"),
                          placeholderBuilder: OctoPlaceholder.blurHash(
                            "LRHe%pIA.m_2KjxawKNGIWkWD*M{",
                          ),
                          errorBuilder: OctoError.icon(color: Colors.black),
                          fit: BoxFit.contain,
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .095,
                          left: MediaQuery.of(context).size.width * .1),
                      child: CircleAvatar(
                        radius: 13,
                        child: FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      GoRideEditProfileShow(),
                                ),
                              );
                            },
                            backgroundColor: GoRideColors.yellow,
                            mini: true,
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 15,
                            )),
                      ),
                    ),
                  ],
                ),
                /* CircleAvatar(radius: 30,
                    child: OctoImage(
                      image: CachedNetworkImageProvider(
                          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fprofilepic.png?alt=media&token=af80c7e4-e14d-4645-b706-c651fb08116e"),
                      placeholderBuilder: OctoPlaceholder.blurHash(
                        "LRHe%pIA.m_2KjxawKNGIWkWD*M{",),
                      errorBuilder: OctoError.icon(color: Colors.black),
                      fit: BoxFit.contain,
                    ),
                  ),*/
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Jay',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .05, bottom: 150),
            child: Column(
              children: drawerItems
                  .map((element) => Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GestureDetector(
                            onTap: () {
                              if (element["id"] == 1) {
                                xOffset = 0;
                                yOffset = 0;
                                scaleFactor = 1;
                                isDrawerOpen = false;
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        HomePage(),
                                  ),
                                );
                              } else if (element["id"] == 2) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        GoRideMyTrips(),
                                  ),
                                );
                              } else if (element["id"] == 3) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        GoRideMyAddress(),
                                  ),
                                );
                              } else if (element["id"] == 4) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        GoRidePaymentMethod(),
                                  ),
                                );
                              } else if (element["id"] == 5) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        GoRideBookLater(),
                                  ),
                                );
                              }
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  element['icon'],
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(element['title'],
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20))
                              ],
                            )),
                      ))
                  .toList(),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => GoRideLoginScreen(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.only(
                  bottom: 60, left: MediaQuery.of(context).size.width * .08),
              child: Row(
                children: [
                  SvgPicture.asset(
                      GoRideConstant.getSvgImagePath("me.logout.svg")),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
