import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/PersonalDetailActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/StringsRes.dart';

class ProfilePictureActivity extends StatefulWidget {
  const ProfilePictureActivity({Key? key}) : super(key: key);

  @override
  _ProfilePictureActivityState createState() => _ProfilePictureActivityState();
}

class _ProfilePictureActivityState extends State<ProfilePictureActivity> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: ColorsRes.backgroundColor,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                  backgroundColor: ColorsRes.white,
                                  radius: 50,
                                  child: ClipOval(
                                      child: SvgPicture.asset(
                                    "assets/images/fullApps/loveMeet/default_profile.svg",
                                    width: 135,
                                    height: 135,
                                    fit: BoxFit.fill,
                                  )))),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text(
                        StringsRes.profilePictureText,
                        style: TextStyle(
                            color: ColorsRes.gradientTwo,
                            fontWeight: FontWeight.normal,
                            fontSize: 50),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text(
                        StringsRes.profilePictureDescriptionText,
                        style: TextStyle(
                            color: ColorsRes.darkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        //Navigator.pop(context);
                      },
                      child: Container(
                          decoration: DesignConfig.boxDecorationButton(
                              ColorsRes.gradientOne, ColorsRes.gradientTwo),
                          margin: EdgeInsets.only(right: 20, left: 20),
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          alignment: Alignment.center,
                          child: Text(StringsRes.addPhotoText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: ColorsRes.white,
                              ))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PersonalDetailActivity(),
                          ),
                        );
                      },
                      child: Container(
                          decoration: DesignConfig.boxDecorationButton(
                              ColorsRes.white, ColorsRes.white),
                          margin: EdgeInsets.only(right: 20, left: 20),
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          alignment: Alignment.center,
                          child: Text(StringsRes.skipText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: ColorsRes.grayColor,
                              ))),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginActivity(),
      ),
    );
  }
}
