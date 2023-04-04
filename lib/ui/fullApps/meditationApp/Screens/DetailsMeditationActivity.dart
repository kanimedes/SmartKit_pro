import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/PlayMeditationActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/model/HomeModel.dart';

class DetailsMeditationActivity extends StatefulWidget {
  int? index;
  DetailsMeditationActivity({Key? key, this.index}) : super(key: key);

  @override
  State<DetailsMeditationActivity> createState() =>
      _DetailsMeditationActivityState();
}

class _DetailsMeditationActivityState extends State<DetailsMeditationActivity> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        body: Stack(children: [
          OctoImage(
            image: CachedNetworkImageProvider(
              homeList[widget.index!].imgurl!,
            ),
            placeholderBuilder: OctoPlaceholder.blurHash(
              homeList[widget.index!].hash!,
            ),
            errorBuilder: OctoError.icon(color: ColorsRes.black),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            color: ColorsRes.black.withOpacity(0.30),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 6,
                      left: MediaQuery.of(context).size.width / 8),
                  child: Text(
                    homeList[widget.index!].name!,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorsRes.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      fontFamily: "TrebuchetMS",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 15.0,
                      left: MediaQuery.of(context).size.height / 18,
                      right: MediaQuery.of(context).size.height / 18),
                  child: Text(
                    homeList[widget.index!].description!,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: ColorsRes.white,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Lato",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PlayMeditationActivity(index: widget.index),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 2.7),
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 1.35,
                      decoration: DesignConfig.buttonShadowColor(
                          ColorsRes.gradientColor1,
                          30.0,
                          ColorsRes.gradientColor2,
                          ColorsRes.gradientColor3),
                      child: Text(
                        StringsRes.startDailyMeditation.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorsRes.white,
                          fontWeight: FontWeight.normal,
                          fontFamily: "TrebuchetMS",
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
          GestureDetector(
              onTap: () {
                Navigator.pop(
                  context,
                );
              },
              child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 15.9,
                      left: MediaQuery.of(context).size.width / 16),
                  child: Icon(Icons.arrow_back, color: ColorsRes.white))),
        ]),
      ),
    );
  }
}
