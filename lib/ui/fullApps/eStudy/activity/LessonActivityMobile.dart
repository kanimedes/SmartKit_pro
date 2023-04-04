import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/eStudy/Model/Lessons_Model.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Model/Task_Model.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/activity/HomeActivityMobile.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/SliverAppBarDelegate.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/StringsRes.dart';

import 'SubLessonMobile.dart';

class LessonActivityMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LessonActivityMobileState();
  }
}

class LessonActivityMobileState extends State<LessonActivityMobile>
    with TickerProviderStateMixin {
  ScrollController? scrollController;
  int currentSelected = 0, Lesson = 1, id = 0, idvideo = 0;
  // FlickManager flickManager;
  bool descTextShowFlag = false;
  TabController? _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    scrollController!.addListener(() => setState(() {}));

    _controller = TabController(length: 2, vsync: this);

    _controller!.addListener(() {
      setState(() {
        _selectedIndex = _controller!.index;
      });
    });

    // flickManager = FlickManager(
    //   videoPlayerController: VideoPlayerController.network(LessonsList[id].LessonsContaint[idvideo].lessonsContanUrl),
    // );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    // flickManager.dispose();
    super.dispose();
  }

  Widget Lessons() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 60),
      child: ListView.builder(
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: LessonsList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration:
                    DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: new CircleAvatar(
                      radius: 30,
                      child: ClipOval(
                          child: DesignConfig.DisplayCourseImage(
                              LessonsList[index].localimg,
                              LessonsList[index].image,
                              LessonsList[index].blurUrl,
                              100.0,
                              100.0))),
                  title: new Text(LessonsList[index].lessonsName!,
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorsRes.introTitlecolor,
                      )),
                  subtitle: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 5),
                        new Text(
                            LessonsList[index].lessonsDate! +
                                " " +
                                LessonsList[index].lessonsTime!,
                            style: TextStyle(
                                fontSize: 14, color: ColorsRes.lightgraycolor)),
                        SizedBox(height: 5),
                        new Text(LessonsList[index].lessonsNumber!,
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorsRes.lightgraycolor,
                            )),
                      ]),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SubLessonMobile(
                          id: index,
                        ),
                      ),
                    );
                  },
                ));
          }),
    );
  }

  Widget Task() {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: TaskList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration:
                  DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: new Container(
                  width: 50.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: OctoImage(
                    image: CachedNetworkImageProvider(
                      TaskList[index].image!,
                    ),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      TaskList[index].blurUrl!,
                    ),
                    errorBuilder: OctoError.icon(color: Colors.black),
                    fit: BoxFit.cover,
                  ),
                ),
                title: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(TaskList[index].taskName!,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorsRes.introTitlecolor)),
                            SizedBox(height: 5),
                            new Text(TaskList[index].lessonsName!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorsRes.lightgraycolor,
                                )),
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(TaskList[index].lessonsDate!,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: ColorsRes.lightgraycolor)),
                            SizedBox(height: 5),
                            TaskList[index].taskStatus == "Pending"
                                ? new Text(TaskList[index].taskStatus!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: ColorsRes.red,
                                    ))
                                : new Text(TaskList[index].taskStatus!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: ColorsRes.green,
                                    )),
                          ])
                    ]),
                onTap: () {},
              ));
        });
  }

  Widget LessonsMenu() {
    return new DefaultTabController(
      length: 2,
      child: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              systemOverlayStyle: SystemUiOverlayStyle.light,
              shadowColor: Colors.transparent,
              snap: false,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )), //Text
                /*background: SvgPicture.asset(
                    "assets/images/fullApps/eStudy/topback.svg",
                    height: MediaQuery.of(context).size.width,
                    // fit: BoxFit.cover,
                  )*/ //Images.network
              ), //FlexibleSpaceBar
              expandedHeight: 0,
              backgroundColor: ColorsRes.bgcolor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: ColorsRes.appcolor),
                tooltip: 'Back',
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomeActivityMobile(),
                    ),
                  );
                },
              ), //IconButton
            ),
            SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppBarDelegate(
                  TabBar(
                    indicatorColor: ColorsRes.appcolor,
                    indicatorWeight: 2,
                    controller: _controller,
                    labelColor: ColorsRes.appcolor,
                    unselectedLabelColor: ColorsRes.tabItemColor,
                    tabs: [
                      Tab(
                        child: Text(StringsRes.Lessons_lb,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ),
                      Tab(
                        child: Text(StringsRes.Task_lb,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ),
                    ],
                  ),
                )),
          ];
        },
        body: WillPopScope(
          onWillPop: () {
            return Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeActivityMobile(),
              ),
            ) as Future<bool>;
          } as Future<bool> Function()?,
          child: new TabBarView(
            controller: _controller,
            children: <Widget>[
              Lessons(),
              Task(),
            ],
          ),
        ),
      ), //<Widget>[]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.bgPage,
      resizeToAvoidBottomInset: false,
      body: LessonsMenu(),
    );
  }
}
