import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/FavouriteActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/HomeActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/ProfileActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/SearchActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/StringsRes.dart';

import '../../../../app/routes.dart';

class MainActivity extends StatefulWidget {
  int? id;
  MainActivity({Key? key, this.id}) : super(key: key);

  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  int? selectedIndex = 0;
  String text = StringsRes.homeText;

  ChoiceChip? choiceChip;
  late List<Widget> fragments;

  @override
  void initState() {
    super.initState();
    fragments = [
      HomeActivity(),
      SearchActivity(),
      FavouriteActivity(),
      ProfileActivity(),
    ];
    widget.id != null ? selectedIndex = widget.id : selectedIndex = 0;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (selectedIndex != 0) {
          setState(() {
            selectedIndex = 0;
          });
          return Future.value(false);
        }
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.home, (route) => false);
        return Future.value(true);
      } as Future<bool> Function()?,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarIconBrightness:
              Platform.isIOS ? Brightness.light : Brightness.dark,
        ),
        child: Platform.isIOS
            ? SafeArea(
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  extendBody: true,
                  backgroundColor: Colors.transparent,
                  body: fragments[selectedIndex!],
                  bottomNavigationBar: BottomAppBar(
                    child: Container(
                      color: Colors.transparent,
                      height: 90,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorsRes.bottomColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                        ),
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    updateTabSelection(0, StringsRes.homeText);
                                  },
                                  iconSize: 27.0,
                                  icon: SvgPicture.asset(
                                      "assets/images/fullApps/worldTour/svg/active_home.svg",
                                      color: selectedIndex == 0
                                          ? ColorsRes.white
                                          : ColorsRes.iconColor),
                                ),
                                CircleAvatar(
                                    backgroundColor: selectedIndex == 0
                                        ? ColorsRes.lableColor
                                        : ColorsRes.bottomColor,
                                    radius: 2),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    updateTabSelection(
                                        1, StringsRes.searchText);
                                  },
                                  iconSize: 27.0,
                                  icon: SvgPicture.asset(
                                      "assets/images/fullApps/worldTour/svg/active_search.svg",
                                      color: selectedIndex == 1
                                          ? ColorsRes.white
                                          : ColorsRes.iconColor),
                                ),
                                CircleAvatar(
                                    backgroundColor: selectedIndex == 1
                                        ? ColorsRes.lableColor
                                        : ColorsRes.bottomColor,
                                    radius: 2),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    updateTabSelection(
                                        2, StringsRes.searchText);
                                  },
                                  iconSize: 27.0,
                                  icon: SvgPicture.asset(
                                      "assets/images/fullApps/worldTour/svg/active_heart.svg",
                                      color: selectedIndex == 2
                                          ? ColorsRes.white
                                          : ColorsRes.iconColor),
                                ),
                                CircleAvatar(
                                    backgroundColor: selectedIndex == 2
                                        ? ColorsRes.lableColor
                                        : ColorsRes.bottomColor,
                                    radius: 2),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    updateTabSelection(
                                        3, StringsRes.profileText);
                                  },
                                  iconSize: 27.0,
                                  icon: SvgPicture.asset(
                                      "assets/images/fullApps/worldTour/svg/active_account.svg",
                                      color: selectedIndex == 3
                                          ? ColorsRes.white
                                          : ColorsRes.iconColor),
                                ),
                                CircleAvatar(
                                    backgroundColor: selectedIndex == 3
                                        ? ColorsRes.lableColor
                                        : ColorsRes.bottomColor,
                                    radius: 2),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    color: Colors.transparent,
                  ),
                ),
              )
            : Scaffold(
                resizeToAvoidBottomInset: false,
                extendBody: true,
                backgroundColor: Colors.transparent,
                body: fragments[selectedIndex!],
                bottomNavigationBar: BottomAppBar(
                  child: Container(
                    color: Colors.transparent,
                    height: 90,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorsRes.bottomColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  updateTabSelection(0, StringsRes.homeText);
                                },
                                iconSize: 27.0,
                                icon: SvgPicture.asset(
                                    "assets/images/fullApps/worldTour/svg/active_home.svg",
                                    color: selectedIndex == 0
                                        ? ColorsRes.white
                                        : ColorsRes.iconColor),
                              ),
                              CircleAvatar(
                                  backgroundColor: selectedIndex == 0
                                      ? ColorsRes.lableColor
                                      : ColorsRes.bottomColor,
                                  radius: 2),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  updateTabSelection(1, StringsRes.searchText);
                                },
                                iconSize: 27.0,
                                icon: SvgPicture.asset(
                                    "assets/images/fullApps/worldTour/svg/active_search.svg",
                                    color: selectedIndex == 1
                                        ? ColorsRes.white
                                        : ColorsRes.iconColor),
                              ),
                              CircleAvatar(
                                  backgroundColor: selectedIndex == 1
                                      ? ColorsRes.lableColor
                                      : ColorsRes.bottomColor,
                                  radius: 2),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  updateTabSelection(2, StringsRes.searchText);
                                },
                                iconSize: 27.0,
                                icon: SvgPicture.asset(
                                    "assets/images/fullApps/worldTour/svg/active_heart.svg",
                                    color: selectedIndex == 2
                                        ? ColorsRes.white
                                        : ColorsRes.iconColor),
                              ),
                              CircleAvatar(
                                  backgroundColor: selectedIndex == 2
                                      ? ColorsRes.lableColor
                                      : ColorsRes.bottomColor,
                                  radius: 2),
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  updateTabSelection(3, StringsRes.profileText);
                                },
                                iconSize: 27.0,
                                icon: SvgPicture.asset(
                                    "assets/images/fullApps/worldTour/svg/active_account.svg",
                                    color: selectedIndex == 3
                                        ? ColorsRes.white
                                        : ColorsRes.iconColor),
                              ),
                              CircleAvatar(
                                  backgroundColor: selectedIndex == 3
                                      ? ColorsRes.lableColor
                                      : ColorsRes.bottomColor,
                                  radius: 2),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  color: Colors.transparent,
                ),
              ),
      ),
    );
  }
}
