import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/MainActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/PreviewActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBox.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/model/CategoryModel.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/model/SliderModel.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/model/TopTripsModel.dart';

class DetailActivity extends StatefulWidget {
  int? id;
  String? type;
  DetailActivity({Key? key, this.id, this.type}) : super(key: key);

  @override
  _DetailActivityState createState() => _DetailActivityState();
}

class _DetailActivityState extends State<DetailActivity>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  PageController? _controller;
  CarouselController buttonCarouselController = CarouselController();
  bool descTextShowFlag = false;
  TabController? _tabController;
  int _activeIndex = 0;
  String? _currentImage;
  String? _currentImageBlurUrl;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _tabController = TabController(vsync: this, length: 3);
    _tabController!.addListener(() {
      setState(() {
        _activeIndex = _tabController!.index;
      });
    });
    _currentImage = widget.type == "slider"
        ? sliderList[widget.id!].image
        : widget.type == "toptrips"
            ? topTripsList[widget.id!].image
            : widget.type == "category"
                ? categoryList[widget.id!].image
                : "";
    _currentImageBlurUrl = widget.type == "slider"
        ? sliderList[widget.id!].image
        : widget.type == "toptrips"
            ? topTripsList[widget.id!].image
            : widget.type == "category"
                ? categoryList[widget.id!].image
                : "";
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
                child: Icon(Icons.arrow_back, color: ColorsRes.bottomColor)),
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
                child: Icon(Icons.arrow_forward, color: ColorsRes.bottomColor)),
          ),
        ),
      ]),
    ]);
  }

  Widget reviewData() {
    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: Text(StringsRes.reviewsText,
                    style: TextStyle(
                        fontSize: 25,
                        color: ColorsRes.bottomColor,
                        fontWeight: FontWeight.normal)),
              )),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: DesignConfig.displayRatingFull("5.0", true),
              )),
        ],
      ),
      ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: widget.type == "slider"
              ? sliderList[widget.id!].reviewList!.length
              : widget.type == "toptrips"
                  ? topTripsList[widget.id!].reviewList!.length
                  : widget.type == "category"
                      ? categoryList[widget.id!].reviewList!.length
                      : "" as int?,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: DesignConfig.boxDecorationButtonColor(
                  ColorsRes.white.withOpacity(0.7),
                  ColorsRes.white.withOpacity(0.6),
                  40),
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                widget.type == "slider"
                                    ? sliderList[widget.id!]
                                        .reviewList![index]
                                        .name!
                                    : widget.type == "toptrips"
                                        ? topTripsList[widget.id!]
                                            .reviewList![index]
                                            .name!
                                        : widget.type == "category"
                                            ? categoryList[widget.id!]
                                                .reviewList![index]
                                                .name!
                                            : "",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ColorsRes.bottomColor,
                                    fontWeight: FontWeight.bold)),
                          )),
                      Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DesignConfig.displayRatingFull(
                                widget.type == "slider"
                                    ? sliderList[widget.id!]
                                        .reviewList![index]
                                        .rating
                                    : widget.type == "toptrips"
                                        ? topTripsList[widget.id!]
                                            .reviewList![index]
                                            .rating
                                        : widget.type == "category"
                                            ? categoryList[widget.id!]
                                                .reviewList![index]
                                                .rating
                                            : "0.0",
                                true),
                          )),
                    ],
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 10.0),
                        child: Text(
                            widget.type == "slider"
                                ? sliderList[widget.id!]
                                    .reviewList![index]
                                    .description!
                                : widget.type == "toptrips"
                                    ? topTripsList[widget.id!]
                                        .reviewList![index]
                                        .description!
                                    : widget.type == "category"
                                        ? categoryList[widget.id!]
                                            .reviewList![index]
                                            .description!
                                        : "",
                            style: TextStyle(
                                fontSize: 15,
                                color: ColorsRes.iconColor,
                                fontWeight: FontWeight.normal)),
                      )),
                ],
              ),
            );
          }),
    ]));
  }

  Widget hotelImage() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.9,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PreviewActivity(
                    id: widget.id,
                    type: widget.type,
                    image: widget.type == "slider"
                        ? sliderList[widget.id!].image
                        : widget.type == "toptrips"
                            ? topTripsList[widget.id!].image
                            : widget.type == "category"
                                ? categoryList[widget.id!].image
                                : "",
                    blurUrl: widget.type == "slider"
                        ? sliderList[widget.id!].blurUrl
                        : widget.type == "toptrips"
                            ? topTripsList[widget.id!].blurUrl
                            : widget.type == "category"
                                ? categoryList[widget.id!].blurUrl
                                : "",
                    localimg: widget.type == "slider"
                        ? sliderList[widget.id!].localimg
                        : widget.type == "toptrips"
                            ? topTripsList[widget.id!].localimg
                            : widget.type == "category"
                                ? categoryList[widget.id!].localimg
                                : "",
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              child: OctoImage(
                image: CachedNetworkImageProvider(_currentImage!),
                placeholderBuilder: OctoPlaceholder.blurHash(
                  _currentImageBlurUrl!,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                errorBuilder: OctoError.icon(color: ColorsRes.bottomColor),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 7.5,
          margin: EdgeInsets.only(
              left: 10.0, top: MediaQuery.of(context).size.height * .38),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(flex: 3, child: preview()),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 80,
                  child: GestureDetector(
                      child: Container(
                        width: 80,
                        height: 80,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: GlassBox(
                          redius: 20.0,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 7.5,
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Card(
                              shape: DesignConfig.setRoundedBorder(
                                  Colors.transparent, 10, false),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Stack(
                                children: [
                                  OctoImage(
                                    image: CachedNetworkImageProvider(
                                      widget.type == "slider"
                                          ? sliderList[widget.id!]
                                              .previewImageList![1]
                                              .image!
                                          : widget.type == "toptrips"
                                              ? topTripsList[widget.id!]
                                                  .previewImageList![1]
                                                  .image!
                                              : widget.type == "category"
                                                  ? categoryList[widget.id!]
                                                      .previewImageList![1]
                                                      .image!
                                                  : "",
                                    ),
                                    placeholderBuilder:
                                        OctoPlaceholder.blurHash(
                                      widget.type == "slider"
                                          ? sliderList[widget.id!]
                                              .previewImageList![1]
                                              .blurUrl!
                                          : widget.type == "toptrips"
                                              ? topTripsList[widget.id!]
                                                  .previewImageList![1]
                                                  .blurUrl!
                                              : widget.type == "category"
                                                  ? categoryList[widget.id!]
                                                      .previewImageList![1]
                                                      .blurUrl!
                                                  : "",
                                    ),
                                    width: double.maxFinite,
                                    height: 80,
                                    errorBuilder: OctoError.icon(
                                        color: ColorsRes.bottomColor),
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    decoration:
                                        DesignConfig.boxDecorationContainer(
                                            ColorsRes.black.withOpacity(0.5),
                                            10),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "+${widget.type == "slider" ? (sliderList[widget.id!].previewImageList!.length - 3).toString() : widget.type == "toptrips" ? (topTripsList[widget.id!].previewImageList!.length - 3).toString() : widget.type == "category" ? (categoryList[widget.id!].previewImageList!.length - 3).toString() : ""}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: ColorsRes.white,
                                          fontWeight: FontWeight.w500),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PreviewActivity(
                              id: widget.id,
                              type: widget.type,
                              image: widget.type == "slider"
                                  ? sliderList[widget.id!].image
                                  : widget.type == "toptrips"
                                      ? topTripsList[widget.id!].image
                                      : widget.type == "category"
                                          ? categoryList[widget.id!].image
                                          : "",
                              blurUrl: widget.type == "slider"
                                  ? sliderList[widget.id!].blurUrl
                                  : widget.type == "toptrips"
                                      ? topTripsList[widget.id!].blurUrl
                                      : widget.type == "category"
                                          ? categoryList[widget.id!].blurUrl
                                          : "",
                              localimg: widget.type == "slider"
                                  ? sliderList[widget.id!].localimg
                                  : widget.type == "toptrips"
                                      ? topTripsList[widget.id!].localimg
                                      : widget.type == "category"
                                          ? categoryList[widget.id!].localimg
                                          : "",
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }

  Widget data() {
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          snap: false,
          pinned: true,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "",
                style:
                    TextStyle(color: ColorsRes.white, fontSize: 28), //TextStyle
              ), //Text
              background: Stack(children: [
                hotelImage(),
              ])),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => MainActivity(id: 2)));
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
                            child: Icon(Icons.favorite_border,
                                color: ColorsRes.bottomColor),
                          )))),
            ), //IconButton//IconButton
          ], //FlexibleSpaceBar
          expandedHeight: MediaQuery.of(context).size.height / 2,
          backgroundColor: Colors.transparent.withOpacity(0.02),
          shadowColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
                          child: Icon(Icons.arrow_back_ios_sharp,
                              color: ColorsRes.bottomColor),
                        )))),
          ) //IconButton
          ), //SliverAppBar
      SliverList(
          delegate: SliverChildListDelegate(
        [
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //slider(),
                Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                                widget.type == "slider"
                                    ? sliderList[widget.id!].name!
                                    : widget.type == "toptrips"
                                        ? topTripsList[widget.id!].name!
                                        : widget.type == "category"
                                            ? categoryList[widget.id!].name!
                                            : "",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: ColorsRes.bottomColor,
                                    fontWeight: FontWeight.normal)),
                          )),
                      Row(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 10.0, bottom: 10.0),
                                child: Text(
                                    widget.type == "slider"
                                        ? sliderList[widget.id!].price!
                                        : widget.type == "toptrips"
                                            ? topTripsList[widget.id!].price!
                                            : widget.type == "category"
                                                ? categoryList[widget.id!]
                                                    .price!
                                                : "",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: ColorsRes.iconColor,
                                        fontWeight: FontWeight.bold)),
                              )),
                          Padding(
                            padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
                            child: Text("/person",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: ColorsRes.iconColor, fontSize: 14)),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {},
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 50,
                                    decoration:
                                        DesignConfig.boxDecorationButtonColor(
                                            ColorsRes.grayColor
                                                .withOpacity(0.2),
                                            ColorsRes.grayColor
                                                .withOpacity(0.2),
                                            20),
                                    alignment: AlignmentDirectional.center,
                                    margin: EdgeInsets.only(left: 20.0),
                                    padding: EdgeInsets.all(15.0),
                                    child: SvgPicture.asset(
                                        "assets/images/fullApps/worldTour/svg/heart.svg"),
                                  )),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: GestureDetector(
                              onTap: () {},
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration:
                                        DesignConfig.boxDecorationButtonColor(
                                            ColorsRes.blueColor,
                                            ColorsRes.blueColor,
                                            20),
                                    alignment: AlignmentDirectional.center,
                                    margin: EdgeInsets.only(right: 20.0),
                                    padding: EdgeInsets.only(
                                        top: 15.0, bottom: 15.0),
                                    child: Text(
                                      StringsRes.bookNowText,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorsRes.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                            widget.type == "slider"
                                ? sliderList[widget.id!].description!
                                : widget.type == "toptrips"
                                    ? topTripsList[widget.id!].description!
                                    : widget.type == "category"
                                        ? categoryList[widget.id!].description!
                                        : "",
                            maxLines: descTextShowFlag ? null : 5,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: ColorsRes.iconColor, fontSize: 14)),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            descTextShowFlag = !descTextShowFlag;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              descTextShowFlag
                                  ? Text(
                                      StringsRes.readLessText,
                                      style: TextStyle(
                                          color: ColorsRes.iconColor,
                                          fontSize: 14),
                                    )
                                  : Text(StringsRes.readMoreText,
                                      style: TextStyle(
                                        color: ColorsRes.iconColor,
                                        fontSize: 14,
                                      ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: _activeIndex == 1
                            ? MediaQuery.of(context).size.height / 1
                            : MediaQuery.of(context).size.height / 2.2,
                        width: MediaQuery.of(context).size.width,
                        decoration: DesignConfig.boxDecorationIntroductionColor(
                            ColorsRes.grayColor.withOpacity(0.2),
                            ColorsRes.grayColor.withOpacity(0.2),
                            40),
                        margin: EdgeInsets.only(top: 20.0),
                        //child: GlassBoxCurve(height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
                        child: DefaultTabController(
                            length: 3,
                            initialIndex: _activeIndex,
                            child: SingleChildScrollView(
                                physics: NeverScrollableScrollPhysics(),
                                child: Column(children: [
                                  Stack(
                                    fit: StackFit.passthrough,
                                    alignment: Alignment.bottomCenter,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                24,
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                24),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color: ColorsRes.grayColor
                                                    .withOpacity(0.5),
                                                width: 2.0),
                                          ),
                                        ),
                                      ),
                                      TabBar(
                                        physics:
                                            AlwaysScrollableScrollPhysics(),
                                        isScrollable: true,
                                        controller: _tabController,
                                        labelColor: ColorsRes.bottomColor,
                                        unselectedLabelColor:
                                            ColorsRes.grayColor,
                                        labelStyle: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                        indicatorColor: ColorsRes.white,
                                        tabs: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 20.0,
                                                top: 20.0,
                                                left: 5.0,
                                                right: 5.0),
                                            child: Text(StringsRes.specsText,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 20.0,
                                                top: 20.0,
                                                left: 5.0,
                                                right: 5.0),
                                            child: Text(StringsRes.reviewsText,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 20.0,
                                                top: 20.0,
                                                left: 5.0,
                                                right: 5.0),
                                            child: Text(StringsRes.relatedText,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: _activeIndex == 1
                                        ? MediaQuery.of(context).size.height *
                                            .89
                                        : MediaQuery.of(context).size.height /
                                            2.7,
                                    child: TabBarView(
                                        controller: _tabController,
                                        children: [
                                          space(),
                                          reviewData(),
                                          relatadeData(),
                                        ]),
                                  )
                                ]))),
                      ),
                    ])
              ]), //SliverChildBuildDelegate
        ], //<Widget>[]
      ))
    ]);
  }

  Widget preview() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.type == "slider"
              ? sliderList[widget.id!].previewImageList!.length > 3
                  ? 3
                  : sliderList[widget.id!].previewImageList!.length
              : widget.type == "toptrips"
                  ? topTripsList[widget.id!].previewImageList!.length > 3
                      ? 3
                      : topTripsList[widget.id!].previewImageList!.length
                  : widget.type == "category"
                      ? categoryList[widget.id!].previewImageList!.length > 3
                          ? 3
                          : categoryList[widget.id!].previewImageList!.length
                      : "" as int?,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Container(
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: GlassBox(
                    redius: 20.0,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 7.5,
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Card(
                        shape: DesignConfig.setRoundedBorder(
                            Colors.transparent, 10, false),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: OctoImage(
                          image: CachedNetworkImageProvider(
                            widget.type == "slider"
                                ? sliderList[widget.id!]
                                    .previewImageList![index]
                                    .image!
                                : widget.type == "toptrips"
                                    ? topTripsList[widget.id!]
                                        .previewImageList![index]
                                        .image!
                                    : widget.type == "category"
                                        ? categoryList[widget.id!]
                                            .previewImageList![index]
                                            .image!
                                        : "",
                          ),
                          placeholderBuilder: OctoPlaceholder.blurHash(
                            widget.type == "slider"
                                ? sliderList[widget.id!]
                                    .previewImageList![index]
                                    .blurUrl!
                                : widget.type == "toptrips"
                                    ? topTripsList[widget.id!]
                                        .previewImageList![index]
                                        .blurUrl!
                                    : widget.type == "category"
                                        ? categoryList[widget.id!]
                                            .previewImageList![index]
                                            .blurUrl!
                                        : "",
                          ),
                          width: double.maxFinite,
                          height: 80,
                          errorBuilder:
                              OctoError.icon(color: ColorsRes.bottomColor),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _currentImage = widget.type == "slider"
                        ? sliderList[widget.id!].previewImageList![index].image
                        : widget.type == "toptrips"
                            ? topTripsList[widget.id!]
                                .previewImageList![index]
                                .image
                            : widget.type == "category"
                                ? categoryList[widget.id!]
                                    .previewImageList![index]
                                    .image
                                : "";
                    _currentImageBlurUrl = widget.type == "slider"
                        ? sliderList[widget.id!]
                            .previewImageList![index]
                            .blurUrl
                        : widget.type == "toptrips"
                            ? topTripsList[widget.id!]
                                .previewImageList![index]
                                .blurUrl
                            : widget.type == "category"
                                ? categoryList[widget.id!]
                                    .previewImageList![index]
                                    .blurUrl
                                : "";
                  });
                });
          }),
    );
  }

  Widget relatadeData() {
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

  Widget space() {
    return Container(
      height: 270,
      margin: EdgeInsets.only(left: 8),
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, top: 10.0),
          child: Text(StringsRes.spaceText,
              style: TextStyle(
                  color: ColorsRes.bottomColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.left,
              overflow: TextOverflow.visible),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return navigationPage() as Future<bool>;
      },
      child: Scaffold(
        extendBody: true,
        body: SizedBox(
          width: double.infinity,
          child: data(),
        ),
      ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
