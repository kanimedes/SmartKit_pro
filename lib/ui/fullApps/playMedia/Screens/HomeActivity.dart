import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Model/NewMovie_Model.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Model/RecommendMovieModel.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Model/ThisMonthMovie_Model.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Model/WatchList_Model.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/MovieDetailActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/NewMovieActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/NotificationActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/ProfileActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/RecommendedMovieActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/ThisMonthMovieActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/TopScoreMovieActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/UpNextMovieActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  int currentIndex = 0;
  PageController? _controller;

  late List<List> diffsliderlist;

  @override
  void initState() {
    super.initState();
    diffsliderlist = [];
    for (int i = 0; i < 7; i++) {
      sliderlist.shuffle();
      List newlist = [];
      newlist.addAll(sliderlist);
      diffsliderlist.add(newlist);
    }
    _controller = PageController(initialPage: 0);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  Widget newMovie() {
    return Container(
      height: 200,
      margin: EdgeInsets.only(left: 8),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: newMovieList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Container(
                  width: 120,
                  height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Stack(children: <Widget>[
                    Card(
                      shape: DesignConfig.setRoundedBorder(
                          Colors.transparent, 0, false),
                      margin: EdgeInsets.only(top: 15, right: 12),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: OctoImage(
                        image: CachedNetworkImageProvider(
                          newMovieList[index].imgurl!,
                        ),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          newMovieList[index].hash!,
                        ),
                        errorBuilder: OctoError.icon(color: Colors.black),
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        height: double.maxFinite,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                                "assets/images/fullApps/playMedia/svg/bookmark01.svg"),
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            )
                          ],
                        )),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Icon(
                              newMovieList[index].like == "1"
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: ColorsRes.yellowColor,
                            ))),
                  ]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailActivity(
                        id: index,
                        name: newMovieList[index].name,
                        image: newMovieList[index].image,
                        type: "newlist",
                        imgurl: newMovieList[index].imgurl,
                        hash: newMovieList[index].hash,
                      ),
                    ),
                  );
                });
          }),
    );
  }

  Widget slider(List cursliderlist) {
    return SizedBox(
      height: 200,
      child: Stack(children: [
        PageView.builder(
          controller: _controller,
          itemCount: cursliderlist.length > 5 ? 5 : cursliderlist.length,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (_, i) {
            return GestureDetector(
                child: OctoImage(
                  image: CachedNetworkImageProvider(
                    cursliderlist[i]['imgurl'],
                  ),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    cursliderlist[i]['hash'],
                  ),
                  errorBuilder: OctoError.icon(color: Colors.black),
                  fit: BoxFit.fill,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailActivity(
                          id: i,
                          name: cursliderlist[i]['name'],
                          image: cursliderlist[i]['image'],
                          imgurl: cursliderlist[i]['imgurl'],
                          hash: cursliderlist[i]['hash'],
                          type: "watchlist"),
                    ),
                  );
                });
          },
        ),
        Container(
          margin: EdgeInsets.only(
              left: 20, top: MediaQuery.of(context).size.height * .22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              cursliderlist.length > 5 ? 5 : cursliderlist.length,
              (index) => buildDot(index, context),
            ),
          ),
        )
      ]),
    );
  }

  Container buildDot(int index, BuildContext context) {
    print(index.toString() + currentIndex.toString());
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsets.only(right: 5),
      decoration: currentIndex == index
          ? DesignConfig.boxDecorationContainer(ColorsRes.white, 10)
          : DesignConfig.boxDecorationBorderButtonColor(ColorsRes.white, 10),
    );
  }

  Widget thisMonthMovie() {
    return Container(
        margin: EdgeInsets.only(left: 8),
        child: GridView.count(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          crossAxisCount: 3,
          shrinkWrap: true,
          childAspectRatio: 0.6,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          physics: ClampingScrollPhysics(),
          children: List.generate(thisMonthMovieList.length, (index) {
            return GestureDetector(
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(children: <Widget>[
                        Card(
                          margin: EdgeInsets.all(0),
                          shape: DesignConfig.setRoundedBorder(
                              Colors.transparent, 0, false),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: OctoImage(
                            image: CachedNetworkImageProvider(
                              thisMonthMovieList[index].imgurl!,
                            ),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              thisMonthMovieList[index].hash!,
                            ),
                            errorBuilder: OctoError.icon(color: Colors.black),
                            fit: BoxFit.cover,
                            width: double.maxFinite,
                            height: double.maxFinite,
                          ),
                        ),
                        SvgPicture.asset(
                            thisMonthMovieList[index].like == "1"
                                ? "assets/images/fullApps/playMedia/svg/bookmark.svg"
                                : "assets/images/fullApps/playMedia/svg/bookmark01.svg",
                            width: 30,
                            height: 30),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 5.0, right: 3),
                                child: Icon(
                                  thisMonthMovieList[index].like == "1"
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: ColorsRes.yellowColor,
                                ))),
                      ]),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 1),
                      height: 42,
                      child: Text(thisMonthMovieList[index].name!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: ColorsRes.white,
                              fontWeight: FontWeight.normal)),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailActivity(
                        id: index,
                        name: thisMonthMovieList[index].name,
                        image: thisMonthMovieList[index].image,
                        type: "thismonthlist",
                        imgurl: thisMonthMovieList[index].imgurl,
                        hash: thisMonthMovieList[index].hash,
                      ),
                    ),
                  );
                });
          }),
        ));
  }

  Widget recommededMovie() {
    return Container(
      height: 200,
      margin: EdgeInsets.only(left: 8),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommdedMovieList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: Container(
                  width: 200,
                  height: 170,
                  //margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  margin: EdgeInsets.only(right: 15),
                  child: Stack(children: <Widget>[
                    Card(
                      margin: EdgeInsets.all(0),
                      shape: DesignConfig.setRoundedBorder(
                          Colors.transparent, 0, false),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: OctoImage(
                        image: CachedNetworkImageProvider(
                          recommdedMovieList[index].imgurl!,
                        ),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          recommdedMovieList[index].hash!,
                        ),
                        errorBuilder: OctoError.icon(color: Colors.black),
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        height: double.maxFinite,
                      ),
                    ),
                    recommdedMovieList[index].bookmarked!
                        ? SvgPicture.asset(
                            "assets/images/fullApps/playMedia/svg/bookmark.svg")
                        : Stack(
                            children: [
                              SvgPicture.asset(
                                  "assets/images/fullApps/playMedia/svg/bookmark01.svg"),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              )
                            ],
                          ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                            padding:
                                const EdgeInsets.only(right: 10, bottom: 10.0),
                            child: Icon(
                              recommdedMovieList[index].like == "1"
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: ColorsRes.yellowColor,
                            ))),
                  ]),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailActivity(
                        id: index,
                        name: recommdedMovieList[index].name,
                        image: recommdedMovieList[index].image,
                        type: "recommdedmovielist",
                        imgurl: recommdedMovieList[index].imgurl,
                        hash: recommdedMovieList[index].hash,
                      ),
                    ),
                  );
                });
          }),
    );
  }

  Widget topScoreMovie() {
    return Container(
        width: double.infinity,
        color: ColorsRes.backgroundColor,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: topScoreList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 0.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Stack(children: <Widget>[
                              Card(
                                margin: EdgeInsets.only(bottom: 0.0),
                                shape: DesignConfig.setRoundedBorder(
                                    Colors.transparent, 0, false),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: OctoImage(
                                  image: CachedNetworkImageProvider(
                                    topScoreList[index].imgurl!,
                                  ),
                                  placeholderBuilder: OctoPlaceholder.blurHash(
                                    topScoreList[index].hash!,
                                  ),
                                  errorBuilder:
                                      OctoError.icon(color: Colors.black),
                                  fit: BoxFit.cover,
                                  width: 150,
                                  height: 100,
                                ),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SvgPicture.asset(
                                      "assets/images/fullApps/playMedia/svg/bookmark01.svg"),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 18,
                                  )
                                ],
                              ),
                              Positioned.fill(
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, bottom: 10.0),
                                        child: Icon(
                                          topScoreList[index].like == "1"
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: ColorsRes.yellowColor,
                                        ))),
                              ),
                            ]),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(topScoreList[index].name!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .merge(TextStyle(
                                              color: ColorsRes.white,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5))),
                                  SizedBox(height: 3),
                                  Text(topScoreList[index].description!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .merge(TextStyle(
                                            color: Colors.grey.withOpacity(0.5),
                                          ))),
                                  SizedBox(height: 5),
                                  Text(topScoreList[index].time!,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: ColorsRes.textColor
                                              .withOpacity(0.7),
                                          fontWeight: FontWeight.normal)),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Icon(Icons.star,
                                                size: 20,
                                                color: ColorsRes.yellowColor),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(watchList[index].rating!,
                                                style: TextStyle(
                                                    color: ColorsRes.white,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Icon(
                                                Icons
                                                    .arrow_drop_down_circle_outlined,
                                                size: 20,
                                                color: ColorsRes.textColor
                                                    .withOpacity(0.7)),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(watchList[index].duration!,
                                                style: TextStyle(
                                                    color: ColorsRes.white,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Divider(
                            color: ColorsRes.textColor.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailActivity(
                          id: index,
                          name: topScoreList[index].name,
                          image: topScoreList[index].image,
                          type: "toplist",
                          imgurl: topScoreList[index].imgurl,
                          hash: topScoreList[index].hash,
                        ),
                      ),
                    );
                  });
            }));
  }

  Widget upNextMonthMovie() {
    return Container(
        width: double.infinity,
        color: ColorsRes.backgroundColor,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: watchList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 0.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Stack(children: <Widget>[
                              Card(
                                margin: EdgeInsets.only(bottom: 0.0),
                                shape: DesignConfig.setRoundedBorder(
                                    Colors.transparent, 0, false),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: OctoImage(
                                  image: CachedNetworkImageProvider(
                                    watchList[index].imgurl!,
                                  ),
                                  placeholderBuilder: OctoPlaceholder.blurHash(
                                    watchList[index].hash!,
                                  ),
                                  errorBuilder:
                                      OctoError.icon(color: Colors.black),
                                  fit: BoxFit.cover,
                                  width: 150,
                                  height: 100,
                                ),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SvgPicture.asset(
                                      "assets/images/fullApps/playMedia/svg/bookmark01.svg"),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 18,
                                  )
                                ],
                              ),
                              Positioned.fill(
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, bottom: 10.0),
                                        child: Icon(
                                          watchList[index].like == "1"
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: ColorsRes.yellowColor,
                                        ))),
                              ),
                            ]),
                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(watchList[index].name!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .merge(TextStyle(
                                              color: ColorsRes.white,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5))),
                                  SizedBox(height: 3),
                                  Text(watchList[index].description!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .merge(TextStyle(
                                            color: Colors.grey.withOpacity(0.5),
                                          ))),
                                  SizedBox(height: 5),
                                  Text(watchList[index].time!,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: ColorsRes.textColor
                                              .withOpacity(0.7),
                                          fontWeight: FontWeight.normal)),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Icon(Icons.star,
                                                size: 20,
                                                color: ColorsRes.yellowColor),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(watchList[index].rating!,
                                                style: TextStyle(
                                                    color: ColorsRes.white,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Icon(
                                                Icons
                                                    .arrow_drop_down_circle_outlined,
                                                size: 20,
                                                color: ColorsRes.textColor
                                                    .withOpacity(0.7)),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(watchList[index].duration!,
                                                style: TextStyle(
                                                    color: ColorsRes.white,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Divider(
                            color: ColorsRes.textColor.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailActivity(
                          id: index,
                          name: watchList[index].name,
                          image: watchList[index].image,
                          type: "watchlist",
                          imgurl: watchList[index].imgurl,
                          hash: watchList[index].hash,
                        ),
                      ),
                    );
                  });
            }));
  }

  Widget showMovieData(List msliderlist) {
    //currentIndex = 0;
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            slider(msliderlist),
            if (newMovieList.isNotEmpty)
              Padding(
                  padding:
                      EdgeInsetsDirectional.only(top: 15, start: 10, end: 10),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Row(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          StringsRes.newText,
                          style: TextStyle(
                              color: ColorsRes.yellowColor,
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
                              Text(StringsRes.moreText,
                                  style: TextStyle(
                                      color: ColorsRes.yellowColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16)),
                              Icon(Icons.arrow_forward_ios,
                                  color: ColorsRes.yellowColor, size: 15)
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewMovieActivity(),
                              ),
                            );
                          },
                        ),
                      ),
                    ]),
                    newMovie(),
                  ])),
            if (recommdedMovieList.isNotEmpty)
              Padding(
                  padding:
                      EdgeInsetsDirectional.only(top: 15, start: 10, end: 10),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Row(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          StringsRes.recommendedText,
                          style: TextStyle(
                              color: ColorsRes.yellowColor,
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
                              Text(StringsRes.moreText + " ",
                                  style: TextStyle(
                                      color: ColorsRes.yellowColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16)),
                              Icon(Icons.arrow_forward_ios,
                                  color: ColorsRes.yellowColor, size: 15)
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RecommendedMovieActivity(),
                              ),
                            );
                          },
                        ),
                      ),
                    ]),
                    recommededMovie(),
                  ])),
            if (topScoreList.isNotEmpty)
              Padding(
                  padding:
                      EdgeInsetsDirectional.only(top: 15, start: 10, end: 10),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Row(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          StringsRes.topScoreText,
                          style: TextStyle(
                              color: ColorsRes.yellowColor,
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
                              Text(StringsRes.moreText,
                                  style: TextStyle(
                                      color: ColorsRes.yellowColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16)),
                              Icon(Icons.arrow_forward_ios,
                                  color: ColorsRes.yellowColor, size: 15)
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TopScoreMovieActivity(),
                              ),
                            );
                          },
                        ),
                      ),
                    ]),
                    topScoreMovie(),
                  ])),
            if (thisMonthMovieList.isNotEmpty)
              Padding(
                  padding:
                      EdgeInsetsDirectional.only(top: 15, start: 10, end: 10),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Row(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          StringsRes.thisMonthText,
                          style: TextStyle(
                              color: ColorsRes.yellowColor,
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
                              Text(StringsRes.moreText,
                                  style: TextStyle(
                                      color: ColorsRes.yellowColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16)),
                              Icon(Icons.arrow_forward_ios,
                                  color: ColorsRes.yellowColor, size: 15)
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ThisMonthMovieActivity(),
                              ),
                            );
                          },
                        ),
                      ),
                    ]),
                    thisMonthMovie(),
                  ])),
            if (watchList.isNotEmpty)
              Padding(
                  padding:
                      EdgeInsetsDirectional.only(top: 15, start: 10, end: 10),
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Row(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          StringsRes.upNextText,
                          style: TextStyle(
                              color: ColorsRes.yellowColor,
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
                              Text(StringsRes.moreText,
                                  style: TextStyle(
                                      color: ColorsRes.yellowColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16)),
                              Icon(Icons.arrow_forward_ios,
                                  color: ColorsRes.yellowColor, size: 15)
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpNextMovieActivity(),
                              ),
                            );
                          },
                        ),
                      ),
                    ]),
                    upNextMonthMovie(),
                  ])),
            SizedBox(height: 120)
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.backgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(StringsRes.homeText,
            style: TextStyle(
                fontSize: 20,
                color: ColorsRes.white,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: ColorsRes.backgroundColor,
        shadowColor: Colors.transparent,
        leading: Row(
          children: [
            Platform.isIOS
                ? Expanded(
                    child: BackButton(
                    color: ColorsRes.textColor,
                  ))
                : Text(""),
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationActivity(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.notifications_none,
                        color: ColorsRes.textColor.withOpacity(0.7), size: 30),
                  )),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                  "assets/images/fullApps/playMedia/svg/search-1.svg",
                  height: 30.0,
                  width: 30.0,
                  color: ColorsRes.textColor.withOpacity(0.7)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileActivity(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                  "assets/images/fullApps/playMedia/svg/acoount.svg",
                  height: 30.0,
                  width: 30.0,
                  color: ColorsRes.textColor.withOpacity(0.7)),
            ),
          ),
        ],
      ),
      body: DefaultTabController(
          length: 7,
          child: SingleChildScrollView(
              child: Column(children: [
            TabBar(
              physics: AlwaysScrollableScrollPhysics(),
              isScrollable: true,
              labelColor: ColorsRes.yellowColor,
              unselectedLabelColor: ColorsRes.textColor.withOpacity(0.7),
              labelStyle: Theme.of(context).textTheme.subtitle1,
              indicatorColor: ColorsRes.yellowColor,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(StringsRes.actionText,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(StringsRes.dramaText,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(StringsRes.adventureText,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(StringsRes.musicText,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(StringsRes.comedyText,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(StringsRes.horrorText,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(StringsRes.animatedText,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal)),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .85,
              child: TabBarView(children: [
                showMovieData(diffsliderlist[0]),
                showMovieData(diffsliderlist[1]),
                showMovieData(diffsliderlist[2]),
                showMovieData(diffsliderlist[3]),
                showMovieData(diffsliderlist[4]),
                showMovieData(diffsliderlist[5]),
                showMovieData(diffsliderlist[6]),
              ]),
            )
          ]))),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }

  List sliderlist = [
    {
      "name": "ANNO",
      "image": "assets/images/fullApps/playMedia/slider_1.jpg",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_1.jpg?alt=media&token=c041cdea-873d-4905-a687-348d9c2f4d88",
      "hash": "LmHBuQRjRjWW~pWBWAfko~Rkaxj]",
    },
    {
      "name": "John Wick",
      "image": "assets/images/fullApps/playMedia/slider_10.jpg",
      "hash": "L025+8xa009Z^lt755ELRkays:of",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_10.jpg?alt=media&token=5b838a2a-3954-44c0-a204-b11d04094d3c",
    },
    {
      "name": "The Croods",
      "image": "assets/images/fullApps/playMedia/slider_11.jpg",
      "hash": "LpHK*BogWZNGL4R-NHn\$F~s:Rlj[",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_11.jpg?alt=media&token=7fc3650c-981c-4c80-9d81-e1ac033e0510",
    },
    {
      "name": "THOR",
      "image": "assets/images/fullApps/playMedia/slider_12.jpg",
      "hash": "L01oqZaK00tlnOayS~kCI;bb\$*nO",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_12.jpg?alt=media&token=878ced6d-ddcd-4225-9718-4bab21184853",
    },
    {
      "name": "Tangled",
      "image": "assets/images/fullApps/playMedia/slider_13.jpg",
      "hash": "LDCs%I0\$+Eq[u%e8u6X.0-t8D*M{",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_13.jpg?alt=media&token=fcdfba60-367a-4900-bf19-fb5fae12db1c",
    },
    {
      "name": "Man Of Steel",
      "image": "assets/images/fullApps/playMedia/slider_14.jpg",
      "hash": "L95F5+DNV??w.AI9V?%hRiofjtWU",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_14.jpg?alt=media&token=6cd4348f-80cd-44da-9cc5-8298b56dc525",
    },
    {
      "name": "The Smurfs",
      "image": "assets/images/fullApps/playMedia/slider_15.jpg",
      "hash": "LPFYos-:NEg1~q-;NFkC%NW@t7Rl",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_15.jpg?alt=media&token=439a4398-cbf9-48e0-b97f-689d02caf126",
    },
    {
      "name": "Titanic",
      "image": "assets/images/fullApps/playMedia/slider_16.jpg",
      "hash": "L78DIS13,DJSNHRjs,R+0i}qK4wd",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_16.jpg?alt=media&token=cc2d6e46-2783-4e65-aebe-3be5d6dbdcb0",
    },
    {
      "name": "Frozen",
      "image": "assets/images/fullApps/playMedia/slider_17.jpg",
      "hash": "LjG^hQM|M{t7~pbvbbfkspaes:WV",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_17.jpg?alt=media&token=1e221302-cecd-4628-9feb-a8188ff49ff6",
    },
    {
      "name": "Pirates Of Caribbean",
      "image": "assets/images/fullApps/playMedia/slider_18.jpg",
      "hash": "LAF=mZ01D\$yDI-e=R+WB01~nR,R5",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_18.jpg?alt=media&token=e64a63f8-c318-43a7-ad8d-daaa7c7b55ba",
    },
    {
      "name": "Project Power",
      "image": "assets/images/fullApps/playMedia/slider_19.jpg",
      "hash": "L29PcjOO:,iQuh+HsRkW050oA:t\$",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_19.jpg?alt=media&token=3221583a-e90f-4693-9f19-4d8e1bf463b4",
    },
    {
      "name": "Skyfall",
      "image": "assets/images/fullApps/playMedia/slider_2.jpg",
      "hash": "LC8qNgD%00_3~qIU4n-;%MWBM{of",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_2.jpg?alt=media&token=98dd4c7e-51b2-46b0-9120-2b51c658bdce",
    },
    {
      "name": "Shrek",
      "image": "assets/images/fullApps/playMedia/slider_3.jpg",
      "hash": "LPFj~MWA%%o#1UogMxWB8_WDitn#",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_3.jpg?alt=media&token=bbde912a-cc79-44ec-a618-0a2980233257",
    },
    {
      "name": "Interstellar",
      "image": "assets/images/fullApps/playMedia/slider_4.jpg",
      "hash": "LGA,zk00of~qRjofayae00?bxu9F",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_4.jpg?alt=media&token=b99d58be-c808-4470-90dd-bc7c092f5b3c",
    },
    {
      "name": "Live.Die.Repeat",
      "image": "assets/images/fullApps/playMedia/slider_5.jpg",
      "hash": "LZJ%j=-o~UtQxtS5ENs.s:NHIpjs",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_5.jpg?alt=media&token=bfbe9dd6-e5e0-4ed8-9273-abe7a07f964b",
    },
    {
      "name": "Venom",
      "image": "assets/images/fullApps/playMedia/slider_6.jpg",
      "hash": "L37BTGjG00DO*0IUQ-RPNuNFI9tR",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_6.jpg?alt=media&token=90556821-a790-4be9-9316-0304b2d0620a",
    },
    {
      "name": "Godzilla vs Kong",
      "image": "assets/images/fullApps/playMedia/slider_7.jpg",
      "hash": "LfIg[jD2o~#l^*PAoMn\$IVoLV@nP",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_7.jpg?alt=media&token=f266040d-aa39-420d-8c84-4377262ac1b9",
    },
    {
      "name": "Alien",
      "image": "assets/images/fullApps/playMedia/slider_8.jpg",
      "hash": "L33bzII94m?w.SROD%%gRPkDozad",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_8.jpg?alt=media&token=363bd3b2-51a9-4493-8d38-160af1948c35",
    },
    {
      "name": "Mad Max: Fury Road",
      "image": "assets/images/fullApps/playMedia/slider_9.jpg",
      "hash": "LfKvZ:Men5S6~TnNRnayELoyX9n#",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_9.jpg?alt=media&token=4232549f-ed35-424f-997e-5d8bdd7d4ecd",
    },
    {
      "name": "Sky Lines",
      "image": "assets/images/fullApps/playMedia/slider_20.jpg",
      "hash": "LT6+|wo}MxWYyZo#R*a#j]f,aejY",
      "imgurl":
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_20.jpg?alt=media&token=ff519df3-f65f-4473-b01a-e929a29548f6",
    },
  ];
}
