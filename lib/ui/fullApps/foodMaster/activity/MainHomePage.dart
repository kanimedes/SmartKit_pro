import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/CartPayment/CartListPage.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/Order/OrderList.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/Restaurant/RestaurantList.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/TermsConditionActivity.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/home/HomeScreenPage.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/profile/AddressList.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/profile/FavouriteList.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/profile/UserInfoPage.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/drawerstyle/drawerbehavior.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Item.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Restaurant.dart';

import '../../../../app/routes.dart';
import 'Notification/NotificationList.dart';
import 'authentication/LoginHomePage.dart';

Restaurant? selectedrestaurant;
late Item selecteditem;

class MainHomePage extends StatefulWidget {
  final String? from;
  const MainHomePage({
    Key? key,
    this.from,
  }) : super(key: key);
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  final Future<SharedPreferences> _sprefs = SharedPreferences.getInstance();
  int? selectedMenuItemId;
  List<Menuitem> menuitems = [];
  HomeScreenPage? homepage;
  int? counter;

  @override
  void initState() {
    super.initState();
    selectedMenuItemId = 0;
    homepage = HomeScreenPage();
    counter = 1;
    getData1();
    setState(() {
      // getData();
    });
  }

  getData1() async {
    setMeuItems();
  }

  setMeuItems() {
    menuitems = [];
    menuitems = [
      Menuitem<int>(
        id: 0,
        title: StringsRes.myprofile,
        icon: SvgPicture.asset(
          "assets/images/fullApps/foodMaster/myprofile_icon.svg",
        ),
      ),
    ];
    menuitems.addAll([
      Menuitem<int>(
        id: 5,
        title: StringsRes.lblrestaurants,
        icon: SvgPicture.asset(
          "assets/images/fullApps/foodMaster/restaurant_dropdown.svg",
          width: 28,
          height: 28,
        ),
      ),
      Menuitem<int>(
        id: 1,
        title: StringsRes.myorders,
        icon: SvgPicture.asset(
          "assets/images/fullApps/foodMaster/myorder_icon.svg",
          width: 28,
          height: 28,
        ),
      ),
      Menuitem<int>(
        id: 2,
        title: StringsRes.deliveryaddress,
        icon: SvgPicture.asset(
          "assets/images/fullApps/foodMaster/deliveryaddress_icon.svg",
        ),
      ),
      Menuitem<int>(
        id: 3,
        title: StringsRes.notifications,
        icon: SvgPicture.asset(
          "assets/images/fullApps/foodMaster/notification_dropdown.svg",
        ),
      ),
      Menuitem<int>(
        id: 4,
        title: StringsRes.favourite,
        icon: SvgPicture.asset(
          "assets/images/fullApps/foodMaster/Favourite_dropdown.svg",
        ),
      ),
      Menuitem<int>(
        id: 6,
        title: StringsRes.termsandcondition,
        icon: SvgPicture.asset(
          "assets/images/fullApps/foodMaster/terms_dropdown.svg",
        ),
      ),
      Menuitem<int>(
          id: 7,
          title: StringsRes.privacypolicy,
          icon: SvgPicture.asset(
            "assets/images/fullApps/foodMaster/privacypolicy_dropdown.svg",
          )),
    ]);

    //
  }

