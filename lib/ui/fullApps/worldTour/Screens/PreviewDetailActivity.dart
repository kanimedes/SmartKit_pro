import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBox.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/model/TopTripsModel.dart';

class PreviewDetailActivity extends StatefulWidget {
  String? image, blurUrl, localimg;
  PreviewDetailActivity({Key? key, this.image, this.blurUrl, this.localimg})
      : super(key: key);
  @override
  PreviewDetailActivityState createState() => PreviewDetailActivityState();
}

class PreviewDetailActivityState extends State<PreviewDetailActivity> {
  CarouselController buttonCarouselController = CarouselController();
  bool descTextShowFlag = false;
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return navigationPage() as Future<bool>;
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(children: [
              Column(
                children: [
                  Expanded(
                      child: PageView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    controller: _controller,
                    itemCount: topTripsList[1].previewImageList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OctoImage(
                        image: CachedNetworkImageProvider(
                          topTripsList[1].previewImageList![index].image!,
                        ),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          topTripsList[1].previewImageList![index].blurUrl!,
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        errorBuilder:
                            OctoError.icon(color: ColorsRes.bottomColor),
                        fit: BoxFit.fitHeight,
                      );
                    },
                    onPageChanged: (int p) {
                      setState(() {
                        //page = p;
                      });
                    },
                  )),
                ],
              ),
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
            ])));
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
