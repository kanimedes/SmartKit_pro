import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appBar.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appSwitch.dart';

class ProfileSecurityScreen extends StatefulWidget {
  const ProfileSecurityScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSecurityScreen> createState() => _ProfileSecurityScreenState();
}

class _ProfileSecurityScreenState extends State<ProfileSecurityScreen> {
  List<bool> isSwitched = [
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
      appBar: appBar(context, 'Security'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: 30, end: 30, top: 20, bottom: 20),
          child: Column(
            children: [
              appSwitch(context, 'Touch ID', isSwitched[0], (value) {
                toggleSwitch(0);
              }, () {
                toggleSwitch(0);
              }),
              getSizedBox(height: 20),
              appSwitch(context, 'Face ID', isSwitched[1], (value) {
                toggleSwitch(1);
              }, () {
                toggleSwitch(1);
              }),
              getSizedBox(height: 20),
              appSwitch(context, 'PIN PASSWORD', isSwitched[2], (value) {
                toggleSwitch(2);
              }, () {
                toggleSwitch(2);
              }),
              getSizedBox(height: 20),
              appSwitch(context, '2 Factor Verification', isSwitched[3],
                  (value) {
                toggleSwitch(3);
              }, () {
                toggleSwitch(3);
              }),
              getSizedBox(height: 20),
              AppButton(
                btnText: 'Change Password',
                textColor: AppColors.primaryColor,
                backgroundColor: AppColors.primaryLightColor,
                textSize: 15,
                voidCallBack: (){Navigator.pop(context);},
              )
            ],
          ),
        ),
      ),
    );
  }
}
