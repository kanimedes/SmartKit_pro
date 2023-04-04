import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Model/NewMovie_Model.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/MovieDetailActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class NewMovieActivity extends StatefulWidget {
  const NewMovieActivity({Key? key}) : super(key: key);

  @override
  _NewMovieActivityState createState() => _NewMovieActivityState();
}

class _NewMovieActivityState extends State<NewMovieActivity> {
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
        title: Text(StringsRes.newText,
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
              itemCount: newMovieList.length,
              physics: NeverScrollableScrollPhysics(),
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
                                      newMovieList[index].imgurl!,
                                    ),
                                    placeholderBuilder:
                                        OctoPlaceholder.blurHash(
                                      newMovieList[index].hash!,
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
                                            newMovieList[index].like == "1"
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
                                    Text(newMovieList[index].name!,
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
                                    Text(newMovieList[index].time!,
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
                                              Text(newMovieList[index].rating!,
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
                                                  newMovieList[index].duration!,
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
                            name: newMovieList[index].name,
                            image: newMovieList[index].image,
                            type: "newlist",
                            imgurl: newMovieList[index].imgurl,
                            hash: newMovieList[index].hash,
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
