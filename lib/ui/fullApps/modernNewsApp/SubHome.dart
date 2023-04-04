// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Color.dart';
import 'Helper/Session.dart';
import 'Helper/String.dart';
import 'Model/Category.dart';
import 'Model/News.dart';
import 'NewsDetails.dart';
import 'NewsTag.dart';

class SubHome extends StatefulWidget {
  SubHome({
    this.scrollController,
    this.catList,
    this.curTabId,
    this.isSubCat,
    this.index,
    this.subCatId,
  });

  ScrollController? scrollController;

  List<Category>? catList;
  String? curTabId;
  bool? isSubCat;
  int? index;
  String? subCatId;

  @override
  SubHomeState createState() => new SubHomeState();
}

class SubHomeState extends State<SubHome> {
  Key _key = new PageStorageKey(const {});
  bool _innerListIsScrolled = false;
  final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();
  bool enabled = true;
  List<News> newsList = [];
  double progress = 0;
  String fileSave = "";
  String otherImageSave = "";
  var isDarkTheme;
  int? from;
  String? curTabId;
  bool isFirst = false;

  String? optId;
  int desiIndex = 2;

  bool isClickable = false;
  List<News> comList = [];
  bool isFrom = false;

  void _updateScrollPosition() {
    if (!_innerListIsScrolled &&
        widget.scrollController!.position.extentAfter == 0.0) {
      setState(() {
        _innerListIsScrolled = true;
      });
    } else if (_innerListIsScrolled &&
        widget.scrollController!.position.extentAfter > 0.0) {
      setState(() {
        _innerListIsScrolled = false;
        // Reset scroll positions of the TabBarView pages
        _key = new PageStorageKey(const {});
      });
    }
  }

  @override
  void initState() {
    if (!widget.isSubCat!) {
      getNews();
    }

    combineList();
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController!.removeListener(_updateScrollPosition);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SubHome oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.subCatId != widget.subCatId) {
      updateData();
    }
  }

  updateData() async {
    newsList.clear();
    comList.clear();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey2,
      body: viewContent(),
    );
  }

  viewContent() {
    return newsList.isEmpty
        ? Center(
            child: Text(getTranslated(context, 'no_news')!,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .fontColor
                        .withOpacity(0.8))))
        : Padding(
            padding: EdgeInsetsDirectional.only(
              top: 15.0,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: comList.length,
              itemBuilder: (context, index) {
                return comList[index].type == "survey"
                    ? showSurveyQue(index)
                    : newsItem(index);
              },
            ));
  }

  updateHomePage() {
    setState(() {});
  }

//show snackbar msg
  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).colorScheme.fontColor),
      ),
      backgroundColor: isDark! ? colors.tempdarkColor : colors.bgColor,
      elevation: 1.0,
    ));
  }

