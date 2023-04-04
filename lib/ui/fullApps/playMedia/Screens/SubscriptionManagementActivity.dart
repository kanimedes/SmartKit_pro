import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class SubscriptionManagementActivity extends StatefulWidget {
  const SubscriptionManagementActivity({Key? key}) : super(key: key);

  @override
  _SubscriptionManagementActivityState createState() =>
      _SubscriptionManagementActivityState();
}

class _SubscriptionManagementActivityState
    extends State<SubscriptionManagementActivity> {
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
          title: Text(StringsRes.subscriptionManagementText,
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
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(StringsRes.purchaseHistoryText,
                        style: TextStyle(
                            fontSize: 18,
                            color: ColorsRes.white,
                            fontWeight: FontWeight.normal)),
                  )),
              ListTile(
                title: Text(StringsRes.managementSubscriptionText,
                    style: TextStyle(
                        fontSize: 18,
                        color: ColorsRes.white,
                        fontWeight: FontWeight.normal)),
                trailing: Icon(Icons.arrow_forward_ios, color: ColorsRes.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
