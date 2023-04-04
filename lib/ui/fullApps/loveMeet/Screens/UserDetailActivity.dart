import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Model/Gallary_Model.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Model/Profile_Model.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/NotificationActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/StringsRes.dart';

class UserDetailActivity extends StatefulWidget {
  final int? id;
  const UserDetailActivity({Key? key, this.id}) : super(key: key);

  @override
  _UserDetailActivityState createState() => _UserDetailActivityState();
}

class _UserDetailActivityState extends State<UserDetailActivity> {
  ScrollController? scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController!.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    scrollController!.dispose();
    super.dispose();
  }

  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin =
        MediaQuery.of(context).size.height * .40 - 2.0;
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
    return Positioned(
      top: top,
      left: 0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: ColorsRes.backgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            ),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 20.0, top: 20.0),
                      child: Text(
                        profileList[widget.id!].name!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorsRes.darkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Text(
                        profileList[widget.id!].occupation!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorsRes.grayColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 20.0, top: 20.0),
                      child: Text(
                        StringsRes.locationText,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorsRes.darkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Text(
                        profileList[widget.id!].location!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorsRes.grayColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 20.0, top: 20.0),
                      child: Text(
                        StringsRes.aboutText,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorsRes.darkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Text(
                        profileList[widget.id!].about!,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorsRes.grayColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 20.0, top: 20.0),
                      child: Text(
                        StringsRes.interestedText,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ColorsRes.darkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 20.0, top: 10.0),
                      child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          spacing: 10,
                          runSpacing: 4.0,
                          children: List.generate(
                              profileList[widget.id!].interestedList!.length >=
                                      10
                                  ? 10
                                  : profileList[widget.id!]
                                      .interestedList!
                                      .length,
                              (i) => GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: ColorsRes.darkColor)),
                                        padding: EdgeInsetsDirectional.only(
                                            start: 8,
                                            end: 8,
                                            top: 8,
                                            bottom: 8),
                                        child: Text(
                                            profileList[widget.id!]
                                                .interestedList![i]
                                                .name!,
                                            style: TextStyle(
                                              height: 1.0,
                                              color: ColorsRes.darkColor,
                                            ))),
                                  ))),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.09,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        children: List.generate(gallaryList.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: OctoImage(
                                  image: CachedNetworkImageProvider(
                                    gallaryList[index].imgurl!,
                                  ),
                                  placeholderBuilder: OctoPlaceholder.blurHash(
                                    gallaryList[index].hash!,
                                  ),
                                  errorBuilder:
                                      OctoError.icon(color: Colors.black),
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.width / 5.2),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return navigationPage() as Future<bool>;
        },
        child: Scaffold(
          body: Stack(children: [
            CustomScrollView(controller: scrollController, slivers: <Widget>[
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
                    style: TextStyle(color: ColorsRes.darkColor, fontSize: 28),
                  ), //Text
                  background: Stack(children: [
                    OctoImage(
                      image: CachedNetworkImageProvider(
                        profileList[widget.id!].imgurl!,
                      ),
                      placeholderBuilder: OctoPlaceholder.blurHash(
                        profileList[widget.id!].hash!,
                      ),
                      errorBuilder: OctoError.icon(color: Colors.black),
                      fit: BoxFit.fill,
                    ),
                  ]), //Images.network
                ),
                actions: [
                  IconButton(
                      icon: Icon(Icons.notifications_none),
                      color: ColorsRes.darkColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationActivity(),
                          ),
                        );
                      }),
                  GestureDetector(
                      onTap: () {
                        DesignConfig.showFilter(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/images/fullApps/loveMeet/filter.svg",
                            color: ColorsRes.darkColor,
                          ),
                        ),
                      ))
                ], //FlexibleSpaceBar
                expandedHeight: MediaQuery.of(context).size.height * .5,
                backgroundColor: ColorsRes.backgroundColor,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: ColorsRes.darkColor),
                  tooltip: 'Back',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ), //IconButton
              ), //SliverAppBar
            ]),
            _buildFab(),
          ]),
        ));
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
