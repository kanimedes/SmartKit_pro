import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Model/WatchList_Model.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/MainActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class WatchListActivity extends StatefulWidget {
  const WatchListActivity({Key? key}) : super(key: key);

  @override
  _WatchListActivityState createState() => _WatchListActivityState();
}

class _WatchListActivityState extends State<WatchListActivity> {
  bool checkInternet = true;
  @override
  void initState() {
    super.initState();
    networkCheck();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  Future<void> networkCheck() async {
    checkInternet = await DesignConfig.checkInternet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(StringsRes.yourWatchlistText,
            style: TextStyle(
                fontSize: 20,
                color: ColorsRes.white,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios, color: ColorsRes.white),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainActivity(),
                ),
              );
            }),
        backgroundColor: ColorsRes.backgroundColor,
        shadowColor: Colors.transparent,
      ),
      body: checkInternet == true
          ? Container(
              width: double.infinity,
              height: double.infinity,
              color: ColorsRes.backgroundColor,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: watchList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 0.0, left: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Stack(children: <Widget>[
                                Card(
                                  margin: EdgeInsets.only(bottom: 0.0),
                                  shape: DesignConfig.setRoundedBorder(
                                      Colors.transparent, 0, false),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: OctoImage(
                                    image: CachedNetworkImageProvider(
                                      watchList[index].imgurl!,
                                    ),
                                    placeholderBuilder:
                                        OctoPlaceholder.blurHash(
                                      watchList[index].hash!,
                                    ),
                                    errorBuilder:
                                        OctoError.icon(color: Colors.black),
                                    fit: BoxFit.cover,
                                    width: 150,
                                    height: 100,
                                  ),
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        "assets/images/fullApps/playMedia/svg/bookmark01.svg"),
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 18,
                                    )
                                  ],
                                ),
                                Positioned.fill(
                                  child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, bottom: 10.0),
                                          child: Icon(
                                            watchList[index].like == "1"
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: ColorsRes.yellowColor,
                                          ))),
                                ),
                              ]),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(watchList[index].name!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .merge(TextStyle(
                                                color: ColorsRes.white,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0.5))),
                                    SizedBox(height: 5),
                                    Text(watchList[index].time!,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: ColorsRes.textColor
                                                .withOpacity(0.7),
                                            fontWeight: FontWeight.normal)),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Icon(Icons.star,
                                                  size: 20,
                                                  color: ColorsRes.yellowColor),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(watchList[index].rating!,
                                                  style: TextStyle(
                                                      color: ColorsRes.white,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Icon(
                                                  Icons
                                                      .arrow_drop_down_circle_outlined,
                                                  size: 20,
                                                  color: ColorsRes.textColor
                                                      .withOpacity(0.7)),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(watchList[index].duration!,
                                                  style: TextStyle(
                                                      color: ColorsRes.white,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text(watchList[index].watchOption!,
                                        style: TextStyle(
                                            color: ColorsRes.blueColor,
                                            fontWeight: FontWeight.normal)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Divider(
                              color: ColorsRes.textColor.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              color: ColorsRes.backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                    child: SvgPicture.asset(
                      "assets/images/fullApps/playMedia/svg/no_internet.svg",
                      height: 100,
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(StringsRes.noInternetConnectionText,
                            style: TextStyle(
                                fontSize: 20,
                                color: ColorsRes.white,
                                fontWeight: FontWeight.bold)),
                      )),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        networkCheck();
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      decoration: DesignConfig.boxDecorationButtonColor(
                          ColorsRes.yellowColor, ColorsRes.yellowColor, 0),
                      child: Text(
                        StringsRes.tryAgainText,
                        style: TextStyle(
                          color: ColorsRes.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginActivity(),
      ),
    );
  }
}