  Widget drawerHeader() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Platform.isIOS
              ? BackButton(
                  color: ColorsRes.black,
                )
              : Text(""),
          CircleAvatar(
            radius: 40,
            child: Image.asset(
              "assets/images/fullApps/foodMaster/splash_logo.png",
              width: 60,
            ),
          ),
          Text("abc",
              style: TextStyle(
                  fontSize: 18,
                  color: ColorsRes.black,
                  fontWeight: FontWeight.normal)),
          Text(
            "abc@gmail.com",
            style: TextStyle(fontSize: 14, color: ColorsRes.grayColor),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.home, (route) => false);
        return Future.value(true);
      } as Future<bool> Function()?,
      child: DrawerScaffold(
        appBar: AppBar(
            backgroundColor: ColorsRes.backgroundColor,
            elevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Blacksmith",
                  style:
                      TextStyle(color: ColorsRes.darkOrangeColor, fontSize: 24),
                ),
                Row(
                  children: const [
                    Icon(Icons.location_on, color: ColorsRes.grayColor),
                    Text(
                      "Deliver to: ",
                      style:
                          TextStyle(color: ColorsRes.grayColor, fontSize: 14),
                    ),
                    Text(
                      "Bhuj",
                      style: TextStyle(color: ColorsRes.black, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            iconTheme: IconThemeData(
              color: ColorsRes.black,
            ),
            actions: [
              ButtonClickAnimation(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartListPage(
                            id: 1,
                            id1: "3",
                            id2: "1",
                            name: "Fresh Pasta and Risotto",
                            price: 50,
                            logom:
                                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_1.jpg?alt=media&token=0bafc4f2-9989-4b81-b38f-a82d8072bc9b",
                            description:
                                "peeled tomatoes, mozzarella salad,...",
                            extra: "Extra Sauce",
                            address: ", 123,xyz",
                            phone: "1234567890",
                            timeslot: const ["10:00", "11:00"],
                            openTime: "09:00 AM",
                            closeTime: "11:00 PM",
                            blurUrl: "LRN+d}E1LNrq^gRPNIV[0%#;z;oN",
                            localimg:
                                "assets/images/fullApps/foodMaster/Detail_1.jpg",
                            mini: "2")),
                  );
                },
                child: Stack(alignment: Alignment.center, children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Icons.shopping_cart_outlined,
                        color: ColorsRes.grayColor),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IntrinsicHeight(
                      child: Container(
                        decoration: DesignConfig.boxDecorationContainer(
                            ColorsRes.orangeColor, 20),
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10, left: 5),
                        padding: EdgeInsets.only(
                          left: 3,
                          right: 3,
                        ),
                        child: Text(
                          counter.toString(),
                          style: Theme.of(context).textTheme.caption!.merge(
                              TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ]),
        onSlide: (drawer, value) {},
        onOpened: (drawer) {},
        onClosed: (drawer) {},
        drawers: [
          SideDrawer(
              percentage: 0.8,
              drawerWidth: MediaQuery.of(context).size.width - 80,
              padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
              menu: Menu(items: menuitems),
              direction: Direction.left,
              animation: true,
              selectedItemId: selectedMenuItemId,
              onMenuItemSelected: (itemId) {
                setState(() {
                  selectedMenuItemId = itemId;
                });
                openSpecifiPage(itemId);
              },
              alignment: Alignment.topLeft,
              headerView: Padding(
                padding:
                    EdgeInsets.only(left: 20, bottom: 20, top: kToolbarHeight),
                child: drawerHeader(),
              ),
              footerView: GestureDetector(
                  onTap: () {
                    setMeuItems();
                    setState(() {});
                  },
                  child: Container(
                    decoration: DesignConfig.buttonShadowColor(
                        ColorsRes.continueShoppingGradient1Color,
                        37,
                        ColorsRes.continueShoppingGradient2Color),
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(left: 20, bottom: 20),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginHomePage(
                                      from: "intro",
                                    )),
                          );
                        },
                        child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  backgroundColor: ColorsRes.lightOrangeColor,
                                  radius: 15,
                                  child: Icon(
                                    Icons.power_settings_new,
                                    size: 20,
                                    color: ColorsRes.orangeColor,
                                  )),
                              SizedBox(width: 10),
                              Text(
                                StringsRes.lbllogout.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: ColorsRes.white,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(width: 10),
                            ])),
                  )))
        ],
        builder: (context, id) {
          return homepage;
        },
      ),
    );
  }

  void openSpecifiPage(itemId) {
    if (itemId == 0) {
      Navigator.of(context)
          .push(CupertinoPageRoute(builder: (context) => UserInfoPage()));
    } else if (itemId == 1) {
      Navigator.of(context)
          .push(CupertinoPageRoute(builder: (context) => OrderList()));
    } else if (itemId == 2) {
      Navigator.of(context)
          .push(CupertinoPageRoute(builder: (context) => AddressList()));
    } else if (itemId == 3) {
      Navigator.of(context)
          .push(CupertinoPageRoute(builder: (context) => NotificationList()));
    } else if (itemId == 4) {
      Navigator.of(context)
          .push(CupertinoPageRoute(builder: (context) => FavouriteList()));
    } else if (itemId == 5) {
      Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => RestaurantList(
                fromsearch: false,
              )));
    } else if (itemId == 6) {
      Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) => TermsConditionActivity()));
    } else if (itemId == 7) {
      Navigator.of(context).push(
          CupertinoPageRoute(builder: (context) => TermsConditionActivity()));
    }
  }
}
