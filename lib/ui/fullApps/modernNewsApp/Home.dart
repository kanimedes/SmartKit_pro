// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Bookmark.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Color.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Session.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/String.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Model/BreakingNews.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Model/News.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/NewsTag.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/NotificationList.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Search.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Setting.dart';
import 'Model/Category.dart';
import 'NewsDetails.dart';
import 'SubHome.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

int _selectedIndex = 0;

class HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Widget>? fragments;
  DateTime? currentBackPressTime;
  final bool _isNetworkAvail = true;

  @override
  void initState() {
    super.initState();
    fragments = [
      HomePage(),
      Bookmark(),
      NotificationList(),
      Setting(),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: colors.bgColor,
          //extendBodyBehindAppBar: true,
          extendBody: true,
          bottomNavigationBar: bottomBar(),
          body: fragments?[_selectedIndex],
        ));
  }

  //when home page in back click press
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (_selectedIndex != 0) {
      _selectedIndex = 0;

      return Future.value(false);
    } else if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      setSnackbar(getTranslated(context, 'EXIT_WR')!);

      return Future.value(false);
    }
    return Future.value(true);
  }

  _onItemTapped(index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  updateParent() {
    //setState(() {});
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

  bottomBar() {
    return Padding(
        padding: EdgeInsetsDirectional.only(
            start: 15.0, end: 15.0, bottom: 15.0, top: 10.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
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
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: _selectedIndex,
                onTap: (int index) {
                  _onItemTapped(index);
                },
                backgroundColor: Theme.of(context).colorScheme.boxColor,
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          "assets/images/fullApps/modernNews/svg/home_icon.svg",
                          semanticsLabel: 'home',
                          height: 20.0,
                          width: 20.0,
                          color: _selectedIndex == 0
                              ? colors.primary
                              : Theme.of(context).colorScheme.fontColor),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          "assets/images/fullApps/modernNews/svg/saved_icon.svg",
                          semanticsLabel: 'saved',
                          height: 20.0,
                          width: 20.0,
                          color: _selectedIndex == 1
                              ? colors.primary
                              : Theme.of(context).colorScheme.fontColor),
                      label: "Saved Bookmark"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.notifications,
                        color: _selectedIndex == 2
                            ? colors.primary
                            : Theme.of(context).colorScheme.fontColor,
                      ),
                      label: "Notification"),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.settings,
                        color: _selectedIndex == 3
                            ? colors.primary
                            : Theme.of(context).colorScheme.fontColor,
                      ),
                      label: "Setting"),
                ],
              ),
            )));
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String? error;
  final TextEditingController textController = TextEditingController();
  TabController? _tc;
  String? catId = "";
  final List<Map<String, dynamic>> _tabs = [];
  int tcIndex = 0;
  var scrollController = ScrollController();
  List<String> allImage = [];
  int? selectSubCat = 0;
  bool isFirst = false;
  var isliveNews;
  int offset = 0;
  int total = 0;
  bool enabled = true;
  ScrollController controller = new ScrollController();
  ScrollController controller1 = new ScrollController();
  bool isTab = true;
  SubHome subHome = SubHome();

  @override
  void initState() {
    // context.read<SubCatProvider>().setCat("1");
    // context.read<SubCatProvider>().setSubCat("0");

    this._addInitailTab();

    super.initState();
  }

  //add tab bar category title
  _addInitailTab() async {
    setState(() {
      for (int i = 0; i < catList.length; i++) {
        _tabs.add({
          'text': catList[i].categoryName,
        });
        catId = catList[i].id;
      }

      _tc = TabController(
        vsync: this,
        length: _tabs.length,
      )..addListener(() {
          setState(() {
            // context.read<SubCatProvider>().setCat(catList[_tc!.index].id!);
            // context.read<SubCatProvider>().setSubCat("0");
            isTab = true;
            tcIndex = _tc!.index;
            selectSubCat = 0;
          });
        });
    });
  }

  tabBarData() {
    return TabBar(
      labelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontWeight: FontWeight.w600,
          ),
      unselectedLabelColor:
          Theme.of(context).colorScheme.fontColor.withOpacity(0.8),
      isScrollable: true,
      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // Creates border
          color: colors.primary.withOpacity(0.08)),
      tabs: _tabs
          .map((tab) => Container(
              height: 32,
              padding: EdgeInsetsDirectional.only(top: 5.0, bottom: 5.0),
              child: Tab(
                text: tab['text'],
              )))
          .toList(),
      labelColor: colors.primary,
      controller: _tc,
      unselectedLabelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(),
    );
  }

  subTabData() {
    return catList.isNotEmpty
        ? catList[_tc!.index].subData!.isNotEmpty
            ? Padding(
                padding: EdgeInsetsDirectional.only(top: 10.0),
                child: Container(
                    height: 27,
                    alignment: Alignment.center,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: catList[_tc!.index].subData!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: index == 0 ? 0 : 10),
                              child: InkWell(
                                child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsetsDirectional.only(
                                        start: 7.0,
                                        end: 7.0,
                                        top: 2.5,
                                        bottom: 2.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: selectSubCat == index
                                          ? colors.primary.withOpacity(0.07)
                                          : Theme.of(context)
                                              .colorScheme
                                              .fontColor
                                              .withOpacity(0.13),
                                    ),
                                    child: Text(
                                      catList[_tc!.index]
                                          .subData![index]
                                          .subCatName!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          ?.copyWith(
                                              color: selectSubCat == index
                                                  ? colors.primary
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .fontColor
                                                      .withOpacity(0.9),
                                              fontSize: 12,
                                              fontWeight: selectSubCat == index
                                                  ? FontWeight.w600
                                                  : FontWeight.normal),
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                    )),
                                onTap: () async {
                                  this.setState(() {
                                    isTab = false;
                                    selectSubCat = index;

                                    if (index == 0) {
                                      //context.read<SubCatProvider>().setCat(catList[tcIndex].id!);
                                      //context.read<SubCatProvider>().setSubCat("0");
                                      subHome = SubHome(
                                        subCatId: "0",
                                        curTabId: catList[tcIndex].id!,
                                        index: tcIndex,
                                        isSubCat: true,
                                        catList: catList,
                                        scrollController: scrollController,
                                      );
                                    } else {
                                      //  context.read<SubCatProvider>().setCat("0");
                                      // context.read<SubCatProvider>().setSubCat(catList[tcIndex]
                                      //  .subData![index]
                                      //  .id!);
                                      subHome = SubHome(
                                        subCatId: catList[tcIndex]
                                            .subData![index]
                                            .id!,
                                        curTabId: "0",
                                        index: tcIndex,
                                        isSubCat: true,
                                        catList: catList,
                                        scrollController: scrollController,
                                      );
                                    }
                                  });
                                },
                              ));
                        })))
            : Container()
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsetsDirectional.only(
                    top: 10.0, start: 15.0, end: 15.0, bottom: 10.0),
                child: NestedScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    controller: scrollController,
                    clipBehavior: Clip.none,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        new SliverList(
                          delegate: new SliverChildListDelegate([
                            weatherDataView(),
                            liveWithSearchView(),
                            viewBreakingNews(),
                            viewRecentContent(),
                            viewUserNewsContent(),
                            catText(),
                          ]),
                        ),
                        SliverAppBar(
                          toolbarHeight: 0,
                          titleSpacing: 0,
                          pinned: true,
                          bottom: PreferredSize(
                              preferredSize: Size.fromHeight(
                                  catList[_tc!.index].subData!.isNotEmpty
                                      ? 71
                                      : 34),
                              child: Column(
                                  children: [tabBarData(), subTabData()])),
                          backgroundColor:
                              isDark! ? colors.darkModeColor : colors.bgColor,
                          elevation: 0,
                          floating: true,
                        )
                      ];
                    },
                    body: TabBarView(
                        controller: _tc,
                        //key: _key,
                        children:
                            new List<Widget>.generate(_tc!.length, (int index) {
                          //return viewContent();
                          return isTab
                              ? SubHome(
                                  curTabId: catList[index].id,
                                  isSubCat: false,
                                  scrollController: scrollController,
                                  catList: catList,
                                  subCatId: "0",
                                  index: index,
                                )
                              : subHome;
                        }))))));
  }

  Widget weatherDataView() {
    DateTime now = DateTime.now();
    String day = DateFormat('EEEE').format(now);
    return Container(
        padding: EdgeInsets.all(15.0),
        height: 110,
        //width: deviceWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).colorScheme.lightColor,
          boxShadow: [
            BoxShadow(
                blurRadius: 10.0,
                offset: const Offset(12.0, 15.0),
                color: colors.tempdarkColor.withOpacity(0.2),
                spreadRadius: -7),
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  Text(
                    getTranslated(context, 'weather_lbl')!,
                    style: Theme.of(this.context).textTheme.subtitle2?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .fontColor
                              .withOpacity(0.8),
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.wb_sunny_outlined,
                        size: 27,
                        color: Colors.yellow,
                      ),
                      /* Image.network(
                                  "https:${weatherData!.icon!}",
                                  width: 40.0,
                                  height: 40.0,
                                ),*/
                      Padding(
                          padding: EdgeInsetsDirectional.only(start: 7.0),
                          child: Text(
                            "30.1\u2103",
                            style: Theme.of(this.context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .fontColor
                                      .withOpacity(0.8),
                                ),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 1,
                          ))
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Crim Lane,Edison,US",
                    style: Theme.of(this.context).textTheme.subtitle2?.copyWith(
                        color: Theme.of(context).colorScheme.fontColor,
                        fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 1,
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.only(top: 3.0),
                      child: Text(
                        day,
                        style:
                            Theme.of(this.context).textTheme.caption?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .fontColor
                                      .withOpacity(0.8),
                                ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 1,
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.only(top: 3.0),
                      child: Text(
                        "Sunny",
                        style:
                            Theme.of(this.context).textTheme.caption?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .fontColor
                                      .withOpacity(0.8),
                                ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      )),
                  Padding(
                      padding: EdgeInsetsDirectional.only(top: 3.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(Icons.arrow_upward_outlined,
                              size: 13.0,
                              color: Theme.of(context).colorScheme.fontColor),
                          Text(
                            "H:38.1\u2103",
                            style: Theme.of(this.context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .fontColor
                                      .withOpacity(0.8),
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                          Padding(
                              padding: EdgeInsetsDirectional.only(start: 8.0),
                              child: Icon(Icons.arrow_downward_outlined,
                                  size: 13.0,
                                  color:
                                      Theme.of(context).colorScheme.fontColor)),
                          Text(
                            "L:25.8\u2103",
                            style: Theme.of(this.context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .fontColor
                                      .withOpacity(0.8),
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ));
  }

  Widget liveWithSearchView() {
    return Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Row(
          children: [
            Expanded(
                flex: 9,
                child: InkWell(
                  child: Padding(
                      padding: EdgeInsetsDirectional.only(end: 0.0),
                      child: Container(
                          height: 60,
                          // width: _folded ? deviceWidth! - 120 : 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Theme.of(context).colorScheme.lightColor,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10.0,
                                  offset: const Offset(12.0, 15.0),
                                  color: colors.tempdarkColor.withOpacity(0.2),
                                  spreadRadius: -7),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/fullApps/modernNews/svg/live_news.svg",
                                semanticsLabel: 'live news',
                                height: 21.0,
                                width: 21.0,
                                color: Theme.of(context).colorScheme.fontColor,
                              ),
                              Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(start: 8.0),
                                  child: Text(
                                    getTranslated(context, 'liveNews')!,
                                    style: Theme.of(this.context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .fontColor,
                                            fontWeight: FontWeight.w600),
                                  ))
                            ],
                          ))),
                  onTap: () {},
                )),
            Expanded(
                flex: 3,
                child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 10.0),
                    child: InkWell(
                      child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Theme.of(context).colorScheme.lightColor,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10.0,
                                  offset: const Offset(12.0, 15.0),
                                  color: colors.tempdarkColor.withOpacity(0.2),
                                  spreadRadius: -7),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(start: 0.0),
                            child: SvgPicture.asset(
                              "assets/images/fullApps/modernNews/svg/search_icon.svg",
                              height: 18,
                              width: 18,
                              color: Theme.of(context).colorScheme.fontColor,
                            ),
                          )),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Search()));
                      },
                    )))
          ],
        ));
  }

  updateHome() {
    setState(() {});
  }

  Widget viewBreakingNews() {
    return Padding(
        padding: EdgeInsetsDirectional.only(
          top: 15.0,
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsetsDirectional.only(start: 8.0),
                  child: Text(
                    getTranslated(context, 'breakingNews_lbl')!,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .fontColor
                            .withOpacity(0.9),
                        fontWeight: FontWeight.w600),
                  )),
              breakingNewsList.isEmpty
                  ? Center(
                      child: Text(getTranslated(context, 'breaking_not_avail')!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .fontColor
                                      .withOpacity(0.8))))
                  : SizedBox(
                      height: 250.0,
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: breakingNewsList.length,
                        itemBuilder: (context, index) {
                          return breakingNewsItem(index);
                        },
                      ))
            ]));
  }

  Widget viewRecentContent() {
    return Padding(
        padding: EdgeInsetsDirectional.only(
          top: 15.0,
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsetsDirectional.only(start: 8.0),
                  child: Text(
                    getTranslated(context, 'recentNews_lbl')!,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .fontColor
                            .withOpacity(0.9),
                        fontWeight: FontWeight.w600),
                  )),
              recentNewsList.isEmpty
                  ? Center(
                      child: Text(getTranslated(context, 'recent_no_news')!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .fontColor
                                      .withOpacity(0.8))))
                  : SizedBox(
                      height: 250.0,
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        controller: controller,
                        itemCount: recentNewsList.length,
                        itemBuilder: (context, index) {
                          return recentNewsItem(index);
                        },
                      ))
            ]));
  }

  Widget viewUserNewsContent() {
    return Padding(
        padding: EdgeInsetsDirectional.only(
          top: 15.0,
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsetsDirectional.only(start: 8.0),
                  child: Text(
                    getTranslated(context, 'forYou_lbl')!,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .fontColor
                            .withOpacity(0.9),
                        fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                  height: 250.0,
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    controller: controller1,
                    itemCount: userNewsList.reversed.length,
                    itemBuilder: (context, index) {
                      return (index == userNewsList.length)
                          ? Center(child: CircularProgressIndicator())
                          : userNewsItem(index);
                    },
                  ))
            ]));
  }

  Widget catText() {
    return Padding(
        padding: EdgeInsetsDirectional.only(top: 20.0, bottom: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 2,
                child: Divider(
                  color:
                      Theme.of(context).colorScheme.fontColor.withOpacity(0.7),
                  endIndent: 20,
                  thickness: 1.0,
                )),
            Text(
              getTranslated(context, 'category_lbl')!,
              style: Theme.of(context).textTheme.subtitle1?.merge(TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .fontColor
                        .withOpacity(0.7),
                  )),
            ),
            Expanded(
                flex: 7,
                child: Divider(
                  color:
                      Theme.of(context).colorScheme.fontColor.withOpacity(0.7),
                  indent: 20,
                  thickness: 1.0,
                )),
          ],
        ));
  }

  recentNewsItem(int index) {
    List<String> tagList = [];
    if (recentNewsList[index].tagName! != "") {
      final tagName = recentNewsList[index].tagName!;
      tagList = tagName.split(',');
    }

    if (recentNewsList[index].tagId! != "") {}

    allImage.clear();

    allImage.add(recentNewsList[index].image!);
    if (recentNewsList[index].imageDataList!.isNotEmpty) {
      for (int i = 0; i < recentNewsList[index].imageDataList!.length; i++) {
        allImage.add(recentNewsList[index].imageDataList![i].otherImage!);
      }
    }

    return Padding(
      padding:
          EdgeInsetsDirectional.only(top: 15.0, start: index == 0 ? 0 : 6.0),
      child: InkWell(
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  recentNewsList[index].image!,
                  height: 250.0,
                  width: 193.0,
                  fit: BoxFit.cover,
                )),
            Positioned.directional(
                textDirection: Directionality.of(context),
                bottom: 7.0,
                start: 7,
                end: 7,
                height: 99,
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
                                recentNewsList[index].date!,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                        color: colors.tempdarkColor,
                                        fontSize: 10.0),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    recentNewsList[index].title!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.copyWith(
                                            color: colors.tempdarkColor
                                                .withOpacity(0.9),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.5,
                                            height: 1.0),
                                    maxLines: 3,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      recentNewsList[index].tagName! != ""
                                          ? SizedBox(
                                              height: 16.0,
                                              child: ListView.builder(
                                                  physics:
                                                      AlwaysScrollableScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  itemCount: tagList.length >= 2
                                                      ? 2
                                                      : tagList.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .only(
                                                                    start: index ==
                                                                            0
                                                                        ? 0
                                                                        : 1.5),
                                                        child: InkWell(
                                                          child: Container(
                                                              height: 16.0,
                                                              width: 45,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              padding: EdgeInsetsDirectional
                                                                  .only(
                                                                      start:
                                                                          3.0,
                                                                      end: 3.0,
                                                                      top: 2.5,
                                                                      bottom:
                                                                          2.5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3.0),
                                                                color: colors
                                                                    .primary
                                                                    .withOpacity(
                                                                        0.08),
                                                              ),
                                                              child: Text(
                                                                tagList[index],
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyText2
                                                                    ?.copyWith(
                                                                      color: colors
                                                                          .primary,
                                                                      fontSize:
                                                                          9.5,
                                                                    ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
                                                              )),
                                                          onTap: () async {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          NewsTag(
                                                                    tagName:
                                                                        tagList[
                                                                            index],
                                                                  ),
                                                                ));
                                                          },
                                                        ));
                                                  }))
                                          : Container(),
                                      Spacer(),
                                      InkWell(
                                        child: SvgPicture.asset(
                                          recentNewsList[index].status == "1"
                                              ? "assets/images/fullApps/modernNews/svg/bookmarkfilled_icon.svg"
                                              : "assets/images/fullApps/modernNews/svg/bookmark_icon.svg",
                                          semanticsLabel: 'bookmark icon',
                                          height: 14,
                                          width: 14,
                                        ),
                                        onTap: () async {},
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 8.0),
                                        child: InkWell(
                                          child: SvgPicture.asset(
                                            "assets/images/fullApps/modernNews/svg/share_icon.svg",
                                            semanticsLabel: 'share icon',
                                            height: 13,
                                            width: 13,
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
                bottom: (250 - 80) / 2,
                start: 190 - 65,
                child: InkWell(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10.5),
                            decoration: BoxDecoration(
                                color: colors.tempboxColor.withOpacity(0.7),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              recentNewsList[index].like == "1"
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
          News model = recentNewsList[index];
          List<News> recList = [];
          recList.addAll(recentNewsList);
          recList.removeAt(index);
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
        },
      ),
    );
  }

  userNewsItem(int index) {
    List<String> tagList = [];
    if (userNewsList[index].tagName! != "") {
      final tagName = userNewsList[index].tagName!;
      tagList = tagName.split(',');
    }

    List<String> tagId = [];

    if (userNewsList[index].tagId! != "") {
      tagId = userNewsList[index].tagId!.split(",");
    }

    allImage.clear();

    allImage.add(userNewsList[index].image!);
    if (userNewsList[index].imageDataList!.isNotEmpty) {
      for (int i = 0; i < userNewsList[index].imageDataList!.length; i++) {
        allImage.add(userNewsList[index].imageDataList![i].otherImage!);
      }
    }

    return Padding(
      padding:
          EdgeInsetsDirectional.only(top: 15.0, start: index == 0 ? 0 : 6.0),
      child: InkWell(
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  userNewsList[index].image!,
                  height: 250.0,
                  width: 193.0,
                  fit: BoxFit.cover,
                )),
            Positioned.directional(
                textDirection: Directionality.of(context),
                bottom: 7.0,
                start: 7,
                end: 7,
                height: 99,
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
                                userNewsList[index].date!,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                        color: colors.tempdarkColor,
                                        fontSize: 10.0),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    userNewsList[index].title!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.copyWith(
                                            color: colors.tempdarkColor
                                                .withOpacity(0.9),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.5,
                                            height: 1.0),
                                    maxLines: 3,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      userNewsList[index].tagName! != ""
                                          ? SizedBox(
                                              height: 16.0,
                                              child: ListView.builder(
                                                  physics:
                                                      AlwaysScrollableScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  shrinkWrap: true,
                                                  itemCount: tagList.length >= 2
                                                      ? 2
                                                      : tagList.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .only(
                                                                    start: index ==
                                                                            0
                                                                        ? 0
                                                                        : 1.5),
                                                        child: InkWell(
                                                          child: Container(
                                                              height: 16.0,
                                                              width: 45,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              padding: EdgeInsetsDirectional
                                                                  .only(
                                                                      start:
                                                                          3.0,
                                                                      end: 3.0,
                                                                      top: 2.5,
                                                                      bottom:
                                                                          2.5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3.0),
                                                                color: colors
                                                                    .primary
                                                                    .withOpacity(
                                                                        0.08),
                                                              ),
                                                              child: Text(
                                                                tagList[index],
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyText2
                                                                    ?.copyWith(
                                                                      color: colors
                                                                          .primary,
                                                                      fontSize:
                                                                          9.5,
                                                                    ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
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
                                                                        tagList[
                                                                            index],
                                                                  ),
                                                                ));
                                                          },
                                                        ));
                                                  }))
                                          : Container(),
                                      Spacer(),
                                      InkWell(
                                        child: SvgPicture.asset(
                                          userNewsList[index].status == "1"
                                              ? "assets/images/fullApps/modernNews/svg/bookmarkfilled_icon.svg"
                                              : "assets/images/fullApps/modernNews/svg/bookmark_icon.svg",
                                          semanticsLabel: 'bookmark icon',
                                          height: 14,
                                          width: 14,
                                        ),
                                        onTap: () async {},
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            start: 8.0),
                                        child: InkWell(
                                          child: SvgPicture.asset(
                                            "assets/images/fullApps/modernNews/svg/share_icon.svg",
                                            semanticsLabel: 'share icon',
                                            height: 13,
                                            width: 13,
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
                bottom: (250 - 80) / 2,
                start: 190 - 65,
                child: InkWell(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10.5),
                            decoration: BoxDecoration(
                                color: colors.tempboxColor.withOpacity(0.7),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              userNewsList[index].like == "1"
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
          News model = userNewsList[index];
          List<News> usList = [];
          usList.addAll(userNewsList);
          usList.removeAt(index);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => NewsDetails(
                    model: model,
                    index: index,
                    updateParent: updateHomePage,
                    id: model.id,
                    isFav: false,
                    isDetails: true,
                    news: usList,
                  )));
        },
      ),
    );
  }

  breakingNewsItem(int index) {
    return Padding(
      padding:
          EdgeInsetsDirectional.only(top: 15.0, start: index == 0 ? 0 : 6.0),
      child: InkWell(
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  breakingNewsList[index].image!,
                  height: 250.0,
                  width: 193.0,
                  fit: BoxFit.cover,
                )),
            Positioned.directional(
                textDirection: Directionality.of(context),
                bottom: 7.0,
                start: 7,
                end: 7,
                height: 62,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                breakingNewsList[index].title!,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(
                                        color: colors.tempdarkColor
                                            .withOpacity(0.9),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.5,
                                        height: 1.0),
                                maxLines: 3,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )))),
          ],
        ),
        onTap: () {
          BreakingNewsModel model = breakingNewsList[index];
          List<BreakingNewsModel> tempBreak = [];
          tempBreak.addAll(breakingNewsList);
          tempBreak.removeAt(index);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => NewsDetails(
                    model1: model,
                    index: index,
                    updateParent: updateHomePage,
                    id: model.id,
                    isFav: false,
                    isDetails: false,
                    news1: tempBreak,
                    //updateHome: updateHome,
                  )));
        },
      ),
    );
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

