import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBoxCurve.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/model/IntroductionModel.dart';

class IntroductionActivity extends StatefulWidget {
  const IntroductionActivity({Key? key}) : super(key: key);

  @override
  IntroductionActivityState createState() => IntroductionActivityState();
}

class IntroductionActivityState extends State<IntroductionActivity> {
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
                              height: MediaQuery.of(context).size.height,
                              errorBuilder:
                                  OctoError.icon(color: ColorsRes.bottomColor),
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
                  top: MediaQuery.of(context).size.height / 1.4),
              child: GlassBoxCurve(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                          alignment: AlignmentDirectional.center,
                          margin: EdgeInsets.only(
                              left: 20.0, top: 30.0, right: 20.0),
                          child: Text(
                            introductionList[currentIndex].title!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsRes.bottomColor,
                              fontSize: 25,
                              fontWeight: FontWeight.normal,
                            ),
                          )),
                    ),
                    SizedBox(height: 30),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(
                                introductionList.length,
                                (index) => buildDot(index, context),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
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
                                  currentIndex == introductionList.length - 1
                                      ? StringsRes.skipText
                                      : StringsRes.skipText,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: ColorsRes.bottomColor),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
        height: 10,
        width: 10,
        margin: EdgeInsets.only(right: 5),
        decoration: currentIndex == index
            ? DesignConfig.boxDecorationContainer(ColorsRes.bottomColor, 10)
            : DesignConfig.boxDecorationBorderButtonColor(
                ColorsRes.bottomColor, 10));
  }
}
