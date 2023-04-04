import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/NotificationActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/StringsRes.dart';

class MatchActivity extends StatefulWidget {
  const MatchActivity({Key? key}) : super(key: key);

  @override
  _MatchActivityState createState() => _MatchActivityState();
}

class _MatchActivityState extends State<MatchActivity> {
  String gender = StringsRes.maleText;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: ColorsRes.backgroundColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorsRes.darkColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            StringsRes.matchText,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: ColorsRes.darkColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.notifications_none),
                color: ColorsRes.darkColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationActivity(),
                    ),
                  );
                }),
            GestureDetector(
                onTap: () {
                  DesignConfig.showFilter(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/fullApps/loveMeet/filter.svg",
                      color: ColorsRes.darkColor,
                    ),
                  ),
                ))
          ],
        ),
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
                      SizedBox(
                        height: 35.0,
                      ),
                      Stack(children: [
                        // image set in circle
                        Container(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .010),
                            child: CircleAvatar(
                              radius: 80,
                              backgroundColor: ColorsRes.backgroundColor,
                              child: ClipOval(
                                  child: OctoImage(
                                image: CachedNetworkImageProvider(
                                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_f.jpg?alt=media&token=36ecf13a-53d9-4fd8-9134-e8fd29037a8c",
                                ),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  "LKIh5BIB0KH=~WDO=~W=FeIUxun#",
                                ),
                                errorBuilder:
                                    OctoError.icon(color: Colors.black),
                                width: 195,
                                height: 195,
                                fit: BoxFit.fill,
                              )),
                            )),
                        Container(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .35),
                            child: CircleAvatar(
                              radius: 80,
                              backgroundColor: ColorsRes.backgroundColor,
                              child: ClipOval(
                                  child: OctoImage(
                                image: CachedNetworkImageProvider(
                                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_k.jpg?alt=media&token=bc79f61d-f2b6-4b53-8a66-e37ad9c50b49",
                                ),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  "LOFzKM}DIU%2AsAYJ8WDVsxGt7M|",
                                ),
                                errorBuilder:
                                    OctoError.icon(color: Colors.black),
                                width: 195,
                                height: 195,
                                fit: BoxFit.fill,
                              )),
                            )),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * .030,
                              left: MediaQuery.of(context).size.width * .25),
                          child: SvgPicture.asset(
                              "assets/images/fullApps/loveMeet/heart.svg"),
                        ),
                      ]),
                      SizedBox(height: 60),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(
                            StringsRes.nowFriendText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsRes.gradientTwo,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //Navigator.pop(context);
                        },
                        child: Container(
                            decoration: DesignConfig.boxDecorationButtonColor(
                                ColorsRes.gradientOne,
                                ColorsRes.gradientTwo,
                                50),
                            margin:
                                EdgeInsets.only(right: 20, left: 20, top: 60),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            alignment: Alignment.center,
                            child: Text(StringsRes.sendMessageText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsRes.white,
                                ))),
                      ),
                      GestureDetector(
                        onTap: () {
                          //Navigator.pop(context);
                        },
                        child: Container(
                            decoration:
                                DesignConfig.boxDecorationBorderButtonColor(
                                    ColorsRes.darkColor, 50),
                            margin:
                                EdgeInsets.only(right: 20, left: 20, top: 20.0),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            alignment: Alignment.center,
                            child: Text(StringsRes.findNewFriendFriendText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsRes.darkColor,
                                ))),
                      ),
                      SizedBox(
                        height: 35.0,
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

  Future<void> navigationPage() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginActivity(),
      ),
    );
  }
}
