import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/string.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/collection.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/explore.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/home.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/profile.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final pages = [HomeScreen(), Explore(), Collection(), Profile()];

  int currentIndex = 0;

  getBottomNavigationBarIcon(Widget icons, String name) {
    return BottomNavigationBarItem(icon: icons, label: name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          getBottomNavigationBarIcon(Icon(Icons.home_outlined), home),
          getBottomNavigationBarIcon(Icon(Icons.search_sharp), explore),
          getBottomNavigationBarIcon(Icon(Icons.favorite_border), collection),
          getBottomNavigationBarIcon(Icon(Icons.person_outlined), profile)
        ],
        currentIndex: currentIndex,
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(fontSize: 12),
        selectedLabelStyle:
            TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
