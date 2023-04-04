import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/snippets/helper/snippetsColors.dart';

class BottomNavsScreen extends StatefulWidget {
  const BottomNavsScreen({
    Key? key,
  }) : super(key: key);
  @override
  _BottomNavsScreenState createState() => _BottomNavsScreenState();
}

class _BottomNavsScreenState extends State<BottomNavsScreen>
    with TickerProviderStateMixin {
  int currentIndex1 = 0,
      currentIndex2 = 0,
      currentIndex3 = 0,
      currentIndex4 = 0,
      currentIndex5 = 0,
      currentIndex6 = 0,
      currentIndex7 = 0;
  TabController? tabController;
  TabController? tabController1;

  List<Tab> myTabs = [
    Tab(
      icon: Icon(Icons.home_outlined),
      text: "Home",
    ),
    Tab(
      icon: Icon(Icons.search),
      text: "Search",
    ),
    Tab(
      icon: Icon(Icons.favorite_border),
      text: "like",
    ),
    Tab(
      icon: Icon(Icons.notification_important_outlined),
      text: "Notification",
    ),
    Tab(
      icon: Icon(Icons.settings),
      text: "Settings",
    ),
  ];

  @override
  void initState() {
    tabController = TabController(
        length: myTabs.length, vsync: this, initialIndex: currentIndex5);
    tabController1 = TabController(
        length: myTabs.length, vsync: this, initialIndex: currentIndex6);
    super.initState();
  }

  floatingMethod({required IconData icon, required int index, dynamic sizes}) {
    return Padding(
        padding: EdgeInsets.only(
            bottom: 0.0,
            left: index == 0
                ? 0
                : index == 1
                    ? sizes.width * .17
                    : index == 2
                        ? sizes.width * .36
                        : index == 3
                            ? sizes.width * .53
                            : sizes.width * .75),
        child: Container(
          height: sizes.height * .055,
          width: sizes.width * .2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.bgColor,
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
          margin:
              EdgeInsets.only(left: size.width * .04, right: size.width * .04),
          child: ListView(
            children: [
              SizedBox(
                height: size.height * .05,
              ),
              tabBar1(size),
              SizedBox(
                height: size.height * .03,
              ),
              tabBar2(size),
              SizedBox(
                height: size.height * .03,
              ),
              tabBar3(size),
              SizedBox(
                height: size.height * .03,
              ),
              tabBar4(size),
              SizedBox(
                height: size.height * .03,
              ),
              tabBar5(size),
              SizedBox(
                height: size.height * .03,
              ),
              tabBar6(size),
              SizedBox(
                height: size.height * .03,
              ),
              tabBar7(size)
            ],
          )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget tabBar1(dynamic size) {
    return design(
      size: size,
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: ColorRes.labelColor,
        elevation: 0.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_important_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex1,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (int index) {
          if (mounted) {
            setState(() {
              currentIndex1 = index;
            });
          }
        },
      ),
    );
  }

  Widget tabBar2(dynamic size) {
    return design(
      size: size,
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Color(0xffcacccf),
        elevation: 0.0,
        //backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Container(
                height: size.height * .05,
                width: size.width * .1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
              ),
              label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
            activeIcon: Container(
              height: size.height * .05,
              width: size.width * .1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "",
            activeIcon: Container(
              height: size.height * .05,
              width: size.width * .1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_outlined),
            label: "",
            activeIcon: Container(
              height: size.height * .05,
              width: size.width * .1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Icon(
                Icons.notification_important_outlined,
                color: Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "",
            activeIcon: Container(
              height: size.height * .05,
              width: size.width * .1,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex2,

        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (int index) {
          if (mounted) {
            setState(() {
              currentIndex2 = index;
            });
          }
        },
      ),
    );
  }

  Widget tabBar3(dynamic size) {
    return design(
      size: size,
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Color(0xffcacccf),
        elevation: 0.0,

        //backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: "",
            activeIcon: Container(
              height: size.height * .04,
              width: size.width * .23,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffe1e1fa),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Icon(Icons.home_outlined,
                          color: Theme.of(context).colorScheme.primary)),
                  Expanded(
                    child: Text(
                      "Home",
                      style: TextStyle(fontSize: 12),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
            activeIcon: Container(
              height: size.height * .04,
              width: size.width * .23,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffe1e1fa),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Icon(Icons.search,
                          color: Theme.of(context).colorScheme.primary)),
                  Expanded(
                      child: Text(
                    "Search",
                    style: TextStyle(fontSize: 12),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ))
                ],
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "",
            activeIcon: Container(
              height: size.height * .04,
              width: size.width * .23,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffe1e1fa),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Icon(Icons.favorite_border,
                          color: Theme.of(context).colorScheme.primary)),
                  Expanded(
                      child: Text(
                    "Like",
                    style: TextStyle(fontSize: 12),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ))
                ],
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_outlined),
            label: "",
            activeIcon: Container(
              height: size.height * .04,
              width: size.width * .23,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffe1e1fa),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      child: Icon(Icons.notification_important_outlined,
                          color: Theme.of(context).colorScheme.primary)),
                  Expanded(
                    child: Text(
                      "Notification",
                      style: TextStyle(fontSize: 12),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "",
            activeIcon: Container(
              height: size.height * .04,
              width: size.width * .23,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffe1e1fa),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Icon(Icons.settings,
                          color: Theme.of(context).colorScheme.primary)),
                  Expanded(
                      child: Text(
                    "Setting",
                    style: TextStyle(fontSize: 12),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ))
                ],
              ),
            ),
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: currentIndex3,

        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (int index) {
          if (mounted) {
            setState(() {
              currentIndex3 = index;
            });
          }
        },
      ),
    );
  }

  Widget tabBar4(dynamic size) {
    return design(
      size: size,
      child: BottomNavigationBar(
        unselectedItemColor: Color(0xffcacccf),
        elevation: 0.0,
        //backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: "Like"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notification_important_outlined),
              label: "Notification"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex4,

        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: (int index) {
          if (mounted) {
            setState(() {
              currentIndex4 = index;
            });
          }
        },
      ),
    );
  }

  Widget tabBar5(dynamic size) {
    return Container(
      height: size.height * .09,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: ColorRes.labelColor,
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          tabs: myTabs,
        ),
      ),
    );
  }

  Widget tabBar6(dynamic size) {
    return Container(
      height: size.height * .09,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: TabBar(
          labelColor: Theme.of(context).colorScheme.primary,
          unselectedLabelColor: ColorRes.labelColor,
          controller: tabController1,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Theme.of(context).colorScheme.primary,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 5.0),
          ),
          tabs: myTabs,
        ),
      ),
    );
  }

  Widget tabBar7(dynamic size) {
    return Stack(
      children: [
        Container(
          height: size.height * .1,
        ),
        Container(
          height: size.height * .09,
          margin: EdgeInsets.only(top: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: false,
              unselectedItemColor: ColorRes.labelColor,
              elevation: 0.0,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Container(
                      height: 20,
                    ),
                    label: "    Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: "Search",
                    activeIcon: Container(
                      height: 20,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    label: "Like",
                    activeIcon: Container(
                      height: 20,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notification_important_outlined),
                    label: "Notification",
                    activeIcon: Container(
                      height: 20,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: "Setting",
                    activeIcon: Container(
                      height: 20,
                    )),
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex7,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              onTap: (int index) {
                if (mounted) {
                  setState(() {
                    currentIndex7 = index;
                  });
                }
              },
            ),
          ),
        ),
        floatingMethod(
            icon: currentIndex7 == 0
                ? Icons.home
                : currentIndex7 == 1
                    ? Icons.search
                    : currentIndex7 == 2
                        ? Icons.favorite_border
                        : currentIndex7 == 3
                            ? Icons.notification_important_outlined
                            : Icons.settings,
            index: currentIndex7,
            sizes: size)
      ],
    );
  }

  Widget design({required Widget child, dynamic size}) {
    return SizedBox(
        height: size.height * .09,
        child:
            ClipRRect(borderRadius: BorderRadius.circular(20), child: child));
  }
}
