import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/DownloadsActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/HomeActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/MoreActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/SearchActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/WatchListActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class MainActivity extends StatefulWidget {
  int? id;
  MainActivity({Key? key, this.id}) : super(key: key);

  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  int selectedIndex = 0;
  String text = StringsRes.homeText;

  ChoiceChip? choiceChip;
  late List<Widget> fragments;

  @override
  void initState() {
    super.initState();
    fragments = [
      HomeActivity(),
      WatchListActivity(),
      SearchActivity(),
      DownloadsActivity(),
      MoreActivity(),
    ];
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
        return Future.value(true);
      } as Future<bool> Function()?,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          toolbarHeight: 0,
          backgroundColor: ColorsRes.backgroundColor,
        ),
        backgroundColor: Colors.transparent,
        body: fragments[selectedIndex],
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: ColorsRes.backgroundColor,
            height: 90,
            child: Container(
              decoration: BoxDecoration(
                color: ColorsRes.menuBackgroundColor,
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
                          selectedIndex == 0
                              ? "assets/images/fullApps/playMedia/svg/home.svg"
                              : "assets/images/fullApps/playMedia/svg/home01.svg",
                        ),
                      ),
                      Text(
                        StringsRes.homeText,
                        style: TextStyle(
                            fontSize: 12,
                            color: selectedIndex == 0
                                ? ColorsRes.yellowColor
                                : ColorsRes.white,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          updateTabSelection(1, StringsRes.watchlistText);
                        },
                        iconSize: 27.0,
                        icon: SvgPicture.asset(
                          selectedIndex == 1
                              ? "assets/images/fullApps/playMedia/svg/watchlist.svg"
                              : "assets/images/fullApps/playMedia/svg/watchlist01.svg",
                        ),
                      ),
                      Text(
                        StringsRes.watchlistText,
                        style: TextStyle(
                            fontSize: 12,
                            color: selectedIndex == 1
                                ? ColorsRes.yellowColor
                                : ColorsRes.white,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
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
                          selectedIndex == 2
                              ? "assets/images/fullApps/playMedia/svg/search.svg"
                              : "assets/images/fullApps/playMedia/svg/search02.svg",
                        ),
                      ),
                      Text(
                        StringsRes.searchText,
                        style: TextStyle(
                            fontSize: 12,
                            color: selectedIndex == 2
                                ? ColorsRes.yellowColor
                                : ColorsRes.white,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          updateTabSelection(3, StringsRes.downloadText);
                        },
                        iconSize: 27.0,
                        icon: SvgPicture.asset(
                          selectedIndex == 3
                              ? "assets/images/fullApps/playMedia/svg/download.svg"
                              : "assets/images/fullApps/playMedia/svg/download02.svg",
                        ),
                      ),
                      Text(
                        StringsRes.downloadText,
                        style: TextStyle(
                            fontSize: 12,
                            color: selectedIndex == 3
                                ? ColorsRes.yellowColor
                                : ColorsRes.white,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          updateTabSelection(4, StringsRes.moreText);
                        },
                        iconSize: 27.0,
                        icon: SvgPicture.asset(
                          selectedIndex == 4
                              ? "assets/images/fullApps/playMedia/svg/more.svg"
                              : "assets/images/fullApps/playMedia/svg/more02.svg",
                        ),
                      ),
                      Text(
                        StringsRes.moreText,
                        style: TextStyle(
                            fontSize: 12,
                            color: selectedIndex == 4
                                ? ColorsRes.yellowColor
                                : ColorsRes.white,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
