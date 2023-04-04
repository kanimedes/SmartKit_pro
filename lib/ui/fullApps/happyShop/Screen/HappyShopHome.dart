import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopFavrite.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopHomeTab.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopNotification.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopTrackOrder.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/widget/HappyShopAppBar.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/widget/HappyShopDrawer.dart';

class HappyShopHome extends StatefulWidget {
  const HappyShopHome({Key? key}) : super(key: key);

  @override
  _HappyShopHomeState createState() => _HappyShopHomeState();
}

class _HappyShopHomeState extends State<HappyShopHome> {
  late List<Widget> happyShopBottomeTab;
  int _curSelected = 0;

  @override
  void initState() {
    super.initState();
    _curSelected = 0;
    happyShopBottomeTab = [
      HappyShopHpmeTab(),
      HappyShopFavrite(
        appbar: false,
      ),
      HappyShopNotification(
        appbar: false,
      ),
      HappyShopTreackOrder(
        appbar: false,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: HappyShopAppBar(),
      ),
      drawer: HappyShopDrawer(),
      backgroundColor: Colors.white10,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: getBottomBar(),
      body: happyShopBottomeTab[_curSelected],
    );
  }

  getBottomBar() {
    return BottomAppBar(
      child: Container(
          decoration: BoxDecoration(
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: _curSelected,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: LikeButton(
                      size: 50.0,
                      onTap: (bool isLiked) {
                        return onNavigationTap(isLiked, 0);
                      },
                      circleColor: CircleColor(
                          start: primary, end: primary.withOpacity(0.1)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: primary,
                        dotSecondaryColor: primary.withOpacity(0.1),
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.home_outlined,
                          size: 24,
                          color: Color(0x31333333).withOpacity(0.5),
                        );
                      },
                    ),
                    activeIcon: LikeButton(
                      size: 50.0,
                      onTap: (bool isLiked) {
                        return onNavigationTap(isLiked, 0);
                      },
                      circleColor: CircleColor(
                          start: primary, end: primary.withOpacity(0.1)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: primary,
                        dotSecondaryColor: primary.withOpacity(0.1),
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.home_sharp,
                          size: 24,
                          color: happyshopcolor2,
                        );
                      },
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Favorite',
                    icon: LikeButton(
                      size: 50.0,
                      onTap: (bool isLiked) {
                        return onNavigationTap(isLiked, 1);
                      },
                      circleColor: CircleColor(
                          start: primary, end: primary.withOpacity(0.1)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: primary,
                        dotSecondaryColor: primary.withOpacity(0.1),
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.favorite_border,
                          size: 24,
                          color: Color(0x31333333).withOpacity(0.5),
                        );
                      },
                    ),
                    activeIcon: LikeButton(
                      size: 50.0,
                      onTap: (bool isLiked) {
                        return onNavigationTap(isLiked, 1);
                      },
                      circleColor: CircleColor(
                          start: primary, end: primary.withOpacity(0.1)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: primary,
                        dotSecondaryColor: primary.withOpacity(0.1),
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.favorite,
                          size: 24,
                          color: happyshopcolor2,
                        );
                      },
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Notifications',
                    icon: LikeButton(
                      size: 50.0,
                      onTap: (bool isLiked) {
                        return onNavigationTap(isLiked, 2);
                      },
                      circleColor: CircleColor(
                          start: primary, end: primary.withOpacity(0.1)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: primary,
                        dotSecondaryColor: primary.withOpacity(0.1),
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.notifications_none,
                          size: 24,
                          color: Color(0x31333333).withOpacity(0.5),
                        );
                      },
                    ),
                    activeIcon: LikeButton(
                      size: 50.0,
                      onTap: (bool isLiked) {
                        return onNavigationTap(isLiked, 2);
                      },
                      circleColor: CircleColor(
                          start: primary, end: primary.withOpacity(0.1)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: primary,
                        dotSecondaryColor: primary.withOpacity(0.1),
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.notifications,
                          size: 24,
                          color: happyshopcolor2,
                        );
                      },
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: 'Track Order',
                    icon: LikeButton(
                      size: 50.0,
                      onTap: (bool isLiked) {
                        return onNavigationTap(isLiked, 3);
                      },
                      circleColor: CircleColor(
                          start: primary, end: primary.withOpacity(0.1)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: primary,
                        dotSecondaryColor: primary.withOpacity(0.1),
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.directions_bike_outlined,
                          size: 24,
                          color: Color(0x31333333).withOpacity(0.5),
                        );
                      },
                    ),
                    activeIcon: LikeButton(
                      size: 50.0,
                      onTap: (bool isLiked) {
                        return onNavigationTap(isLiked, 3);
                      },
                      circleColor: CircleColor(
                          start: primary, end: primary.withOpacity(0.1)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: primary,
                        dotSecondaryColor: primary.withOpacity(0.1),
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.directions_bike,
                          size: 24,
                          color: happyshopcolor2,
                        );
                      },
                    ),
                  ),
                ],
              ))),
    );
  }

  Future<bool> onNavigationTap(bool isLiked, int index) async {
    setState(() {
      _curSelected = index;
    });
    return !isLiked;
  }
}
