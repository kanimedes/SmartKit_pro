import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/Restaurant/RestaurantDetail.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/Restaurant/RestaurantList.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Category.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/City.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Restaurant.dart';

import '../MainHomePage.dart';

StreamController<String>? homestreamdata;

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  Category? selectedcategory;

  bool isshowinternetmsg = true;
  List<String>? favresidlist;
  List<int>? featuredidlist;
  int selectedIndex = 0;
  City? city;
  String restauranttype = Constant.restaurantAll;
  String cityid = "0";

  @override
  void initState() {
    super.initState();
    favresidlist = [];
    featuredidlist = [];
  }

  @override
  dispose() {
    if (homestreamdata != null && !homestreamdata!.isClosed) {
      homestreamdata!.sink.close();
    }
    super.dispose();
  }

  final List<String> titles = [
    "Fast Food",
    "Health Food",
    "Dessert",
    "Meal",
    "Drinks",
  ];
  NavigationRailDestination textDestination(String text, int index) {
    return NavigationRailDestination(
      padding: EdgeInsets.zero,
      icon: SizedBox.shrink(),
      label: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: RotatedBox(
          quarterTurns: -1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: selectedIndex == index
                          ? ColorsRes.white
                          : Colors.transparent),
                ),
              ),
              Align(alignment: Alignment.center, child: Text(text)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: 100),
                child: IntrinsicHeight(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          ColorsRes.continueShoppingGradient1Color,
                          ColorsRes.continueShoppingGradient2Color
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0, 2],
                      ),
                    ),
                    child: NavigationRail(
                      minWidth: 56.0,
                      groupAlignment: -1.0,
                      backgroundColor: Colors.transparent,
                      selectedIndex: selectedIndex,
                      onDestinationSelected: (int index) {
                        setState(() {
                          selectedIndex = index;
                          cityid = "0";
                          restauranttype = Constant.restaurantAll;

                          restaurantlist.clear();
                          restaurantlist.addAll(restaurantlist1
                              .where((element) =>
                                  element.cityId.toString() != cityid)
                              .toList());
                          restaurantlist;
                        });
                      },
                      labelType: NavigationRailLabelType.all,
                      leading: GestureDetector(
                        onTap: () {
                          cityBottomSheet();
                        },
                        child: SvgPicture.asset(
                            "assets/images/fullApps/foodMaster/filter.svg",
                            color: ColorsRes.white),
                      ),
                      selectedLabelTextStyle: TextStyle(
                        color: ColorsRes.white,
                        fontSize: 18,
                        letterSpacing: 1,
                        decorationThickness: 2.0,
                      ),
                      unselectedLabelTextStyle: TextStyle(
                        fontSize: 18,
                        letterSpacing: 0.8,
                        color: ColorsRes.lightWhiteColor,
                      ),
                      destinations: [
                        textDestination("Fast Food", 0),
                        textDestination("Health Food", 1),
                        textDestination("Dessert", 2),
                        textDestination("Meal", 3),
                        textDestination("Drinks", 4),
                      ],
                    ),
                  ),
                ))),
        Expanded(
          flex: 11,
          child: Container(
            color: ColorsRes.backgroundColor,
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                children: [
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => RestaurantList(
                                fromsearch: true,
                              )));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: 22,
                      ),
                      decoration: DesignConfig.boxDecorationContainerShadow(
                          ColorsRes.containerShadowColor, 14, 14, 14, 14),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 12, right: 12, top: 15, bottom: 15),
                        child: Row(children: [
                          SizedBox(width: 10),
                          Text(
                            StringsRes.searchItem,
                            style: TextStyle(
                                color: ColorsRes.grayColor, fontSize: 14),
                          ),
                          SizedBox(width: 10),
                        ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          titles[selectedIndex],
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorsRes.darkOrangeColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  selectedIndex == 0
                      ? restaurantWidget(restaurantlist.length)
                      : selectedIndex == 1
                          ? restaurantWidget(1)
                          : selectedIndex == 2
                              ? restaurantWidget(2)
                              : selectedIndex == 3
                                  ? restaurantWidget(3)
                                  : selectedIndex == 4
                                      ? restaurantWidget(4)
                                      : restaurantWidget(restaurantlist.length)
                ]),
          ),
        ),
      ],
    );
  }

  Widget restaurantWidget(int i) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: i,
        itemBuilder: (context, index) {
          Restaurant restaurant;
          if (restauranttype == Constant.restaurantAll) {
            restaurant = restaurantlist[index];
          } else {
            restaurant = restaurantlist1[index];
          }
          List<String> descriptionlist = restaurant.description!.split(",");

          return GestureDetector(
            onTap: () {
              selectedrestaurant = restaurant;
              Navigator.of(context)
                  .push(CupertinoPageRoute(
                      builder: (context) => RestaurantDetail(
                            fromfav: false,
                            id: selectedrestaurant!.id,
                          )))
                  .then((value) {
                setState(() {});
              });
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 22.0),
              decoration: DesignConfig.boxDecorationContainerShadow(
                  ColorsRes.containerShadowColor, 14, 14, 14, 14),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(children: [
                      Card(
                        margin: EdgeInsets.all(0),
                        shape: DesignConfig.setHalfRoundedBorder(
                            Colors.white, 15, 0, 15, 0, false),
                        elevation: 0,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: OctoImage(
                          image:
                              CachedNetworkImageProvider('${restaurant.logom}'),
                          placeholderBuilder:
                              OctoPlaceholder.blurHash('${restaurant.blurUrl}'),
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          errorBuilder: OctoError.icon(color: ColorsRes.black),
                          fit: BoxFit.cover,
                        ),
                      ),
                      restaurant.freeDeliver == 1
                          ? Align(
                              alignment: Alignment.bottomLeft,
                              child: IntrinsicWidth(
                                child: Container(
                                  decoration: DesignConfig
                                      .boxDecorationContainerRoundHalf(
                                          ColorsRes.lightOrangeColor,
                                          0,
                                          0,
                                          50,
                                          50),
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8, top: 5, bottom: 5),
                                  margin: EdgeInsets.only(
                                      left: 0,
                                      top: MediaQuery.of(context).size.height /
                                          7),
                                  child: Text(
                                    StringsRes.freedelivery,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: ColorsRes.orangeColor,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IntrinsicWidth(
                          child: Container(
                            decoration:
                                DesignConfig.boxDecorationContainerRoundHalf(
                                    ColorsRes.lightOrangeColor, 50, 50, 0, 0),
                            padding: EdgeInsets.only(
                                left: 8, right: 8, top: 5, bottom: 5),
                            margin: EdgeInsets.only(
                                left: 5,
                                top: MediaQuery.of(context).size.height / 7),
                            child: Row(children: [
                              Icon(
                                Icons.star,
                                color: ColorsRes.orangeColor,
                                size: 15,
                              ),
                              Text(
                                restaurant.rating!,
                                style: TextStyle(
                                    fontSize: 10,
                                    color: ColorsRes.orangeColor,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "(${restaurant.views.toString()})",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: ColorsRes.orangeColor,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ]),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
                      child: Text(
                        restaurant.name!,
                        style: TextStyle(
                            fontSize: 16,
                            color: ColorsRes.orangeColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 3, bottom: 9),
                            child: Icon(Icons.restaurant_menu,
                                color: ColorsRes.grayColor, size: 10),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Wrap(
                                      children: List.generate(
                                    descriptionlist.length > 10
                                        ? 10
                                        : descriptionlist.length,
                                    (index) => Padding(
                                      padding:
                                          EdgeInsets.only(left: 3, bottom: 10),
                                      child: Text(
                                        descriptionlist[index] + ",",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: ColorsRes.grayColor),
                                      ),
                                    ),
                                  )),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 3, right: 3, bottom: 10),
                                    child: Text(
                                      restaurant.openingTime! +
                                          " - " +
                                          restaurant.closingTime!,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: ColorsRes.grayColor),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          );
        });
  }

  cityBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(20.0)),
        ),
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return SizedBox(
              height: (MediaQuery.of(context).size.height) / 1.5,
              child: Container(
                decoration: DesignConfig.boxDecorationContainerRoundHalf(
                    ColorsRes.white, 20, 0, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          StringsRes.selectcity,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 24,
                              color: ColorsRes.black),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Stack(
                      children: [
                        ListView.builder(
                            padding: EdgeInsets.only(
                                bottom: kToolbarHeight,
                                top: MediaQuery.of(context).padding.top),
                            itemCount: citylist.length,
                            itemBuilder: (context, index) {
                              City city = citylist[index];
                              return ListTile(
                                  onTap: () {
                                    cityid = city.id.toString();
                                    restauranttype = Constant.restaurantCity;

                                    setState(() {
                                      restaurantlist.clear();
                                      restaurantlist.addAll(restaurantlist1
                                          .where((element) =>
                                              element.cityId.toString() ==
                                              cityid)
                                          .toList());

                                      Navigator.pop(context);
                                    });
                                  },
                                  leading: CircleAvatar(
                                      backgroundColor: ColorsRes.orangeColor,
                                      child: Text(
                                        citylist[index].alias!.toUpperCase(),
                                        style: TextStyle(
                                            color: ColorsRes.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  title: Text(city.name!),
                                  trailing: cityid == city.id.toString()
                                      ? Icon(
                                          Icons.check_box,
                                          color: ColorsRes.green,
                                        )
                                      : null);
                            }),
                        if (cityid != "0")
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ActionChip(
                                label: Text(
                                  StringsRes.lblclear,
                                  style: TextStyle(
                                      color: ColorsRes.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                avatar: Icon(Icons.cancel),
                                shadowColor: ColorsRes.grayColor,
                                backgroundColor: ColorsRes.orangeColor,
                                onPressed: () {
                                  cityid = "0";
                                  restauranttype = Constant.restaurantAll;
                                  setState(() {
                                    restaurantlist.clear();
                                    restaurantlist.addAll(restaurantlist1
                                        .where((element) =>
                                            element.cityId.toString() !=
                                            cityid)
                                        .toList());
                                    restaurantlist;
                                    Navigator.of(context).pop();
                                  });
                                },
                              ),
                            ),
                          )
                      ],
                    )),
                  ],
                ),
              ));
        });
  }
}
