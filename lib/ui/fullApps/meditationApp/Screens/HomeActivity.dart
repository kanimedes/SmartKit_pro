import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/DetailsMeditationActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/BackgroundClipper.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/model/HomeModel.dart';

class HomeActivity extends StatefulWidget {
  Function(bool)? update;
  HomeActivity({Key? key, this.update}) : super(key: key);

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity>
    with TickerProviderStateMixin {
  //for animating the first menu
  late List<AnimationController> animationControllers = [];

  late List<Animation<double>> animations = [];
  //for animating the second menu

  late List<AnimationController> secondAnimationControllers = [];

  late List<Animation<double>> secondAnimations = [];

  List<String> dataList = [
    "assets/images/image.png",
    "assets/images/image-1.png",
    "assets/images/image-2.png",
    "assets/images/image-3.png",
    "assets/images/image.png",
    "assets/images/image-1.png",
    "assets/images/image-2.png",
    "assets/images/image-3.png",
    "assets/images/image.png",
    "assets/images/image-1.png",
    "assets/images/image-2.png",
    "assets/images/image-3.png",
  ];

  //to open and close the card details
  late AnimationController toggleCardDetailsAnimationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 750));

  late Animation<double> toggleCardDetailsAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: toggleCardDetailsAnimationController,
          curve: Curves.easeInOutSine));

  List<Color> color = [
    Colors.blue,
    Colors.purple,
    Colors.cyan,
    Colors.orange,
    Colors.pink,
    Colors.yellow,
    Colors.green,
    Colors.indigoAccent,
    Colors.blue,
    Colors.purple,
    Colors.cyan,
    Colors.orange
  ];
  List<GlobalKey> customPainterKeys = [];

  late double heightPercentage = 0.5;
  late double spacingBetweenTwoCards = 0.45; //in percentage
  late bool isCardDetailsOpen = false;
  late int selectedCardMenuIndex = -1;

  late AnimationController cardDetailsTopMenuAnimationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 400));
  late Animation<double> cardDetailsTopMenuAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: cardDetailsTopMenuAnimationController,
          curve: Curves.easeInOutSine));

  late int currentMenu = 3; // will have two menu 1, 2 and 3

  @override
  void initState() {
    super.initState();
    initAnimations();
  }

  //initAnimations
  void initAnimations() {
    for (var i = 0; i < homeList.length; i++) {
      animationControllers.add(AnimationController(
          vsync: this, duration: Duration(milliseconds: 1000)));
      animations.add(Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
              parent: animationControllers[i], curve: Curves.easeInOutSine)));
      secondAnimationControllers.add(AnimationController(
          vsync: this, duration: Duration(milliseconds: 1000)));
      secondAnimations.add(Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
              parent: secondAnimationControllers[i],
              curve: Curves.easeInOutSine)));
      customPainterKeys.add(GlobalKey());
    }
  }

  @override
  void dispose() {
    for (var i = 0; i < homeList.length; i++) {
      animationControllers[i].dispose();
      secondAnimationControllers[i].dispose();
    }
    toggleCardDetailsAnimationController.dispose();
    cardDetailsTopMenuAnimationController.dispose();
    super.dispose();
  }

  //
  double _calculateBeginTopPositionForCard(int cardIndex) {
    double topPosition;

    //
    if (cardIndex > 7) {
      topPosition = 0.0;
      for (var i = 8; i < cardIndex; i++) {
        topPosition = topPosition +
            MediaQuery.of(context).size.height *
                (heightPercentage * spacingBetweenTwoCards);
      }
    } else {
      topPosition = -MediaQuery.of(context).size.height * heightPercentage;
      for (var i = cardIndex; i < 7; i++) {
        topPosition = topPosition -
            MediaQuery.of(context).size.height *
                (heightPercentage * spacingBetweenTwoCards);
      }
    }

    return topPosition;
  }

  //
  double _calculateEndTopPositionForCard(int cardIndex) {
    if (cardIndex > 7) {
      return _calculateBeginTopPositionForCard(cardIndex + 5);
    }
    return _calculateBeginTopPositionForCard(cardIndex + 4);
  }

  //
  double _calculateToggleCardEndDetails(int cardIndex) {
    if (currentMenu == 1) {}
    if (cardIndex < selectedCardMenuIndex) {
      return -(MediaQuery.of(context).size.height * heightPercentage);
    }
    if (cardIndex > selectedCardMenuIndex) {
      return MediaQuery.of(context).size.height;
    }
    return 0;
  }

  void openCardDetails(int cardIndex) async {
    //if card already opened then do nothing
    if (isCardDetailsOpen) {
      return;
    }
    setState(() {
      selectedCardMenuIndex = cardIndex;
      isCardDetailsOpen = true;
      widget.update!(true);
    });
    await toggleCardDetailsAnimationController.forward();

    cardDetailsTopMenuAnimationController.forward();
  }

  void closeCardDetails() async {
    await cardDetailsTopMenuAnimationController.reverse();
    await toggleCardDetailsAnimationController.reverse();
    setState(() {
      selectedCardMenuIndex = -1;
      isCardDetailsOpen = false;
      widget.update!(false);
    });
  }

  bool isFirstMenuScrolling() {
    bool isScrolling = false;
    for (var animationController in animationControllers) {
      if (animationController.isAnimating) {
        isScrolling = true;
        break;
      }
    }
    return isScrolling;
  }

  bool isSecondMenuScrolling() {
    bool isScrolling = false;
    for (var animationController in secondAnimationControllers) {
      if (animationController.isAnimating) {
        isScrolling = true;
        break;
      }
    }
    return isScrolling;
  }

  void onVerticalDragEnd(DragEndDetails dragEndDetails) async {
    double primaryVelocity = dragEndDetails.primaryVelocity ?? 0;
    if (primaryVelocity < 0) {
      print("Up Direction");
      //first menu start with 0 to 3
      if (currentMenu == 1) {
        if (isSecondMenuScrolling()) {
          return;
        }
        for (var i = 0; i < 8; i++) {
          await Future.delayed(Duration(milliseconds: 100));
          //To aovid repeat animation

          secondAnimationControllers[i].reverse().then((value) {
            if (i == 7) {
              setState(() {
                currentMenu = 2;
              });
            }
          });
        }
      }
      //second menu start with 4 to 7
      else if (currentMenu == 2) {
        if (isFirstMenuScrolling()) {
          return;
        }
        for (var i = 4; i < homeList.length; i++) {
          await Future.delayed(Duration(milliseconds: 100));

          animationControllers[i].reverse().then((value) {
            if (i == 7) {
              setState(() {
                currentMenu = 3;
              });
            }
          });
        }
      }
    } else if (primaryVelocity > 0) {
      //slide menu down side

      print("Down Direction");
      //third menu start with 8 to 11
      if (currentMenu == 3) {
        if (isFirstMenuScrolling()) {
          return;
        }
        for (var i = homeList.length - 1; i >= 0; i--) {
          await Future.delayed(Duration(milliseconds: 100));

          animationControllers[i].forward().then((value) {
            if (i == 8) {
              currentMenu = 2;
              setState(() {});
            }
          });
        }
      }

      //second menu start with 4 to 7
      else if (currentMenu == 2) {
        if (isSecondMenuScrolling()) {
          return;
        }
        for (var i = 7; i >= 0; i--) {
          await Future.delayed(Duration(milliseconds: 100));

          secondAnimationControllers[i].forward().then((value) {
            if (i == 4) {
              currentMenu = 1;
              setState(() {});
            }
          });
        }
      }
    }
  }

  Widget _buildCard(int cardIndex) {
    return AnimatedBuilder(
        animation: toggleCardDetailsAnimationController,
        builder: (context, _) {
          return AnimatedBuilder(
              animation: secondAnimationControllers[cardIndex],
              builder: (context, child) {
                return AnimatedBuilder(
                  animation: animationControllers[cardIndex],
                  builder: (context, child) {
                    final double bottomRightCurveLinePercentage =
                        toggleCardDetailsAnimation
                            .drive(Tween<double>(begin: 1.0, end: 0.8))
                            .value;
                    final double bottomRightCurveControlPointDy =
                        toggleCardDetailsAnimation
                            .drive(Tween<double>(begin: 0.5, end: 0.725))
                            .value;
                    final double topRightCurveControlPointDy =
                        toggleCardDetailsAnimation
                            .drive(Tween<double>(begin: 0.275, end: 0.0))
                            .value;
                    final double topRightCurveEndPointDx =
                        toggleCardDetailsAnimation
                            .drive(Tween<double>(begin: 0.8, end: 1.0))
                            .value;
                    final double topRightCurveEndPointDy =
                        toggleCardDetailsAnimation
                            .drive(Tween<double>(begin: 0.2, end: 0.0))
                            .value;
                    final double topLeftCurveEndPointDy =
                        toggleCardDetailsAnimation
                            .drive(Tween<double>(begin: 0.25, end: 0.0))
                            .value;

                    double topPosition = animations[cardIndex]
                        .drive(Tween<double>(
                          begin: _calculateBeginTopPositionForCard(cardIndex),
                          end: _calculateEndTopPositionForCard(cardIndex),
                        ))
                        .value;
                    if (cardIndex < 8) {
                      if (cardIndex > 3) {
                        topPosition = topPosition +
                            (secondAnimations[cardIndex].value *
                                (_calculateBeginTopPositionForCard(
                                        cardIndex + 9) -
                                    topPosition));
                      } else {
                        topPosition = topPosition +
                            (secondAnimations[cardIndex].value *
                                (_calculateBeginTopPositionForCard(
                                        cardIndex + 8) -
                                    topPosition));
                      }
                    }
                    topPosition = topPosition +
                        toggleCardDetailsAnimation.value *
                            (_calculateToggleCardEndDetails(cardIndex) -
                                topPosition);
                    final topContentPaddingPercentage =
                        toggleCardDetailsAnimation
                            .drive(Tween<double>(begin: 0.1, end: 0.60))
                            .value;
                    return cardIndex == 4 || cardIndex == 0 || cardIndex == 8
                        ? Positioned(
                            top: topPosition,
                            child: GestureDetector(
                              onVerticalDragEnd: onVerticalDragEnd,
                              onTap: () {
                                print("Card index $cardIndex");
                                openCardDetails(cardIndex);
                              },
                              onTapUp: (tapUpDetails) {
                                isCardDetailsOpen
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsMeditationActivity(
                                                  index: selectedCardMenuIndex),
                                        ),
                                      )
                                    : print("");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 30.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(0, 25),
                                    )
                                  ],
                                ),
                                child: ClipPath(
                                  key: customPainterKeys[cardIndex],
                                  clipper: CardCurve(
                                    bottomRightCurveControlPointDy:
                                        bottomRightCurveControlPointDy,
                                    color: color[cardIndex],
                                    bottomRightCurveLinePercentage:
                                        bottomRightCurveLinePercentage,
                                    topLeftCurveControlPointDx: 0,
                                    topLeftCurveControlPointDy: 0,
                                    topLeftCurveEndPointDx: 0,
                                    topLeftCurveEndPointDy: 0,
                                    topRightCurveControlPointDy: 0,
                                    topRightCurveControlPointDx: 1.0,
                                    topRightCurveEndPointDx: 1.0,
                                    topRightCurveEndPointDy: 0,
                                  ),
                                  child: SizedBox(
                                    child: Container(
                                        color: Colors.black26,
                                        child: ShaderMask(
                                          shaderCallback: (rect) {
                                            return isCardDetailsOpen
                                                ? LinearGradient(
                                                    begin: Alignment.center,
                                                    end: Alignment.bottomCenter,
                                                    colors: const [
                                                      Colors.white,
                                                      Color(0x00ffffff),
                                                      Color(0x66000000),
                                                      Color(0x99000000)
                                                    ],
                                                  ).createShader(rect)
                                                : LinearGradient(
                                                    begin: Alignment.center,
                                                    end: Alignment.bottomCenter,
                                                    colors: const [
                                                      Color(0x29000000),
                                                      Color(0x29000000),
                                                      Color(0x29000000),
                                                      Color(0x29000000)
                                                    ],
                                                  ).createShader(rect);
                                          },
                                          blendMode: BlendMode.overlay,
                                          child: Stack(
                                            children: [
                                              OctoImage(
                                                image:
                                                    CachedNetworkImageProvider(
                                                        homeList[cardIndex]
                                                            .imgurl!),
                                                placeholderBuilder:
                                                    OctoPlaceholder.blurHash(
                                                  homeList[cardIndex].hash!,
                                                ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    heightPercentage,
                                                errorBuilder: OctoError.icon(
                                                    color: ColorsRes.black),
                                                fit: BoxFit.fill,
                                              ),
                                              Container(
                                                  color: ColorsRes.black
                                                      .withOpacity(0.60)),
                                              Column(
                                                crossAxisAlignment:
                                                    isCardDetailsOpen
                                                        ? CrossAxisAlignment
                                                            .start
                                                        : CrossAxisAlignment
                                                            .center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: isCardDetailsOpen
                                                          ? topContentPaddingPercentage *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              heightPercentage
                                                          : MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              8,
                                                      left: isCardDetailsOpen
                                                          ? 20.0
                                                          : MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              18,
                                                    ),
                                                    child: Text(
                                                      homeList[cardIndex].name!,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        color: ColorsRes.white,
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            "TrebuchetMS",
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: 4.0,
                                                      left:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              18,
                                                    ),
                                                    child: Text(
                                                      homeList[cardIndex]
                                                          .subTitle!,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        color: ColorsRes.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontFamily: "Lato",
                                                      ),
                                                    ),
                                                  ),
                                                  isCardDetailsOpen
                                                      ? Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 12.0,
                                                            left: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                18,
                                                          ),
                                                          child: Text(
                                                            homeList[cardIndex]
                                                                .author!,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                              color: ColorsRes
                                                                  .white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  "Lato",
                                                            ),
                                                          ),
                                                        )
                                                      : Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .play_arrow,
                                                                color: ColorsRes
                                                                    .white),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                top: 4.0,
                                                                left: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    18,
                                                              ),
                                                              child: Text(
                                                                homeList[
                                                                        cardIndex]
                                                                    .duration!,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      ColorsRes
                                                                          .white,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontFamily:
                                                                      "Lato",
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                    //decoration: BoxDecoration(image: DecorationImage(image: AssetImage(homeList[cardIndex].profile!), fit: BoxFit.cover)),
                                    height: MediaQuery.of(context).size.height *
                                        heightPercentage,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ),
                            ))
                        : Positioned(
                            top: topPosition,
                            child: GestureDetector(
                              onVerticalDragEnd: onVerticalDragEnd,
                              onTap: () {
                                print("Card index $cardIndex");
                                openCardDetails(cardIndex);
                              },
                              onTapUp: (tapUpDetails) {
                                isCardDetailsOpen
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsMeditationActivity(
                                                  index: selectedCardMenuIndex),
                                        ),
                                      )
                                    : print("");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      blurRadius: 30.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(0, 25),
                                    )
                                  ],
                                ),
                                child: ClipPath(
                                  key: customPainterKeys[cardIndex],
                                  clipper: CardCurve(
                                      bottomRightCurveControlPointDy:
                                          bottomRightCurveControlPointDy,
                                      color: color[cardIndex],
                                      bottomRightCurveLinePercentage:
                                          bottomRightCurveLinePercentage,
                                      topLeftCurveControlPointDx: 0,
                                      topLeftCurveControlPointDy: 0,
                                      topLeftCurveEndPointDx: 0,
                                      topLeftCurveEndPointDy:
                                          topLeftCurveEndPointDy,
                                      topRightCurveControlPointDy:
                                          topRightCurveControlPointDy,
                                      topRightCurveControlPointDx: 1.0,
                                      topRightCurveEndPointDx:
                                          topRightCurveEndPointDx,
                                      topRightCurveEndPointDy:
                                          topRightCurveEndPointDy),
                                  child: SizedBox(
                                    child: Container(
                                        color: Colors.black26,
                                        child: ShaderMask(
                                          shaderCallback: (rect) {
                                            return isCardDetailsOpen
                                                ? LinearGradient(
                                                    begin: Alignment.center,
                                                    end: Alignment.bottomCenter,
                                                    colors: const [
                                                      Colors.white,
                                                      Color(0x00ffffff),
                                                      Color(0x66000000),
                                                      Color(0x99000000)
                                                    ],
                                                  ).createShader(rect)
                                                : LinearGradient(
                                                    begin: Alignment.center,
                                                    end: Alignment.bottomCenter,
                                                    colors: const [
                                                      Color(0x29000000),
                                                      Color(0x29000000),
                                                      Color(0x29000000),
                                                      Color(0x29000000)
                                                    ],
                                                  ).createShader(rect);
                                          },
                                          blendMode: BlendMode.overlay,
                                          child: Stack(
                                            children: [
                                              OctoImage(
                                                image:
                                                    CachedNetworkImageProvider(
                                                        homeList[cardIndex]
                                                            .imgurl!),
                                                placeholderBuilder:
                                                    OctoPlaceholder.blurHash(
                                                  homeList[cardIndex].hash!,
                                                ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    heightPercentage,
                                                errorBuilder: OctoError.icon(
                                                    color: ColorsRes.black),
                                                fit: BoxFit.fill,
                                              ),
                                              Container(
                                                  color: ColorsRes.black
                                                      .withOpacity(0.60)),
                                              Column(
                                                crossAxisAlignment:
                                                    isCardDetailsOpen
                                                        ? CrossAxisAlignment
                                                            .start
                                                        : CrossAxisAlignment
                                                            .center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: isCardDetailsOpen
                                                          ? topContentPaddingPercentage *
                                                              MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              heightPercentage
                                                          : MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              8,
                                                      left: isCardDetailsOpen
                                                          ? 20.0
                                                          : MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              18,
                                                    ),
                                                    child: Text(
                                                      homeList[cardIndex].name!,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        color: ColorsRes.white,
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            "TrebuchetMS",
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      top: 4.0,
                                                      left:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              18,
                                                    ),
                                                    child: Text(
                                                      homeList[cardIndex]
                                                          .subTitle!,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        color: ColorsRes.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontFamily: "Lato",
                                                      ),
                                                    ),
                                                  ),
                                                  isCardDetailsOpen
                                                      ? Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 12.0,
                                                            left: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                18,
                                                          ),
                                                          child: Text(
                                                            homeList[cardIndex]
                                                                .author!,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                              color: ColorsRes
                                                                  .white,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  "Lato",
                                                            ),
                                                          ),
                                                        )
                                                      : Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .play_arrow,
                                                                color: ColorsRes
                                                                    .white),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                top: 4.0,
                                                                left: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    18,
                                                              ),
                                                              child: Text(
                                                                homeList[
                                                                        cardIndex]
                                                                    .duration!,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      ColorsRes
                                                                          .white,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontFamily:
                                                                      "Lato",
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                    //decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage(homeList[cardIndex].profile!))),
                                    height: MediaQuery.of(context).size.height *
                                        heightPercentage,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ),
                            ));
                  },
                );
              });
        });
  }

  Widget _buildTopBar() {
    return AnimatedBuilder(
        animation: toggleCardDetailsAnimation,
        builder: (context, _) {
          final bottomPosition = toggleCardDetailsAnimationController
              .drive(Tween<double>(
                begin: MediaQuery.of(context).size.height / 1.2,
                end: -30,
              ))
              .value;
          return Positioned(
              bottom: bottomPosition,
              //left: MediaQuery.of(context).size.width * (0.1),
              child: SizedBox(
                height: MediaQuery.of(context).size.height /
                    6.2, //bottom nav bar height
                width: MediaQuery.of(context).size.width,
                //decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(15.0)),
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 25.9,
                      right: MediaQuery.of(context).size.width / 16),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 20),
                                    width: 52.0,
                                    height: 52.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(80.0),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                        radius: 30,
                                        child: ClipOval(
                                          child: OctoImage(
                                            image: CachedNetworkImageProvider(
                                              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fprofile_pic_home.jpg?alt=media&token=07c2032d-4204-41b3-b26b-20d1a0ef34e3",
                                            ),
                                            placeholderBuilder:
                                                OctoPlaceholder.blurHash(
                                              "LnM%[pfg~pnm?aM{Iojv?wWBajkC",
                                            ),
                                            errorBuilder: OctoError.icon(
                                                color: ColorsRes.black),
                                            fit: BoxFit.fill,
                                          ),
                                        ))),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width /
                                          6.9),
                                  child: SvgPicture.asset(
                                      "assets/images/fullApps/meditationApp/notification.svg"),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15.0,
                                  left: MediaQuery.of(context).size.height / 78,
                                  right:
                                      MediaQuery.of(context).size.height / 18,
                                  bottom: 10.0),
                              child: Text(
                                "Hi\nBlacksmith Asgar",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: ColorsRes.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "TrebuchetMS",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 2.0),
                            height: MediaQuery.of(context).size.height / 21,
                            decoration: DesignConfig.boxDecorationContainer(
                                ColorsRes.bottomNavigationColor
                                    .withOpacity(0.75),
                                18.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 2.0, left: 10.0),
                                  suffixIcon: SizedBox(
                                    width: 20,
                                    child: Icon(
                                      Icons.search,
                                      color: ColorsRes.white,
                                    ),
                                  ),
                                  border: InputBorder.none),
                              cursorColor: ColorsRes.black,
                              style: TextStyle(
                                color: ColorsRes.black,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  Widget _buildCardTopMenu() {
    return AnimatedBuilder(
        animation: cardDetailsTopMenuAnimationController,
        builder: (context, _) {
          final topPosition = cardDetailsTopMenuAnimation
              .drive(Tween<double>(
                begin: -30,
                end: 30,
              ))
              .value;
          return Positioned(
              top: topPosition,
              left: MediaQuery.of(context).size.width * (0.08),
              child: Opacity(
                opacity: cardDetailsTopMenuAnimation.value,
                child: SizedBox(
                    height: 35.0, //bottom nav bar height
                    width: MediaQuery.of(context).size.width * (0.85),
                    /*decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(15.0)
                  ),*/
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                closeCardDetails();
                              });
                            },
                            child: Icon(Icons.arrow_back_sharp,
                                color: ColorsRes.white)),
                        Row(
                          children: [
                            CircleAvatar(
                                radius: 18.0,
                                backgroundColor:
                                    ColorsRes.backgroundColor.withOpacity(0.5),
                                child: SvgPicture.asset(
                                    "assets/images/fullApps/meditationApp/fav.svg")),
                            SizedBox(width: 10.0),
                            CircleAvatar(
                                radius: 18.0,
                                backgroundColor:
                                    ColorsRes.backgroundColor.withOpacity(0.5),
                                child: SvgPicture.asset(
                                    "assets/images/fullApps/meditationApp/share.svg")),
                          ],
                        ),
                      ],
                    )),
              ));
        });
  }

  Widget _buildCardDetail() {
    /*return AnimatedBuilder(
        animation: toggleCardDetailsAnimation,
        builder: (context, _) {
          final bottomPosition = toggleCardDetailsAnimationController
              .drive(Tween<double>(
            begin: -MediaQuery.of(context).size.height/2.9,
            end: MediaQuery.of(context).size.height/2.9,
          ))
              .value;*/
    return SlideTransition(
        position: cardDetailsTopMenuAnimation
            .drive(Tween<Offset>(begin: Offset(0, 1.0), end: Offset.zero)),
        child: FadeTransition(
          opacity: cardDetailsTopMenuAnimation,
          child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2.2),
              height:
                  MediaQuery.of(context).size.height, //bottom nav bar height
              width: MediaQuery.of(context).size.width,
              /*decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(15.0)
                  ),*/
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/fullApps/meditationApp/playbutton.svg",
                                color: ColorsRes.textColor),
                            SizedBox(width: 10.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: Text(
                                "Stretching",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorsRes.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  fontFamily: "Lato",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Text(
                            "10:30",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorsRes.greyColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              fontFamily: "Lato",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/fullApps/meditationApp/unplayed.svg"),
                            SizedBox(width: 10.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: Text(
                                "Let's meditate",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorsRes.textColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 19,
                                  fontFamily: "Lato",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Text(
                            "08:00",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorsRes.greyColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 19,
                              fontFamily: "Lato",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/fullApps/meditationApp/unplayed.svg"),
                            SizedBox(width: 10.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: Text(
                                "The third eye",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorsRes.textColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 19,
                                  fontFamily: "Lato",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Text(
                            "05:40",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorsRes.greyColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 19,
                              fontFamily: "Lato",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/fullApps/meditationApp/unplayed.svg"),
                            SizedBox(width: 10.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: Text(
                                "The Nirvana",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: ColorsRes.textColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 19,
                                  fontFamily: "Lato",
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Text(
                            "05:40",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: ColorsRes.greyColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 19,
                              fontFamily: "Lato",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }

  List<Widget> _buildCards() {
    final List<Widget> children = [];
    for (var i = 0; i < homeList.length; i++) {
      children.add(_buildCard(i));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (cardDetailsTopMenuAnimationController.isCompleted) {
          closeCardDetails();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorsRes.backgroundColor,
          floatingActionButton: isCardDetailsOpen
              ? SlideTransition(
                  position: cardDetailsTopMenuAnimation.drive(
                      Tween<Offset>(begin: Offset(0, 1.0), end: Offset.zero)),
                  child: FadeTransition(
                    opacity: cardDetailsTopMenuAnimation,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsMeditationActivity(
                                  index: selectedCardMenuIndex),
                            ),
                          );
                        },
                        child: Container(
                            height: 57,
                            width: 57.0,
                            decoration: DesignConfig.buttonShadowPlayColor(
                              ColorsRes.gradientColor1,
                              50,
                              ColorsRes.gradientColor2,
                              ColorsRes.gradientColor3,
                            ),
                            child: SvgPicture.asset(
                              "assets/images/fullApps/meditationApp/playbutton.svg",
                              height: 44,
                              width: 44,
                              fit: BoxFit.scaleDown,
                            ))),
                  ),
                )
              : Container(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: isCardDetailsOpen
              ? SlideTransition(
                  position: cardDetailsTopMenuAnimation.drive(
                      Tween<Offset>(begin: Offset(0, 1.0), end: Offset.zero)),
                  child: FadeTransition(
                    opacity: cardDetailsTopMenuAnimation,
                    child: ClipPath(
                        clipper: CustomClipperImage(),
                        child: Container(
                            height: MediaQuery.of(context).size.height / 9.9,
                            width: MediaQuery.of(context).size.width,
                            color: ColorsRes.bottomNavigationColor
                                .withOpacity(0.5),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Text(
                                      "00:45 / 10:30 ",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorsRes.textColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        fontFamily: "Lato",
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.0, right: 20.0),
                                    child: Text(
                                      "Stretching",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: ColorsRes.textColor,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                        fontFamily: "Lato",
                                      ),
                                    ),
                                  ),
                                ]))),
                  ),
                )
              : Container(height: 0),
          body: Stack(
            children: [
              //to build cards
              ..._buildCards(),
              //to build bottom nav bar
              //isCardDetailsOpen?_buildBottomNavBar():Container(),
              isCardDetailsOpen ? Container() : _buildTopBar(),
              //to build top card menu that contains like, share and back button
              _buildCardTopMenu(),
              _buildCardDetail(),
            ],
          ),
        ),
      ),
    );
  }
}

class CardCurve extends CustomClipper<Path> {
  final Color color;
  final double topLeftCurveControlPointDx;
  final double topLeftCurveEndPointDx;
  final double topRightCurveControlPointDx;
  final double topRightCurveEndPointDx;
  final double topRightCurveEndPointDy;
  final double topLeftCurveEndPointDy;
  final double topRightCurveControlPointDy;
  final double topLeftCurveControlPointDy;
  final double bottomRightCurveLinePercentage;
  final double bottomRightCurveControlPointDy;
  late Path path;

  CardCurve({
    required this.color,
    required this.bottomRightCurveControlPointDy,
    required this.topLeftCurveControlPointDx,
    required this.topLeftCurveControlPointDy,
    required this.topLeftCurveEndPointDx,
    required this.topLeftCurveEndPointDy,
    required this.topRightCurveControlPointDx,
    required this.topRightCurveControlPointDy,
    required this.topRightCurveEndPointDx,
    required this.topRightCurveEndPointDy,
    required this.bottomRightCurveLinePercentage,
  }) {
    path = Path();
  }

  @override
  Path getClip(Size size) {
    path.moveTo(0, size.height * (0.5));

    path.lineTo(0, size.height * (0.75));

    //bottom left curve
    //end point dx is 0.2 else 0
    path.quadraticBezierTo(0, size.height, size.width * (0.2), size.height);

    //for bottom right curve
    //path is set to (0.8,0.8) else (1.0,1.0)
    path.lineTo(size.width * bottomRightCurveLinePercentage,
        size.height * bottomRightCurveLinePercentage);

    //bottom right curve
    //with curve control point dy = 0.725 and flat control point dy = 0.5
    path.quadraticBezierTo(
        size.width,
        size.height * bottomRightCurveControlPointDy,
        size.width,
        size.height * (0.5));

    //topRight curve
    //for curve control point dy is 0.275 else 0
    //for curve end point dy is 0.2 else 0
    //for curve end point dx is 0.8 else 1.0

    path.quadraticBezierTo(
        size.width * topRightCurveControlPointDx,
        size.height * topRightCurveControlPointDy,
        size.width * topRightCurveEndPointDx,
        size.height * topRightCurveEndPointDy);

    path.lineTo(size.width * (0.2), 0);

    //topLeft curve
    //for curve end point dy is 0.25 else 0
    path.quadraticBezierTo(
        size.width * topLeftCurveControlPointDx,
        size.height * topLeftCurveControlPointDy,
        size.width * topLeftCurveEndPointDx,
        size.height * topLeftCurveEndPointDy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
