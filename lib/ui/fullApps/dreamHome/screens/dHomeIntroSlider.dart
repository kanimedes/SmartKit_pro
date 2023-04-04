import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/helper/DHomeColors.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/helper/introSlider/smoothIndicator.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/helper/introSlider/waveFormIndicator.dart';

import '../helper/DHomeString.dart';
import 'login/DHomeSignIn.dart';

class DHomeIntroSlider extends StatefulWidget {
  const DHomeIntroSlider({Key? key}) : super(key: key);
  @override
  DHomeIntroSliderState createState() => DHomeIntroSliderState();
}

class DHomeIntroSliderState extends State<DHomeIntroSlider> {
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

  Widget _slider() {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * .65,
        child: PageView(
          controller: _pageController,
          children: <Widget>[
            pageData(DHomeString.intro1, DHomeString.des1, 0),
            pageData(DHomeString.intro2, DHomeString.des2, 1),
            pageData(DHomeString.intro3, DHomeString.des3, 2),
          ],
          onPageChanged: (int pageno) {
            setState(() {
              currentIndex = pageno;
            });
          },
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height * .04,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          onDotClicked: (int a) {
            currentIndex = a;
            print(currentIndex);
          },
          effect: const WormEffect(
            dotHeight: 14, spacing: 20,
            dotWidth: 14, activeDotColor: DHomeColors.red,
            dotColor: DHomeColors.black,
            type: WormType.normal,
            // strokeWidth: 5,
          ),
        ),
      ]),
      SizedBox(
        height: MediaQuery.of(context).size.height * .08,
      ),
      getStartBtn(),
      SizedBox(
        height: MediaQuery.of(context).size.height * .02,
      ),
      _btn()
    ]);
  }

  Widget pageData(String title, String desc, int pageindex) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipPath(
            clipper: BezierClipper(),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: height! * .535,
                child: OctoImage(
                  image: CachedNetworkImageProvider(currentIndex == 0
                      ? "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fintro_1.png?alt=media&token=7b8ec7a2-9196-4b3b-aadc-b03d619dd914"
                      : currentIndex == 1
                          ? "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fintro_2.png?alt=media&token=c89149b4-0f37-4880-ba3d-34765ac5059e"
                          : "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/dreamhomeapp%2Fintro_3.png?alt=media&token=52ea95be-b483-40da-8808-cb7236724d01"),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    currentIndex == 0
                        ? "LhM7Jp^+S\$bb%gxvsls:_4tSRPWB"
                        : currentIndex == 1
                            ? "LfKwkB?axu.8~A%MkDRjE2RiM{Rj"
                            : "LGJHm+00yF-oZ~~Wx]9F-=%1Rix]",
                  ),
                  // width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  errorBuilder: OctoError.icon(color: DHomeColors.black),
                  fit: BoxFit.fill,
                )

                // child: Image.asset("assets/woldtour.png",fit: BoxFit.fill,),
                ),
          ),
          Text(title,
              style: const TextStyle(
                  fontSize: 24,
                  color: DHomeColors.black,
                  fontWeight: FontWeight.w500)),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: MediaQuery.of(context).size.width * .07,
              end: MediaQuery.of(context).size.width * .07,
              top: 10,
            ),
            child: Text(desc,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff484848))),
          ),
        ]);
  }

  Widget getStartBtn() {
    return currentIndex == 0 || currentIndex == 1
        ? ElevatedButton(
            onPressed: () {
              if (currentIndex == 0) {
                setState(() {
                  _pageController.jumpToPage(1);
                });
              } else if (currentIndex == 1) {
                setState(() {
                  _pageController.jumpToPage(2);
                });
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => DHomeSignIn(),),);
              }
            },
            child: const Text(
              DHomeString.next,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: DHomeColors.white,
                  fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 48),
              shape: const StadiumBorder(),
              primary: DHomeColors.black,
            ),
          )
        : Stack(children: [
            ElevatedButton(
              onPressed: () {
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const DHomeSignIn(),
                    ),
                  );
                });
              },
              child: const Text(
                DHomeString.GetStarted,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: DHomeColors.white,
                    fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 48),
                alignment: Alignment.center,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.only(right: 30),
                primary: DHomeColors.black,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .35, top: 13),
              child: const Icon(
                Icons.arrow_forward,
                color: DHomeColors.white,
              ),
            ),
          ]);
  }

  _btn() {
    return TextButton(
      onPressed: () {
        if (currentIndex == 0) {
          setState(() {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const DHomeSignIn(),
              ),
            );
          });
        } else if (currentIndex == 1) {
          setState(() {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const DHomeSignIn(),
              ),
            );
          });
        } else if (currentIndex == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const DHomeSignIn(),
            ),
          );
        }
      },
      child: const Text("Skip",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xffa2a2a2),
              fontSize: 14,
              fontWeight: FontWeight.w500)),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(backgroundColor: DHomeColors.bgColor, body: _slider()),
    );
  }
}

class BezierClipper extends CustomClipper<Path> {
  Path _getInitialClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 450.15;
    path.lineTo(
        -0.003999999999997783 * _xScaling, 341.78499999999997 * _yScaling);
    path.cubicTo(
      -30.003999999999997783 * _xScaling,
      360.78499999999997 * _yScaling,
      10.461000000000002 * _xScaling,
      210.15099999999995 * _yScaling,
      115.553 * _xScaling,
      350.15099999999995 * _yScaling,
    );
    path.cubicTo(
      115.645 * _xScaling,
      350.15099999999995 * _yScaling,
      190.21699999999998 * _xScaling,
      450.186 * _yScaling,
      250.29500000000002 * _xScaling,
      400.21 * _yScaling,
    );
    path.cubicTo(
      330.373 * _xScaling,
      314.234 * _yScaling,
      500.666 * _xScaling,
      460.47299999999996 * _yScaling,
      450.408 * _xScaling,
      400.47299999999996 * _yScaling,
    );
    path.cubicTo(
      394.15000000000003 * _xScaling,
      333.47299999999996 * _yScaling,
      413.99600000000004 * _xScaling,
      254.199 * _yScaling,
      413.99600000000004 * _xScaling,
      254.199 * _yScaling,
    );
    path.cubicTo(
      413.99600000000004 * _xScaling,
      254.199 * _yScaling,
      413.99600000000004 * _xScaling,
      0 * _yScaling,
      413.99600000000004 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      413.99600000000004 * _xScaling,
      0 * _yScaling,
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
      -0.003999999999997783 * _xScaling,
      341.78499999999997 * _yScaling,
      -0.003999999999997783 * _xScaling,
      341.78499999999997 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  @override
  Path getClip(Size size) => _getInitialClip(size);
}