//get latest news data list
  Future<void> getNews() async {
    if (widget.catList![widget.index!].subData!.isNotEmpty) {
      print("subcatId*****${widget.subCatId}****${widget.curTabId!}");
      if (widget.subCatId == "0") {
        for (int i = 0; i < recentNewsList.length; i++) {
          if (recentNewsList[i].categoryId == widget.curTabId!) {
            newsList.add(recentNewsList[i]);
          }
        }
      } else {
        for (int i = 0; i < recentNewsList.length; i++) {
          if (recentNewsList[i].subCat_id == widget.subCatId!) {
            print("in subat****");
            setState(() {
              newsList.add(recentNewsList[i]);
            });

            print("newsList****${newsList.length}");
          }
        }
      }
    } else {
      for (int i = 0; i < recentNewsList.length; i++) {
        if (recentNewsList[i].categoryId == widget.curTabId!) {
          newsList.add(recentNewsList[i]);
        }
      }
    }
    combineList();
  }

  combineList() {
    comList.clear();
    int cur = 0;
    for (int i = 0; i < newsList.length; i++) {
      if (i != 0 && i % desiIndex == 0) {
        if (questionList.isNotEmpty && questionList.length > cur) {
          comList.add(questionList[cur]);

          cur++;
        }
      }

      comList.add(newsList[i]);
    }
  }

  showSurveyQue(int i) {
    return Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Theme.of(context).colorScheme.lightColor,
            ),
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  comList[i].question!,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).colorScheme.darkColor,
                      height: 1.0),
                ),
                Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: 15.0, start: 7.0, end: 7.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        //padding: EdgeInsets.only(bottom: 10.0),
                        itemCount: comList[i].optionDataList!.length,
                        itemBuilder: (context, j) {
                          return Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: InkWell(
                                child: Container(
                                    height: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: optId ==
                                                comList[i].optionDataList![j].id
                                            ? colors.primary.withOpacity(0.1)
                                            : isDark!
                                                ? colors.tempdarkColor
                                                : colors.bgColor),
                                    child: Text(
                                      comList[i].optionDataList![j].options!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          ?.copyWith(
                                              color: optId ==
                                                      comList[i]
                                                          .optionDataList![j]
                                                          .id
                                                  ? colors.primary
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .darkColor,
                                              height: 1.0),
                                      textAlign: TextAlign.center,
                                    )),
                                onTap: () {
                                  setState(() {
                                    optId = comList[i].optionDataList![j].id;
                                  });
                                },
                              ));
                        })),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: InkWell(
                    child: Container(
                      height: 40.0,
                      width: deviceWidth! * 0.35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: colors.tempboxColor,
                          borderRadius: BorderRadius.circular(7.0)),
                      child: Text(
                        getTranslated(context, 'submit_btn')!,
                        style: Theme.of(this.context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(
                                color: colors.primary,
                                fontWeight: FontWeight.w600,
                                //fontSize: 21,
                                letterSpacing: 0.6),
                      ),
                    ),
                    onTap: () async {},
                  ),
                )
              ],
            )));
  }

  newsItem(int index) {
    List<String> tagList = [];
    if (comList[index].tagName! != "") {
      final tagName = comList[index].tagName!;
      tagList = tagName.split(',');
    }

    List<String> tagId = [];

    if (comList[index].tagId! != "") {
      tagId = comList[index].tagId!.split(",");
    }
    return Padding(
        padding: EdgeInsetsDirectional.only(top: index == 0 ? 0 : 15.0),
        child: Column(children: [
          AbsorbPointer(
            absorbing: !enabled,
            child: InkWell(
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        comList[index].image!,
                        height: 320.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )),
                  Positioned.directional(
                      textDirection: Directionality.of(context),
                      bottom: 10.0,
                      start: 10,
                      end: 10,
                      height: 123,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: colors.tempboxColor.withOpacity(0.85),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      comList[index].date!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                              color: colors.tempdarkColor,
                                              fontSize: 13.0),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(top: 6.0),
                                        child: Text(
                                          comList[index].title!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              ?.copyWith(
                                                  color: colors.tempdarkColor
                                                      .withOpacity(0.9),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  height: 1.0),
                                          maxLines: 3,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(top: 6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            comList[index].tagName! != ""
                                                ? SizedBox(
                                                    height: 23.0,
                                                    child: ListView.builder(
                                                        physics:
                                                            ClampingScrollPhysics(),
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        shrinkWrap: true,
                                                        itemCount:
                                                            tagList.length >= 3
                                                                ? 3
                                                                : tagList
                                                                    .length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return Padding(
                                                              padding: EdgeInsetsDirectional
                                                                  .only(
                                                                      start: index ==
                                                                              0
                                                                          ? 0
                                                                          : 4),
                                                              child: InkWell(
                                                                child:
                                                                    Container(
                                                                        height:
                                                                            23.0,
                                                                        width:
                                                                            65,
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        padding: EdgeInsetsDirectional.only(
                                                                            start:
                                                                                3.0,
                                                                            end:
                                                                                3.0,
                                                                            top:
                                                                                2.5,
                                                                            bottom:
                                                                                2.5),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(3.0),
                                                                          color: colors
                                                                              .primary
                                                                              .withOpacity(0.08),
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          tagList[
                                                                              index],
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .bodyText2
                                                                              ?.copyWith(
                                                                                color: colors.primary,
                                                                                fontSize: 12,
                                                                              ),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          softWrap:
                                                                              true,
                                                                        )),
                                                                onTap: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                NewsTag(
                                                                          tadId:
                                                                              tagId[index],
                                                                          tagName:
                                                                              tagList[index],
                                                                        ),
                                                                      ));
                                                                },
                                                              ));
                                                        }))
                                                : Container(),
                                            Spacer(),
                                            InkWell(
                                              child: SvgPicture.asset(
                                                comList[index].status == "1"
                                                    ? "assets/news/images/bookmarkfilled_icon.svg"
                                                    : "assets/news/images/bookmark_icon.svg",
                                                semanticsLabel: 'bookmark icon',
                                                height: 19,
                                                width: 19,
                                              ),
                                              onTap: () async {},
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      start: 13.0),
                                              child: InkWell(
                                                child: SvgPicture.asset(
                                                  "assets/news/images/share_icon.svg",
                                                  semanticsLabel: 'share icon',
                                                  height: 19,
                                                  width: 19,
                                                ),
                                                onTap: () async {},
                                              ),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              )))),
                  Positioned.directional(
                      textDirection: Directionality.of(context),
                      bottom: (320 - 113) / 2,
                      start: deviceWidth! * 0.67,
                      child: InkWell(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(55.0),
                            child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  height: 55,
                                  width: 55,
                                  padding: EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                      color:
                                          colors.tempboxColor.withOpacity(0.5),
                                      shape: BoxShape.circle),
                                  child: SvgPicture.asset(
                                    comList[index].like == "1"
                                        ? "assets/news/images/likefilled_button.svg"
                                        : "assets/news/images/Like_icon.svg",
                                    semanticsLabel: 'like icon',
                                  ),
                                ))),
                        onTap: () async {},
                      ))
                ],
              ),
              onTap: () {
                setState(() {
                  enabled = false;
                });

                News model = comList[index];
                List<News> recList = [];
                recList.addAll(newsList);
                recList
                    .removeWhere((element) => element.id == comList[index].id);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => NewsDetails(
                          model: model,
                          index: index,
                          updateParent: updateHomePage,
                          id: model.id,
                          isFav: false,
                          isDetails: true,
                          news: recList,
                        )));
                setState(() {
                  enabled = true;
                });
              },
            ),
          )
        ]));
  }
}
