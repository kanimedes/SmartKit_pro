import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/StringsRes.dart';

class AllPlansActivity extends StatefulWidget {
  const AllPlansActivity({Key? key}) : super(key: key);

  @override
  _AllPlansActivityState createState() => _AllPlansActivityState();
}

class _AllPlansActivityState extends State<AllPlansActivity> {
  String? status = "2";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.black,
      body: Stack(
        children: [
          OctoImage(
            image: CachedNetworkImageProvider(
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fblurback.jpg?alt=media&token=1220f65c-6e44-42d7-99dc-7a2a5f33fa39"),
            placeholderBuilder: OctoPlaceholder.blurHash(
              "L584=3*0%\$tmkWkCV@V@r_MdR5R5",
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            errorBuilder: OctoError.icon(color: ColorsRes.black),
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 18.0,
                      left: MediaQuery.of(context).size.width / 18,
                    ),
                    child: Icon(Icons.close, color: ColorsRes.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 28.0,
                    left: MediaQuery.of(context).size.width / 18,
                  ),
                  child: Text(
                    StringsRes.unlimitedAccess,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorsRes.white,
                      fontSize: 28,
                      fontWeight: FontWeight.normal,
                      fontFamily: "TrebuchetMS",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5.0,
                    left: MediaQuery.of(context).size.width / 18,
                  ),
                  child: Text(
                    StringsRes.getAccessToAllFeatures,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorsRes.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Lato",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 12,
                      top: MediaQuery.of(context).size.height / 45,
                      right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                          "assets/images/fullApps/meditationApp/check.svg"),
                      SizedBox(width: 15.0),
                      Expanded(
                        child: Text(
                          StringsRes.allPlan1,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorsRes.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Lato",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 12,
                      top: MediaQuery.of(context).size.height / 45,
                      right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                          "assets/images/fullApps/meditationApp/check.svg"),
                      SizedBox(width: 15.0),
                      Expanded(
                        child: Text(
                          StringsRes.allPlan2,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorsRes.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Lato",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 12,
                      top: MediaQuery.of(context).size.height / 45,
                      right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                          "assets/images/fullApps/meditationApp/check.svg"),
                      SizedBox(width: 15.0),
                      Expanded(
                        child: Text(
                          StringsRes.allPlan3,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorsRes.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Lato",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 12,
                      top: MediaQuery.of(context).size.height / 45,
                      right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                          "assets/images/fullApps/meditationApp/check.svg"),
                      SizedBox(width: 15.0),
                      Expanded(
                        child: Text(
                          StringsRes.allPlan4,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorsRes.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Lato",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 12,
                      top: MediaQuery.of(context).size.height / 45,
                      right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                          "assets/images/fullApps/meditationApp/check.svg"),
                      SizedBox(width: 15.0),
                      Expanded(
                        child: Text(
                          StringsRes.allPlan5,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorsRes.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Lato",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 12,
                      top: MediaQuery.of(context).size.height / 45,
                      right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                          "assets/images/fullApps/meditationApp/check.svg"),
                      SizedBox(width: 15.0),
                      Expanded(
                        child: Text(
                          StringsRes.allPlan6,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorsRes.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Lato",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 19),
                  child: Divider(
                    height: 2,
                    color: ColorsRes.white,
                    indent: MediaQuery.of(context).size.height / 22,
                    endIndent: MediaQuery.of(context).size.height / 22,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 34.0,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      StringsRes.chooseAPlan,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsRes.white,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Lato",
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          status = "1";
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 6.5,
                        width: MediaQuery.of(context).size.width / 3.8,
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 20,
                            top: MediaQuery.of(context).size.height / 30),
                        decoration: status == "1"
                            ? DesignConfig.buttonShadowColor(
                                ColorsRes.gradientColor1,
                                24.0,
                                ColorsRes.gradientColor2,
                                ColorsRes.gradientColor3)
                            : DesignConfig.buttonShadowColor(
                                ColorsRes.backgroundColor,
                                24.0,
                                ColorsRes.backgroundColor,
                                ColorsRes.backgroundColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "6",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: status == "1"
                                    ? ColorsRes.white
                                    : ColorsRes.greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato",
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "month",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: status == "1"
                                    ? ColorsRes.white
                                    : ColorsRes.greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato",
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "\$9.99",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: status == "1"
                                    ? ColorsRes.white
                                    : ColorsRes.greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Lato",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          status = "2";
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 6.5,
                        width: MediaQuery.of(context).size.width / 3.8,
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width / 20,
                            top: MediaQuery.of(context).size.height / 30),
                        decoration: status == "2"
                            ? DesignConfig.buttonShadowColor(
                                ColorsRes.gradientColor1,
                                24.0,
                                ColorsRes.gradientColor2,
                                ColorsRes.gradientColor3)
                            : DesignConfig.buttonShadowColor(
                                ColorsRes.backgroundColor,
                                24.0,
                                ColorsRes.backgroundColor,
                                ColorsRes.backgroundColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "1",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: status == "2"
                                    ? ColorsRes.white
                                    : ColorsRes.greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato",
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "year",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: status == "2"
                                    ? ColorsRes.white
                                    : ColorsRes.greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato",
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "\$12.99",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: status == "2"
                                    ? ColorsRes.white
                                    : ColorsRes.greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Lato",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          status = "3";
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 6.5,
                        width: MediaQuery.of(context).size.width / 3.8,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 30),
                        decoration: status == "3"
                            ? DesignConfig.buttonShadowColor(
                                ColorsRes.gradientColor1,
                                24.0,
                                ColorsRes.gradientColor2,
                                ColorsRes.gradientColor3)
                            : DesignConfig.buttonShadowColor(
                                ColorsRes.backgroundColor,
                                24.0,
                                ColorsRes.backgroundColor,
                                ColorsRes.backgroundColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "3",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: status == "3"
                                    ? ColorsRes.white
                                    : ColorsRes.greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato",
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "month",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: status == "3"
                                    ? ColorsRes.white
                                    : ColorsRes.greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato",
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "\$6.99",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: status == "3"
                                    ? ColorsRes.white
                                    : ColorsRes.greyColor,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Lato",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 28.0,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Trial period : ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorsRes.white.withOpacity(0.6),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Lato",
                          ),
                        ),
                        Text(
                          "1 week for FREE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorsRes.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Lato",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 14,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 9,
                        right: MediaQuery.of(context).size.width / 9,
                        top: MediaQuery.of(context).size.height / 20),
                    decoration: DesignConfig.buttonShadowColor(
                        ColorsRes.gradientColor1,
                        24.0,
                        ColorsRes.gradientColor2,
                        ColorsRes.gradientColor3),
                    child: Text(
                      StringsRes.continueText.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsRes.white,
                        fontSize: 19,
                        fontWeight: FontWeight.normal,
                        fontFamily: "TrebuchetMS",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
