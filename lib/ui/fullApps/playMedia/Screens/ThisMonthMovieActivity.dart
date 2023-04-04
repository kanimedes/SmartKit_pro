import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Model/ThisMonthMovie_Model.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/MovieDetailActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class ThisMonthMovieActivity extends StatefulWidget {
  const ThisMonthMovieActivity({Key? key}) : super(key: key);

  @override
  _ThisMonthMovieActivityState createState() => _ThisMonthMovieActivityState();
}

class _ThisMonthMovieActivityState extends State<ThisMonthMovieActivity> {
  bool checkInternet = true;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(StringsRes.thisMonthText,
            style: TextStyle(
                fontSize: 20,
                color: ColorsRes.white,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios, color: ColorsRes.white),
            onTap: () {
              Navigator.pop(context);
            }),
        backgroundColor: ColorsRes.backgroundColor,
        shadowColor: Colors.transparent,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorsRes.backgroundColor,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: thisMonthMovieList.length,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    child: Padding(
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
                                      thisMonthMovieList[index].imgurl!,
                                    ),
                                    placeholderBuilder:
                                        OctoPlaceholder.blurHash(
                                      thisMonthMovieList[index].hash!,
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
                                            thisMonthMovieList[index].like ==
                                                    "1"
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
                                    Text(thisMonthMovieList[index].name!,
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
                                    Text(thisMonthMovieList[index].time!,
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
                                              Text(
                                                  thisMonthMovieList[index]
                                                      .rating!,
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
                                              Text(
                                                  thisMonthMovieList[index]
                                                      .duration!,
                                                  style: TextStyle(
                                                      color: ColorsRes.white,
                                                      fontWeight:
                                                          FontWeight.normal)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
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
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailActivity(
                            id: index,
                            name: thisMonthMovieList[index].name,
                            image: thisMonthMovieList[index].image,
                            type: "thismonthlist",
                            imgurl: thisMonthMovieList[index].imgurl,
                            hash: thisMonthMovieList[index].hash,
                          ),
                        ),
                      );
                    });
              })),
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
