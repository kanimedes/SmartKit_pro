import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/AllPlansActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/StringsRes.dart';

class SubscriptionActivity extends StatefulWidget {
  const SubscriptionActivity({Key? key}) : super(key: key);

  @override
  _SubscriptionActivityState createState() => _SubscriptionActivityState();
}

class _SubscriptionActivityState extends State<SubscriptionActivity> {
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
                    StringsRes.startYourJourney,
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
                      left: MediaQuery.of(context).size.width / 12,
                      top: MediaQuery.of(context).size.height / 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                          "assets/images/fullApps/meditationApp/check.svg"),
                      SizedBox(width: 15.0),
                      Expanded(
                        child: Text(
                          StringsRes.subscriptionPlan1,
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
                          StringsRes.subscriptionPlan2,
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
                          StringsRes.subscriptionPlan3,
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
                          StringsRes.subscriptionPlan4,
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
                          StringsRes.subscriptionPlan5,
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
                          StringsRes.subscriptionPlan6,
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
                          StringsRes.subscriptionPlan7,
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
                    top: MediaQuery.of(context).size.height / 14.0,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "3,650.00 for 1 Year",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorsRes.white.withOpacity(0.6),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Lato",
                          ),
                        ),
                        Text(
                          "Equivalent to 304.16 / month",
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
                        top: MediaQuery.of(context).size.height / 26),
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllPlansActivity(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 9,
                        right: MediaQuery.of(context).size.width / 9,
                        top: MediaQuery.of(context).size.height / 26),
                    child: Text(
                      StringsRes.viewAllPlans,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsRes.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Lato",
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
