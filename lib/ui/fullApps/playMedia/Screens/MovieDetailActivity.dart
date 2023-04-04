// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Model/Cast_Model.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Model/NewMovie_Model.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Model/ParentGuidLine_Model.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Model/RecommendMovieModel.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Model/ThisMonthMovie_Model.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Model/WatchList_Model.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/ReviewActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/VideoActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class MovieDetailActivity extends StatefulWidget {
  int? id;
  String? name, image, type, imgurl, hash;
  MovieDetailActivity(
      {Key? key,
      this.id,
      this.name,
      this.image,
      this.type,
      this.imgurl,
      this.hash})
      : super(key: key);

  @override
  _MovieDetailActivityState createState() => _MovieDetailActivityState();
}

class _MovieDetailActivityState extends State<MovieDetailActivity> {
  int currentIndex = 0;
  PageController? _controller;

  bool descTextShowFlag = false;

  @override
  void initState() {
    super.initState();
    castList.shuffle();
    _controller = PageController(initialPage: 0);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  Widget movieImage() {
    return SizedBox(
      width: double.maxFinite,
      height: 250,
      child: OctoImage(
        image: CachedNetworkImageProvider(
          widget.imgurl!,
        ),
        placeholderBuilder: OctoPlaceholder.blurHash(
          widget.hash!,
        ),
        errorBuilder: OctoError.icon(color: Colors.black),
        fit: BoxFit.contain,
      ),
    );
  }

  Widget displayMovieType() {
    return Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 10,
        runSpacing: 15.0,
        children: List.generate(
            widget.type == "recommdedmovielist"
                ? recommdedMovieList[widget.id!].movieTypeList!.length
                : widget.type == "watchlist"
                    ? watchList[widget.id!].movieTypeList!.length
                    : widget.type == "newlist"
                        ? newMovieList[widget.id!].movieTypeList!.length
                        : widget.type == "thismonthlist"
                            ? thisMonthMovieList[widget.id!]
                                .movieTypeList!
                                .length
                            : widget.type == "toplist"
                                ? topScoreList[widget.id!].movieTypeList!.length
                                : 0 >= 10
                                    ? 10
                                    : widget.type == "recommdedmovielist"
                                        ? recommdedMovieList[widget.id!]
                                            .movieTypeList!
                                            .length
                                        : widget.type == "watchlist"
                                            ? watchList[widget.id!]
                                                .movieTypeList!
                                                .length
                                            : widget.type == "newlist"
                                                ? newMovieList[widget.id!]
                                                    .movieTypeList!
                                                    .length
                                                : widget.type == "thismonthlist"
                                                    ? thisMonthMovieList[
                                                            widget.id!]
                                                        .movieTypeList!
                                                        .length
                                                    : widget.type == "toplist"
                                                        ? topScoreList[
                                                                widget.id!]
                                                            .movieTypeList!
                                                            .length
                                                        : 0,
            (i) => GestureDetector(
                  onTap: () {},
                  child: Container(
                      decoration: DesignConfig.boxDecorationBorderButtonColor(
                          ColorsRes.textColor, 50),
                      padding: EdgeInsetsDirectional.only(
                          start: 10, end: 10, top: 10, bottom: 10),
                      child: Text(
                          widget.type == "recommdedmovielist"
                              ? recommdedMovieList[widget.id!]
                                  .movieTypeList![i]
                                  .name!
                              : widget.type == "watchlist"
                                  ? watchList[widget.id!]
                                      .movieTypeList![i]
                                      .name!
                                  : widget.type == "newlist"
                                      ? newMovieList[widget.id!]
                                          .movieTypeList![i]
                                          .name!
                                      : widget.type == "thismonthlist"
                                          ? thisMonthMovieList[widget.id!]
                                              .movieTypeList![i]
                                              .name!
                                          : widget.type == "toplist"
                                              ? topScoreList[widget.id!]
                                                  .movieTypeList![i]
                                                  .name!
                                              : "".trim(),
                          style: TextStyle(
                            height: 1.0,
                            color: ColorsRes.white,
                            fontSize: 12,
                          ))),
                )));
  }

