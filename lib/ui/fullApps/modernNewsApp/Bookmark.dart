import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Color.dart';

import 'Helper/Session.dart';
import 'Helper/String.dart';
import 'Login.dart';
import 'Model/News.dart';

class Bookmark extends StatefulWidget {
  @override
  BookmarkState createState() => BookmarkState();
}

class BookmarkState extends State<Bookmark> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final ScrollController _controller = new ScrollController();
  bool enabled = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(() {});
    super.dispose();
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

  //news bookmark list have no news then call this function
  Widget getNoItem() {
    return Center(child: Text(getTranslated(context, 'bookmark_nt_avail')!));
  }

  //user not login then show this function used to navigate login screen
  Widget loginMsg() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              getTranslated(context, 'bookmark_login')!,
              style: Theme.of(context).textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
            InkWell(
                child: Text(
                  getTranslated(context, 'loginnow_lbl')!,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                }),
          ],
        ));
  }

  //show bookmarklist
  getBookmarkList() {
    return ListView.builder(
        controller: _controller,
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: bookmarkList.length,
        itemBuilder: (context, index) {
          List<String> tagList = [];
          if (bookmarkList[index].tagName! != "") {
            final tagName = bookmarkList[index].tagName!;
            tagList = tagName.split(',');
          }

          if (bookmarkList[index].tagId! != "") {}

          return Padding(
              padding: EdgeInsetsDirectional.only(top: 15.0),
              child: AbsorbPointer(
                absorbing: !enabled,
                child: InkWell(
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              bookmarkList[index].image!,
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
                                    filter: ImageFilter.blur(
                                        sigmaX: 15, sigmaY: 15),
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: colors.tempboxColor
                                            .withOpacity(0.85),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            bookmarkList[index].date!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption
                                                ?.copyWith(
                                                    color: colors.tempdarkColor,
                                                    fontSize: 13.0),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 8.0),
                                              child: Text(
                                                bookmarkList[index].title!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1
                                                    ?.copyWith(
                                                        color: colors
                                                            .tempdarkColor
                                                            .withOpacity(0.9),
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15,
                                                        height: 1.0,
                                                        letterSpacing: 0.5),
                                                maxLines: 3,
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                              )),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 8.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  bookmarkList[index]
                                                              .tagName! !=
                                                          ""
                                                      ? SizedBox(
                                                          height: 23.0,
                                                          child:
                                                              ListView.builder(
                                                                  physics:
                                                                      ClampingScrollPhysics(),
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  shrinkWrap:
                                                                      true,
                                                                  controller:
                                                                      _controller,
                                                                  itemCount: tagList
                                                                              .length >=
                                                                          3
                                                                      ? 3
                                                                      : tagList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return Padding(
                                                                        padding: EdgeInsetsDirectional.only(
                                                                            start: index == 0
                                                                                ? 0
                                                                                : 4),
                                                                        child:
                                                                            InkWell(
                                                                          child: ClipRRect(
                                                                              borderRadius: BorderRadius.circular(3.0),
                                                                              child: BackdropFilter(
                                                                                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                                                                                  child: Container(
                                                                                      height: 23.0,
                                                                                      width: 65,
                                                                                      alignment: Alignment.center,
                                                                                      padding: EdgeInsetsDirectional.only(start: 3.0, end: 3.0, top: 2.5, bottom: 2.5),
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(3.0),
                                                                                        color: colors.primary.withOpacity(0.03),
                                                                                      ),
                                                                                      child: Text(
                                                                                        tagList[index],
                                                                                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                                                                              color: colors.primary,
                                                                                              fontSize: 12,
                                                                                            ),
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                        softWrap: true,
                                                                                      )))),
                                                                          onTap:
                                                                              () {},
                                                                        ));
                                                                  }))
                                                      : Container(),
                                                  Spacer(),
                                                  InkWell(
                                                      child: SvgPicture.asset(
                                                        bookmarkList[index]
                                                                    .status ==
                                                                "1"
                                                            ? "assets/images/fullApps/modernNews/svg/bookmarkfilled_icon.svg"
                                                            : "assets/images/fullApps/modernNews/svg/bookmark_icon.svg",
                                                        semanticsLabel:
                                                            'bookmark icon',
                                                        height: 19,
                                                        width: 19,
                                                        color: colors.primary,
                                                      ),
                                                      onTap: () async {}),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .only(start: 13.0),
                                                    child: InkWell(
                                                      child: SvgPicture.asset(
                                                        "assets/images/fullApps/modernNews/svg/share_icon.svg",
                                                        semanticsLabel:
                                                            'share icon',
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
                                        filter: ImageFilter.blur(
                                            sigmaX: 10, sigmaY: 10),
                                        child: Container(
                                          height: 55,
                                          width: 55,
                                          padding: EdgeInsets.all(13),
                                          decoration: BoxDecoration(
                                              color: colors.tempboxColor
                                                  .withOpacity(0.5),
                                              shape: BoxShape.circle),
                                          child: SvgPicture.asset(
                                            bookmarkList[index].like == "1"
                                                ? "assets/images/fullApps/modernNews/svg/likefilled_button.svg"
                                                : "assets/images/fullApps/modernNews/svg/Like_icon.svg",
                                            semanticsLabel: 'like icon',
                                          ),
                                        ))),
                                onTap: () async {}))
                      ],
                    ),
                    onTap: () async {}),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 35),
            child: Center(
                child: Padding(
                    padding: EdgeInsets.only(top: 35.0),
                    child: Text(
                      getTranslated(context, 'bookmark_lbl')!,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: colors.primary,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5),
                    )))),
        body: Padding(
          padding: EdgeInsetsDirectional.only(
              top: 0.0, bottom: 10.0, start: 13.0, end: 13.0),
          child: bookmarkList.isEmpty ? getNoItem() : getBookmarkList(),
        ));
  }
}
