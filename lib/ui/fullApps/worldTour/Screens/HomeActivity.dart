import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/DetailActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/NotificationActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBox.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/model/CategoryModel.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/model/SliderModel.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/model/TopTripsModel.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  int currentIndex = 0;
  PageController? _controller;
  CarouselController buttonCarouselController = CarouselController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  Widget sliderWidget() {
    final basicSlider = CarouselSlider.builder(
      carouselController: buttonCarouselController,
      itemCount: sliderList.length,
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 2.0,
        height: 300,
      ),
      itemBuilder: (context, index, realIdx) {
        return OctoImage(
          image: CachedNetworkImageProvider(sliderList[index].image!),
          placeholderBuilder: OctoPlaceholder.blurHash(
            sliderList[index].blurUrl!,
          ),
          width: 1000,
          errorBuilder: OctoError.icon(color: ColorsRes.bottomColor),
          fit: BoxFit.fill,
        );
      },
    );
    return Column(children: [
      basicSlider,
      Row(children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey.shade300),
                onPressed: () => buttonCarouselController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear),
                child: Icon(Icons.arrow_back, color: ColorsRes.iconColor)),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey.shade300),
                onPressed: () => buttonCarouselController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear),
                child: Icon(Icons.arrow_forward, color: ColorsRes.iconColor)),
          ),
        ),
      ]),
    ]);
  }

  Widget topTrip() {
    return Container(
      height: 270,
      margin: EdgeInsets.only(left: 8),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: topTripsList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Container(
                  decoration: DesignConfig.boxDecorationButtonColor(
                      ColorsRes.grayColor.withOpacity(0.2),
                      ColorsRes.grayColor.withOpacity(0.2),
                      30),
                  width: 170,
                  height: 160,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Stack(
                    children: [
                      Column(children: <Widget>[
                        Card(
                          shape: DesignConfig.setRoundedBorder(
                              Colors.transparent, 30, false),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            children: [
                              OctoImage(
                                image: CachedNetworkImageProvider(
                                    topTripsList[index].image!),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  topTripsList[index].blurUrl!,
                                ),
                                width: double.maxFinite,
                                height: 170,
                                errorBuilder: OctoError.icon(
                                    color: ColorsRes.bottomColor),
                                fit: BoxFit.fitHeight,
                              ),
                              topTripsList[index].like == "1"
                                  ? Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              24,
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      decoration: DesignConfig
                                          .boxDecorationLeafButtonColor(
                                              ColorsRes.lableColor,
                                              ColorsRes.lableColor,
                                              30),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          StringsRes.newText,
                                          style: TextStyle(
                                              color: ColorsRes.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ))
                                  : Container()
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0, top: 10.0),
                            child: Text(
                              topTripsList[index].name!,
                              style: TextStyle(
                                  color: ColorsRes.bottomColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              topTripsList[index].location!,
                              style: TextStyle(
                                  color: ColorsRes.grayColor, fontSize: 15),
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ]),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Card(
                            color: ColorsRes.white.withOpacity(0.7),
                            elevation: 5,
                            shadowColor: ColorsRes.iconColor.withOpacity(0.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Container(
                                height: 40,
                                width: 40,
                                padding: EdgeInsets.all(10.0),
                                decoration:
                                    DesignConfig.boxDecorationButtonColor(
                                        ColorsRes.white.withOpacity(0.7),
                                        ColorsRes.white.withOpacity(0.6),
                                        50),
                                child: SvgPicture.asset(
                                    "assets/images/fullApps/worldTour/svg/active_heart.svg",
                                    color: ColorsRes.bottomColor)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailActivity(id: index, type: "toptrips"),
                    ),
                  );
                });
          }),
    );
  }

  Widget slider() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.9,
      child: Stack(children: [
        PageView.builder(
          controller: _controller,
          itemCount: sliderList.length,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (_, i) {
            return GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    child: OctoImage(
                      image: CachedNetworkImageProvider(sliderList[i].image!),
                      placeholderBuilder: OctoPlaceholder.blurHash(
                        sliderList[i].blurUrl!,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      errorBuilder:
                          OctoError.icon(color: ColorsRes.bottomColor),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailActivity(id: i, type: "slider"),
                    ),
                  );
                });
          },
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 5.2,
          margin: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: MediaQuery.of(context).size.height * .318),
          child: GlassBox(
            redius: 40.0,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text(
                                sliderList[currentIndex].name!,
                                style: TextStyle(
                                    color: ColorsRes.bottomColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.normal),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.0, top: 5.0),
                              child: Text(
                                sliderList[currentIndex].location!,
                                style: TextStyle(
                                    color: ColorsRes.bottomColor, fontSize: 15),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    decoration:
                                        DesignConfig.boxDecorationButtonColor(
                                            ColorsRes.blueColor,
                                            ColorsRes.blueColor,
                                            25),
                                    alignment: AlignmentDirectional.center,
                                    margin: EdgeInsets.only(
                                      left: 20.0,
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          StringsRes.discoverText,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: ColorsRes.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Icon(Icons.arrow_forward,
                                            color: ColorsRes.white),
                                      ],
                                    )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _controller!.previousPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.linear);
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Card(
                                        color: ColorsRes.white.withOpacity(0.7),
                                        elevation: 5,
                                        shadowColor: ColorsRes.iconColor
                                            .withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Container(
                                            height: 50,
                                            width: 50,
                                            padding: EdgeInsets.all(10.0),
                                            decoration: DesignConfig
                                                .boxDecorationButtonColor(
                                                    ColorsRes.white
                                                        .withOpacity(0.7),
                                                    ColorsRes.white
                                                        .withOpacity(0.6),
                                                    50),
                                            child: Center(
                                                child: Icon(Icons.arrow_back,
                                                    color:
                                                        ColorsRes.grayColor))),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _controller!.nextPage(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.linear);
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Card(
                                        color: ColorsRes.white.withOpacity(0.7),
                                        elevation: 5,
                                        shadowColor: ColorsRes.iconColor
                                            .withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Container(
                                            height: 50,
                                            width: 50,
                                            padding: EdgeInsets.all(10.0),
                                            decoration: DesignConfig
                                                .boxDecorationButtonColor(
                                                    ColorsRes.white
                                                        .withOpacity(0.7),
                                                    ColorsRes.white
                                                        .withOpacity(0.6),
                                                    50),
                                            child: Center(
                                                child: Icon(Icons.arrow_forward,
                                                    color:
                                                        ColorsRes.grayColor))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget category() {
    return SizedBox(
        width: double.infinity,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, right: 0),
                                child: SizedBox(
                                  height: 200,
                                  child: Stack(children: <Widget>[
                                    Card(
                                      shape: DesignConfig.setRoundedBorder(
                                          Colors.transparent, 30, false),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: OctoImage(
                                        image: CachedNetworkImageProvider(
                                            categoryList[index].image!),
                                        placeholderBuilder:
                                            OctoPlaceholder.blurHash(
                                          categoryList[index].blurUrl!,
                                        ),
                                        width: double.maxFinite,
                                        height: double.maxFinite,
                                        errorBuilder: OctoError.icon(
                                            color: ColorsRes.bottomColor),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(
                                            left: 20.0, bottom: 20.0),
                                        alignment: Alignment.bottomLeft,
                                        child: GlassBox(
                                            redius: 40.0,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.9,
                                            height: 50,
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20)),
                                                          child: OctoImage(
                                                            image: CachedNetworkImageProvider(
                                                                categoryList[
                                                                        index]
                                                                    .smallImage!),
                                                            placeholderBuilder:
                                                                OctoPlaceholder
                                                                    .blurHash(
                                                              categoryList[
                                                                      index]
                                                                  .blurUrlSmall!,
                                                            ),
                                                            errorBuilder:
                                                                OctoError.icon(
                                                                    color: ColorsRes
                                                                        .bottomColor),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child: Text(
                                                            categoryList[index]
                                                                .name!,
                                                            style: TextStyle(
                                                                color: ColorsRes
                                                                    .bottomColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 18),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ))))
                                  ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailActivity(id: index, type: "category"),
                      ),
                    );
                  });
            }));
  }

  Widget data() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            snap: false,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "",
                  style: TextStyle(
                      color: ColorsRes.white, fontSize: 0), //TextStyle
                ), //Text
                background: Stack(children: [
                  slider(),
                ])),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationActivity(),
                    ),
                  );
                },
                child: Container(
                    padding: EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    child: GlassBox(
                        redius: 40.0,
                        width: 50,
                        height: 50,
                        child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                  "assets/images/fullApps/worldTour/svg/notifications_icon.svg"),
                            )))),
              ), //IconButton//IconButton
            ], //FlexibleSpaceBar
            expandedHeight: MediaQuery.of(context).size.height / 2,
            backgroundColor: Colors.transparent.withOpacity(0.02),
            shadowColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Container(
                  padding: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: GlassBox(
                      redius: 40.0,
                      width: 50,
                      height: 50,
                      child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                                "assets/images/fullApps/worldTour/svg/drawer_icon.svg"),
                          )))),
            ) //IconButton
            ), //SliverAppBar
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //slider(),
                  topTripsList.isNotEmpty
                      ? Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: 15, start: 10, end: 10),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      StringsRes.topTripsText,
                                      style: TextStyle(
                                          color: ColorsRes.bottomColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Spacer(), // Defaults to a flex of one.
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        start: 5, top: 5, bottom: 5),
                                    child: GestureDetector(
                                      child: Row(
                                        children: [
                                          Text(StringsRes.exploreText,
                                              style: TextStyle(
                                                  color: ColorsRes.grayColor
                                                      .withOpacity(0.5),
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 16)),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: ColorsRes.blueColor,
                                            size: 15,
                                          )
                                        ],
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                ]),
                                topTrip(),
                              ]))
                      : Container(),
                  categoryList.isNotEmpty
                      ? Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: 15, start: 10, end: 10),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      StringsRes.categoryText,
                                      style: TextStyle(
                                          color: ColorsRes.bottomColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Spacer(), // Defaults to a flex of one.
                                ]),
                                category(),
                              ]))
                      : Container(),
                ])
          ]),
          //]) //SliverChildBuildDelegate
        )
      ], //<Widget>[]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      drawerScrimColor: Colors.transparent,
      drawer: DesignConfig.drawer(_scaffoldKey, context),
      body: SizedBox(
        width: double.infinity,
        child: data(),
      ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
