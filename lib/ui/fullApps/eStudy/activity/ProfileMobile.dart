import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/eStudy/activity/HomeActivityMobile.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/StringsRes.dart';

class ProfileMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProfileMobileState();
  }
}

class ProfileMobileState extends State<ProfileMobile> {
  ScrollController? scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    scrollController!.addListener(() => setState(() {}));

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

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin =
        MediaQuery.of(context).size.height * .24 - 4.0;
    //pixels from top where scaling should start
    const double scaleStart = 96.0;
    //pixels from top where scaling should end
    const double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (scrollController!.hasClients) {
      double offset = scrollController!.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }
    return new Positioned(
      top: top,
      left: 5,
      child: new Transform(
        transform: new Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: new Container(
          alignment: Alignment.bottomLeft,
          child: Container(
              margin: EdgeInsets.only(left: 20),
              width: 104.0,
              height: 104.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.0),
                border: Border.all(
                  color: Colors.white,
                  width: 5.0,
                ),
              ),
              child: CircleAvatar(
                  radius: 30,
                  child: ClipOval(
                      child: OctoImage(
                    image: CachedNetworkImageProvider(
                      "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/estuddy%2Fpropic.jpg?alt=media&token=7a4c5c73-4049-46dd-b15b-c63fd0ea5520",
                    ),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      "LPIX]f?b.TIUtRWBRjt7x]Rjsmof",
                    ),
                    errorBuilder: OctoError.icon(color: ColorsRes.black),
                    fit: BoxFit.fill,
                  )))),
        ),
      ),
    );
  }

  Widget ProfileMenu() {
    return Stack(children: <Widget>[
      CustomScrollView(
        controller: scrollController,
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
                  "",
                  style:
                      TextStyle(color: ColorsRes.introTitlecolor, fontSize: 28),
                ), //Text
                background: Stack(children: [
                  Container(
                    color: ColorsRes.bgcolor,
                    height: MediaQuery.of(context).size.width,
                    child: SizedBox(
                        child: SvgPicture.asset(
                      'assets/images/fullApps/eStudy/topback.svg',
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .20,
                        left: MediaQuery.of(context).size.height * .18),
                    alignment: Alignment.bottomLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 18, right: 20),
                        child: Text.rich(TextSpan(
                            text: StringsRes.appname + "\n",
                            style:
                                TextStyle(color: ColorsRes.white, fontSize: 24),
                            children: <InlineSpan>[
                              TextSpan(
                                text: StringsRes.User_Email_lb + "\n",
                                style: TextStyle(
                                    color: ColorsRes.white, fontSize: 16),
                              ),
                            ]))),
                  ),
                ]) //Images.network
                ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LetsGetStartActivity()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    alignment: Alignment.center,
                    height: 40,
                    width: 78,
                    decoration: BoxDecoration(
                      color: ColorsRes.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringsRes.Logout_lb,
                            style: TextStyle(
                                color: ColorsRes.introTitlecolor, fontSize: 16),
                          ),
                        ]),
                  )), //IconButton//IconButton
            ], //FlexibleSpaceBar
            expandedHeight: MediaQuery.of(context).size.height * .3,
            backgroundColor: ColorsRes.bgcolor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: ColorsRes.white),
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
              delegate: SliverChildListDelegate([
            Center(
                child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                    decoration: DesignConfig.boxDecorationContainer(
                        ColorsRes.white, 10),
                    child: Column(children: <Widget>[
                      SizedBox(height: 20),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 1, vertical: -1),
                        title: Text(
                          StringsRes.Edit_Profile_lb,
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorsRes.black,
                          ),
                        ),
                        dense: true,
                        leading: SvgPicture.asset(
                          'assets/images/fullApps/eStudy/profile_a.svg',
                          height: 25,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1),
                        dense: true,
                        title: Text(
                          StringsRes.Instructors_lb,
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorsRes.black,
                          ),
                        ),
                        leading: SvgPicture.asset(
                          'assets/images/fullApps/eStudy/profile_b.svg',
                          height: 25,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1),
                        dense: true,
                        title: Text(
                          StringsRes.Class_Reminder_lb,
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorsRes.black,
                          ),
                        ),
                        leading: SvgPicture.asset(
                          'assets/images/fullApps/eStudy/profile_c.svg',
                          height: 25,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1),
                        dense: true,
                        title: Text(
                          StringsRes.Question_Bank_lb,
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorsRes.black,
                          ),
                        ),
                        leading: SvgPicture.asset(
                          'assets/images/fullApps/eStudy/profile_d.svg',
                          height: 25,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1),
                        dense: true,
                        title: Text(
                          StringsRes.Chat_lb,
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorsRes.black,
                          ),
                        ),
                        leading: SvgPicture.asset(
                          'assets/images/fullApps/eStudy/profile_e.svg',
                          height: 25,
                        ),
                        onTap: () {},
                      ),
                      Divider(
                        height: 0.0,
                        thickness: 2,
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1),
                        dense: true,
                        title: Text(
                          StringsRes.Settings_lb,
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorsRes.black,
                          ),
                        ),
                        leading: SvgPicture.asset(
                          'assets/images/fullApps/eStudy/profile_f.svg',
                          height: 25,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1),
                        dense: true,
                        title: Text(
                          StringsRes.Help_lb,
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorsRes.black,
                          ),
                        ),
                        leading: SvgPicture.asset(
                          'assets/images/fullApps/eStudy/profile_g.svg',
                          height: 25,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -1),
                        dense: true,
                        title: Text(
                          StringsRes.Contact_Us_lb,
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorsRes.black,
                          ),
                        ),
                        leading: SvgPicture.asset(
                          'assets/images/fullApps/eStudy/profile_h.svg',
                          height: 25,
                        ),
                        onTap: () {},
                      ),
                      SizedBox(height: 20),
                    ]))),
          ]) //SliverChildBuildDelegate
              ),
          SliverPadding(padding: EdgeInsets.only(bottom: 90))
        ], //<Widget>[]
      ),
      _buildFab(),
    ]);
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
        body: ProfileMenu(),
      ),
    );
  }
}
