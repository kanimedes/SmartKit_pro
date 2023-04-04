import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/newsApp/activity/Profile/BookmarkPost.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/Profile/NewArticle.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/Profile/TextPost.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/Profile/VideoPost.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/StringsRes.dart';

import 'AudioPost.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  ScrollController? scrollController;
  bool silverCollapsed = false;
  String myTitle = "WRTeam";
  double expandheight = 160;
  TabController? _tabController;

  Widget _buildActions() {
    Widget profile = new GestureDetector(
      onTap: () {
        //profile setting
      },
      child: new Container(
          height: 30.0,
          width: 45.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
            border: Border.all(color: Colors.grey, width: 2.0),
          ),
          child: CircleAvatar(
              radius: 30,
              child: ClipOval(
                  child: OctoImage(
                image: CachedNetworkImageProvider(
                    "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fdefaultprofile.jpg?alt=media&token=b2810172-c9f2-4d40-9f2a-0d58bde25d41"),
                placeholderBuilder:
                    OctoPlaceholder.blurHash("LlHenEjZ_NWB%Mj[WBWV~qkB-;of"),
                errorBuilder: OctoError.icon(color: Colors.black),
                fit: BoxFit.cover,
              )))),
    );

    double scale;
    if (scrollController!.hasClients) {
      scale = scrollController!.offset / 300;
      scale = scale * 2;
      if (scale > 1) {
        scale = 1.0;
      }
    } else {
      scale = 0.0;
    }

    return new Transform(
      transform: new Matrix4.identity()..scale(scale, scale),
      alignment: Alignment.center,
      child: profile,
    );
  }

  @override
  void dispose() {
    scrollController!.dispose();

    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    _tabController = new TabController(vsync: this, length: 4);
    _tabController!.addListener(_handleTabSelection);
    scrollController!.addListener(() {
      if (scrollController!.offset > expandheight &&
          !scrollController!.position.outOfRange) {
        if (!silverCollapsed) {
          // do what ever you want when silver is collapsing !

          myTitle = StringsRes.profile;
          silverCollapsed = true;
          setState(() {});
        }
      }
      if (scrollController!.offset <= expandheight &&
          !scrollController!.position.outOfRange) {
        if (silverCollapsed) {
          // do what ever you want when silver is expanding !

          myTitle = "WRTeam";
          silverCollapsed = false;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new DefaultTabController(
        length: 4,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                backgroundColor: ColorsRes.appcolor,
                expandedHeight: expandheight,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    silverCollapsed ? myTitle : '',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                  background: expandAppbarWidget(),
                ),
                actions: <Widget>[
                  Opacity(
                    opacity: silverCollapsed ? 1 : 0,
                    child: new Padding(
                      padding: EdgeInsets.all(5.0),
                      child: _buildActions(),
                    ),
                  ),
                ],
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  silverCollapsed,
                  TabBar(
                    indicatorColor: ColorsRes.blue,
                    controller: _tabController,
                    labelColor: Colors.black87,
                    unselectedLabelColor: ColorsRes.grey,
                    tabs: [
                      Tab(
                          icon: SvgPicture.asset(
                        "assets/images/fullApps/newsapp/svg/text_post.svg",
                        height: MediaQuery.of(context).size.width / 18,
                        width: MediaQuery.of(context).size.width / 18,
                        color: tabColor(0),
                      )),
                      Tab(
                          icon: SvgPicture.asset(
                        "assets/images/fullApps/newsapp/svg/video_post.svg",
                        height: MediaQuery.of(context).size.width / 18,
                        width: MediaQuery.of(context).size.width / 18,
                        color: tabColor(1),
                      )),
                      Tab(
                          icon: SvgPicture.asset(
                        "assets/images/fullApps/newsapp/svg/audio_post.svg",
                        height: MediaQuery.of(context).size.width / 18,
                        width: MediaQuery.of(context).size.width / 18,
                        color: tabColor(2),
                      )),
                      Tab(
                          icon: SvgPicture.asset(
                        "assets/images/fullApps/newsapp/svg/bookmark_post.svg",
                        height: MediaQuery.of(context).size.width / 18,
                        width: MediaQuery.of(context).size.width / 18,
                        color: tabColor(3),
                      )),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: Container(
            margin: EdgeInsets.only(top: silverCollapsed ? kToolbarHeight : 0),
            child: new TabBarView(
              controller: _tabController,
              children: <Widget>[
                new TextPost(),
                new VideoPost(),
                new AudioPost(),
                new BookmarkPost(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  expandAppbarWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ButtonClickAnimation(
            onTap: () {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (context) => NewArticle()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15, top: 10, bottom: 5),
              child: SvgPicture.asset(
                "assets/images/fullApps/newsapp/svg/upload.svg",
                height: MediaQuery.of(context).size.width / 18,
                width: MediaQuery.of(context).size.width / 18,
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: ColorsRes.blue,
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ClipOval(
                          child: OctoImage(
                            image: CachedNetworkImageProvider(
                                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Fdefaultprofile.jpg?alt=media&token=b2810172-c9f2-4d40-9f2a-0d58bde25d41"),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                                "LlHenEjZ_NWB%Mj[WBWV~qkB-;of"),
                            errorBuilder: OctoError.icon(color: Colors.black),
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.add_circle,
                        color: ColorsRes.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(myTitle,
                      style: Theme.of(context).textTheme.subtitle1!.merge(
                          TextStyle(
                              color: ColorsRes.white,
                              fontWeight: FontWeight.bold))),
                  Text("wrteam02@gmail.com",
                      style: TextStyle(
                        color: ColorsRes.white,
                      )),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.button!.merge(TextStyle(
                  color: ColorsRes.white, fontWeight: FontWeight.bold)),
              text: "20k",
              children: const <TextSpan>[
                TextSpan(
                    text: "\nfollowers",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          SizedBox(width: 20),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.button!.merge(TextStyle(
                  color: ColorsRes.white, fontWeight: FontWeight.bold)),
              text: "128",
              children: const <TextSpan>[
                TextSpan(
                    text: "\nfollowing",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          SizedBox(width: 20),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: Theme.of(context).textTheme.button!.merge(TextStyle(
                  color: ColorsRes.white, fontWeight: FontWeight.bold)),
              text: "10",
              children: const <TextSpan>[
                TextSpan(
                    text: "\nposts",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ],
            ),
          ),
        ]),
        SizedBox(height: 5),
      ],
    );
  }

  tabColor(int i) {
    return _tabController!.index == i
        ? ColorsRes.blue
        : silverCollapsed
            ? ColorsRes.grey.withOpacity(0.3)
            : ColorsRes.appcolor.withOpacity(0.5);
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  bool silverCollapsed;

  _SliverAppBarDelegate(this.silverCollapsed, this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: silverCollapsed
          ? ColorsRes.white
          : ColorsRes.appcolor.withOpacity(0.5),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
