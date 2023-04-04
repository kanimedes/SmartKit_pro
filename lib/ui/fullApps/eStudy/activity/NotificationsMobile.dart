import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Model/Notification_Model.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/activity/HomeActivityMobile.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/StringsRes.dart';

class NotificationsMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new NotificationsMobileState();
  }
}

class NotificationsMobileState extends State<NotificationsMobile> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.portraitDown,
    ]);
  }

  Widget NotificationMenu() {
    return NotificationList.isNotEmpty
        ? CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                shadowColor: Colors.transparent,
                snap: false,
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      StringsRes.Notfication_lb,
                      style: TextStyle(
                          color: ColorsRes.introTitlecolor, fontSize: 28),
                    ), //Text
                    background: SvgPicture.asset(
                      "assets/images/fullApps/eStudy/topback.svg",
                      fit: BoxFit.cover,
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
              ), //SliverAppBar
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                    title: Text(NotificationList[index].date!,
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorsRes.appcolor,
                        )),
                    subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(NotificationList[index].discount!,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: ColorsRes.introTitlecolor)),
                          SizedBox(height: 10),
                          new Text(NotificationList[index].message!,
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorsRes.introMessagecolor,
                              )),
                          SizedBox(height: 10),
                          Divider(
                            height: 5,
                            thickness: 1,
                          )
                        ]),
                    isThreeLine: true,
                  ), //ListTile
                  childCount: NotificationList.length,
                ), //SliverChildBuildDelegate
              ),
              SliverPadding(padding: EdgeInsets.only(bottom: 90))
            ], //<Widget>[]
          )
        : CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                shadowColor: Colors.transparent,
                snap: false,
                pinned: true,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      StringsRes.Notfication_lb,
                      style: TextStyle(
                          color: ColorsRes.introTitlecolor, fontSize: 28),
                    ), //Text
                    background: SvgPicture.network(
                      "assets/images/fullApps/eStudy/topback.svg",
                      fit: BoxFit.cover,
                    ) //Images.network
                    ), //FlexibleSpaceBar
                expandedHeight: 0,
                backgroundColor: ColorsRes.bgcolor,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: ColorsRes.appcolor),
                  tooltip: 'Back',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ), //IconButton
              ), //SliverAppBar
              SliverFillRemaining(
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      size: 75,
                      color: ColorsRes.introMessagecolor,
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      StringsRes.No_Notification_lb,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Nunito-Regular',
                          fontSize: 28,
                          color: ColorsRes.introTitlecolor),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Text(StringsRes.No_Notification_Message_lb,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Nunito-Regular',
                              fontSize: 18,
                              color: ColorsRes.black)),
                    ),
                  ]))) //SliverList
            ], //<Widget>[]
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
        body: NotificationMenu(),
      ),
    );
  }
}
