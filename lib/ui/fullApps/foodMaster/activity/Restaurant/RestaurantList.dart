import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ease_in_widget.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/City.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Restaurant.dart';

import '../MainHomePage.dart';
import '../home/HomeScreenPage.dart';
import 'RestaurantDetail.dart';

StreamController<String>? restaurantstream;

class RestaurantList extends StatefulWidget {
  final bool? fromsearch;
  const RestaurantList({
    Key? key,
    this.fromsearch,
  }) : super(key: key);
  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  Restaurant? restaurant;
  City? city;
  String restauranttype = Constant.restaurantAll;
  String cityid = "0";
  List<String>? favresidlist;
  bool isloading = false;
  TextEditingController searchcontroller = TextEditingController();
  //int offset = 0;
  //int limit = 10;
  bool isloadmore = true;
  String searchText = '';
  bool ispageLoading = false;
  GlobalKey<ScaffoldState>? scaffoldKey;
  List<int>? residlist;

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  void setupChannel() {
    restaurantstream = StreamController<String>();
    restaurantstream!.stream.listen((response) async {
      favresidlist = restaurant!.id as List<String>?;
      setState(() {});
    });
  }

  @override
  dispose() {
    if (restaurantstream != null && !restaurantstream!.isClosed) {
      restaurantstream!.sink.close();
      restaurantstream = null;
    }
    if (homestreamdata != null && !homestreamdata!.isClosed) {
      homestreamdata!.sink.add("");
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: DesignConfig.setAppbar(StringsRes.lblrestaurants, context),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
        child: Column(children: [
          searchWidget(),
          Expanded(child: restaurantWidget()),
        ]),
      ),
    );
  }

  searchWidget() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: DesignConfig.boxDecorationContainerShadow(
                  ColorsRes.containerShadowColor, 14, 14, 14, 14),
              padding:
                  EdgeInsets.only(left: 22, right: 22, top: 15, bottom: 15),
              child: Text(
                StringsRes.searchItem,
                style: TextStyle(color: ColorsRes.grayColor, fontSize: 14),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          EaseInWidget(
              onTap: () {
                cityBottomSheet();
              },
              child: Icon(
                Icons.filter_alt_rounded,
                color: ColorsRes.orangeColor,
                size: 40,
              ))
        ],
      ),
    );
  }

  Widget restaurantWidget() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        itemCount: restaurantlist.length,
        itemBuilder: (context, index) {
          restaurant = restaurantlist[index];
          List<String> descriptionlist = restaurant!.description!.split(",");

          return GestureDetector(
            onTap: () {
              selectedrestaurant = restaurant;
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => RestaurantDetail(
                        fromfav: false,
                        id: selectedrestaurant!.id,
                      )));
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
                          image: CachedNetworkImageProvider(
                              '${restaurant!.logom}'),
                          placeholderBuilder: OctoPlaceholder.blurHash(
                              '${restaurant!.blurUrl}'),
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          errorBuilder: OctoError.icon(color: ColorsRes.black),
                          fit: BoxFit.cover,
                        ),
                      ),
                      restaurant!.freeDeliver == 1
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
                                restaurant!.rating!,
                                style: TextStyle(
                                    fontSize: 10,
                                    color: ColorsRes.orangeColor,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "(${restaurant!.views.toString()})",
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
                        restaurant!.name!,
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
                                      restaurant!.openingTime! +
                                          " - " +
                                          restaurant!.closingTime!,
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
                                            element.cityId.toString() != cityid)
                                        .toList());

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
