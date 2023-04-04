import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Model/All_Course_Model.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Model/My_Course_Model.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Model/Saved_Course_Model.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/activity/CourseDetailActivityMobile.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/activity/HomeActivityMobile.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/SliverAppBarDelegate.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/StringsRes.dart';

class CourseMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CourseMobileState();
  }
}

class CourseMobileState extends State<CourseMobile>
    with TickerProviderStateMixin {
  ScrollController? scrollController;
  TabController? _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    scrollController!.addListener(() => setState(() {}));
    _controller = TabController(length: 3, vsync: this);

    _controller!.addListener(() {
      setState(() {
        _selectedIndex = _controller!.index;
      });
    });
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    scrollController!.dispose();
    super.dispose();
  }

  Widget AllCourse() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 60),
      child: GridView.count(
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 0, top: 10),
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 0.8,
        physics: ClampingScrollPhysics(),
        children: List.generate(AllCourseList.length, (index) {
          All_Course_Model allCourse = AllCourseList[index];
          return SizedBox(
              child: GestureDetector(
                  child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: EdgeInsets.only(bottom: 12, right: 10),
                      decoration: DesignConfig.boxDecorationContainer(
                          ColorsRes.white, 10),
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              child: DesignConfig.DisplayCourseImage(
                                AllCourseList[index].imageList![1].localimg,
                                AllCourseList[index].imageList![1].image,
                                AllCourseList[index].imageList![1].blurUrl,
                                double.maxFinite,
                                double.maxFinite,
                              ),
                            ),
                            DesignConfig.DisplayCourseTitle(
                                allCourse.CourseName!, 2),
                            Container(
                                margin: EdgeInsets.only(left: 10, top: 5),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  AllCourseList[index].CourseSpeker!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: ColorsRes.introMessagecolor,
                                      fontSize: 10),
                                  textAlign: TextAlign.left,
                                )),
                            DesignConfig.DisplayBundlePriceAll_course(
                                allCourse, false, false),
                            SizedBox(height: 5)
                          ])),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CourseDetailActivityMobile(
                              id: index,
                              type: "allcourse",
                            )));
                  }));
        }),
      ),
    );
  }

  Widget MyCourse() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 60),
      child: new ListView.builder(
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
        shrinkWrap: true,
        controller: scrollController,
        physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          My_Course_Model item = MyCourseList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CourseDetailActivityMobile(
                        id: index,
                        type: "mycourse",
                      )));
            },
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: EdgeInsets.only(bottom: 12),
              decoration:
                  DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
              child: IntrinsicHeight(
                child: Row(children: <Widget>[
                  DesignConfig.DisplayCourseImage(
                      MyCourseList[index].imageList![1].localimg,
                      MyCourseList[index].imageList![1].image,
                      MyCourseList[index].imageList![1].blurUrl,
                      100,
                      100),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        DesignConfig.DisplayCourseTitle(
                            MyCourseList[index].CourseName!, 2),
                        DesignConfig.DisplayCoursePriceMy_course(
                          item,
                          false,
                          false,
                          ColorsRes.secondgradientcolor,
                          ColorsRes.firstgradientcolor,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          );
        },
        itemCount: MyCourseList.length,
      ),
    );
  }

  Widget SavedCourse() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.only(bottom: 60),
      child: new ListView.builder(
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
        shrinkWrap: true,
        controller: scrollController,
        physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          Saved_Course_Model item = SavedCourseList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CourseDetailActivityMobile(
                        id: index,
                        type: "savecourse",
                      )));
            },
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: EdgeInsets.only(bottom: 12),
              decoration:
                  DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
              child: IntrinsicHeight(
                child: Row(children: <Widget>[
                  DesignConfig.DisplayCourseImage(
                      SavedCourseList[index].imageList![1].localimg,
                      SavedCourseList[index].imageList![1].image,
                      SavedCourseList[index].imageList![1].blurUrl,
                      100,
                      100),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        DesignConfig.DisplayCourseTitle(
                            SavedCourseList[index].CourseName!, 2),
                        DesignConfig.DisplayCoursePriceSaved_course(
                          item,
                          false,
                          false,
                          ColorsRes.secondgradientcolor,
                          ColorsRes.firstgradientcolor,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          );
        },
        itemCount: SavedCourseList.length,
      ),
    );
  }

  Widget CourseMenu() {
    return DefaultTabController(
      length: 3,
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
                  background: SvgPicture.asset(
                    "assets/images/fullApps/eStudy/topback.svg",
                    height: MediaQuery.of(context).size.width,
                    // fit: BoxFit.cover,
                  ) //Images.network
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
                        child: Text(StringsRes.All_lb,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ),
                      Tab(
                        child: Text(StringsRes.My_Courses_lb,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ),
                      Tab(
                        child: Text(StringsRes.Saved_lb,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ),
                    ],
                  ),
                )),
          ];
        },
        body: new TabBarView(
          controller: _controller,
          children: <Widget>[
            AllCourse(),
            MyCourse(),
            SavedCourse(),
          ],
        ),
      ), //<Widget>[]
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeActivityMobile(),
            )) as Future<bool>;
      } as Future<bool> Function()?,
      child: Scaffold(
        backgroundColor: ColorsRes.bgPage,
        resizeToAvoidBottomInset: false,
        body: CourseMenu(),
      ),
    );
  }
}
