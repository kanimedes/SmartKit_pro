import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/FeedbackPage.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/Home/HomePage.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/LiveVideos/LiveVideoList.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/Settings/SettingPage.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/RollingNavBar/circular_bottom_navigation.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/RollingNavBar/tab_item.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/VideoView/overlay_handler.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/model/Article.dart';

import 'Profile/ProfilePage.dart';

late Article selectednews;

class MainActivity extends StatefulWidget {
  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    new TabItem(null, StringsRes.home, ColorsRes.appcolor, "home.svg",
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    new TabItem(null, StringsRes.settings, ColorsRes.appcolor, "setting.svg",
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    new TabItem(null, StringsRes.live, ColorsRes.appcolor, "live.svg",
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    new TabItem(null, StringsRes.profile, ColorsRes.appcolor, "profile.svg",
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
    new TabItem(
        null, StringsRes.feedback, ColorsRes.appcolor, "bt_feedback.svg",
        labelStyle: TextStyle(fontWeight: FontWeight.bold)),
  ]);

  CircularBottomNavigationController? _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<OverlayHandlerProvider>(context, listen: false)
            .overlayActive) {
          Provider.of<OverlayHandlerProvider>(context, listen: false)
              .enablePip(1.77);

          Provider.of<OverlayHandlerProvider>(context, listen: false)
              .removeOverlay(context);
          Navigator.of(context).pop();

          return false;
        }

        return true;
      },
      child: Scaffold(
        body: /* Stack(
          children: <Widget>[
            Padding(
              child:*/
            bodyContainer(),
        /* padding: EdgeInsets.only(bottom: bottomNavBarHeight),
            ),
            Align(
                alignment: Alignment.bottomCenter, child: bottomNav())
          ],
        ),*/
        bottomNavigationBar: bottomNav(),
      ),
    );
  }

  Widget bodyContainer() {
    if (selectedPos == 0) {
      return new HomePage();
    } else if (selectedPos == 1) {
      return new SettingPage();
    } else if (selectedPos == 2) {
      return new LiveVideoList();
    } else if (selectedPos == 3) {
      return new ProfilePage();
    } else if (selectedPos == 4) {
      return new FeedbackPage();
    } else {
      return Container();
    }
  }

  Widget bottomNav() {
    return /*Container(
      height: MediaQuery.of(context).size.height*.1,
      child:*/
        SnakeNavigationBar.color(
      behaviour: SnakeBarBehaviour.pinned,
      backgroundColor: ColorsRes.appcolor,
      snakeShape: SnakeShape.rectangle,
      snakeViewColor: Colors.black,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      selectedLabelStyle: TextStyle(color: Colors.white),
      currentIndex: selectedPos,
      height: MediaQuery.of(context).size.height * .07,
      onTap: (index) => setState(() => selectedPos = index),
      items: [
        BottomNavigationBarItem(
            icon:
                SvgPicture.asset("assets/images/fullApps/newsapp/svg/home.svg"),
            label: StringsRes.home),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
                "assets/images/fullApps/newsapp/svg/setting.svg"),
            label: StringsRes.settings),
        BottomNavigationBarItem(
            icon:
                SvgPicture.asset("assets/images/fullApps/newsapp/svg/live.svg"),
            label: StringsRes.live),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
                "assets/images/fullApps/newsapp/svg/bt_feedback.svg"),
            label: StringsRes.profile),
      ],
    );
  }
  /*FlipBoxBarPlus(
        selectedIndex: selectedPos,
        navBarHeight: 50,
        items: [
          FlipBarItem(
              icon:SvgPicture.asset("assets/images/fullApps/newsapp/svg/home.svg"),
              text: Text(StringsRes.home),
              frontColor: Colors.blue,
              backColor: Colors.blueAccent),
          FlipBarItem(
              icon: SvgPicture.asset("assets/images/fullApps/newsapp/svg/setting.svg"),
              text: Text(StringsRes.settings),
              frontColor: Colors.cyan,
              backColor: Colors.cyanAccent),
          FlipBarItem(
              icon: SvgPicture.asset("assets/images/fullApps/newsapp/svg/live.svg"),
              text: Text(StringsRes.live),
              frontColor: Colors.orange,
              backColor: Colors.orangeAccent),
          FlipBarItem(
              icon: SvgPicture.asset("assets/images/fullApps/newsapp/svg/bt_feedback.svg"),
              text: Text(StringsRes.profile),
              frontColor: Colors.purple,
              backColor: Colors.purpleAccent),
        ],
        onIndexChanged: (newIndex) {
          setState(() {
            selectedPos = newIndex;
          });
        },
      ),*/
  /*   return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      iconsSize: MediaQuery.of(context).size.width / 16,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
        this.selectedPos = selectedPos!;
          //print(_navigationController.value);
        });
      },
    );*/

  @override
  void dispose() {
    super.dispose();
    _navigationController!.dispose();
  }
}
