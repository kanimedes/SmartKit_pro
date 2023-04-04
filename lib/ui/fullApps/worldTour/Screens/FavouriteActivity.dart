import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/NotificationActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBox.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBoxFull.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/model/FavouriteModel.dart';

class FavouriteActivity extends StatefulWidget {
  const FavouriteActivity({Key? key}) : super(key: key);

  @override
  FavouriteActivityState createState() => FavouriteActivityState();
}

class FavouriteActivityState extends State<FavouriteActivity> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      drawerScrimColor: Colors.transparent,
      drawer: DesignConfig.drawer(_scaffoldKey, context),
      body: GlassBoxFull(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.only(left: 10.0, top: 25.0),
                        child: GlassBox(
                          redius: 40.0,
                          width: 50,
                          height: 50,
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                    "assets/images/fullApps/worldTour/svg/drawer_icon.svg")),
                          ),
                        )))),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationActivity(),
                    ),
                  );
                },
                child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.only(left: 10.0, top: 25.0),
                        child: GlassBox(
                          redius: 40.0,
                          width: 50,
                          height: 50,
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset(
                                    "assets/images/fullApps/worldTour/svg/notifications_icon.svg")),
                          ),
                        )))),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 8.4,
                    left: MediaQuery.of(context).size.width / 15.5),
                child: Text(
                  StringsRes.favouritesText,
                  style: TextStyle(
                      fontSize: 35,
                      color: ColorsRes.bottomColor,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 6.2),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: favouriteList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: DesignConfig.boxDecorationButtonColor(
                                ColorsRes.white.withOpacity(0.7),
                                ColorsRes.white.withOpacity(0.6),
                                40),
                            padding: EdgeInsets.all(15.0),
                            margin: EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 20.0),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: SizedBox(
                                                height: 80,
                                                width: 80,
                                                child: Card(
                                                  shape: DesignConfig
                                                      .setRoundedBorder(
                                                          Colors.transparent,
                                                          25,
                                                          false),
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  child: OctoImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                      favouriteList[index]
                                                          .image!,
                                                    ),
                                                    placeholderBuilder:
                                                        OctoPlaceholder
                                                            .blurHash(
                                                      favouriteList[index]
                                                          .blurUrl!,
                                                    ),
                                                    width: double.maxFinite,
                                                    height: double.maxFinite,
                                                    errorBuilder:
                                                        OctoError.icon(
                                                            color: ColorsRes
                                                                .bottomColor),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 0.0),
                                                        child: Text(
                                                            favouriteList[index]
                                                                .title!,
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: ColorsRes
                                                                    .bottomColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      )),
                                                  Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 2.0),
                                                        child: SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .52,
                                                            child: Text(
                                                              favouriteList[
                                                                      index]
                                                                  .subTitle!,
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: ColorsRes
                                                                      .iconColor
                                                                      .withOpacity(
                                                                          0.7),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            )),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Card(
                                          color:
                                              ColorsRes.white.withOpacity(0.7),
                                          elevation: 5,
                                          shadowColor: ColorsRes.iconColor
                                              .withOpacity(0.5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          child: Container(
                                              height: 50,
                                              width: 50,
                                              padding: EdgeInsets.all(15.0),
                                              decoration: DesignConfig
                                                  .boxDecorationButtonColor(
                                                      ColorsRes.white
                                                          .withOpacity(0.7),
                                                      ColorsRes.white
                                                          .withOpacity(0.6),
                                                      50),
                                              child: SvgPicture.asset(
                                                  "assets/images/fullApps/worldTour/svg/remove_fav.svg")),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
