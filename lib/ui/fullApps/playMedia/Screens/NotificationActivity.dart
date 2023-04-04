import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Model/Notification_Model.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/ProfileActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class NotificationActivity extends StatefulWidget {
  const NotificationActivity({Key? key}) : super(key: key);

  @override
  _NotificationActivityState createState() => _NotificationActivityState();
}

class _NotificationActivityState extends State<NotificationActivity> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return navigationPage() as Future<bool>;
      },
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          title: Text(StringsRes.notificationText,
              style: TextStyle(
                  fontSize: 20,
                  color: ColorsRes.white,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: GestureDetector(
              child: Icon(Icons.arrow_back_ios, color: ColorsRes.white),
              onTap: () {
                Navigator.pop(context);
              }),
          backgroundColor: ColorsRes.backgroundColor,
          shadowColor: Colors.transparent,
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                    "assets/images/fullApps/playMedia/svg/search-1.svg",
                    height: 30.0,
                    width: 30.0,
                    color: ColorsRes.textColor.withOpacity(0.7)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileActivity(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                    "assets/images/fullApps/playMedia/svg/acoount.svg",
                    height: 30.0,
                    width: 30.0,
                    color: ColorsRes.textColor.withOpacity(0.7)),
              ),
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorsRes.backgroundColor,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: notificationList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 0.0),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ExpansionTile(
                            trailing: Icon(Icons.arrow_drop_down,
                                color: ColorsRes.white),
                            title: Column(
                              children: [
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Text(
                                          notificationList[index].title!,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: ColorsRes.white,
                                              fontWeight: FontWeight.bold)),
                                    )),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30.0, top: 10.0),
                                      child: Text(
                                          notificationList[index].subtitle!,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: ColorsRes.textColor
                                                  .withOpacity(0.7),
                                              fontWeight: FontWeight.bold)),
                                    )),
                              ],
                            ),
                            children: [
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: notificationList[index]
                                      .notificationItemList!
                                      .length,
                                  itemBuilder: (BuildContext context, int i) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 0.0),
                                      child: Column(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30.0,
                                                            top: 20.0),
                                                    child: Row(
                                                      children: [
                                                        notificationList[index]
                                                                    .notificationItemList![
                                                                        i]
                                                                    .status ==
                                                                "1"
                                                            ? CircleAvatar(
                                                                radius: 5,
                                                                backgroundColor:
                                                                    Colors.red,
                                                                child:
                                                                    ClipOval())
                                                            : CircleAvatar(
                                                                radius: 5,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                child:
                                                                    ClipOval()),
                                                        SizedBox(width: 10.0),
                                                        Expanded(
                                                            child: Text(
                                                          notificationList[
                                                                  index]
                                                              .notificationItemList![
                                                                  i]
                                                              .title!,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: ColorsRes
                                                                  .white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )),
                                                      ],
                                                    ),
                                                  )),
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 50.0,
                                                            top: 10.0),
                                                    child: Text(
                                                        notificationList[index]
                                                            .notificationItemList![
                                                                i]
                                                            .time!,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color: ColorsRes
                                                                .textColor
                                                                .withOpacity(
                                                                    0.7),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal)),
                                                  )),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 50.0, top: 10.0),
                                            child: Divider(
                                              color: ColorsRes.textColor
                                                  .withOpacity(0.7),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
