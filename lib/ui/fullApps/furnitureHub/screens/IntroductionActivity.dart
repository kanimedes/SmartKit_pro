import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/IntroductionModel.dart';

import '../../widgets/slideAnimation.dart';
import 'LoginActivity.dart';

class IntroductionActivity extends StatefulWidget {
  const IntroductionActivity({Key? key}) : super(key: key);

  @override
  IntroductionActivityState createState() => IntroductionActivityState();
}

class IntroductionActivityState extends State<IntroductionActivity>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  PageController? _controller;
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _controller = PageController(initialPage: 0);
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: introductionList.length,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                        _animationController!.repeat();
                      });
                    },
                    itemBuilder: (_, i) {
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: Stack(
                          children: [
                            OctoImage(
                              image: CachedNetworkImageProvider(
                                  introductionList[i].imageUrl!),
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                introductionList[i].blurUrl!,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 1.5,
                              errorBuilder:
                                  OctoError.icon(color: ColorsRes.black),
                              fit: BoxFit.fill,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 1.5,
                  left: MediaQuery.of(context).size.width / 16,
                  right: MediaQuery.of(context).size.width / 16),
              color: ColorsRes.backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                        alignment: AlignmentDirectional.center,
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 19,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SlideAnimation(
                              position: currentIndex + 1,
                              itemCount: 8,
                              slideDirection: SlideDirection.fromRight,
                              animationController: _animationController,
                              child: Text(
                                introductionList[currentIndex].title!,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: ColorsRes.purpalColor,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 40.2),
                            SlideAnimation(
                              position: currentIndex + 2,
                              itemCount: 8,
                              slideDirection: SlideDirection.fromRight,
                              animationController: _animationController,
                              child: Text(
                                introductionList[currentIndex].subTitle!,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: ColorsRes.greyColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SlideAnimation(
                          position: currentIndex + 3,
                          itemCount: 8,
                          slideDirection: SlideDirection.fromRight,
                          animationController: _animationController,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              introductionList.length,
                              (index) => buildDot(index, context),
                            ),
                          ),
                        ),
                        SlideAnimation(
                          position: currentIndex + 4,
                          itemCount: 8,
                          slideDirection: SlideDirection.fromRight,
                          animationController: _animationController,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Row(
                              children: [
                                SlideAnimation(
                                  position: currentIndex + 4,
                                  itemCount: 8,
                                  slideDirection: SlideDirection.fromRight,
                                  animationController: _animationController,
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => LoginActivity(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        currentIndex ==
                                                introductionList.length - 1
                                            ? StringsRes.skipText
                                            : StringsRes.skipText,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: ColorsRes.greyColor),
                                      )),
                                ),
                                SlideAnimation(
                                  position: currentIndex + 5,
                                  itemCount: 8,
                                  slideDirection: SlideDirection.fromRight,
                                  animationController: _animationController,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (currentIndex == 0) {
                                        setState(() {
                                          _controller!.jumpToPage(1);
                                        });
                                      } else if (currentIndex == 1) {
                                        setState(() {
                                          _controller!.jumpToPage(2);
                                        });
                                      } else if (currentIndex == 2) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                LoginActivity(),
                                          ),
                                        );
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              15,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              15,
                                          top: 10.0,
                                          bottom: 10.0),
                                      decoration:
                                          DesignConfig.boxDecorationContainer(
                                              ColorsRes.greenColor, 5.0),
                                      child: Text(
                                        StringsRes.nextText,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: ColorsRes.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
        height: currentIndex == index ? 12 : 8,
        width: currentIndex == index ? 12 : 8,
        margin: EdgeInsets.only(right: 15),
        decoration: currentIndex == index
            ? DesignConfig.boxDecorationContainer(ColorsRes.greenColor, 12)
            : DesignConfig.boxDecorationContainer(ColorsRes.greyColor, 12));
  }
}
