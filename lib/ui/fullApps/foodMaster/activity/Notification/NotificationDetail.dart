import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/Notification/NotificationList.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';

class NotificationDetailActivity extends StatefulWidget {
  const NotificationDetailActivity({Key? key}) : super(key: key);

  @override
  NotificationDetailState createState() => NotificationDetailState();
}

class NotificationDetailState extends State<NotificationDetailActivity> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.backgroundColor,
      appBar: DesignConfig.setAppbar(StringsRes.notifications, context),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                selectednotification.data!.title!,
                style: TextStyle(
                    fontSize: 18,
                    color: ColorsRes.orangeColor,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  Constant.getFormatparse(selectednotification.updatedAt!),
                  style: TextStyle(
                      fontSize: 14,
                      color: ColorsRes.grayColor,
                      fontWeight: FontWeight.normal)),
            ),
            Divider(
              color: ColorsRes.grayColor,
              indent: 8,
              endIndent: 8,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    selectednotification.data!.body!,
                    style: TextStyle(
                      color: ColorsRes.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
