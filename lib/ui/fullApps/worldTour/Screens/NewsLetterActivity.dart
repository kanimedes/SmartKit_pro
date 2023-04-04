import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/MainActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBox.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBoxCurve.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/StringsRes.dart';

class NewsLetterActivity extends StatefulWidget {
  const NewsLetterActivity({Key? key}) : super(key: key);

  @override
  NewsLetterActivityState createState() => NewsLetterActivityState();
}

class NewsLetterActivityState extends State<NewsLetterActivity> {
  bool descTextShowFlag = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget showUsername() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
      decoration: DesignConfig.boxDecorationButtonColor(
          Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.8), 50),
      padding: const EdgeInsets.only(left: 20.0),
      child: TextFormField(
        style: TextStyle(color: ColorsRes.black),
        cursorColor: ColorsRes.black,
        decoration: InputDecoration(
          hintText: StringsRes.fullNameText,
          hintStyle: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: ColorsRes.grayColor)),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.name,
      ),
    );
  }

  Widget showEmail() {
    return Container(
      margin: EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
      decoration: DesignConfig.boxDecorationButtonColor(
          Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.8), 50),
      padding: const EdgeInsets.only(left: 20.0),
      child: TextFormField(
        style: TextStyle(color: ColorsRes.black),
        cursorColor: ColorsRes.black,
        decoration: InputDecoration(
          hintText: StringsRes.emailAddressText,
          hintStyle: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: ColorsRes.grayColor)),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                        'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fimage_b.jpg?alt=media&token=2279a2b7-205e-4543-8260-b379377c5ba4'),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      'LA7{HstRnNyEK-.SkDkWMJXT%zWB',
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    errorBuilder: OctoError.icon(color: ColorsRes.bottomColor),
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.only(top: 25.0, left: 10.0),
                    child: GlassBox(
                        redius: 40.0,
                        width: 50,
                        height: 50,
                        child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.close,
                                  color: ColorsRes.bottomColor),
                            )))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 3.4),
              height: MediaQuery.of(context).size.height,
              child: GlassBoxCurve(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          margin: EdgeInsets.only(top: 30.0),
                          decoration:
                              DesignConfig.boxDecorationBorderButtonColor(
                                  ColorsRes.white, 50),
                          child: Container(
                              padding: EdgeInsets.all(30.0),
                              decoration: DesignConfig.boxDecorationButtonColor(
                                  ColorsRes.white.withOpacity(0.7),
                                  ColorsRes.white.withOpacity(0.6),
                                  50),
                              child: SvgPicture.asset(
                                  "assets/images/fullApps/worldTour/svg/newsletter.svg")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          StringsRes.weeklyNewsletterText,
                          style: TextStyle(
                              fontSize: 35,
                              color: ColorsRes.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          StringsRes.weeklyNewsletterDescriptionText,
                          style: TextStyle(
                              fontSize: 18,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      showUsername(),
                      showEmail(),
                      Container(
                        margin:
                            EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0),
                        child: Row(children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  descTextShowFlag = !descTextShowFlag;
                                });
                              },
                              child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration:
                                      DesignConfig.boxDecorationButtonColor(
                                          Colors.white.withOpacity(0.8),
                                          Colors.white.withOpacity(0.8),
                                          10),
                                  child: Icon(Icons.done,
                                      color: descTextShowFlag
                                          ? ColorsRes.grayColor
                                          : Colors.transparent))),
                          SizedBox(width: 10.0),
                          Text(
                            StringsRes.iAgreeToReceiveNewslettersText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsRes.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ]),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => MainActivity()),
                              (Route<dynamic> route) => false);
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: DesignConfig.boxDecorationButtonColor(
                                  ColorsRes.blueColor, ColorsRes.blueColor, 25),
                              alignment: AlignmentDirectional.center,
                              margin: EdgeInsets.only(
                                  left: 30.0,
                                  top: MediaQuery.of(context).size.height / 45,
                                  right: 30.0,
                                  bottom:
                                      MediaQuery.of(context).size.height / 45),
                              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      "assets/images/fullApps/worldTour/svg/mail_icon.svg"),
                                  SizedBox(width: 10),
                                  Text(
                                    StringsRes.subscribeText,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: ColorsRes.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
