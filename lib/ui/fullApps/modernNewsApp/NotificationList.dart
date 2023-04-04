import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Session.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Color.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/ListItemNotification.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Model/Notification.dart';
import 'Helper/String.dart';
import 'Model/News.dart';
import 'NewsDetails.dart';

class NotificationList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StateNoti();
}

class StateNoti extends State<NotificationList> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController controller = new ScrollController();
  ScrollController controller1 = new ScrollController();

  List<NotificationModel> tempList = [];
  final bool _isNetworkAvail = true;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey1 =
      new GlobalKey<RefreshIndicatorState>();
  TabController? _tc;
  List<NotificationModel> notiList = [];
  List<NotificationModel> tempUserList = [];
  late final List<String> _tabs = [
    getTranslated(context, 'personal_lbl')!,
    getTranslated(context, 'news_lbl')!
  ];
  List<String> selectedList = [];

  @override
  void initState() {
    _tc = TabController(length: 2, vsync: this, initialIndex: 0);
    _tc!.addListener(_handleTabControllerTick);
    tempUserList.addAll(userNotificationList);
    super.initState();
  }

  void _handleTabControllerTick() {
    setState(() {
      selectedList.clear();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    controller1.dispose();
    super.dispose();
  }

  //refresh function used in refresh notification
  Future<void> _refresh() async {
    userNotificationList.clear();
    setState(() {
      userNotificationList.addAll(tempUserList);
    });
  }

  Future<void> _refresh1() async {
    setState(() {
      notificationList.addAll(notificationList);
    });
  }

  setAppBar() {
    return PreferredSize(
        preferredSize: Size(double.infinity, 72),
        child: Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Column(children: [
              Text(
                getTranslated(context, 'notification_lbl')!,
                style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: colors.primary,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5),
              ),
              DefaultTabController(
                  length: 2,
                  child: Row(children: [
                    Container(
                        padding:
                            EdgeInsetsDirectional.only(start: 10.0, top: 15.0),
                        width: deviceWidth! / 1.8,
                        height: 35.0,
                        child: TabBar(
                          controller: _tc,
                          labelStyle: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5),
                          labelPadding: EdgeInsets.zero,
                          labelColor: colors.primary,
                          unselectedLabelColor: Theme.of(context)
                              .colorScheme
                              .fontColor
                              .withOpacity(0.7),
                          indicatorColor: colors.primary,
                          //indicatorSize: TabBarIndicatorSize.tab,
                          indicator: UnderlineTabIndicator(
                              borderSide:
                                  BorderSide(width: 3.0, color: colors.primary),
                              insets: EdgeInsets.symmetric(horizontal: 10.0)),
                          tabs: _tabs.map((e) => Tab(text: e)).toList(),
                        )),
                  ])),
              Padding(
                  padding: EdgeInsetsDirectional.only(
                      end: 15.0, start: 15.0, top: 1.0),
                  child: Divider(
                    thickness: 1.5,
                    height: 1.0,
                    color: Theme.of(context)
                        .colorScheme
                        .fontColor
                        .withOpacity(0.3),
                  ))
            ])));
  }

  deleteNotification(String id) async {
    setState(() {
      for (int i = 0; i < selectedList.length; i++) {
        userNotificationList.removeWhere((item) => item.id == selectedList[i]);
      }
    });
    selectedList.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: setAppBar(),
        body: TabBarView(controller: _tc, children: [
          RefreshIndicator(
              key: _refreshIndicatorKey1,
              onRefresh: _refresh,
              child: Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 15.0, end: 15.0, bottom: 10.0),
                  child: Column(children: <Widget>[
                    selectedList.isNotEmpty
                        ? Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                deleteNotification(selectedList.join(','));
                              },
                            ),
                          )
                        : Container(),
                    Expanded(
                        child: ListView.builder(
                      controller: controller1,
                      itemCount: userNotificationList.length,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListItemNoti(
                            userNoti: userNotificationList[index],
                            isSelected: (bool value) {
                              setState(() {
                                if (value) {
                                  selectedList
                                      .add(userNotificationList[index].id!);
                                } else {
                                  selectedList
                                      .remove(userNotificationList[index].id!);
                                }
                              });
                            },
                            key:
                                Key(userNotificationList[index].id.toString()));
                      },
                    ))
                  ]))),
          notificationList.isEmpty
              ? Padding(
                  padding:
                      const EdgeInsetsDirectional.only(top: kToolbarHeight),
                  child: Center(
                      child: Text(getTranslated(context, 'noti_nt_avail')!)))
              : RefreshIndicator(
                  key: _refreshIndicatorKey,
                  onRefresh: _refresh1,
                  child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: 15.0, end: 15.0, top: 10.0, bottom: 10.0),
                      child: ListView.builder(
                        controller: controller,
                        itemCount: notificationList.length,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return listItem(index);
                        },
                      )))
        ]));
  }

  //list of notification shown
  Widget listItem(int index) {
    NotificationModel model = notificationList[index];

    return Padding(
        padding: EdgeInsetsDirectional.only(
          top: 5.0,
          bottom: 10.0,
        ),
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.boxColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      blurRadius: 10.0,
                      offset: const Offset(5.0, 5.0),
                      color: Theme.of(context)
                          .colorScheme
                          .fontColor
                          .withOpacity(0.1),
                      spreadRadius: 1.0),
                ],
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  model.image != null || model.image != ''
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: model.image! != ""
                              ? Image.asset(
                                  model.image!,
                                  height: 80.0,
                                  width: 80,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  "assets/images/fullApps/modernNews/read.png",
                                  height: 80.0,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                        )
                      : Container(
                          height: 0,
                        ),
                  Expanded(
                      child: Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 13.0, end: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(model.title!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .fontColor
                                        .withOpacity(0.9),
                                    fontSize: 15.0,
                                    letterSpacing: 0.1)),
                        Padding(
                            padding: const EdgeInsetsDirectional.only(top: 8.0),
                            child: Text(model.date_sent!,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                        fontWeight: FontWeight.normal,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .fontColor
                                            .withOpacity(0.7),
                                        fontSize: 11)))
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
          onTap: () {
            NotificationModel model = notificationList[index];
            if (model.newsId != "") {
              getNewsById(model.newsId!, index);
            }
          },
        ));
  }

  updateParent() {
    //setState(() {});
  }

  //when open dynamic link news index and id can used for fetch specific news
  Future<void> getNewsById(String id, int index) async {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => NewsDetails(
              model: userNewsList[index],
              index: int.parse(id),
              updateParent: updateParent,
              id: userNewsList[index].id,
              isFav: false,
              isDetails: true,
              news: const [],
            )));
  }

//set snackbar msg
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
}
