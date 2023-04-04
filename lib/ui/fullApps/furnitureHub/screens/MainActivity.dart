// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';

import 'CartActivity.dart';
import 'HomeActivity.dart';
import 'ProfileActivity.dart';
import 'WishListActivity.dart';

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
  bool updateStatus = false;

  @override
  void initState() {
    super.initState();
    fragments = [
      HomeActivity(update: update),
      ProfileActivity(),
      CartActivity(),
      WishListActivity(),
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

  update(bool update) {
    if (update) {
      updateStatus = true;
    } else {
      updateStatus = false;
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
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
        return Future.value(true);
      },
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
                      height: MediaQuery.of(context).size.height / 10,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          color: ColorsRes.backgroundColor,
                        ),
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                updateTabSelection(0, "home");
                              },
                              iconSize: 27.0,
                              icon: SvgPicture.asset(
                                selectedIndex == 0
                                    ? "assets/images/fullApps/furnitureHub/home_active.svg"
                                    : "assets/images/fullApps/furnitureHub/home.svg",
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                updateTabSelection(1, "home");
                              },
                              iconSize: 27.0,
                              icon: SvgPicture.asset(
                                selectedIndex == 1
                                    ? "assets/images/fullApps/furnitureHub/profile_active.svg"
                                    : "assets/images/fullApps/furnitureHub/profile.svg",
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                updateTabSelection(2, "profile");
                              },
                              iconSize: 27.0,
                              icon: SvgPicture.asset(
                                selectedIndex == 2
                                    ? "assets/images/fullApps/furnitureHub/cart_active.svg"
                                    : "assets/images/fullApps/furnitureHub/cart.svg",
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                updateTabSelection(3, "wishlist");
                              },
                              iconSize: 27.0,
                              icon: SvgPicture.asset(
                                selectedIndex == 3
                                    ? "assets/images/fullApps/furnitureHub/wishlist_active.svg"
                                    : "assets/images/fullApps/furnitureHub/wishlist.svg",
                              ),
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
                bottomNavigationBar: updateStatus
                    ? Container(height: 0)
                    : BottomAppBar(
                        child: Container(
                          color: Colors.transparent,
                          height: MediaQuery.of(context).size.height / 10,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0)),
                              color: ColorsRes.backgroundColor,
                            ),
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    updateTabSelection(0, "home");
                                  },
                                  iconSize: 27.0,
                                  icon: SvgPicture.asset(
                                    selectedIndex == 0
                                        ? "assets/images/fullApps/furnitureHub/home_active.svg"
                                        : "assets/images/fullApps/furnitureHub/home.svg",
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    updateTabSelection(1, "home");
                                  },
                                  iconSize: 27.0,
                                  icon: SvgPicture.asset(
                                    selectedIndex == 1
                                        ? "assets/images/fullApps/furnitureHub/profile_active.svg"
                                        : "assets/images/fullApps/furnitureHub/profile.svg",
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    updateTabSelection(2, "profile");
                                  },
                                  iconSize: 27.0,
                                  icon: SvgPicture.asset(
                                    selectedIndex == 2
                                        ? "assets/images/fullApps/furnitureHub/cart_active.svg"
                                        : "assets/images/fullApps/furnitureHub/cart.svg",
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    updateTabSelection(3, "wishlist");
                                  },
                                  iconSize: 27.0,
                                  icon: SvgPicture.asset(
                                    selectedIndex == 3
                                        ? "assets/images/fullApps/furnitureHub/wishlist_active.svg"
                                        : "assets/images/fullApps/furnitureHub/wishlist.svg",
                                  ),
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
