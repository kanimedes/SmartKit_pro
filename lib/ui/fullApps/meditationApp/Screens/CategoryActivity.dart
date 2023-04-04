import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/MainActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/model/CategoryModel.dart';

class CategoryActivity extends StatefulWidget {
  const CategoryActivity({Key? key}) : super(key: key);

  @override
  _CategoryActivityState createState() => _CategoryActivityState();
}

class _CategoryActivityState extends State<CategoryActivity> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
          backgroundColor: ColorsRes.backgroundColor,
          body: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 18.3),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        StringsRes.howWeCanHelpYou,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorsRes.textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          fontFamily: "TrebuchetMS",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        StringsRes.howWeCanHelpYouSubTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorsRes.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Lato",
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.412,
                      margin:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: GridView.count(
                          childAspectRatio: 1.3,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          children: List.generate(
                            categoryList.length,
                            (index) {
                              return GestureDetector(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    borderRadius: BorderRadius.circular(18.0),
                                    child: ShaderMask(
                                      shaderCallback: (rect) {
                                        return LinearGradient(
                                          begin: Alignment.center,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withOpacity(0.50)
                                          ],
                                        ).createShader(rect);
                                      },
                                      blendMode: BlendMode.overlay,
                                      child: Stack(children: [
                                        OctoImage(
                                            image: CachedNetworkImageProvider(
                                              categoryList[index].imgurl!,
                                            ),
                                            placeholderBuilder:
                                                OctoPlaceholder.blurHash(
                                              categoryList[index].hash!,
                                            ),
                                            errorBuilder: OctoError.icon(
                                                color: Colors.black),
                                            fit: BoxFit.fill,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, right: 20.0),
                                            child: Text(
                                              categoryList[index].name!,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: ColorsRes.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                                fontFamily: "TrebuchetMS",
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 12.0,
                                            ),
                                            child:
                                                categoryList[index].like == "1"
                                                    ? SvgPicture.asset(
                                                        "assets/images/fullApps/meditationApp/seleted.svg",
                                                      )
                                                    : Container(),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    if (categoryList[index].like! == "1") {
                                      categoryList[index].like = "0";
                                    } else {
                                      categoryList[index].like = "1";
                                    }
                                  });
                                },
                              );
                            },
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainActivity(),
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            top: 5.0,
                            right: MediaQuery.of(context).size.width / 12,
                            left: MediaQuery.of(context).size.width / 12),
                        height: MediaQuery.of(context).size.height / 14,
                        width: MediaQuery.of(context).size.width,
                        decoration: DesignConfig.buttonShadowColor(
                            ColorsRes.gradientColor1,
                            30.0,
                            ColorsRes.gradientColor2,
                            ColorsRes.gradientColor3),
                        child: Text(
                          StringsRes.getStarted,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorsRes.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: "TrebuchetMS",
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainActivity(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Text(
                          StringsRes.skip.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorsRes.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            fontFamily: "TrebuchetMS",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    ) /*)*/;
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
