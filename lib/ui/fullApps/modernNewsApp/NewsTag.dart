import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Color.dart';
import 'Helper/Session.dart';
import 'Helper/String.dart';
import 'Model/News.dart';
import 'NewsDetails.dart';

class NewsTag extends StatefulWidget {
  final String? tadId;
  final String? tagName;

  const NewsTag({Key? key, this.tadId, this.tagName}) : super(key: key);

  @override
  NewsTagState createState() => NewsTagState();
}

class NewsTagState extends State<NewsTag> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<News> tagNewsList = [];

  @override
  void initState() {
    for (int i = 0; i < recentNewsList.length; i++) {
      if (recentNewsList[i].tagName == widget.tagName) {
        setState(() {
          tagNewsList.add(recentNewsList[i]);
        });
      }
    }
    super.initState();
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

  newsItem(int index) {
    List<String> tagList = [];
    if (tagNewsList[index].tagName! != "") {
      final tagName = tagNewsList[index].tagName!;
      tagList = tagName.split(',');
    }

    List<String> tagId = [];

    if (tagNewsList[index].tagId! != "") {
      tagId = tagNewsList[index].tagId!.split(",");
    }
    return Padding(
        padding: EdgeInsetsDirectional.only(top: index == 0 ? 0 : 15.0),
        child: Column(children: <Widget>[
          InkWell(
            child: Stack(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      tagNewsList[index].image!,
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
                                    tagNewsList[index].date!,
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
                                        tagNewsList[index].title!,
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
                                          tagNewsList[index].tagName! != ""
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
                                                              : tagList.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Padding(
                                                            padding: EdgeInsetsDirectional
                                                                .only(
                                                                    start:
                                                                        index ==
                                                                                0
                                                                            ? 0
                                                                            : 4),
                                                            child: InkWell(
                                                              child: Container(
                                                                  height: 23.0,
                                                                  width: 65,
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  padding: EdgeInsetsDirectional.only(
                                                                      start:
                                                                          3.0,
                                                                      end: 3.0,
                                                                      top: 2.5,
                                                                      bottom:
                                                                          2.5),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            3.0),
                                                                    color: colors
                                                                        .primary
                                                                        .withOpacity(
                                                                            0.08),
                                                                  ),
                                                                  child: Text(
                                                                    tagList[
                                                                        index],
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyText2
                                                                        ?.copyWith(
                                                                          color:
                                                                              colors.primary,
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
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
                                                                        tadId: tagId[
                                                                            index],
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
                                              tagNewsList[index].status == "1"
                                                  ? "assets/images/fullApps/modernNews/svg/bookmarkfilled_icon.svg"
                                                  : "assets/images/fullApps/modernNews/svg/bookmark_icon.svg",
                                              semanticsLabel: 'bookmark icon',
                                              height: 19,
                                              width: 19,
                                            ),
                                            onTap: () async {},
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: 13.0),
                                            child: InkWell(
                                              child: SvgPicture.asset(
                                                "assets/images/fullApps/modernNews/svg/share_icon.svg",
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
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 55,
                                width: 55,
                                padding: EdgeInsets.all(13),
                                decoration: BoxDecoration(
                                    color: colors.tempboxColor.withOpacity(0.5),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                  tagNewsList[index].like == "1"
                                      ? "assets/images/fullApps/modernNews/svg/likefilled_button.svg"
                                      : "assets/images/fullApps/modernNews/svg/Like_icon.svg",
                                  semanticsLabel: 'like icon',
                                ),
                              ))),
                      onTap: () async {},
                    ))
              ],
            ),
            onTap: () {
              News model = tagNewsList[index];
              List<News> tgList = [];
              tgList.addAll(tagNewsList);
              tgList.removeAt(index);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => NewsDetails(
                        model: model,
                        index: index,
                        updateParent: updateHomePage,
                        id: model.id,
                        isFav: false,
                        isDetails: true,
                        news: tgList,
                      )));
            },
          ),
        ]));
  }

  updateHomePage() {
    setState(() {});
  }

  viewContent() {
    return Padding(
        padding: EdgeInsetsDirectional.only(
            top: 0.0, bottom: 10.0, start: 13.0, end: 13.0),
        child: tagNewsList.isEmpty
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
                  itemCount: tagNewsList.length,
                  itemBuilder: (context, index) {
                    return newsItem(index);
                  },
                )));
  }

  //set appbar
  getAppBar() {
    return PreferredSize(
        preferredSize: Size(double.infinity, 45),
        child: AppBar(
          leadingWidth: 50,
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            widget.tagName!,
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5),
          ),
          leading: Builder(builder: (BuildContext context) {
            return Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 15.0, top: 5.0, bottom: 5.0),
                child: Container(
                    height: 38,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.boxColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10.0,
                              offset: const Offset(5.0, 5.0),
                              color: Theme.of(context)
                                  .colorScheme
                                  .fontColor
                                  .withOpacity(0.1),
                              spreadRadius: 1.0),
                        ],
                        borderRadius: BorderRadius.circular(6.0)),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset(
                        "assets/images/fullApps/modernNews/svg/back_icon.svg",
                        semanticsLabel: 'back icon',
                        color: Theme.of(context).colorScheme.fontColor,
                      ),
                    )));
          }),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: getAppBar(),
      body: viewContent(),
    );
  }
}
