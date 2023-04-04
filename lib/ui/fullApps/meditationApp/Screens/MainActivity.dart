import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/HomeActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/MeditationActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/MusicActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/ProfileActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/SleepActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/GlassBoxCurve.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/StringsRes.dart';

class MainActivity extends StatefulWidget {
  int? id;
  MainActivity({Key? key, this.id}) : super(key: key);

  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  int? selectedIndex = 0;
  String text = StringsRes.home;

  ChoiceChip? choiceChip;
  late List<Widget> fragments;
  bool updateStatus = false;

  @override
  void initState() {
    super.initState();
    fragments = [
      HomeActivity(
        update: update,
      ),
      SleepActivity(),
      MeditationActivity(),
      MusicActivity(),
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

  update(bool update) {
    if (update) {
      updateStatus = true;
    } else {
      updateStatus = false;
    }
    setState(() {});
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
                  bottomNavigationBar: SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                    child: GlassBoxCurve(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22, right: 22.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                updateTabSelection(0, StringsRes.home);
                              },
                              child: Column(
                                children: [
                                  Container(
                                      width: 21,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: selectedIndex == 0
                                              ? ColorsRes.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(4.0),
                                              bottomRight:
                                                  Radius.circular(4.0)))),
                                  SizedBox(
                                      height: selectedIndex == 0 ? 15.0 : 20.0),
                                  selectedIndex == 0
                                      ? SvgPicture.asset(
                                          "assets/images/fullApps/meditationApp/home-icon.svg",
                                        )
                                      : SvgPicture.asset(
                                          "assets/images/fullApps/meditationApp/disable.home.svg",
                                        ),
                                  selectedIndex == 0
                                      ? Text(
                                          StringsRes.home,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: ColorsRes.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                updateTabSelection(1, StringsRes.sleep);
                              },
                              child: Column(
                                children: [
                                  Container(
                                      width: 21,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: selectedIndex == 1
                                              ? ColorsRes.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(4.0),
                                              bottomRight:
                                                  Radius.circular(4.0)))),
                                  SizedBox(
                                      height: selectedIndex == 1 ? 15.0 : 20.0),
                                  selectedIndex == 1
                                      ? SvgPicture.asset(
                                          "assets/images/fullApps/meditationApp/sleep-icon.svg",
                                        )
                                      : SvgPicture.asset(
                                          "assets/images/fullApps/meditationApp/disable.sleep.svg",
                                        ),
                                  selectedIndex == 1
                                      ? Text(
                                          StringsRes.sleep,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: ColorsRes.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                updateTabSelection(2, StringsRes.meditations);
                              },
                              child: Column(
                                children: [
                                  Container(
                                      width: 21,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: selectedIndex == 2
                                              ? ColorsRes.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(4.0),
                                              bottomRight:
                                                  Radius.circular(4.0)))),
                                  SizedBox(
                                      height: selectedIndex == 2 ? 15.0 : 20.0),
                                  selectedIndex == 2
                                      ? SvgPicture.asset(
                                          "assets/images/fullApps/meditationApp/meditation-icon.svg",
                                        )
                                      : SvgPicture.asset(
                                          "assets/images/fullApps/meditationApp/disable.meditate.svg",
                                        ),
                                  selectedIndex == 2
                                      ? Text(
                                          StringsRes.meditations,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: ColorsRes.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                updateTabSelection(3, StringsRes.music);
                              },
                              child: Column(
                                children: [
                                  Container(
                                      width: 21,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: selectedIndex == 3
                                              ? ColorsRes.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(4.0),
                                              bottomRight:
                                                  Radius.circular(4.0)))),
                                  SizedBox(
                                      height: selectedIndex == 3 ? 15.0 : 20.0),
                                  selectedIndex == 3
                                      ? SvgPicture.asset(
                                          "assets/images/fullApps/meditationApp/music icon.svg",
                                        )
                                      : SvgPicture.asset(
                                          "assets/images/fullApps/meditationApp/disable.music.svg",
                                        ),
                                  selectedIndex == 3
                                      ? Text(
                                          StringsRes.music,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: ColorsRes.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                updateTabSelection(4, StringsRes.profile);
                              },
                              child: Column(
                                children: [
                                  Container(
                                      width: 21,
                                      height: 5,
                                      decoration: BoxDecoration(
                                          color: selectedIndex == 4
                                              ? ColorsRes.white
                                              : Colors.transparent,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(4.0),
                                              bottomRight:
                                                  Radius.circular(4.0)))),
                                  SizedBox(
                                      height: selectedIndex == 4 ? 15.0 : 20.0),
                                  selectedIndex == 4
                                      ? SvgPicture.asset(
                                          "assets/images/fullApps/meditationApp/profile-icon.svg",
                                        )
                                      : SvgPicture.asset(
                                          "assets/images/fullApps/meditationApp/disable.profile.svg",
                                        ),
                                  selectedIndex == 4
                                      ? Text(
                                          StringsRes.profile,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: ColorsRes.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Scaffold(
                resizeToAvoidBottomInset: false,
                extendBody: true,
                backgroundColor: Colors.transparent,
                body: fragments[selectedIndex!],
                bottomNavigationBar: /*ClipPath(
                clipper: CustomClipperImage(),
                child: Container(height:100,
                  width: 300,
                  color:Colors.red,)
            )*/
                    updateStatus
                        ? Container()
                        : SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                            child: GlassBoxCurve(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 22, right: 22.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        updateTabSelection(0, StringsRes.home);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 21,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == 0
                                                      ? ColorsRes.white
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  4.0)))),
                                          SizedBox(
                                              height: selectedIndex == 0
                                                  ? 15.0
                                                  : 20.0),
                                          selectedIndex == 0
                                              ? SvgPicture.asset(
                                                  "assets/images/fullApps/meditationApp/home-icon.svg",
                                                )
                                              : SvgPicture.asset(
                                                  "assets/images/fullApps/meditationApp/disable.home.svg",
                                                ),
                                          selectedIndex == 0
                                              ? Text(
                                                  StringsRes.home,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: ColorsRes.white,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: "Lato",
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        updateTabSelection(1, StringsRes.sleep);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 21,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == 1
                                                      ? ColorsRes.white
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  4.0)))),
                                          SizedBox(
                                              height: selectedIndex == 1
                                                  ? 15.0
                                                  : 20.0),
                                          selectedIndex == 1
                                              ? SvgPicture.asset(
                                                  "assets/images/fullApps/meditationApp/sleep-icon.svg",
                                                )
                                              : SvgPicture.asset(
                                                  "assets/images/fullApps/meditationApp/disable.sleep.svg",
                                                ),
                                          selectedIndex == 1
                                              ? Text(
                                                  StringsRes.sleep,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: ColorsRes.white,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: "Lato",
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        updateTabSelection(
                                            2, StringsRes.meditations);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 21,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == 2
                                                      ? ColorsRes.white
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  4.0)))),
                                          SizedBox(
                                              height: selectedIndex == 2
                                                  ? 15.0
                                                  : 20.0),
                                          selectedIndex == 2
                                              ? SvgPicture.asset(
                                                  "assets/images/fullApps/meditationApp/meditation-icon.svg",
                                                )
                                              : SvgPicture.asset(
                                                  "assets/images/fullApps/meditationApp/disable.meditate.svg",
                                                ),
                                          selectedIndex == 2
                                              ? Text(
                                                  StringsRes.meditations,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: ColorsRes.white,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: "Lato",
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        updateTabSelection(3, StringsRes.music);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 21,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == 3
                                                      ? ColorsRes.white
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  4.0)))),
                                          SizedBox(
                                              height: selectedIndex == 3
                                                  ? 15.0
                                                  : 20.0),
                                          selectedIndex == 3
                                              ? SvgPicture.asset(
                                                  "assets/images/fullApps/meditationApp/music icon.svg",
                                                )
                                              : SvgPicture.asset(
                                                  "assets/images/fullApps/meditationApp/disable.music.svg",
                                                ),
                                          selectedIndex == 3
                                              ? Text(
                                                  StringsRes.music,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: ColorsRes.white,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: "Lato",
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        updateTabSelection(
                                            4, StringsRes.profile);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 21,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == 4
                                                      ? ColorsRes.white
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  4.0)))),
                                          SizedBox(
                                              height: selectedIndex == 4
                                                  ? 15.0
                                                  : 20.0),
                                          selectedIndex == 4
                                              ? SvgPicture.asset(
                                                  "assets/images/fullApps/meditationApp/profile-icon.svg",
                                                )
                                              : SvgPicture.asset(
                                                  "assets/images/fullApps/meditationApp/disable.profile.svg",
                                                ),
                                          selectedIndex == 4
                                              ? Text(
                                                  StringsRes.profile,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: ColorsRes.white,
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: "Lato",
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
              ),
      ),
    );
  }
}
