import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/MainActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/PreviewDetailActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBox.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBoxCurve.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/model/CategoryModel.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/model/SliderModel.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/model/TopTripsModel.dart';

class PreviewActivity extends StatefulWidget {
  int? id;
  String? type, image, blurUrl, localimg;
  PreviewActivity(
      {Key? key, this.id, this.type, this.image, this.blurUrl, this.localimg})
      : super(key: key);
  @override
  PreviewActivityState createState() => PreviewActivityState();
}

class PreviewActivityState extends State<PreviewActivity> {
  CarouselController buttonCarouselController = CarouselController();
  bool descTextShowFlag = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget sliderWidget() {
    final basicSlider = CarouselSlider.builder(
      carouselController: buttonCarouselController,
      itemCount: sliderList.length,
      options: CarouselOptions(
        autoPlay: false,
        //enlargeCenterPage: true,
        viewportFraction: 0.4,
        aspectRatio: 2.0, height: 120,
      ),
      itemBuilder: (context, index, realIdx) {
        return Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PreviewDetailActivity(
                      image: widget.type == "slider"
                          ? sliderList[widget.id!]
                              .previewImageList![index]
                              .image
                          : widget.type == "toptrips"
                              ? topTripsList[widget.id!]
                                  .previewImageList![index]
                                  .image
                              : widget.type == "category"
                                  ? categoryList[widget.id!]
                                      .previewImageList![index]
                                      .image
                                  : "",
                      blurUrl: widget.type == "slider"
                          ? sliderList[widget.id!]
                              .previewImageList![index]
                              .blurUrl
                          : widget.type == "toptrips"
                              ? topTripsList[widget.id!]
                                  .previewImageList![index]
                                  .blurUrl
                              : widget.type == "category"
                                  ? categoryList[widget.id!]
                                      .previewImageList![index]
                                      .blurUrl
                                  : "",
                      localimg: widget.type == "slider"
                          ? sliderList[widget.id!]
                              .previewImageList![index]
                              .localimg
                          : widget.type == "toptrips"
                              ? topTripsList[widget.id!]
                                  .previewImageList![index]
                                  .localimg
                              : widget.type == "category"
                                  ? categoryList[widget.id!]
                                      .previewImageList![index]
                                      .localimg
                                  : ""),
                ),
              );
            },
            child: Card(
              shape:
                  DesignConfig.setRoundedBorder(Colors.transparent, 25, false),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: OctoImage(
                image: CachedNetworkImageProvider(
                  widget.type == "slider"
                      ? sliderList[widget.id!].previewImageList![index].image!
                      : widget.type == "toptrips"
                          ? topTripsList[widget.id!]
                              .previewImageList![index]
                              .image!
                          : widget.type == "category"
                              ? categoryList[widget.id!]
                                  .previewImageList![index]
                                  .image!
                              : "",
                ),
                placeholderBuilder: OctoPlaceholder.blurHash(
                  widget.type == "slider"
                      ? sliderList[widget.id!].previewImageList![index].blurUrl!
                      : widget.type == "toptrips"
                          ? topTripsList[widget.id!]
                              .previewImageList![index]
                              .blurUrl!
                          : widget.type == "category"
                              ? categoryList[widget.id!]
                                  .previewImageList![index]
                                  .blurUrl!
                              : "",
                ),
                width: 500,
                errorBuilder: OctoError.icon(color: ColorsRes.bottomColor),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
    return Container(
      child: basicSlider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return navigationPage() as Future<bool>;
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
          ),
          child: Scaffold(
              //appBar: AppBar(toolbarHeight:0),
              resizeToAvoidBottomInset: false,
              body: Stack(children: [
                Column(
                  children: [
                    Expanded(
                      child: OctoImage(
                        image: CachedNetworkImageProvider(widget.image!),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          widget.blurUrl!,
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        errorBuilder:
                            OctoError.icon(color: ColorsRes.bottomColor),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                        image: DecorationImage(
                          image: AssetImage(widget.image!),
                          fit: BoxFit.cover,
                        ),
                      )),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3.5,
                          margin: EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                              bottom: 10.0,
                              top: MediaQuery.of(context).size.height * .50),
                          child: GlassBox(
                            redius: 40.0,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 4.5,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 10.0),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 25.0),
                                              child: Text(
                                                StringsRes.previewText,
                                                style: TextStyle(
                                                    color:
                                                        ColorsRes.bottomColor,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.normal),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 20.0, right: 20.0),
                                        child: sliderWidget(),
                                      ))
                                ],
                              ),
                            ),
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              padding: EdgeInsets.all(5.0),
                              margin: EdgeInsets.only(top: 25.0, left: 10.0),
                              child: GlassBox(
                                  redius: 40.0,
                                  width: 50,
                                  height: 50,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Icon(Icons.arrow_back_ios_sharp,
                                            color: ColorsRes.bottomColor),
                                      )))),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 1.2),
                        height: MediaQuery.of(context).size.height,
                        child: GlassBoxCurve(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainActivity()),
                                        (Route<dynamic> route) => false);
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        alignment: Alignment.center,
                                        decoration: DesignConfig
                                            .boxDecorationButtonColor(
                                                ColorsRes.blueColor,
                                                ColorsRes.blueColor,
                                                25),
                                        margin: EdgeInsets.only(
                                            left: 30.0, top: 30.0, right: 30.0),
                                        padding: EdgeInsets.only(
                                            top: 15.0, bottom: 15.0),
                                        child: Text(
                                          StringsRes.bookNowText,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: ColorsRes.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ])),
        ));
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
