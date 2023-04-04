import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/ContactUsActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/FaqActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/MoreListTile.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/letters.dart';

class HelpActivity extends StatefulWidget {
  const HelpActivity({Key? key}) : super(key: key);

  @override
  _HelpActivityState createState() => _HelpActivityState();
}

class _HelpActivityState extends State<HelpActivity> {
  List helpList = [
    {
      'route': FaqActivity(),
      'title': StringsRes.faqText,
    },
    {
      'route': ContactUsActivity(),
      'title': StringsRes.contactUsText,
    },
  ];
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
          title: Text(StringsRes.helpText,
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
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorsRes.backgroundColor,
          child: ListView.builder(
              itemCount: helpList.length,
              itemBuilder: (BuildContext context, int index) {
                getletter(helpList[index]['title']);
                return Padding(
                  padding: EdgeInsets.only(bottom: 0.0),
                  child: MoreListTileUI(
                    //iconTitle: strs,
                    title: helpList[index]['title'],
                    textcolor: ColorsRes.white,
                    ontap: helpList[index]['route'],
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
