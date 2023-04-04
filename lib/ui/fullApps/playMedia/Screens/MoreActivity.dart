import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/AccountActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/ContinueWatchingActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/DownloadPreferenceActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/HelpActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/LegalActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/MainActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/ParentalControlActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/SubscriptionManagementActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/MoreListTile.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/letters.dart';

class MoreActivity extends StatefulWidget {
  const MoreActivity({Key? key}) : super(key: key);

  @override
  _MoreActivityState createState() => _MoreActivityState();
}

class _MoreActivityState extends State<MoreActivity> {
  List moreList = [
    {
      'route': AccountActivity(),
      'title': StringsRes.accountText,
    },
    {
      'route': DownloadPreferenceActivity(),
      'title': StringsRes.downloadPreferencesText,
    },
    {
      'route': ContinueWatchingActivity(),
      'title': StringsRes.continueWatchingText,
    },
    {
      'route': SubscriptionManagementActivity(),
      'title': StringsRes.subscriptionManagementText,
    },
    {
      'route': ParentalControlActivity(),
      'title': StringsRes.parentalControlText,
    },
    {
      'route': LegalActivity(),
      'title': StringsRes.legalText,
    },
    {
      'route': HelpActivity(),
      'title': StringsRes.helpText,
    },
  ];
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  Widget showList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: moreList.length,
        itemBuilder: (BuildContext context, int index) {
          getletter(moreList[index]['title']);
          return Padding(
            padding: EdgeInsets.only(bottom: 0.0),
            child: MoreListTileUI(
              //iconTitle: strs,
              title: moreList[index]['title'],
              textcolor: ColorsRes.white,
              ontap: moreList[index]['route'],
            ),
          );
        });
  }

  Widget showYesButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context, rootNavigator: true).pop(true);
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: DesignConfig.boxDecorationButtonColor(
              ColorsRes.textColor.withOpacity(0.2),
              ColorsRes.textColor.withOpacity(0.2),
              50),
          child: Text(
            StringsRes.yesText,
            style: TextStyle(
              color: ColorsRes.white,
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget showNoButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context, rootNavigator: true).pop(true);
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: DesignConfig.boxDecorationButtonColor(
              ColorsRes.textColor.withOpacity(0.2),
              ColorsRes.textColor.withOpacity(0.2),
              50),
          child: Text(
            StringsRes.noText,
            style: TextStyle(
              color: ColorsRes.white,
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget showsDialog() {
    return AlertDialog(
      backgroundColor: ColorsRes.menuBackgroundColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
      title: Text(StringsRes.logOutText,
          textAlign: TextAlign.center,
          style: TextStyle(color: ColorsRes.white, fontSize: 20)),
      content: SizedBox(
        height: 120,
        width: 120,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                StringsRes.areYouSureWantToLogOutText,
                style: TextStyle(color: ColorsRes.white, fontSize: 18),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(flex: 1, child: showYesButton()),
                  Expanded(flex: 1, child: showNoButton()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.backgroundColor,
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: GestureDetector(
              child: Icon(Icons.arrow_back_ios, color: ColorsRes.white),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainActivity(),
                  ),
                );
              }),
          backgroundColor: ColorsRes.backgroundColor,
          shadowColor: Colors.transparent),
      body: Container(
        width: double.infinity,
        //height: double.infinity,
        color: ColorsRes.backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              showList(),
              ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return showsDialog();
                      });
                },
                title: Text(StringsRes.logoutText,
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
