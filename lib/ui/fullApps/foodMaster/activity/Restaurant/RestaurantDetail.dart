// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/CartPayment/CartListPage.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/profile/FavouriteList.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ease_in_widget.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/new_dialog.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Category.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Item.dart';

import '../MainHomePage.dart';
import '../home/HomeScreenPage.dart';
import 'RestaurantList.dart';

StreamController<String>? resdetailstreamdata;

const List<Tab> categoryItems = [
  Tab(text: "Pasta"),
  Tab(text: "Pizza"),
  Tab(text: "Snacks"),
  Tab(text: "Drinks"),
  Tab(text: "Burrito"),
  Tab(text: "Sandwitch")
];

class RestaurantDetail extends StatefulWidget {
  final bool? fromfav;
  final int? id;
  const RestaurantDetail({
    Key? key,
    this.fromfav,
    this.id,
  }) : super(key: key);
  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail>
    with SingleTickerProviderStateMixin {
  bool? isfav = false;
  bool istouchfav = false;
  bool istouchitemfav = false;
  String favicon = "favourite_uncheked";
  ScrollController? _hideButtonController;
  late var _isVisible;
  double expandheight = 250;
  GlobalKey<ScaffoldState>? scaffoldKey;
  List<String> descriptionlist = selectedrestaurant!.description!.split(",");
  Category? selectedcategory;
  late List<String> bookmarkItemIds;
  Item? allItem;
  TabController? _controller;
  int _selectedIndex = 0;
  late Category category;

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
    categorylist;
    _isVisible = false;
    _hideButtonController = ScrollController();
    categorylist;
    itemlist;
    for (int i = 0; i < allitemlist.length; i++) {
      allItem = allitemlist[i];
    }
    bookmarkItemIds = [];
    checkfav();
    backbtnVisibility();
    _controller = TabController(length: categoryItems.length, vsync: this);

    _controller!.addListener(() {
      setState(() {
        _selectedIndex = _controller!.index;
      });
    });
  }

  backbtnVisibility() {
    _hideButtonController!.addListener(() {
      if (_hideButtonController!.offset > expandheight &&
          !_hideButtonController!.position.outOfRange) {
        if (!_isVisible) {
          _isVisible = true;
          setState(() {});
        }
      }
      if (_hideButtonController!.offset <= expandheight &&
          !_hideButtonController!.position.outOfRange) {
        if (_isVisible) {
          _isVisible = false;
          setState(() {});
        }
      }

      if (_hideButtonController!.offset >=
              _hideButtonController!.position.maxScrollExtent &&
          !_hideButtonController!.position.outOfRange) {}
    });
  }

  @override
  dispose() {
    if (istouchfav) {
      if (widget.fromfav! &&
          favstreamdata != null &&
          !favstreamdata!.isClosed) {
        favstreamdata!.sink.add("");
      } else {
        if (homestreamdata != null && !homestreamdata!.isClosed) {
          homestreamdata!.sink.add("");
        }
        if (restaurantstream != null && !restaurantstream!.isClosed) {
          restaurantstream!.sink.add("");
        }
      }
    }

    if (istouchitemfav &&
        widget.fromfav! &&
        favitemstreamdata != null &&
        !favitemstreamdata!.isClosed) favitemstreamdata!.sink.add("");

    if (resdetailstreamdata != null && !resdetailstreamdata!.isClosed) {
      resdetailstreamdata!.sink.close();
    }

    super.dispose();
  }

