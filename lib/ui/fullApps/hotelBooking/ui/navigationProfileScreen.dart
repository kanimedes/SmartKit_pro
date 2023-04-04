import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/imageAsset.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/profileMenuItem.dart';

List<FocusNode> focusNodes = [
  FocusNode(),
  FocusNode(),
  FocusNode(),
  FocusNode(),
  FocusNode(),
  FocusNode(),
  FocusNode(),
];

var selectedValue = "Male";

class NavigationProfileScreen extends StatefulWidget {
  const NavigationProfileScreen({Key? key}) : super(key: key);

  @override
  State<NavigationProfileScreen> createState() =>
      _NavigationProfileScreenState();
}

class _NavigationProfileScreenState extends State<NavigationProfileScreen> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: "Male",
          child: Text(
            "Male",
            style: appTextTheme(context).labelSmall,
          )),
      DropdownMenuItem(
          value: "Female",
          child: Text(
            "Female",
            style: appTextTheme(context).labelSmall,
          )),
    ];
    return menuItems;
  }

  void onFocusChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                top: 20, bottom: 90, start: 20, end: 20),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColors.primaryLightColor,
                      child: imageAsset(
                        isNormalImage: true,
                        fileName: 'avatar.png',
                        imgHeight: 70,
                        imgWidth: 70,
                      ),
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      end: 0,
                      child: CircleAvatar(
                        radius: 15,
                        child: imageAsset(
                          isNormalImage: false,
                          fileName: 'ic_edit.svg',
                          imgHeight: 15,
                          imgWidth: 15,
                        ),
                      ),
                    )
                  ],
                ),
                getSizedBox(height: 25),
                profileMenuItem(context, 'Edit Profile', AppColors.textColor,
                    AppColors.textColor, Icons.person_outline, () {
                  Navigator.pushNamed(context, profileEditScreen);
                }),
                getSizedBox(height: 25),
                profileMenuItem(
                    context,
                    'Payment',
                    AppColors.textColor,
                    AppColors.textColor,
                    Icons.account_balance_wallet_outlined, () {
                  Navigator.pushNamed(context, profilePaymentScreen);
                }),
                getSizedBox(height: 25),
                profileMenuItem(
                    context,
                    'Notification Settings',
                    AppColors.textColor,
                    AppColors.textColor,
                    Icons.notification_important_outlined, () {
                  Navigator.pushNamed(
                      context, profileNotificationSettingsScreen);
                }),
                getSizedBox(height: 25),
                profileMenuItem(context, 'Notifications', AppColors.textColor,
                    AppColors.textColor, Icons.notifications_none, () {
                  Navigator.pushNamed(context, profileNotificationsListScreen);
                }),
                getSizedBox(height: 25),
                profileMenuItem(context, 'Security', AppColors.textColor,
                    AppColors.textColor, Icons.shield_outlined, () {
                  Navigator.pushNamed(context, profileSecurityScreen);
                }),
                getSizedBox(height: 25),
                profileMenuItem(
                  context,
                  'Logout',
                  AppColors.red,
                  AppColors.red,
                  Icons.logout_outlined,
                  () {
                    Navigator.pushReplacementNamed(context, signInScreen);
                  },
                ),
              ],
            ),
          )),
    );
  }
}
