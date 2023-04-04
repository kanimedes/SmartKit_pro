import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/CartPayment/CartListPage.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/home/HomeScreenPage.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ease_in_widget.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Item.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Restaurant.dart';

import '../MainHomePage.dart';
import '../Restaurant/RestaurantDetail.dart';

StreamController<String>? favstreamdata;
StreamController<String>? favitemstreamdata;

class FavouriteList extends StatefulWidget {
  const FavouriteList({Key? key}) : super(key: key);

  @override
  _FavouriteListState createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  bool isgettingdata = true;
  bool isgettingitemdata = true;

  late Restaurant restaurant;

  late Item item;
  bool isshowinternetmsg = true;
  late List<String> favresidlist;
  late List<String> bookmarkItemIds;
  List<Map>? idlistmap;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < restaurantlist.length; i++) {
      restaurant = restaurantlist[i];
    }
    for (int j = 0; j < itemlist.length; j++) {
      item = itemlist[j];
    }
    favresidlist = ["1", "2", "3"];
    bookmarkItemIds = ["1", "2", "3"];
    idlistmap = [];
  }

  void setupChannel() {
    favstreamdata = StreamController<String>();
    favstreamdata!.stream.listen((response) async {
      favresidlist = restaurant.id.toString() as List<String>;
      if (restaurantlist.isNotEmpty) {
        restaurantlist.removeWhere(
            (element) => !favresidlist.contains(element.id.toString()));
        setState(() {});
      }
    });

    favitemstreamdata = StreamController<String>();
    favitemstreamdata!.stream.listen((response) async {
      idlistmap = item.id as List<Map>?;

      List<String>? newbookmarkItemIds = item.id as List<String>?;
      if (itemlist.isNotEmpty) {
        itemlist.removeWhere(
            (element) => !newbookmarkItemIds!.contains(element.id.toString()));

        bookmarkItemIds
            .removeWhere((element) => !newbookmarkItemIds!.contains(element));
        setState(() {});
      }

      if (idlistmap!.isNotEmpty) {
        idlistmap!.map((e) {
          String? itemid = e['itemid'];
          if (!bookmarkItemIds.contains(itemid)) {}
        });
      }
    });
  }

  getItemList() async {
    idlistmap = item.id as List<Map>?;

    if (idlistmap!.isEmpty) {
      isgettingitemdata = false;
      setState(() {});
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        appBar: AppBar(
          backgroundColor: ColorsRes.white,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: ColorsRes.orangeColor)),
          title: Text(
            StringsRes.favourite,
            style: TextStyle(color: ColorsRes.orangeColor),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          iconTheme: IconThemeData(
            color: ColorsRes.black,
          ),
          bottom: PreferredSize(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                border:
                    Border.all(color: ColorsRes.continueShoppingGradient1Color),
                gradient: LinearGradient(
                  colors: const [
                    ColorsRes.continueShoppingGradient1Color,
                    ColorsRes.continueShoppingGradient2Color,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: const [0, 2],
                ),
              ),
              height: kToolbarHeight - 5,
              child: TabBar(
                labelColor: ColorsRes.white,
                unselectedLabelColor: ColorsRes.orangeColor,
                labelStyle: Theme.of(context).textTheme.subtitle1,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ColorsRes.orangeColor),
                tabs: [
                  Tab(
                    child: Text(StringsRes.lblrestaurants),
                  ),
                  Tab(
                    child: Text(StringsRes.lblfooditems),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight - 5),
          ),
        ),
        body: TabBarView(
          children: [
            restaurantWidget(),
            itemListWidget(),
          ],
        ),
      ),
    );
  }

  @override
  dispose() {
    if (homestreamdata != null && !homestreamdata!.isClosed) {
      homestreamdata!.sink.add("");
    }
    if (favstreamdata != null && !favstreamdata!.isClosed) {
      favstreamdata!.sink.close();
    }
    if (favitemstreamdata != null && !favitemstreamdata!.isClosed) {
      favstreamdata!.sink.close();
    }
    super.dispose();
  }

  Widget restaurantWidget() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount: restaurantlist.length,
        itemBuilder: (context, index) {
          Restaurant restaurant = restaurantlist[index];

          List<String> descriptionlist = restaurant.description!.split(",");

          return GestureDetector(
            onTap: () {
              selectedrestaurant = restaurant;
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => RestaurantDetail(
                        fromfav: true,
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
                                      restaurantlist[index].openingTime! +
                                          " - " +
                                          restaurantlist[index].closingTime!,
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

  Widget itemListWidget() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount: itemlist.length,
        itemBuilder: (context, index) {
          Item item = itemlist[index];

          return GestureDetector(
            onTap: () {
              Restaurant res = Restaurant();
              res.id = item.restaurantid;
              selectedrestaurant = res;
              selecteditem = item;

              showBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.only(top: 12, bottom: 20),
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
                          image: CachedNetworkImageProvider('${item.logom}'),
                          placeholderBuilder:
                              OctoPlaceholder.blurHash('${item.blurUrl}'),
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          errorBuilder: OctoError.icon(color: ColorsRes.black),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: EaseInWidget(
                              child: Container(
                                  decoration: DesignConfig
                                      .boxDecorationContainerRoundHalf(
                                          ColorsRes.lightOrangeColor,
                                          0,
                                          14,
                                          14,
                                          0),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.add,
                                        color: ColorsRes.orangeColor),
                                  )),
                              onTap: () async {
                                itemlist.removeAt(index);
                                bookmarkItemIds.remove(item.id.toString());
                                setState(() {});
                              }),
                        ),
                      ),
                      if (item.available == 0)
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              decoration: DesignConfig.boxDecorationContainer(
                                  ColorsRes.white.withOpacity(0.9), 10),
                              child: Text(
                                StringsRes.itemnotavailable,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .merge(TextStyle(
                                        color: ColorsRes.orangeColor,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        )
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 8.0, right: 8.0),
                      child: Text(
                        item.name!,
                        style: TextStyle(
                          color: ColorsRes.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, bottom: 10),
                      child: Text(
                        Constant.currencysymbol + item.price.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: ColorsRes.black,
                        ),
                      ),
                    ),
                  ]),
            ),
          );
        });
  }

  void showBottomSheet() {
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          shape: DesignConfig.setRoundedBorder(
                              ColorsRes.orangeColor, 15, false),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          margin: EdgeInsets.all(20),
                          child: Stack(
                            children: [
                              OctoImage(
                                image: CachedNetworkImageProvider(
                                    '${selecteditem.logom}'),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                    '${selecteditem.blurUrl}'),
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                errorBuilder:
                                    OctoError.icon(color: ColorsRes.black),
                                fit: BoxFit.fill,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: EaseInWidget(
                                      child: Container(
                                          decoration: DesignConfig
                                              .boxDecorationContainerRoundHalf(
                                                  ColorsRes.lightOrangeColor,
                                                  0,
                                                  14,
                                                  14,
                                                  0),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Icon(Icons.favorite,
                                                color: ColorsRes.orangeColor),
                                          )),
                                      onTap: () async {
                                        setState(() {});
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              selecteditem.name!,
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorsRes.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 20.0, bottom: 10.0),
                                child: Text(
                                  selecteditem.shortDescription!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ColorsRes.grayColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: IntrinsicWidth(
                            child: Container(
                              decoration:
                                  DesignConfig.boxDecorationContainerRoundHalf(
                                      ColorsRes.lightOrangeColor, 0, 0, 50, 50),
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, top: 6, bottom: 6),
                              margin: EdgeInsets.only(left: 20, bottom: 10),
                              child: Row(children: [
                                Icon(
                                  Icons.star,
                                  color: ColorsRes.orangeColor,
                                  size: 15,
                                ),
                                Text(
                                  selecteditem.rating!,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: ColorsRes.orangeColor,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "(${selecteditem.views.toString()})",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: ColorsRes.orangeColor,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: IntrinsicWidth(
                            child: Container(
                              decoration:
                                  DesignConfig.boxDecorationContainerRoundHalf(
                                      ColorsRes.lightOrangeColor, 0, 0, 50, 50),
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, top: 6, bottom: 6),
                              margin: EdgeInsets.only(left: 20, bottom: 10),
                              child: Row(children: [
                                Text(
                                  "Delivery: ",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: ColorsRes.orangeColor,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  selecteditem.deliveryTime.toString(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: ColorsRes.orangeColor,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: IntrinsicWidth(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        StringsRes.lbltotal,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: ColorsRes.grayColor,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: IntrinsicWidth(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        Constant.currencysymbol +
                                            " " +
                                            selecteditem.price.toString(),
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: ColorsRes.orangeColor,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: ButtonClickAnimation(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CartListPage(
                                              id: selecteditem.id,
                                              id1: selecteditem.id.toString(),
                                              id2: selectedrestaurant!.id
                                                  .toString(),
                                              name: selecteditem.name,
                                              price: selecteditem.price,
                                              logom: selecteditem.logom,
                                              description:
                                                  selecteditem.description,
                                              localimg: selecteditem.localimg,
                                              address:
                                                  selectedrestaurant!.address,
                                              phone: selectedrestaurant!.phone,
                                              timeslot: selectedrestaurant!
                                                  .timeslotlist,
                                              openTime: selectedrestaurant!
                                                  .openingTime,
                                              closeTime: selectedrestaurant!
                                                  .closingTime,
                                              blurUrl:
                                                  selectedrestaurant!.blurUrl,
                                              mini: selectedrestaurant!
                                                  .minimum))).then((value) {
                                    setState(() {});
                                  });
                                },
                                child: IntrinsicWidth(
                                  child: Container(
                                    height: 60.0,
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    alignment: Alignment.center,
                                    decoration: DesignConfig.buttonShadowColor(
                                        ColorsRes
                                            .continueShoppingGradient1Color,
                                        37,
                                        ColorsRes
                                            .continueShoppingGradient2Color),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Text(
                                          StringsRes.addToCart,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: ColorsRes.white,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: "Poppins"),
                                        ),
                                        SizedBox(width: 10),
                                        FloatingActionButton(
                                          onPressed: () {},
                                          mini: true,
                                          backgroundColor:
                                              ColorsRes.lightWhiteColor,
                                          foregroundColor:
                                              ColorsRes.lightWhiteColor,
                                          child: Icon(Icons.add,
                                              color: ColorsRes.darkOrangeColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )));
        });
  }
}
