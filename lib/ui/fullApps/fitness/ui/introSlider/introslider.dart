import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/Utils/fitnessconst.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/Utils/utlis.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({Key? key}) : super(key: key);

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider>
    with TickerProviderStateMixin {
  final PageController pageController = PageController();
  int currentIndex = 0;
  late AnimationController _controller;
  late Animation<Offset> imageanimation;
  late Animation<Offset> textanimation;
  late Animation<Offset> buttinanimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    imageanimation =
        Tween<Offset>(begin: Offset(0.0, -2.0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceIn),
    );
    textanimation =
        Tween<Offset>(begin: Offset(0.0, 2.0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    buttinanimation =
        Tween<Offset>(begin: Offset(0.0, 2.0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceIn),
    );
    _controller.forward();
  }

  Widget slider(String imagename, String text, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SlideTransition(
          position: imageanimation,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Image.asset(
              fitnessUiUtils.getImagePath(imagename),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
              child: SlideTransition(
                position: textanimation,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 7,
      width: currentIndex == index ? 25 : 7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: currentIndex == index
            ? Theme.of(context).primaryColor
            : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _builslistview() {
    return PageView(
      controller: pageController,
      onPageChanged: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      children: [
        slider("onboarding_1.jpg", intro1, 0),
        slider("onboarding_2.jpg", intro2, 1),
        slider("onboarding_3.jpg", intro3, 2),
      ],
    );
  }

  Widget _buildbutton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
        position: buttinanimation,
        child: CustomeRoundedButton(
            title: "Next",
            width: MediaQuery.of(context).size.width * 0.85,
            hight: MediaQuery.of(context).size.height * 0.06,
            buttonmargin: true,
            ontap: () {
              Navigator.of(context).pushNamed(Routes.yourself);
            }),
      ),
    );
  }

  Widget _dots() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
            left: 20, bottom: MediaQuery.of(context).size.height * 0.12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => buildDot(index, context),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: [
            _builslistview(),
            _dots(),
            _buildbutton(),
          ],
        ));
  }
}
