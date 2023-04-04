// ignore_for_file: unused_field

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/BedModel.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/ChairModel.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/ExploreModel.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/SofaModel.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/TableModel.dart';
import 'package:smartkit_pro/ui/fullApps/widgets/slideAnimation.dart';

import 'DetailActivity.dart';
import 'NotificationActivity.dart';
import 'SearchActivity.dart';

// ignore: must_be_immutable
class HomeActivity extends StatefulWidget {
  Function(bool)? update;
  HomeActivity({Key? key, this.update}) : super(key: key);

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  PageController? _controller;
  bool descTextShowFlag = false;
  TabController? _tabController;
  int _activeIndex = 0;
  AnimationController? _animationController;

  final ScrollController _scrollBottomBarController =
      ScrollController(); // set controller on scrolling
  bool isScrollingDown = false;
  bool _show = true;
  double bottomBarHeight = 75; // set bottom bar height
  final double _bottomBarOffset = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _controller = PageController(initialPage: 0);
    _tabController = TabController(vsync: this, length: 4);
    _tabController!.addListener(() {
      setState(() {
        _activeIndex = _tabController!.index;
      });
    });
    myScroll();
  }

  void showBottomBar() {
    setState(() {
      _show = true;
      widget.update!(true);
    });
  }

  void hideBottomBar() {
    setState(() {
      _show = false;
      widget.update!(false);
    });
  }

  void myScroll() async {
    _scrollBottomBarController.addListener(() {
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          //_showAppbar = false;
          showBottomBar();
        }
      }
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          //_showAppbar = true;
          hideBottomBar();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
    _scrollBottomBarController.removeListener(() {});
  }

  Widget exploreData() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: exploreList.length,
          itemBuilder: (BuildContext context, int index) {
            return SlideAnimation(
              position: index,
              itemCount: exploreList.length,
              slideDirection: SlideDirection.fromRight,
              animationController: _animationController,
              child: GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(
                        right: 15.0,
                        top: 15.0,
                        bottom: 15.0,
                        left: MediaQuery.of(context).size.width / 20),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: OctoImage(
                          image: CachedNetworkImageProvider(
                              exploreList[index].imgurl!),
                          placeholderBuilder: OctoPlaceholder.blurHash(
                            exploreList[index].hash!,
                          ),
                          width: 133,
                          height: 133,
                          errorBuilder:
                              OctoError.icon(color: ColorsRes.violateColor),
                          fit: BoxFit.fitHeight,
                        )),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailActivity(
                          name: exploreList[index].name!,
                          like: exploreList[index].like!,
                          rating: exploreList[index].rating!,
                          description: exploreList[index].description!,
                          price: exploreList[index].price!,
                          quantity: exploreList[index].quantity!,
                          color: exploreList[index].colorList,
                          image: exploreList[index].image,
                          hash: exploreList[index].hash,
                          imgurl: exploreList[index].imgurl,
                        ),
                      ),
                    );
                  }),
            );
          }),
    );
  }

  Widget tableData() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.69,
      color: ColorsRes.backgroundColor,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: tableList.length,
          itemBuilder: (BuildContext context, int index) {
            return SlideAnimation(
              position: index,
              itemCount: tableList.length,
              slideDirection: SlideDirection.fromBottom,
              animationController: _animationController,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailActivity(
                        name: tableList[index].name!,
                        like: tableList[index].like!,
                        rating: tableList[index].rating!,
                        description: tableList[index].description!,
                        price: tableList[index].price!,
                        quantity: tableList[index].quantity!,
                        color: tableList[index].colorList,
                        image: tableList[index].image,
                        imgurl: tableList[index].imgurl,
                        hash: tableList[index].hash,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 10,
                      bottom: 20.0,
                      left: MediaQuery.of(context).size.width / 20,
                      right: MediaQuery.of(context).size.width / 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(children: <Widget>[
                            Card(
                              margin: EdgeInsets.only(bottom: 0.0),
                              shape: DesignConfig.setRoundedBorder(
                                  Colors.transparent, 10, false),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: OctoImage(
                                image: CachedNetworkImageProvider(
                                  tableList[index].imgurl!,
                                ),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  tableList[index].hash!,
                                ),
                                errorBuilder:
                                    OctoError.icon(color: ColorsRes.black),
                                fit: BoxFit.cover,
                                width: 133,
                                height: 133,
                              ),
                            ),
                          ]),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(tableList[index].name!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsRes.violateColor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5)),
                                SizedBox(height: 5),
                                Text(
                                  tableList[index].description!,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          ColorsRes.greyColor.withOpacity(0.7),
                                      fontWeight: FontWeight.normal),
                                  maxLines: 3,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  tableList[index].price!,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color:
                                          ColorsRes.greenColor.withOpacity(0.7),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                DesignConfig.displayRating(
                                    tableList[index].rating!, true),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10.0,
                                          right: 10.0,
                                          top: 4.0,
                                          bottom: 4.0),
                                      decoration:
                                          DesignConfig.boxDecorationContainer(
                                              ColorsRes.greenColor, 20.0),
                                      child: Text(
                                        StringsRes.addToCartText,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: ColorsRes.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 20.0),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (tableList[index].like == "1") {
                                            tableList[index].like = "0";
                                          } else {
                                            tableList[index].like = "1";
                                          }
                                        });
                                      },
                                      child: Icon(
                                        tableList[index].like == "1"
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: ColorsRes.redColor,
                                        size: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget chairData() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.69,
      color: ColorsRes.backgroundColor,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: chairList.length,
          itemBuilder: (BuildContext context, int index) {
            return SlideAnimation(
              position: index,
              itemCount: chairList.length,
              slideDirection: SlideDirection.fromBottom,
              animationController: _animationController,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailActivity(
                        name: chairList[index].name!,
                        like: chairList[index].like!,
                        rating: chairList[index].rating!,
                        description: chairList[index].description!,
                        price: chairList[index].price!,
                        quantity: chairList[index].quantity!,
                        color: chairList[index].colorList,
                        image: chairList[index].image,
                        hash: chairList[index].hash,
                        imgurl: chairList[index].imgurl,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 10,
                      bottom: 20.0,
                      left: MediaQuery.of(context).size.width / 20,
                      right: MediaQuery.of(context).size.width / 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(children: <Widget>[
                            Card(
                              margin: EdgeInsets.only(bottom: 0.0),
                              shape: DesignConfig.setRoundedBorder(
                                  Colors.transparent, 10, false),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: OctoImage(
                                image: CachedNetworkImageProvider(
                                  chairList[index].imgurl!,
                                ),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  chairList[index].hash!,
                                ),
                                errorBuilder:
                                    OctoError.icon(color: ColorsRes.black),
                                fit: BoxFit.cover,
                                width: 133,
                                height: 133,
                              ),
                            ),
                          ]),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(chairList[index].name!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsRes.violateColor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5)),
                                SizedBox(height: 5),
                                Text(
                                  chairList[index].description!,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          ColorsRes.greyColor.withOpacity(0.7),
                                      fontWeight: FontWeight.normal),
                                  maxLines: 3,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  chairList[index].price!,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color:
                                          ColorsRes.greenColor.withOpacity(0.7),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                DesignConfig.displayRating(
                                    chairList[index].rating!, true),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10.0,
                                          right: 10.0,
                                          top: 4.0,
                                          bottom: 4.0),
                                      decoration:
                                          DesignConfig.boxDecorationContainer(
                                              ColorsRes.greenColor, 20.0),
                                      child: Text(
                                        StringsRes.addToCartText,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: ColorsRes.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 20.0),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (chairList[index].like == "1") {
                                            chairList[index].like = "0";
                                          } else {
                                            chairList[index].like = "1";
                                          }
                                        });
                                      },
                                      child: Icon(
                                        chairList[index].like == "1"
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: ColorsRes.redColor,
                                        size: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget sofaData() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.69,
      color: ColorsRes.backgroundColor,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: sofaList.length,
          itemBuilder: (BuildContext context, int index) {
            return SlideAnimation(
              position: index,
              itemCount: sofaList.length,
              slideDirection: SlideDirection.fromBottom,
              animationController: _animationController,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailActivity(
                        name: sofaList[index].name!,
                        like: sofaList[index].like!,
                        rating: sofaList[index].rating!,
                        description: sofaList[index].description!,
                        price: sofaList[index].price!,
                        quantity: sofaList[index].quantity!,
                        color: sofaList[index].colorList,
                        image: sofaList[index].image,
                        hash: sofaList[index].hash,
                        imgurl: sofaList[index].imgurl,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 10,
                      bottom: 20.0,
                      left: MediaQuery.of(context).size.width / 20,
                      right: MediaQuery.of(context).size.width / 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(children: <Widget>[
                            Card(
                              margin: EdgeInsets.only(bottom: 0.0),
                              shape: DesignConfig.setRoundedBorder(
                                  Colors.transparent, 10, false),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: OctoImage(
                                image: CachedNetworkImageProvider(
                                  sofaList[index].imgurl!,
                                ),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  sofaList[index].hash!,
                                ),
                                errorBuilder:
                                    OctoError.icon(color: ColorsRes.black),
                                fit: BoxFit.cover,
                                width: 133,
                                height: 133,
                              ),
                            ),
                          ]),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(sofaList[index].name!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsRes.violateColor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5)),
                                SizedBox(height: 5),
                                Text(
                                  sofaList[index].description!,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          ColorsRes.greyColor.withOpacity(0.7),
                                      fontWeight: FontWeight.normal),
                                  maxLines: 3,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  sofaList[index].price!,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color:
                                          ColorsRes.greenColor.withOpacity(0.7),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                DesignConfig.displayRating(
                                    sofaList[index].rating!, true),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10.0,
                                          right: 10.0,
                                          top: 4.0,
                                          bottom: 4.0),
                                      decoration:
                                          DesignConfig.boxDecorationContainer(
                                              ColorsRes.greenColor, 20.0),
                                      child: Text(
                                        StringsRes.addToCartText,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: ColorsRes.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 20.0),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (sofaList[index].like == "1") {
                                            sofaList[index].like = "0";
                                          } else {
                                            sofaList[index].like = "1";
                                          }
                                        });
                                      },
                                      child: Icon(
                                        sofaList[index].like == "1"
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: ColorsRes.redColor,
                                        size: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget bedData() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.69,
      color: ColorsRes.backgroundColor,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: bedList.length,
          itemBuilder: (BuildContext context, int index) {
            return SlideAnimation(
              position: index,
              itemCount: bedList.length,
              slideDirection: SlideDirection.fromBottom,
              animationController: _animationController,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailActivity(
                        name: bedList[index].name!,
                        like: bedList[index].like!,
                        rating: bedList[index].rating!,
                        description: bedList[index].description!,
                        price: bedList[index].price!,
                        quantity: bedList[index].quantity!,
                        color: bedList[index].colorList,
                        image: bedList[index].image,
                        hash: bedList[index].hash,
                        imgurl: bedList[index].imgurl,
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 10,
                      bottom: 20.0,
                      left: MediaQuery.of(context).size.width / 20,
                      right: MediaQuery.of(context).size.width / 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(children: <Widget>[
                            Card(
                              margin: EdgeInsets.only(bottom: 0.0),
                              shape: DesignConfig.setRoundedBorder(
                                  Colors.transparent, 10, false),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: OctoImage(
                                image: CachedNetworkImageProvider(
                                  bedList[index].imgurl!,
                                ),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  bedList[index].hash!,
                                ),
                                errorBuilder:
                                    OctoError.icon(color: ColorsRes.black),
                                fit: BoxFit.cover,
                                width: 133,
                                height: 133,
                              ),
                            ),
                          ]),
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(bedList[index].name!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsRes.violateColor,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5)),
                                SizedBox(height: 5),
                                Text(
                                  bedList[index].description!,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          ColorsRes.greyColor.withOpacity(0.7),
                                      fontWeight: FontWeight.normal),
                                  maxLines: 3,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  bedList[index].price!,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color:
                                          ColorsRes.greenColor.withOpacity(0.7),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                DesignConfig.displayRating(
                                    bedList[index].rating!, true),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 10.0,
                                          right: 10.0,
                                          top: 4.0,
                                          bottom: 4.0),
                                      decoration:
                                          DesignConfig.boxDecorationContainer(
                                              ColorsRes.greenColor, 20.0),
                                      child: Text(
                                        StringsRes.addToCartText,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: ColorsRes.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 20.0),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (bedList[index].like == "1") {
                                            bedList[index].like = "0";
                                          } else {
                                            bedList[index].like = "1";
                                          }
                                        });
                                      },
                                      child: Icon(
                                        bedList[index].like == "1"
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: ColorsRes.redColor,
                                        size: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: NestedScrollView(
            controller: _scrollBottomBarController,
            physics: AlwaysScrollableScrollPhysics(),
            //controller: scrollController,
            clipBehavior: Clip.none,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchActivity(),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 20),
                              height: 40,
                              decoration: DesignConfig.boxDecorationContainer(
                                  ColorsRes.creamColor, 20.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 7.0),
                                    enabled: false,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: ColorsRes.violateColor,
                                    ),
                                    border: InputBorder.none),
                                cursorColor: ColorsRes.violateColor,
                                style: TextStyle(
                                    color: ColorsRes.violateColor,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotificationActivity(),
                              ),
                            );
                          },
                          child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Icon(Icons.notifications_none,
                                      color: ColorsRes.violateColor, size: 30),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IntrinsicHeight(
                                    child: Container(
                                      decoration:
                                          DesignConfig.boxDecorationContainer(
                                              ColorsRes.yellowColor, 20),
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(top: 15, left: 5),
                                      padding: EdgeInsets.only(
                                        left: 3,
                                        right: 3,
                                      ),
                                      child: Text(
                                        "1",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .merge(TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                    SlideAnimation(
                      position: 1,
                      itemCount: 8,
                      slideDirection: SlideDirection.fromLeft,
                      animationController: _animationController,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 20,
                            top: MediaQuery.of(context).size.width / 20),
                        child: Text(
                          StringsRes.exploreText,
                          style: TextStyle(
                              color: ColorsRes.violateColor,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    exploreData(),
                    SlideAnimation(
                      position: 2,
                      itemCount: 8,
                      slideDirection: SlideDirection.fromLeft,
                      animationController: _animationController,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 20),
                            child: Text(
                              StringsRes.categoriesText,
                              style: TextStyle(
                                  color: ColorsRes.violateColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: 20.0),
                            child: Text(
                              StringsRes.seeAllText,
                              style: TextStyle(
                                  color: ColorsRes.violateColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                SliverAppBar(
                  backgroundColor: ColorsRes.backgroundColor,
                  shadowColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  toolbarHeight: 0,
                  titleSpacing: 0,
                  pinned: true,
                  bottom: TabBar(
                    physics: AlwaysScrollableScrollPhysics(),
                    isScrollable: true,
                    padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                    indicatorPadding: EdgeInsets.zero,
                    controller: _tabController,
                    labelColor: ColorsRes.white,
                    unselectedLabelColor: ColorsRes.greyColor,
                    indicator: DesignConfig.buttonShadowColor(
                        ColorsRes.yellowColor, 20.0),
                    labelStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 6.0, top: 6.0, left: 10.0, right: 10.0),
                        child: Text(StringsRes.tableText,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 6.0, top: 6.0, left: 10.0, right: 10.0),
                        child: Text(StringsRes.chairText,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 6.0, top: 6.0, left: 10.0, right: 10.0),
                        child: Text(StringsRes.sofaText,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 6.0, top: 6.0, left: 10.0, right: 10.0),
                        child: Text(StringsRes.bedText,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  elevation: 0,
                  floating: true,
                )
              ];
            },
            body: TabBarView(controller: _tabController, children: [
              tableData(),
              chairData(),
              sofaData(),
              bedData(),
            ]),
          ),
        ));
  }
}
