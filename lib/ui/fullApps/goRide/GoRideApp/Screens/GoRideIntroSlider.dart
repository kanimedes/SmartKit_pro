import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';

import 'Login/GoRideLoginScreen.dart';
import 'Widget/AppBar.dart';

class GoRideIntroSlider extends StatefulWidget {
  const GoRideIntroSlider({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideIntroSliderState();
  }
}

class GoRideIntroSliderState extends State<GoRideIntroSlider> {
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
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Fintro_1.png?alt=media&token=b55c3657-6154-4d96-859c-7887a4d9e430",
      blurUrl: "LMI;L-7%%gT0?HZ\$ngSP0N+ZrWM|",
      localimg: GoRideConstant.getPngImagePath("intro_1.png"),
      title: GoRideStringRes.intro1,
      description: GoRideStringRes.des1,
    ),
    Slide(
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Fintro_2.png?alt=media&token=937bb3c4-fe22-46b3-8577-8251dd8d896f",
      blurUrl: "LHF?FSsS00M{?waK9EjG%htRIUWB",
      localimg: GoRideConstant.getPngImagePath("intro_2.png"),
      title: GoRideStringRes.intro2,
      description: GoRideStringRes.des2,
    ),
    Slide(
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/goride%2Fintro_3.png?alt=media&token=2b92c7c7-a917-4a5e-92cc-82fa1bbc4db9",
      blurUrl: "LDDc8nIo00?b?dW=Mwa#9#s:-nM{",
      localimg: GoRideConstant.getPngImagePath("intro_3.png"),
      title: GoRideStringRes.intro3,
      description: GoRideStringRes.des2,
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
    return Stack(children: [
      PageView.builder(
          itemCount: slideList.length,
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          onPageChanged: _onPageChanged,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                //height: MediaQuery.of(context).size.height*.526,
                width: MediaQuery.of(context).size.width,
                decoration:
                    GoRideConstant.boxDecorationContainer(Colors.white, false),
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60)),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: const [
                            // Colors.white,
                            Color(0x00ffffff),
                            Color(0xc7000000)
                          ],
                        ).createShader(rect);
                      },
                      blendMode: BlendMode.darken,
                      child: OctoImage(
                        image: CachedNetworkImageProvider(
                            slideList[index].imageUrl),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          slideList[index].blurUrl!,
                        ),
                        errorBuilder: OctoError.icon(color: GoRideColors.black),
                        fit: BoxFit.fill,
                      ),
                    )));
          }),
      Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _btn(),
            Row(children: _buildIndicator()),
            ElevatedButton(
                child: Icon(
                  Icons.arrow_forward,
                  color: GoRideColors.black,
                  size: 25,
                ),
                onPressed: () {
                  if (currentIndex == 0) {
                    setState(() {
                      _pageController.jumpToPage(1);
                    });
                  } else if (currentIndex == 1) {
                    setState(() {
                      _pageController.jumpToPage(2);
                    });
                  } else if (currentIndex == 2) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => GoRideLoginScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: GoRideColors.yellow,
                  minimumSize: Size(20, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ))
          ],
        ),
      ),
    ]);
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
          color: isActive ? GoRideColors.yellow : GoRideColors.white,
        ));
  }

  _btn() {
    return TextButton(
      onPressed: () {
        if (currentIndex == 0) {
          setState(() {
            _pageController.jumpToPage(1);
          });
        } else if (currentIndex == 1) {
          setState(() {
            _pageController.jumpToPage(2);
          });
        } else if (currentIndex == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => GoRideLoginScreen(),
            ),
          );
        }
      },
      child: Text("Skip",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: GoRideColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500)),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Column(
          children: [
            AppBarDesign(height: MediaQuery.of(context).size.height * .17),
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
              child: Text(slideList[currentIndex].title,
                  style: TextStyle(
                      fontSize: 20,
                      color: GoRideColors.black,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              //alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .03,
                  left: MediaQuery.of(context).size.height * .05,
                  right: MediaQuery.of(context).size.height * .05),
              //padding: EdgeInsets.only(top: 10,),
              child: Text(slideList[currentIndex].description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xff484848))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            Expanded(child: _slider()),
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
