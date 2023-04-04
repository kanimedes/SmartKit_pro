import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Model/Profile_Model.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/NotificationActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/UserDetailActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/StringsRes.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: ColorsRes.backgroundColor,
          title: Row(
            children: [
              Platform.isIOS
                  ? BackButton(
                      color: ColorsRes.darkColor,
                    )
                  : Text(""),
              Text(
                StringsRes.appNameText,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: ColorsRes.darkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
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
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: GridView.count(
                physics: AlwaysScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(
                  profileList.length,
                  (index) {
                    return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
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
                            child: Stack(children: [
                              OctoImage(
                                  image: CachedNetworkImageProvider(
                                    profileList[index].imgurl!,
                                  ),
                                  placeholderBuilder: OctoPlaceholder.blurHash(
                                    profileList[index].hash!,
                                  ),
                                  errorBuilder:
                                      OctoError.icon(color: Colors.black),
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.width),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 20.0),
                                        child: Text(
                                          profileList[index].name!,
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
                                            left: 10.0,
                                            right: 20.0,
                                            bottom: 10.0),
                                        child: Text(
                                          profileList[index].location!,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: ColorsRes.white,
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
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                UserDetailActivity(id: index)));
                      },
                    );
                  },
                )))) /*)*/;
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