  Widget showCast() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 10),
      child: GridView.count(
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 0, top: 10),
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: List.generate(castList.length, (index) {
          return SizedBox(
              child: GestureDetector(
                  child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: EdgeInsets.only(bottom: 12, right: 10),
                      padding: EdgeInsets.all(2),
                      decoration: DesignConfig.boxDecorationContainer(
                          ColorsRes.white, 0),
                      child: OctoImage(
                        image: CachedNetworkImageProvider(
                          castList[index].imgurl!,
                        ),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          castList[index].hash!,
                        ),
                        errorBuilder: OctoError.icon(color: Colors.black),
                        fit: BoxFit.fill,
                      )),
                  onTap: () {}));
        }),
      ),
    );
  }

  Widget showVideos() {
    return Container(
      height: 150,
      margin: EdgeInsets.only(bottom: 8),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.type == "recommdedmovielist"
              ? recommdedMovieList[widget.id!].movieImageList!.length
              : widget.type == "watchlist"
                  ? watchList[widget.id!].movieImageList!.length
                  : widget.type == "newlist"
                      ? newMovieList[widget.id!].movieImageList!.length
                      : widget.type == "thismonthlist"
                          ? thisMonthMovieList[widget.id!]
                              .movieImageList!
                              .length
                          : widget.type == "toplist"
                              ? topScoreList[widget.id!].movieImageList!.length
                              : 0,
          itemBuilder: (BuildContext context, int index) {
            late var model;
            if (widget.type == "recommdedmovielist") {
              model = recommdedMovieList[widget.id!].movieImageList![index];
            } else if (widget.type == "watchlist") {
              model = watchList[widget.id!].movieImageList![index];
            } else if (widget.type == "newlist") {
              model = newMovieList[widget.id!].movieImageList![index];
            } else if (widget.type == "thismonthlist") {
              model = thisMonthMovieList[widget.id!].movieImageList![index];
            } else if (widget.type == "toplist") {
              model = topScoreList[widget.id!].movieImageList![index];
            }

            return GestureDetector(
                child: Container(
                  width: 170,
                  height: 150,
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(children: <Widget>[
                          Card(
                            shape: DesignConfig.setRoundedBorder(
                                Colors.transparent, 0, false),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: OctoImage(
                              image: CachedNetworkImageProvider(
                                model.imgurl,
                              ),
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                model.hash,
                              ),
                              errorBuilder: OctoError.icon(color: Colors.black),
                              fit: BoxFit.fill,
                              width: double.maxFinite,
                              height: double.maxFinite,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.play_circle_outline_outlined,
                                color: Colors.white, size: 40),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                onTap: () {});
          }),
    );
  }

  Widget showParentGuid() {
    return descTextShowFlag
        ? Container(
            height: 180,
            margin: EdgeInsets.only(bottom: 8),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: parentGuidLineList.length > 4
                    ? 4
                    : parentGuidLineList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      child: Row(
                        children: [
                          parentGuidLineList[index].status == "0"
                              ? Container(
                                  height: 20,
                                  width: 20,
                                  decoration:
                                      DesignConfig.boxDecorationContainer(
                                          ColorsRes.yellowColor, 0),
                                )
                              : Container(
                                  height: 20,
                                  width: 20,
                                  decoration:
                                      DesignConfig.boxDecorationContainer(
                                          Colors.green, 0),
                                ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(parentGuidLineList[index].name!,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: ColorsRes.white,
                                        fontWeight: FontWeight.normal)),
                              ))
                        ],
                      ),
                      onTap: () {});
                }))
        : Container(
            height: 250,
            margin: EdgeInsets.only(bottom: 8),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: parentGuidLineList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      child: Row(
                        children: [
                          parentGuidLineList[index].status == "0"
                              ? Container(
                                  height: 20,
                                  width: 20,
                                  decoration:
                                      DesignConfig.boxDecorationContainer(
                                          ColorsRes.yellowColor, 0),
                                )
                              : Container(
                                  height: 20,
                                  width: 20,
                                  decoration:
                                      DesignConfig.boxDecorationContainer(
                                          Colors.green, 0),
                                ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(parentGuidLineList[index].name!,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: ColorsRes.white,
                                        fontWeight: FontWeight.normal)),
                              ))
                        ],
                      ),
                      onTap: () {});
                }),
          );
  }

  Widget showMovieDetailData() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            movieImage(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(widget.name!,
                  style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: displayMovieType(),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                      widget.type == "recommdedmovielist"
                          ? recommdedMovieList[widget.id!].duration!
                          : widget.type == "watchlist"
                              ? watchList[widget.id!].duration!
                              : widget.type == "newlist"
                                  ? newMovieList[widget.id!].duration!
                                  : widget.type == "thismonthlist"
                                      ? thisMonthMovieList[widget.id!].duration!
                                      : widget.type == "toplist"
                                          ? topScoreList[widget.id!].duration!
                                          : "",
                      style: TextStyle(
                          fontSize: 15,
                          color: ColorsRes.white,
                          fontWeight: FontWeight.normal)),
                ),
                DesignConfig.displayRatingFull(
                    widget.type == "recommdedmovielist"
                        ? recommdedMovieList[widget.id!].rating
                        : widget.type == "watchlist"
                            ? watchList[widget.id!].rating
                            : widget.type == "newlist"
                                ? newMovieList[widget.id!].rating
                                : widget.type == "thismonthlist"
                                    ? thisMonthMovieList[widget.id!].rating
                                    : widget.type == "toplist"
                                        ? topScoreList[widget.id!].rating
                                        : "",
                    true),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  widget.type == "recommdedmovielist"
                      ? recommdedMovieList[widget.id!].description!
                      : widget.type == "watchlist"
                          ? watchList[widget.id!].description!
                          : widget.type == "newlist"
                              ? newMovieList[widget.id!].description!
                              : widget.type == "thismonthlist"
                                  ? thisMonthMovieList[widget.id!].description!
                                  : widget.type == "toplist"
                                      ? topScoreList[widget.id!].description!
                                      : "",
                  maxLines: descTextShowFlag ? null : 5,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: ColorsRes.white, fontSize: 14)),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  setState(() {
                    descTextShowFlag = !descTextShowFlag;
                  });
                },
                child: descTextShowFlag
                    ? Text(
                        StringsRes.showLessText,
                        style: TextStyle(
                            color: ColorsRes.yellowColor, fontSize: 14),
                      )
                    : Text(StringsRes.showMoreText,
                        style: TextStyle(
                          color: ColorsRes.yellowColor,
                          fontSize: 14,
                        )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(StringsRes.castText,
                  style: TextStyle(
                      fontSize: 20,
                      color: ColorsRes.white,
                      fontWeight: FontWeight.bold)),
            ),
            showCast(),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Text(StringsRes.directorText,
                      style: TextStyle(
                          fontSize: 20,
                          color: ColorsRes.white,
                          fontWeight: FontWeight.normal)),
                )),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 10.0),
                  child: Text("Hansal Mehta",
                      style: TextStyle(
                          fontSize: 14,
                          color: ColorsRes.white,
                          fontWeight: FontWeight.normal)),
                )),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(StringsRes.writersText,
                      style: TextStyle(
                          fontSize: 20,
                          color: ColorsRes.white,
                          fontWeight: FontWeight.normal)),
                )),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 10.0),
                  child: Text("Chetan Bhagat and Others",
                      style: TextStyle(
                          fontSize: 14,
                          color: ColorsRes.white,
                          fontWeight: FontWeight.normal)),
                )),
            Padding(
                padding:
                    EdgeInsetsDirectional.only(top: 15, start: 10, end: 10),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Row(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        StringsRes.videosText,
                        style: TextStyle(
                            color: ColorsRes.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Spacer(), // Defaults to a flex of one.
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 5, top: 5, bottom: 5),
                      child: GestureDetector(
                        child: Text(StringsRes.seeAllText,
                            style: TextStyle(
                                color: ColorsRes.yellowColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 16)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoActivity(
                                  id: widget.id, type: widget.type),
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
                  showVideos(),
                ])),
            Padding(
                padding:
                    EdgeInsetsDirectional.only(top: 15, start: 10, end: 10),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Row(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        StringsRes.parentGuideText,
                        style: TextStyle(
                            color: ColorsRes.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Spacer(), // Defaults to a flex of one.
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 5, top: 5, bottom: 5),
                      child: GestureDetector(
                        child: Text(StringsRes.seeAllText,
                            style: TextStyle(
                                color: ColorsRes.yellowColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 16)),
                        onTap: () {},
                      ),
                    ),
                  ]),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        StringsRes.contentRatingText,
                        style: TextStyle(
                            color: ColorsRes.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        StringsRes.viewContantAdvisoryText,
                        style: TextStyle(
                            color: ColorsRes.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  showParentGuid(),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          descTextShowFlag = !descTextShowFlag;
                        });
                      },
                      child: Icon(
                          descTextShowFlag
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: ColorsRes.white,
                          size: 40)),
                ])),
            SizedBox(height: 50),
          ]),
    );
  }

  Widget showReviewList() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 10),
      child: ListView.builder(
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.type == "recommdedmovielist"
              ? recommdedMovieList[widget.id!].reviewList!.length
              : widget.type == "watchlist"
                  ? watchList[widget.id!].reviewList!.length
                  : widget.type == "newlist"
                      ? newMovieList[widget.id!].reviewList!.length
                      : widget.type == "thismonthlist"
                          ? thisMonthMovieList[widget.id!].reviewList!.length
                          : widget.type == "toplist"
                              ? topScoreList[widget.id!].reviewList!.length
                              : "" as int?,
          itemBuilder: (BuildContext context, int index) {
            late var model;
            if (widget.type == "recommdedmovielist") {
              model = recommdedMovieList[widget.id!].reviewList![index];
            } else if (widget.type == "watchlist") {
              model = watchList[widget.id!].reviewList![index];
            } else if (widget.type == "newlist") {
              model = newMovieList[widget.id!].reviewList![index];
            } else if (widget.type == "thismonthlist") {
              model = thisMonthMovieList[widget.id!].reviewList![index];
            } else if (widget.type == "toplist") {
              model = topScoreList[widget.id!].reviewList![index];
            }

            return Container(
                margin: EdgeInsets.only(bottom: 10),
                //decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: CircleAvatar(
                      radius: 30,
                      child: ClipOval(
                          child: OctoImage(
                              image: CachedNetworkImageProvider(
                                model.imgurl,
                              ),
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                model.hash,
                              ),
                              errorBuilder: OctoError.icon(color: Colors.black),
                              height: 100,
                              width: 100))),
                  title: Text(model.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorsRes.white,
                      )),
                  subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(model.name,
                              style: TextStyle(
                                  fontSize: 14, color: ColorsRes.blueColor)),
                        ),
                        Expanded(
                            child: DesignConfig.displayRatingFull(
                                model.rating, true)),
                        Expanded(
                          child: Text(model.time,
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorsRes.white,
                              )),
                        ),
                      ]),
                  onTap: () {},
                ));
          }),
    );
  }

  Widget showReview() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            movieImage(),
            showReviewList(),
            GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReviewActivity(),
                    ),
                  );
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 25.0),
                padding: EdgeInsets.only(top: 15, bottom: 15),
                decoration: DesignConfig.boxDecorationButtonColor(
                    ColorsRes.yellowColor, ColorsRes.yellowColor, 10),
                child: Text(
                  StringsRes.writeReviewText,
                  style: TextStyle(
                    color: ColorsRes.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          title: Text(widget.name!,
              style: TextStyle(
                  fontSize: 20,
                  color: ColorsRes.white,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: ColorsRes.backgroundColor,
          shadowColor: Colors.transparent,
          leading: GestureDetector(
              child: Icon(Icons.arrow_back_ios, color: ColorsRes.white),
              onTap: () {
                Navigator.pop(context);
              })),
      body: Container(
        width: double.infinity,
        //height: double.infinity,
        color: ColorsRes.backgroundColor,
        child: DefaultTabController(
            length: 2,
            child: SingleChildScrollView(
                child: Column(children: [
              TabBar(
                labelColor: ColorsRes.yellowColor,
                unselectedLabelColor: ColorsRes.textColor.withOpacity(0.7),
                labelStyle: Theme.of(context).textTheme.subtitle1,
                indicatorColor: ColorsRes.yellowColor,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(StringsRes.overviewText,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(StringsRes.reviewText,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .85,
                child: TabBarView(children: [
                  showMovieDetailData(),
                  showReview(),
                ]),
              )
            ]))),
      ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
