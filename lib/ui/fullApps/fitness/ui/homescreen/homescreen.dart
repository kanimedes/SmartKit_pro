import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/ui/homescreen/discovepage.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/ui/homescreen/homepage.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/ui/homescreen/insight.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/ui/homescreen/profile.dart';

class FitnessHomepage extends StatefulWidget {
  const FitnessHomepage({Key? key}) : super(key: key);

  @override
  State<FitnessHomepage> createState() => FitnessHomepageState();
}

class FitnessHomepageState extends State<FitnessHomepage> {
  final _scaffolkey = GlobalKey<ScaffoldState>();

  int currentindex = 0;

  List screen = [
    FitnessHomePage(),
    DiscoverPage(),
    Insightscreen(),
    Profilescreen(),
  ];

  Widget _buildbottombar() {
    return BottomAppBar(
      child: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height / 10,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            color: Theme.of(context).backgroundColor,
          ),
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    setState(() {
                      currentindex = 0;
                    });
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.home,
                    color: currentindex == 0
                        ? Theme.of(context).primaryColor
                        : Colors.grey.withOpacity(0.5),
                  )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      currentindex = 1;
                    });
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.discord,
                    color: currentindex == 1
                        ? Theme.of(context).primaryColor
                        : Colors.grey.withOpacity(0.5),
                  )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      currentindex = 2;
                    });
                    //updateTabSelection(2, "profile");
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.insights,
                    color: currentindex == 2
                        ? Theme.of(context).primaryColor
                        : Colors.grey.withOpacity(0.5),
                  )),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentindex = 3;
                  });
                  // updateTabSelection(3, "wishlist");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.person,
                  color: currentindex == 3
                      ? Theme.of(context).primaryColor
                      : Colors.grey.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
      color: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolkey,
      bottomNavigationBar: _buildbottombar(),
      body: screen[currentindex],
    );
  }
}
