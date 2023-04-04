import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/NotificationData.dart';

import 'NotificationDetail.dart';

late NotificationData selectednotification;
int? selectedorderindex;
StreamController<String>? notificationstreamdata;

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  GlobalKey<ScaffoldState>? scaffoldKey;
  bool isloading = true;

  int offset = 0;
  int limit = 10;
  bool isloadmore = true;
  bool ispageLoading = false;

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
    setupChannel();
  }

  void setupChannel() {
    notificationstreamdata = StreamController<String>();
    notificationstreamdata!.stream.listen((response) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (notificationstreamdata != null && !notificationstreamdata!.isClosed) {
      notificationstreamdata!.sink.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: DesignConfig.setAppbar(StringsRes.notifications, context),
        body: Column(children: [
          Expanded(child: notificationWidget()),
          Container(
            height: ispageLoading ? 50.0 : 0,
            color: Colors.transparent,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ]));
  }

  Widget notificationWidget() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        separatorBuilder: (context, index) => SizedBox(height: 5),
        itemCount: notificationlist.length,
        itemBuilder: (context, index) {
          NotificationData notificationData = notificationlist[index];

          return ButtonClickAnimation(
            onTap: () {
              selectednotification = notificationData;
              selectedorderindex = index;
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => NotificationDetailActivity()));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
              decoration: DesignConfig.boxDecorationContainerShadow(
                  ColorsRes.containerShadowColor, 14, 14, 14, 14),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: ColorsRes.orangeColor,
                      child: Text(
                        notificationData.data!.title!.contains(" ")
                            ? "${notificationData.data!.title!.split(' ')[0].substring(0, 1).toUpperCase()}${notificationData.data!.title!.split(' ')[1].substring(0, 1).toUpperCase()}"
                            : notificationData.data!.title!
                                .substring(0, 2)
                                .toUpperCase(),
                        style: TextStyle(
                            color: ColorsRes.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              notificationData.data!.title!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ColorsRes.black,
                                  fontWeight: FontWeight.normal),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(notificationData.data!.body!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: ColorsRes.black, fontSize: 14)),
                            Text(
                              Constant.getFormatparse(
                                  notificationData.updatedAt!),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: ColorsRes.grayColor.withOpacity(0.7)),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
