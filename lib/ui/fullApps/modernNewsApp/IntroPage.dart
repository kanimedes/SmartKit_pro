import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'Helper/Color.dart';
import 'Helper/Session.dart';
import 'Helper/String.dart';
import 'Login.dart';

//slide class
class Slide {
  final String? imageUrl;
  final String? title;
  final String? description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

class IntroSliderScreen extends StatefulWidget {
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<IntroSliderScreen>
    with TickerProviderStateMixin {
  late AnimationController buttonController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 400));
  late Animation<double> buttonSqueezeanimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: buttonController, curve: Curves.easeInOut));

  late AnimationController circleAnimationController =
      AnimationController(vsync: this, duration: Duration(seconds: 500))
        ..forward();
  late Animation<double> circleAnimation =
      Tween<double>().animate(CurvedAnimation(
    parent: circleAnimationController,
    curve: Curves.easeInCubic,
  ));

  late AnimationController imageSlideAnimationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 500))
        ..repeat(reverse: true);
  late Animation<Offset> imageSlideAnimation =
      Tween<Offset>(begin: Offset.zero, end: Offset(0.0, -0.025)).animate(
          CurvedAnimation(
              parent: imageSlideAnimationController, curve: Curves.easeInOut));

  late AnimationController pageIndicatorAnimationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  late Tween<Alignment> pageIndicator =
      AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerLeft);
  late Animation<Alignment> pageIndicatorAnimation = pageIndicator.animate(
      CurvedAnimation(
          parent: pageIndicatorAnimationController, curve: Curves.easeInOut));
  late AnimationController animationController;
  late Animation animation;

  late AnimationController animationController1;
  late Animation animation1;

  late AnimationController animationController2;
  late Animation animation2;
  late List<Slide> slideList = [
    Slide(
      imageUrl: 'assets/images/fullApps/modernNews/uptodate_intro.png',
      title: getTranslated(context, 'wel_title1')!,
      description: getTranslated(context, 'wel_des1')!,
    ),
    Slide(
      imageUrl: 'assets/images/fullApps/modernNews/bookmark_share.png',
      title: getTranslated(context, 'wel_title2')!,
      description: getTranslated(context, 'wel_des2')!,
    ),
    Slide(
      imageUrl: 'assets/images/fullApps/modernNews/new_categories.png',
      title: getTranslated(context, 'wel_title3')!,
      description: getTranslated(context, 'wel_des3')!,
    ),
  ];

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(
        seconds: 2,
      ),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInCubic,
    );
    animationController.addStatusListener(animationStatusListener);
    animationController.forward();

    animationController1 = AnimationController(
      duration: Duration(
        seconds: 2,
      ),
      vsync: this,
    );
    animation1 = CurvedAnimation(
      parent: animationController1,
      curve: Curves.easeInCubic,
    );
    animationController1.addStatusListener(animationStatusListener1);
    animationController1.forward();

    animationController2 = AnimationController(
      duration: Duration(
        seconds: 2,
      ),
      vsync: this,
    );
    animation2 = CurvedAnimation(
      parent: animationController2,
      curve: Curves.easeInCubic,
    );
    animationController2.addStatusListener(animationStatusListener2);
    animationController2.forward();
  }

  @override
  void dispose() {
    buttonController.dispose();
    imageSlideAnimationController.dispose();
    pageIndicatorAnimationController.dispose();
    circleAnimationController.dispose();
    animationController1.dispose();
    animationController.dispose();
    animationController2.dispose();
    super.dispose();
  }

  void animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      animationController.forward();
    }
  }

  void animationStatusListener1(AnimationStatus stat) {
    if (stat == AnimationStatus.completed) {
      animationController1.reverse();
    } else if (stat == AnimationStatus.dismissed) {
      animationController1.forward();
    }
  }

  void animationStatusListener2(AnimationStatus stat) {
    if (stat == AnimationStatus.completed) {
      animationController2.reverse();
    } else if (stat == AnimationStatus.dismissed) {
      animationController2.forward();
    }
  }

  void onPageChanged(int index) {
    if (index == 0) {
      buttonController.reverse();
      pageIndicator.begin = pageIndicator.end;
      pageIndicator.end = Alignment.centerLeft;
    } else if (index == 1) {
      buttonController.reverse();
      pageIndicator.begin = pageIndicator.end;
      pageIndicator.end = Alignment.center;
    } else {
      pageIndicator.begin = pageIndicator.end;
      pageIndicator.end = Alignment.centerRight;
      buttonController.forward();
    }
    Future.delayed(Duration.zero, () {
      pageIndicatorAnimationController.forward(from: 0.0);
    });
  }

  Widget _buildPageIndicator() {
    const double widthAndHeight = 10.0;
    const double borderRadius = 7.5;
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * (0.1),
        width: MediaQuery.of(context).size.width * (0.125),
        padding: EdgeInsets.only(
            top: 15, bottom: MediaQuery.of(context).size.height * (0.025)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: widthAndHeight,
                width: widthAndHeight,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(borderRadius)),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Container(
                height: widthAndHeight,
                width: widthAndHeight,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(borderRadius)),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                height: widthAndHeight,
                width: widthAndHeight,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(borderRadius)),
              ),
            ),
            AnimatedBuilder(
              animation: pageIndicatorAnimationController,
              builder: (context, child) {
                return Align(
                  alignment: pageIndicatorAnimation.value,
                  child: child,
                );
              },
              child: Container(
                height: widthAndHeight,
                width: widthAndHeight,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(borderRadius)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFilledCircle(double radius, Color color) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
    );
  }

  Widget _buildBorderedCircle(
      double radius, double borderWidth, Color color, double padding) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: borderWidth),
      ),
      padding: EdgeInsets.all(padding),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: radius,
      ),
    );
  }

  Widget _buildIntroSlider() {
    return PageView.builder(
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return Container(
            padding: EdgeInsetsDirectional.only(
                start: 30.0, top: 30.0, bottom: 60.0, end: 30.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .boxColor
                                .withOpacity(0.6)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * (0.14),
                            ),
                            Text(
                              slideList[index].title!,
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.fontColor,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SlideTransition(
                              position: imageSlideAnimation,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * (0.45),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  slideList[index].imageUrl!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                slideList[index].description!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.fontColor,
                                    fontSize: 19.0),
                              ),
                            ),
                          ],
                        )))));
      },
      itemCount: slideList.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Padding(
          padding: EdgeInsetsDirectional.only(bottom: 22.0),
          child: AnimatedBuilder(
              builder: (context, child) {
                return Transform.scale(
                  scale: buttonSqueezeanimation.value,
                  child: child,
                );
              },
              animation: buttonController,
              child: FloatingActionButton(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  onPressed: () async {
                    setPrefrenceBool(ISFIRSTTIME, true);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }))),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * (0.22),
            left: -20,
            child: AnimatedBuilder(
              child: _buildFilledCircle(
                  60, Theme.of(context).primaryColor.withOpacity(0.4)),
              animation: animationController,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  child: child,
                  angle: math.pi / 12 * animation.value,
                  origin: Offset(0, 180),
                );
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * (0.22),
            right: 70,
            child: AnimatedBuilder(
              child: _buildFilledCircle(
                  50, Theme.of(context).primaryColor.withOpacity(0.6)),
              animation: animationController1,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  child: child,
                  angle: math.pi / 12 * animation1.value,
                  origin: Offset(-0, -180),
                );
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * (0.075),
            left: 70,
            child: AnimatedBuilder(
              child: _buildBorderedCircle(
                  30, 8, Theme.of(context).primaryColor.withOpacity(0.5), 5),
              animation: animationController,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  child: child,
                  angle: math.pi / 12 * animation.value,
                  origin: Offset(0, 280),
                );
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * (0.045),
            right: -20,
            child: AnimatedBuilder(
              child: _buildBorderedCircle(
                  35, 6, Theme.of(context).primaryColor.withOpacity(0.45), 5),
              animation: animationController1,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  child: child,
                  angle: math.pi / 12 * animation1.value,
                  origin: Offset(-0, -280),
                );
              },
            ),
          ),
          Positioned(
              bottom: 120,
              right: -30,
              child: AnimatedBuilder(
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.17),
                ),
                animation: animationController2,
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    child: child,
                    angle: math.pi / 12 * animation2.value,
                    origin: Offset(-120, -380),
                  );
                },
              )),
          Positioned(
              bottom: 20,
              left: 8,
              child: AnimatedBuilder(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.17),
                ),
                animation: animationController2,
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    child: child,
                    angle: math.pi / 12 * animation2.value,
                    origin: Offset(120, 380),
                  );
                },
              )),
          _buildIntroSlider(),
          _buildPageIndicator(),
        ],
      ),
    );
  }
}
