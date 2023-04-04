// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class ParentalControlActivity extends StatefulWidget {
  ParentalControlActivity({Key? key}) : super(key: key);

  @override
  _ParentalControlActivityState createState() =>
      _ParentalControlActivityState();
}

class _ParentalControlActivityState extends State<ParentalControlActivity> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(StringsRes.parentalControlText,
            style: TextStyle(
                fontSize: 20,
                color: ColorsRes.white,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: ColorsRes.white,
            ),
            onTap: () {
              Navigator.pop(context);
            }),
        backgroundColor: ColorsRes.backgroundColor,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: ColorsRes.backgroundColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(StringsRes.parentalControlDescriptionText,
                          style: TextStyle(
                              fontSize: 15,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.normal)),
                    )),
                Row(children: [
                  Container(
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width * .22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsRes.yellowColor,
                      ),
                      child: CircleAvatar(
                          radius: 70,
                          backgroundColor: ColorsRes.yellowColor,
                          child: SvgPicture.asset(
                            "assets/images/fullApps/playMedia/svg/lock.svg",
                            height: 40,
                            width: 40,
                          ))),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "G (All)",
                          style: TextStyle(
                              fontSize: 18,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "General viewing, suitable for all",
                          style: TextStyle(
                              fontSize: 12,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ]),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 50,
                    color: ColorsRes.yellowColor,
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 40),
                  ),
                ),
                Row(children: [
                  Container(
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width * .22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsRes.yellowColor,
                      ),
                      child: CircleAvatar(
                          radius: 70,
                          backgroundColor: ColorsRes.yellowColor,
                          child: SvgPicture.asset(
                            "assets/images/fullApps/playMedia/svg/lock.svg",
                            height: 40,
                            width: 40,
                          ))),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("PG(+7)",
                            style: TextStyle(
                                fontSize: 18,
                                color: ColorsRes.white,
                                fontWeight: FontWeight.normal)),
                        Text("Parental guidance recommended",
                            style: TextStyle(
                                fontSize: 12,
                                color: ColorsRes.white,
                                fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                ]),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 50,
                    color: ColorsRes.yellowColor,
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 40),
                  ),
                ),
                Row(children: [
                  Container(
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width * .22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsRes.yellowColor,
                      ),
                      child: CircleAvatar(
                          radius: 70,
                          backgroundColor: ColorsRes.yellowColor,
                          child: SvgPicture.asset(
                            "assets/images/fullApps/playMedia/svg/lock.svg",
                            height: 40,
                            width: 40,
                          ))),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("15+",
                            style: TextStyle(
                                fontSize: 18,
                                color: ColorsRes.white,
                                fontWeight: FontWeight.normal)),
                        Text("Suitable for 15 years and over",
                            style: TextStyle(
                                fontSize: 12,
                                color: ColorsRes.white,
                                fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                ]),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 50,
                    color: ColorsRes.yellowColor,
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 40),
                  ),
                ),
                Row(children: [
                  Container(
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width * .22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsRes.yellowColor,
                      ),
                      child: CircleAvatar(
                          radius: 70,
                          backgroundColor: ColorsRes.yellowColor,
                          child: SvgPicture.asset(
                            "assets/images/fullApps/playMedia/svg/lock01.svg",
                            height: 40,
                            width: 40,
                          ))),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("R(+18)",
                            style: TextStyle(
                                fontSize: 18,
                                color: ColorsRes.white,
                                fontWeight: FontWeight.normal)),
                        Text("Restricted content suitable for 18 years",
                            style: TextStyle(
                                fontSize: 12,
                                color: ColorsRes.white,
                                fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
