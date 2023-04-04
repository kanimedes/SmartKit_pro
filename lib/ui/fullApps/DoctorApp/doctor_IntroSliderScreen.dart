import 'package:flutter/material.dart';

import 'doctor_welcomeScreen.dart';
import 'helper/ColorRes.dart';
import 'helper/StringRes.dart';
import 'helper/doctore_DesignConfig.dart';

class DoctorIntroSlider extends StatefulWidget {
  const DoctorIntroSlider({Key? key}) : super(key: key);

  @override
  _DoctorIntroSliderState createState() => _DoctorIntroSliderState();
}

class _DoctorIntroSliderState extends State<DoctorIntroSlider>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  final slideList = [
    Slide(
      title: 'Find your best Doctor',
      localimg: DoctorDesignConfig.getImagePath("img_01.png"),
      description: "Treatment from the best specialist at your home.",
    ),
    Slide(
      title: 'Create Schedule.',
      localimg: DoctorDesignConfig.getImagePath("img_02.png"),
      description:
          "Set your best appointment with your best specialist in just a second.",
    ),
    Slide(
      title: 'Easy Communicate',
      localimg: DoctorDesignConfig.getImagePath("img_03.png"),
      description:
          "Treatment from the best specialist in Voice or Video call and Messaging feature.",
    ),
  ];
  late AnimationController timerAnimationController;
  Widget indicatorLine() {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Color(0xffcad1ff),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          alignment: Alignment.topRight,
          height: 7.0,
          width: MediaQuery.of(context).size.width * .15,
        ),
        AnimatedBuilder(
          animation: timerAnimationController,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                  color: ColorRes.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              alignment: Alignment.topRight,
              height: 7.0,
              width: currentIndex == 0
                  ? MediaQuery.of(context).size.width * .05
                  : currentIndex == 1
                      ? MediaQuery.of(context).size.width * .1
                      : MediaQuery.of(context).size.width * .15,
            );
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    timerAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    timerAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    timerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: size.height * .03, right: size.width * .05),
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const DoctorWelcomeScreen()));
                },
                child: const Text(
                  DoctorStringRes.skip,
                  style: TextStyle(
                      color: ColorRes.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(80, 40),
                  elevation: 0,
                  primary: const Color(0xfff6f7ff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .5,
              width: size.width,
              alignment: Alignment.center,
              // padding: EdgeInsets.only(left: size.width*.08,right: size.width*.08),
              color: Colors.white,
              child: PageView.builder(
                  itemCount: slideList.length,
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      slideList[index].localimg!,
                    );
                  }),
            ),
            Text(
              slideList[currentIndex].title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  Theme.of(context).textTheme.headline5!.merge(const TextStyle(
                        color: ColorRes.blue,
                        fontWeight: FontWeight.bold,
                      )),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .024,
            ),
            Container(
              height: size.height * .09,
              padding: EdgeInsets.only(
                  left: size.width * .1, right: size.width * .1),
              child: Text(
                slideList[currentIndex].description,
                maxLines: 3,
                softWrap: true,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .merge(const TextStyle(
                      color: ColorRes.black,
                    )),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .06,
            ),
            ElevatedButton(
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
                      builder: (BuildContext context) => DoctorWelcomeScreen(),
                    ),
                  );
                }
              },
              child: Text(
                currentIndex == 2 ? "Get Started" : DoctorStringRes.next,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorRes.white,
                    fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(230, 50),
                primary: ColorRes.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Container(
              alignment: Alignment.center,
              child: indicatorLine(),
            ),
            // Row(mainAxisAlignment: MainAxisAlignment.center, children: _buildIndicator()),
          ],
        ),
      ),
    );
  }
}

class Slide {
  final String title;
  final String description;
  String? localimg;

  Slide({
    required this.title,
    required this.description,
    this.localimg,
  });
}