//get all category using api
/*Future<void> getCat() async {
    if (category_mode == "1") {
      _isNetworkAvail = await isNetworkAvailable();
      if (_isNetworkAvail) {
        try {
          var param = {
            ACCESS_KEY: access_key,
          };

          http.Response response = await http.post(Uri.parse(getCatApi), body: param, headers: headers).timeout(Duration(seconds: timeOut));
          var getData = json.decode(response.body);

          String error = getData["error"];
          if (error == "false") {
            tempCatList.clear();
            var data = getData["data"];
            tempCatList = (data as List).map((data) => new Category.fromJson(data)).toList();
            catList.addAll(tempCatList);
            for (int i = 0; i < catList.length; i++) {
              if (catList[i].subData!.length != 0) {
                catList[i]
                    .subData!
                    .insert(0, SubCategory(id: "0", subCatName: "${getTranslated(context, 'all_lbl')! + "\t" + catList[i].categoryName!}"));
              }
            }

            _tabs.clear();
            this._addInitailTab();
          }
          if (mounted)
            setState(() {
              _isLoading = false;
            });
        } on TimeoutException catch (_) {
          setSnackbar(getTranslated(context, 'somethingMSg')!);
          setState(() {
            _isLoading = false;
            _isLoadingMore = false;
          });
        }
      } else {
        setSnackbar(getTranslated(context, 'internetmsg')!);
        setState(() {
          _isLoading = false;
          _isLoadingMore = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
        _isLoadingMore = false;
      });
    }
  }*/

