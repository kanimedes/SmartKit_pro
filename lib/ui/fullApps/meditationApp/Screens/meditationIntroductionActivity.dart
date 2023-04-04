import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/SplaceActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/StringsRes.dart';

class MeditationIntroductionActivity extends StatefulWidget {
  const MeditationIntroductionActivity({Key? key}) : super(key: key);

  @override
  _MeditationIntroductionActivityState createState() =>
      _MeditationIntroductionActivityState();
}

class _MeditationIntroductionActivityState
    extends State<MeditationIntroductionActivity> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  double? height;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final slideList = [
    Slide(
      localimg: 'assets/images/fullApps/meditationApp/image_a.png',
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fimage_a.png?alt=media&token=ce29f8e6-9e3a-490a-be42-2c75e5567d50",
      blurUrl: "LfOf6@OsXTj[~WoexDoJX.WDRjWB",
      title: "Track your activity",
      description:
          "Meditation will reveal the most profound and awesome dimensions of the world in which you already live.",
    ),
    Slide(
      localimg: 'assets/images/fullApps/meditationApp/image_b.png',
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fimage_b.png?alt=media&token=29b739c2-3b36-4e69-aaf7-9d24befda208",
      blurUrl: "LtNJ]|ozg3f,~qj[oeoftSjsW=WB",
      title: "Plan to meditate",
      description:
          "The more regularly and the more deeply you meditate, the sooner you will find yourself acting always from a center of peace.",
    ),
    Slide(
      localimg: 'assets/images/fullApps/meditationApp/image_c.png',
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fimage_c.png?alt=media&token=e74f9943-4334-471f-bcf7-7c4101837882",
      blurUrl: "LUOV#:tlMyM{~qxts,of07MxXmoz",
      title: 'Daily insights',
      description:
          "Meditation is one thing that is not dependent on any goals because there is no failure. There is only success.",
    ),
  ];

  List<T?> map<T>(List list, Function handler) {
    List<T?> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  Widget _slider() {
    return PageView.builder(
      itemCount: slideList.length,
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      onPageChanged: _onPageChanged,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            OctoImage(
              image: CachedNetworkImageProvider(slideList[index].imageUrl),
              placeholderBuilder: OctoPlaceholder.blurHash(
                slideList[index].blurUrl!,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              errorBuilder: OctoError.icon(color: Colors.black),
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: height! <= 640.0
                      ? MediaQuery.of(context).size.height / 9
                      : MediaQuery.of(context).size.height / 1.7),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height! <= 640.0 ? 20 : 45),
                    child: Text(slideList[currentIndex].title,
                        style: TextStyle(
                            fontSize: 22,
                            color: ColorsRes.black,
                            fontFamily: "TrebuchetMS",
                            fontWeight: FontWeight.normal)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: height! <= 640.0 ? 10.0 : 20.0,
                          left: 10.0,
                          right: 10.0),
                      child: Text(slideList[currentIndex].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsRes.textColor,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.normal)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 12,
        width: isActive ? 12 : 12,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? ColorsRes.black : ColorsRes.textColor,
        ));
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        bottomNavigationBar: Container(
            height: MediaQuery.of(context).size.height / 10,
            padding: EdgeInsets.only(bottom: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SplashActivity()),
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 14,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 4,
                    right: MediaQuery.of(context).size.width / 4),
                decoration: DesignConfig.buttonShadowColor(
                    ColorsRes.gradientColor1,
                    30.0,
                    ColorsRes.gradientColor2,
                    ColorsRes.gradientColor3),
                child: Center(
                  child: Text(StringsRes.getStarted,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: ColorsRes.white,
                          decoration: TextDecoration.none,
                          fontFamily: "TrebuchetMS",
                          fontWeight: FontWeight.normal)),
                ),
              ),
            )),
        body: Stack(
          children: <Widget>[
            _slider(),
            Container(
              margin: EdgeInsets.only(
                  bottom: height! <= 640.0 ? 20.0 : 30,
                  top: height! <= 640.0
                      ? MediaQuery.of(context).size.height / 1.3
                      : MediaQuery.of(context).size.height / 1.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Slide {
  final String imageUrl;
  final String title;
  final String description;
  String? blurUrl;
  String? localimg;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.description,
    this.blurUrl,
    this.localimg,
  });
}
