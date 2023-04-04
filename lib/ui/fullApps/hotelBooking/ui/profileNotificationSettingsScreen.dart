import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appBar.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appSwitch.dart';

class ProfileNotificationSettingsScreen extends StatefulWidget {
  const ProfileNotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileNotificationSettingsScreen> createState() =>
      _ProfileNotificationSettingsScreenState();
}

class _ProfileNotificationSettingsScreenState
    extends State<ProfileNotificationSettingsScreen> {
  List<bool> isSwitched = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  void toggleSwitch(int index) {
    if (isSwitched[index] == false) {
      setState(() {
        isSwitched[index] = true;
      });
    } else {
      setState(() {
        isSwitched[index] = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Notification Settings'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 30, end: 30, top: 20, bottom: 20),
          child: Column(
            children: [
              appSwitch(context, 'General Notification', isSwitched[0],
                  (value) {
                toggleSwitch(0);
              }, () {
                toggleSwitch(0);
              }),
              getSizedBox(height: 20),
              appSwitch(context, 'Sound', isSwitched[1], (value) {
                toggleSwitch(1);
              }, () {
                toggleSwitch(1);
              }),
              getSizedBox(height: 20),
              appSwitch(context, 'Vibrate', isSwitched[2], (value) {
                toggleSwitch(2);
              }, () {
                toggleSwitch(2);
              }),
              getSizedBox(height: 20),
              appSwitch(context, 'App Updates', isSwitched[3], (value) {
                toggleSwitch(3);
              }, () {
                toggleSwitch(3);
              }),
              getSizedBox(height: 20),
              appSwitch(context, 'New Service Available', isSwitched[4], (value) {
                toggleSwitch(4);
              }, () {
                toggleSwitch(4);
              }),
              getSizedBox(height: 20),
              appSwitch(context, 'New Tips Available', isSwitched[5], (value) {
                toggleSwitch(5);
              }, () {
                toggleSwitch(5);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