//get bookmark news list id using api
/*Future<void> _getBookmark() async {
    if (CUR_USERID != "") {
      _isNetworkAvail = await isNetworkAvailable();
      if (_isNetworkAvail) {
        try {
          var param = {
            ACCESS_KEY: access_key,
            USER_ID: CUR_USERID,
          };
          http.Response response = await http.post(Uri.parse(getBookmarkApi), body: param, headers: headers).timeout(Duration(seconds: timeOut));

          var getdata = json.decode(response.body);

          String error = getdata["error"];
          if (error == "false") {
            bookmarkList.clear();
            var data = getdata["data"];

            bookmarkList = (data as List).map((data) => new News.fromJson(data)).toList();
            bookMarkValue.clear();

            for (int i = 0; i < bookmarkList.length; i++) {
              setState(() {
                bookMarkValue.add(bookmarkList[i].newsId);
              });
            }
            if (mounted)
              setState(() {
                _isLoading = false;
              });
          } else {
            setState(() {
              _isLoadingMore = false;
              _isLoading = false;
            });
          }
        } on TimeoutException catch (_) {
          setSnackbar(getTranslated(context, 'somethingMSg')!);
          setState(() {
            _isLoading = false;
          });
        }
      } else {
        setSnackbar(getTranslated(context, 'internetmsg')!);
      }
    }
  }*/
}