  checkfav() async {
    isfav = selectedrestaurant!.isbookmarked;
    favicon = isfav! ? "favourite_icon" : "favourite_uncheked";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorsRes.backgroundColor,
      body: DefaultTabController(
        length: categoryItems.length,
        child: NestedScrollView(
          controller: _hideButtonController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                shadowColor: Colors.transparent,
                backgroundColor: ColorsRes.backgroundColor,
                systemOverlayStyle: SystemUiOverlayStyle.light,
                iconTheme: IconThemeData(
                  color: ColorsRes.black,
                ),
                floating: false,
                pinned: true,
                automaticallyImplyLeading: _isVisible,
                leading: _isVisible
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios,
                            color: ColorsRes.orangeColor))
                    : Container(),
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    _isVisible ? selectedrestaurant!.name! : '',
                    style: TextStyle(color: ColorsRes.orangeColor),
                  ),
                  background: Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: const [
                                ColorsRes.blackTransparentColor,
                                ColorsRes.blackTransparentColor
                              ],
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.darken,
                          child: OctoImage(
                            image: CachedNetworkImageProvider(
                                '${selectedrestaurant!.logom}'),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                                '${selectedrestaurant!.blurUrl}'),
                            width: MediaQuery.of(context).size.width,
                            height: double.maxFinite,
                            errorBuilder:
                                OctoError.icon(color: ColorsRes.black),
                            fit: BoxFit.fill,
                          ),
                        ) /*)*/,
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Card(
                              color:
                                  ColorsRes.lightOrangeColor.withOpacity(0.50),
                              margin: EdgeInsets.only(
                                  left: 14,
                                  top: kToolbarHeight -
                                      MediaQuery.of(context).padding.top),
                              shape: DesignConfig.setRoundedBorder(
                                  ColorsRes.lightOrangeColor.withOpacity(0.50),
                                  10,
                                  false),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: ColorsRes.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IntrinsicWidth(
                            child: Container(
                              decoration:
                                  DesignConfig.boxDecorationContainerRoundHalf(
                                      ColorsRes.lightOrangeColor, 50, 50, 0, 0),
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, top: 6, bottom: 6),
                              margin: EdgeInsets.only(
                                  left: 5,
                                  bottom:
                                      MediaQuery.of(context).size.height / 20),
                              child: Row(children: [
                                Icon(
                                  Icons.star,
                                  color: ColorsRes.orangeColor,
                                  size: 15,
                                ),
                                Text(
                                  selectedrestaurant!.rating!,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: ColorsRes.orangeColor,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  "(${selectedrestaurant!.views.toString()})",
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
                          alignment: Alignment.bottomLeft,
                          child: IntrinsicWidth(
                            child: Container(
                              decoration:
                                  DesignConfig.boxDecorationContainerRoundHalf(
                                      ColorsRes.lightOrangeColor, 0, 0, 50, 50),
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, top: 6, bottom: 6),
                              margin: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.height / 20),
                              child: Row(children: [
                                Text(
                                  "Delivery: ",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: ColorsRes.orangeColor,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  selectedrestaurant!.deliveryTime.toString(),
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
                          alignment: Alignment.center,
                          child: IntrinsicWidth(
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, top: 6, bottom: 6),
                              margin: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height / 9.2),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      selectedrestaurant!.name.toString(),
                                      style: TextStyle(
                                          fontSize: 33,
                                          color: ColorsRes.white,
                                          fontWeight: FontWeight.normal),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      selectedrestaurant!.address.toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: ColorsRes.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                expandedHeight: expandheight,
              ),
              SliverPersistentHeader(
                floating: false,
                delegate: SliverAppBarDelegate(
                  TabBar(
                    onTap: (int val) {},
                    physics: AlwaysScrollableScrollPhysics(),
                    isScrollable: true,
                    labelColor: ColorsRes.orangeColor,
                    unselectedLabelColor: ColorsRes.grayTabColor,
                    indicatorColor: Colors.transparent,
                    controller: _controller,
                    labelStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                    tabs: categoryItems,
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            controller: _controller,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  crossAxisCount: 2,
                  childAspectRatio: 0.890,
                  children: List.generate(
                    itemlist.length,
                    (index) {
                      Item item = itemlist[index];
                      return itemWidget(item);
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  crossAxisCount: 2,
                  childAspectRatio: 0.890,
                  children: List.generate(
                    itemlist.length,
                    (index) {
                      Item item = itemlist[index];
                      return itemWidget(item);
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  crossAxisCount: 2,
                  childAspectRatio: 0.890,
                  children: List.generate(
                    itemlist.length,
                    (index) {
                      Item item = itemlist[index];
                      return itemWidget(item);
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  crossAxisCount: 2,
                  childAspectRatio: 0.890,
                  children: List.generate(
                    itemlist.length,
                    (index) {
                      Item item = itemlist[index];
                      return itemWidget(item);
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  crossAxisCount: 2,
                  childAspectRatio: 0.890,
                  children: List.generate(
                    itemlist.length,
                    (index) {
                      Item item = itemlist[index];
                      return itemWidget(item);
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10.0),
                child: GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  crossAxisCount: 2,
                  childAspectRatio: 0.890,
                  children: List.generate(
                    itemlist.length,
                    (index) {
                      Item item = itemlist[index];
                      return itemWidget(item);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
                                  // textAlign: TextAlign.start,
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

  Widget itemWidget(Item item) {
    bool isfavitem = bookmarkItemIds.contains(item.id.toString());
    return GestureDetector(
      onTap: () {
        selecteditem = item;

        showBottomSheet();
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 10),
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
                    height: 122,
                    errorBuilder: OctoError.icon(color: ColorsRes.black),
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: EaseInWidget(
                        child: Container(
                            decoration:
                                DesignConfig.boxDecorationContainerRoundHalf(
                                    ColorsRes.lightOrangeColor, 0, 14, 14, 0),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child:
                                  Icon(Icons.add, color: ColorsRes.orangeColor),
                            )),
                        onTap: () async {
                          bool newval = !isfavitem;
                          istouchitemfav = true;
                          if (newval) {
                            bookmarkItemIds.add(item.id.toString());
                          } else {
                            bookmarkItemIds.remove(item.id.toString());
                          }
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
                          style: Theme.of(context).textTheme.caption!.merge(
                              TextStyle(
                                  color: ColorsRes.orangeColor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  )
              ]),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
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
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
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
  }

  void openCategoryDialogue() {
    showNewDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("${selectedrestaurant!.name} ${StringsRes.categories}"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(categorylist.length, (index) {
                category = categorylist[index];
                bool isselected = selectedcategory != null &&
                        selectedcategory!.id == category.id
                    ? true
                    : false;

                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: EaseInWidget(
                      onTap: () {
                        itemlist.clear();
                        itemlist.addAll(allitemlist.where(
                            (element) => element.id.toString() == category.id));

                        setState(() {});
                        Navigator.of(context).pop();
                      },
                      child: RichText(
                          text: TextSpan(
                        text: category.name,
                        style: TextStyle(
                          color: isselected ? ColorsRes.white : ColorsRes.black,
                          background: Paint()
                            ..color = isselected
                                ? ColorsRes.orangeColor
                                : ColorsRes.grayColor
                            ..strokeJoin = StrokeJoin.round
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 20,
                        ),
                      ))),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: ColorsRes.backgroundColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
