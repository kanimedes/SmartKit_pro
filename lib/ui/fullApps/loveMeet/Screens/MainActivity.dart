import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/DiscoverActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/FavoriteActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/HomeActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/MessageActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/ProfileActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/ColorsRes.dart';

class MainActivity extends StatefulWidget {
  int? id;
  MainActivity({Key? key, this.id}) : super(key: key);

  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  bool clickedCentreFAB = false;
  int? selectedIndex = 0;
  String text = "Home";

  ChoiceChip? choiceChip;
  late List<Widget> fragments;

  @override
  void initState() {
    fragments = [
      HomeActivity(),
      FavoriteActivity(),
      MessageActivity(),
      ProfileActivity(),
    ];
    widget.id != null ? selectedIndex = widget.id : selectedIndex = 0;
    super.initState();
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
      },
      child: Scaffold(
        body: fragments[selectedIndex!],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              //showFilter();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DiscoverActivity()));
            });
          },
          tooltip: "Fab",
          child: Container(
            width: 60,
            height: 60,
            child: Icon(Icons.add),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: const [
                  ColorsRes.gradientOne,
                  ColorsRes.gradientTwo
                ])),
          ),
          elevation: 4.0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: EdgeInsets.only(bottom: 12.0),
            margin: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    updateTabSelection(0, "Home");
                  },
                  iconSize: 27.0,
                  icon: SvgPicture.asset(
                    selectedIndex == 0
                        ? "assets/images/fullApps/loveMeet/home_active.svg"
                        : "assets/images/fullApps/loveMeet/home_deactive.svg",
                  ),
                ),
                IconButton(
                  onPressed: () {
                    updateTabSelection(1, "Favorite");
                  },
                  iconSize: 27.0,
                  icon: SvgPicture.asset(
                    selectedIndex == 1
                        ? "assets/images/fullApps/loveMeet/fav_active.svg"
                        : "assets/images/fullApps/loveMeet/fav_deactive.svg",
                  ),
                ),
                SizedBox(
                  width: 50.0,
                ),
                IconButton(
                  onPressed: () {
                    updateTabSelection(2, "Chat");
                  },
                  iconSize: 27.0,
                  icon: SvgPicture.asset(
                    selectedIndex == 2
                        ? "assets/images/fullApps/loveMeet/chat_active.svg"
                        : "assets/images/fullApps/loveMeet/chat_deactive.svg",
                  ),
                ),
                IconButton(
                  onPressed: () {
                    updateTabSelection(3, "Profile");
                  },
                  iconSize: 27.0,
                  icon: SvgPicture.asset(
                    selectedIndex == 3
                        ? "assets/images/fullApps/loveMeet/profile_active.svg"
                        : "assets/images/fullApps/loveMeet/profile_deactive.svg",
                  ),
                ),
              ],
            ),
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
