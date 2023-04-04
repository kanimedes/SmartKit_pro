import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Model/Search_Model.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/MainActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/NotificationActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/StringsRes.dart';

class DiscoverActivity extends StatefulWidget {
  const DiscoverActivity({Key? key}) : super(key: key);

  @override
  _DiscoverActivityState createState() => _DiscoverActivityState();
}

class _DiscoverActivityState extends State<DiscoverActivity>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return navigationPage() as Future<bool>;
        },
        child: Scaffold(
          backgroundColor: ColorsRes.backgroundColor,
          appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: ColorsRes.backgroundColor,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: ColorsRes.darkColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              StringsRes.discoverText,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: ColorsRes.darkColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
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
            ],
          ),
          bottomNavigationBar: Container(
              decoration: DesignConfig.boxDecorationContainer(
                  ColorsRes.backgroundColor, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                          "assets/images/fullApps/loveMeet/close.svg")),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MainActivity(id: 1)));
                      },
                      child: SvgPicture.asset(
                          "assets/images/fullApps/loveMeet/heart.svg")),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MainActivity(id: 2)));
                      },
                      child: SvgPicture.asset(
                          "assets/images/fullApps/loveMeet/message.svg"))
                ],
              )),
          body: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.85)
                            ],
                          ).createShader(rect);
                        },
                        blendMode: BlendMode.overlay,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(children: [
                            OctoImage(
                              image: CachedNetworkImageProvider(
                                searchList[index].imageurl!,
                              ),
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                searchList[index].hash!,
                              ),
                              errorBuilder: OctoError.icon(color: Colors.black),
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, right: 25.0),
                                      child: Text(
                                        searchList[index].name!,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: ColorsRes.white,
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
                                          left: 15.0,
                                          right: 25.0,
                                          bottom: 15.0),
                                      child: Text(
                                        searchList[index].location!,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: ColorsRes.textColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: searchList.length,
                itemWidth: 300.0,
                //itemHeight: 340.0,
                layout: SwiperLayout.STACK,
              )),
        ));
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
