import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/animatedScreens/recipeAnimation/models/recipe.dart';
import 'package:smartkit_pro/ui/animatedScreens/recipeAnimation/widgets/videoDetailsContainer.dart';

List<Recipe> recipes = [
  Recipe(
      description:
          "Veg Frankie recipe | veg Kathi roll recipe | veg Frankie roll. popular street food in India originated from the streets of Kolkata...",
      imageUrl: "assets/images/animatedScreens/recipeAnimation/recipe-1.jpg",
      name: "Homemade Noodles with beans",
      likes: "2400",
      views: "2000"),
  Recipe(
      description:
          "Veg Frankie recipe | veg Kathi roll recipe | veg Frankie roll. popular street food in India originated from the streets of Kolkata...",
      imageUrl: "assets/images/animatedScreens/recipeAnimation/recipe-2.jpg",
      name: "Chocolate brownie with Cream",
      likes: "20",
      views: "200"),
  Recipe(
      description:
          "Veg Frankie recipe | veg Kathi roll recipe | veg Frankie roll. popular street food in India originated from the streets of Kolkata...",
      imageUrl: "assets/images/animatedScreens/recipeAnimation/recipe-3.jpg",
      name: "Chicken Biriyani with Jeera Rice",
      likes: "2400",
      views: "2000"),
  Recipe(
      description:
          "Veg Frankie recipe | veg Kathi roll recipe | veg Frankie roll. popular street food in India originated from the streets of Kolkata...",
      imageUrl: "assets/images/animatedScreens/recipeAnimation/recipe-4.jpg",
      name: "Orange basil seed drink",
      likes: "2400",
      views: "2000"),
  Recipe(
      description:
          "Veg Frankie recipe | veg Kathi roll recipe | veg Frankie roll. popular street food in India originated from the streets of Kolkata...",
      imageUrl: "assets/images/animatedScreens/recipeAnimation/recipe-1.jpg",
      name: "Mojito",
      likes: "2400",
      views: "2000"),
  Recipe(
      description:
          "Veg Frankie recipe | veg Kathi roll recipe | veg Frankie roll. popular street food in India originated from the streets of Kolkata...",
      imageUrl: "assets/images/animatedScreens/recipeAnimation/recipe-2.jpg",
      name: "Waffels",
      likes: "2400",
      views: "2000"),
];

class RecipeAnimationScreen extends StatefulWidget {
  final Size screenSize;
  const RecipeAnimationScreen({Key? key, required this.screenSize})
      : super(key: key);

  @override
  _RecipeAnimationScreenState createState() => _RecipeAnimationScreenState();

  static Route<dynamic> route(RouteSettings routeSettings) {
    return CupertinoPageRoute(
        builder: (_) =>
            RecipeAnimationScreen(screenSize: routeSettings.arguments as Size));
  }
}

class _RecipeAnimationScreenState extends State<RecipeAnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 900));
  late Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(
          parent: animationController, curve: Curves.easeInOutQuad));

  late AnimationController secondCircleAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 900));
  late Animation<double> secondCircleAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: secondCircleAnimationController,
          curve: Curves.easeInOutQuad));

  //It is to display total card in screen
  int totalCardDiplayedInScreen = 4;

  late List<AnimationController> videoCardAnimationControllers = [];
  late List<Tween<double>> videoCardScaleTweens = [];
  late List<Tween<double>> videoCardFadeTweens = [];
  late List<Tween<double>> videoCardTopPaddingTweens = [];
  late List<Tween<double>> videoCardleftPositionTweens = [];
  late List<Animation> videoCardAnimations = [];
  late int inBetweenCardSliderDurationDiffrence = 225;

  late Tween<double> topVideoCardDetailsScaleTween =
      Tween<double>(begin: 1.3, end: 1.0);

  late int currentSelectedBottomIndex = 1;

  //video card details animations

  late List<AnimationController> videoCardDetailsAnimationControllers = [];
  late List<Animation<double>> videoCardDetailsAnimations = [];

  late List<Tween<double>> videoCardDetailsAngleTweens = [];
  late List<Tween<double>> videoCardDetailsleftPositionTweens = [];

  //
  int videoCardDetailsAnimationDuration = 600;

  late int currentTopVideoCardIndex = recipes.length - 1;
  int videoCardAnimationDurationInMilliseconds = 775;
  late double inBetweenVideoCardTopPadding = widget.screenSize.height * (0.035);
  late double videoCardsScaleDifference = 0.115;

  @override
  void initState() {
    super.initState();

    initAnimations();
    startAnimation();
  }

  void initAnimations() {
    if (videoCardAnimationControllers.isNotEmpty) {
      videoCardAnimationControllers.clear();
      videoCardAnimations.clear();
      videoCardScaleTweens.clear();
      videoCardFadeTweens.clear();
      videoCardleftPositionTweens.clear();
      videoCardTopPaddingTweens.clear();
      videoCardDetailsAngleTweens.clear();
      videoCardDetailsleftPositionTweens.clear();
      videoCardDetailsAnimationControllers.clear();
      videoCardDetailsAnimations.clear();
    }
    for (var i = 0; i < recipes.length; i++) {
      videoCardAnimationControllers.add(AnimationController(
          vsync: this,
          duration: Duration(
              milliseconds: videoCardAnimationDurationInMilliseconds)));
      videoCardAnimations.add(Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
              parent: videoCardAnimationControllers[i],
              curve: Curves.easeInOut)));
      videoCardScaleTweens.add(Tween<double>(
          begin: _calculateBeginVideoCardScale(i),
          end: _calculateEndVideoCardScale(i)));
      if (i >= (recipes.length - totalCardDiplayedInScreen)) {
        videoCardFadeTweens.add(Tween<double>(begin: 1.0, end: 1.0));
      } else {
        videoCardFadeTweens.add(Tween<double>(begin: 0.0, end: 0.0));
      }
      videoCardleftPositionTweens.add(Tween<double>(
          begin: -widget.screenSize.width * (0.8) * (1.5),
          end: widget.screenSize.width * (0.1)));
      videoCardTopPaddingTweens.add(Tween<double>(
          begin: _calculateVideoCardTopPosition(i),
          end: _calculateVideoCardTopPosition(i)));

      videoCardDetailsAnimationControllers.add(AnimationController(
          vsync: this,
          duration: Duration(milliseconds: videoCardDetailsAnimationDuration)));
      if (i == currentTopVideoCardIndex) {
        videoCardDetailsleftPositionTweens.add(Tween<double>(
            begin: widget.screenSize.width * (-0.9),
            end: widget.screenSize.width * (0.15)));
        videoCardDetailsAngleTweens.add(Tween<double>(begin: 0.0, end: 0.0));
        videoCardDetailsAnimations.add(Tween<double>(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(
                parent: videoCardDetailsAnimationControllers[i],
                curve: Curves.easeInOut)));
      } else {
        videoCardDetailsleftPositionTweens.add(Tween<double>(
            begin: widget.screenSize.width * (1.15),
            end: widget.screenSize.width * (0.15)));
        videoCardDetailsAngleTweens.add(Tween<double>(begin: 25, end: 25));
        videoCardDetailsAnimations.add(Tween<double>(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(
                parent: videoCardDetailsAnimationControllers[i],
                curve: Curves.easeInOut)));
      }
    }
    setState(() {});
  }

  void reloadTheRecipes() {
    for (var animationController in videoCardAnimationControllers) {
      animationController.dispose();
    }
    for (var animationController in videoCardDetailsAnimationControllers) {
      animationController.dispose();
    }
    currentTopVideoCardIndex = recipes.length - 1;
    setState(() {});
    initAnimations();
    startAnimation();
  }

  @override
  void dispose() {
    animationController.dispose();
    secondCircleAnimationController.dispose();
    for (var element in videoCardAnimationControllers) {
      element.dispose();
    }
    for (var element in videoCardDetailsAnimationControllers) {
      element.dispose();
    }
    super.dispose();
  }

  void changeBottomNav(int index) {
    setState(() {
      currentSelectedBottomIndex = index;
    });
    reloadTheRecipes();
  }

  void startAnimation() async {
    animationController.forward();

    Future.delayed(const Duration(milliseconds: 200))
        .then((value) => secondCircleAnimationController.forward());

    for (var i = (recipes.length - totalCardDiplayedInScreen);
        i < recipes.length;
        i++) {
      videoCardAnimationControllers[i].forward(from: 0);

      await Future.delayed(
          Duration(milliseconds: inBetweenCardSliderDurationDiffrence));
    }
    videoCardDetailsAnimationControllers[currentTopVideoCardIndex]
        .forward(from: 0);

    for (var i = 0; i < (recipes.length - totalCardDiplayedInScreen); i++) {
      videoCardAnimationControllers[i].forward(from: 0);
    }
  }

  double _calculateBeginVideoCardScale(int index) {
    double scale = 1.75; //max scale
    scale = scale - (recipes.length - 1 - index) * (0.1);
    scale = scale < 0.1 ? 0.1 : scale;
    return scale;
  }

  double _calculateEndVideoCardScale(int index) {
    double scale = 1.0; //max scale
    scale = scale - (recipes.length - 1 - index) * videoCardsScaleDifference;
    scale = scale < 0.1 ? 0.1 : scale;
    return scale;
  }

  double _calculateVideoCardTopPosition(int index) {
    return widget.screenSize.height * (0.5) -
        widget.screenSize.height * (0.2) -
        (recipes.length - 1 - index) * inBetweenVideoCardTopPadding;
  }

  Widget _buildVideoCard(int index) {
    return AnimatedBuilder(
        animation: videoCardAnimationControllers[index],
        builder: (context, _) {
          final double scale = videoCardAnimations[index]
              .drive(videoCardScaleTweens[index])
              .value;
          final double leftPosition = videoCardAnimations[index]
              .drive(videoCardleftPositionTweens[index])
              .value;
          double opacity = videoCardAnimations[index]
              .drive(videoCardFadeTweens[index])
              .value;
          final topPosition = videoCardAnimations[index]
              .drive(videoCardTopPaddingTweens[index])
              .value;

          return Positioned(
            top: topPosition, //,
            left: leftPosition,
            child: Transform.scale(
              scale: scale,
              child: Opacity(
                opacity: opacity,
                child: GestureDetector(
                  onTap: () {
                    //only top card will be tappable
                    if (index == currentTopVideoCardIndex) {
                      //
                      //determine base end condition
                      int endCondition = (index >= totalCardDiplayedInScreen)
                          ? (currentTopVideoCardIndex -
                              totalCardDiplayedInScreen)
                          : 0;
                      for (var i = currentTopVideoCardIndex;
                          i >= endCondition;
                          i--) {
                        //only top card will be go up side
                        if (i == currentTopVideoCardIndex) {
                          videoCardTopPaddingTweens[i] = Tween<double>(
                              begin: videoCardTopPaddingTweens[i].end,
                              end: widget.screenSize.height * (-0.4));
                          videoCardScaleTweens[i] = Tween<double>(
                              begin: videoCardScaleTweens[i].end,
                              end: videoCardScaleTweens[i].end);
                          videoCardleftPositionTweens[i] = Tween(
                              begin: videoCardleftPositionTweens[i].end,
                              end: videoCardleftPositionTweens[i].end);
                          videoCardFadeTweens[i] =
                              Tween<double>(begin: 1.0, end: 1.0);
                        } else if (i == endCondition) {
                          videoCardTopPaddingTweens[i] = Tween<double>(
                              begin: videoCardTopPaddingTweens[i].end,
                              end: videoCardTopPaddingTweens[i].end! +
                                  inBetweenVideoCardTopPadding);
                          videoCardScaleTweens[i] = Tween<double>(
                              begin: videoCardScaleTweens[i].end,
                              end: videoCardScaleTweens[i].end! +
                                  videoCardsScaleDifference);

                          videoCardleftPositionTweens[i] = Tween(
                              begin: videoCardleftPositionTweens[i].end,
                              end: videoCardleftPositionTweens[i].end);
                          if (index >= totalCardDiplayedInScreen) {
                            videoCardFadeTweens[i] =
                                Tween<double>(begin: 0.0, end: 1.0);
                          } else {
                            videoCardFadeTweens[i] =
                                Tween<double>(begin: 1.0, end: 1.0);
                          }
                        } else {
                          //if it is in beetween
                          videoCardTopPaddingTweens[i] = Tween<double>(
                              begin: videoCardTopPaddingTweens[i].end,
                              end: videoCardTopPaddingTweens[i].end! +
                                  inBetweenVideoCardTopPadding);
                          videoCardScaleTweens[i] = Tween<double>(
                              begin: videoCardScaleTweens[i].end,
                              end: videoCardScaleTweens[i].end! +
                                  videoCardsScaleDifference);
                          videoCardleftPositionTweens[i] = Tween(
                              begin: videoCardleftPositionTweens[i].end,
                              end: videoCardleftPositionTweens[i].end);
                          videoCardFadeTweens[i] =
                              Tween<double>(begin: 1.0, end: 1.0);
                        }

                        //
                        videoCardAnimationControllers[i].dispose();
                        videoCardAnimationControllers[i] = AnimationController(
                            vsync: this,
                            duration: Duration(
                                milliseconds:
                                    videoCardDetailsAnimationDuration));
                        videoCardAnimations[i] =
                            Tween<double>(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent: videoCardAnimationControllers[i],
                                    curve: Curves.easeInOut));
                      }

                      if (endCondition > 0) {
                        //if there is more card behind then change those card's scale and topPadding
                        for (var i = (currentTopVideoCardIndex -
                                totalCardDiplayedInScreen -
                                1);
                            i >= 0;
                            i--) {
                          videoCardAnimationControllers[i].dispose();
                          videoCardAnimationControllers[i] =
                              AnimationController(
                                  vsync: this,
                                  duration: Duration(
                                      milliseconds:
                                          videoCardDetailsAnimationDuration));
                          videoCardAnimations[i] =
                              Tween<double>(begin: 0.0, end: 1.0).animate(
                                  CurvedAnimation(
                                      parent: videoCardAnimationControllers[i],
                                      curve: Curves.easeInOut));
                          videoCardTopPaddingTweens[i] = Tween<double>(
                              begin: videoCardTopPaddingTweens[i].end,
                              end: videoCardTopPaddingTweens[i].end! +
                                  inBetweenVideoCardTopPadding);
                          videoCardScaleTweens[i] = Tween<double>(
                              begin: videoCardScaleTweens[i].end,
                              end: videoCardScaleTweens[i].end! +
                                  videoCardsScaleDifference);
                        }
                      }

                      //animate top video card details
                      videoCardDetailsAnimationControllers[
                              currentTopVideoCardIndex]
                          .dispose();
                      videoCardDetailsAnimationControllers[
                              currentTopVideoCardIndex] =
                          AnimationController(
                              vsync: this,
                              duration: Duration(
                                  milliseconds:
                                      videoCardDetailsAnimationDuration));
                      videoCardDetailsAnimations[currentTopVideoCardIndex] =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                  parent: videoCardDetailsAnimationControllers[
                                      currentTopVideoCardIndex],
                                  curve: Curves.easeInOut));
                      videoCardDetailsAngleTweens[currentTopVideoCardIndex] =
                          Tween<double>(begin: 0.0, end: -25.0);
                      videoCardDetailsleftPositionTweens[
                              currentTopVideoCardIndex] =
                          Tween<double>(
                              begin: widget.screenSize.width * (0.15),
                              end: widget.screenSize.width * (-0.9));
                      //animate second top card index
                      if (currentTopVideoCardIndex > 0) {
                        videoCardDetailsAnimationControllers[
                                currentTopVideoCardIndex - 1]
                            .dispose();
                        videoCardDetailsAnimationControllers[
                                currentTopVideoCardIndex - 1] =
                            AnimationController(
                                vsync: this,
                                duration: Duration(
                                    milliseconds:
                                        videoCardDetailsAnimationDuration));
                        videoCardDetailsAnimations[
                                currentTopVideoCardIndex - 1] =
                            Tween<double>(begin: 0.0, end: 1.0).animate(
                                CurvedAnimation(
                                    parent:
                                        videoCardDetailsAnimationControllers[
                                            currentTopVideoCardIndex - 1],
                                    curve: Curves.easeInOut));
                        videoCardDetailsAngleTweens[currentTopVideoCardIndex -
                            1] = Tween<double>(begin: 25.0, end: 0.0);
                        videoCardDetailsleftPositionTweens[
                                currentTopVideoCardIndex - 1] =
                            Tween<double>(
                                begin: widget.screenSize.width * (1.15),
                                end: widget.screenSize.width * (0.15));
                      }

                      ///
                      ///
                      setState(() {});
                      for (var i = currentTopVideoCardIndex; i >= 0; i--) {
                        videoCardAnimationControllers[i].forward();
                      }
                      videoCardDetailsAnimationControllers[
                              currentTopVideoCardIndex]
                          .forward();
                      if (currentTopVideoCardIndex > 0) {
                        videoCardDetailsAnimationControllers[
                                currentTopVideoCardIndex - 1]
                            .forward();
                      }
                      currentTopVideoCardIndex--;
                    }
                  },
                  child: Container(
                    child: Center(
                        child: SvgPicture.asset(
                            "assets/images/animatedScreens/recipeAnimation/playbutton.svg")),
                    width: MediaQuery.of(context).size.width * (0.8),
                    height: MediaQuery.of(context).size.height * (0.4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(recipes[index].imageUrl))),
                  ),
                ),
              ),
            ),
          );
        });
  }

  List<Widget> _buildVideoCards() {
    final List<Widget> children = [];
    for (var i = 0; i < recipes.length; i++) {
      children.add(_buildVideoCard(i));
    }
    return children;
  }

  Widget _buildBottomNavItemContainer(
      int index, IconData iconData, BoxConstraints boxConstraints) {
    return Padding(
      padding: EdgeInsets.only(right: boxConstraints.maxWidth * (0.1)),
      child: InkWell(
        onTap: () {
          changeBottomNav(index);
        },
        child: Icon(
          iconData,
          color: index == currentSelectedBottomIndex
              ? Colors.white
              : Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationContainer() {
    return Positioned(
      bottom: 0,
      child: SlideTransition(
        position: animation.drive<Offset>(
            Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)),
        child: Container(
          height: MediaQuery.of(context).size.height * (0.075),
          width: MediaQuery.of(context).size.width,
          child: LayoutBuilder(builder: (context, boxConstraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBottomNavItemContainer(
                    1, CupertinoIcons.house_fill, boxConstraints),
                _buildBottomNavItemContainer(
                    2, CupertinoIcons.heart_fill, boxConstraints),
                _buildBottomNavItemContainer(
                    3, CupertinoIcons.search_circle_fill, boxConstraints),
                _buildBottomNavItemContainer(
                    4, CupertinoIcons.person_fill, boxConstraints)
              ],
            );
          }),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffff747a), Color(0xfff7699b)])),
        ),
      ),
    );
  }

  Widget _buildVideoDetailsContainer(int index) {
    return AnimatedBuilder(
        animation: videoCardDetailsAnimationControllers[index],
        builder: (context, _) {
          double leftPosition = videoCardDetailsAnimations[index]
              .drive(videoCardDetailsleftPositionTweens[index])
              .value;
          double angle = videoCardDetailsAnimations[index]
              .drive(videoCardDetailsAngleTweens[index])
              .value;

          return Positioned(
            top: MediaQuery.of(context).size.height * (0.575),
            left: leftPosition,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..scale(1.0)
                ..rotateZ(angle * (pi / 180)),
              child: VideoDetailsContainer(
                  currentSelectedVideoIndex: currentTopVideoCardIndex,
                  index: index,
                  recipe: recipes[index]),
            ),
          );
        });
  }

  List<Widget> _buildVideoDetailsContainers() {
    final List<Widget> children = [];
    for (var i = 0; i < recipes.length; i++) {
      children.add(_buildVideoDetailsContainer(i));
    }
    return children;
  }

  Widget _buildBackButton() {
    return FadeTransition(
      opacity: animation,
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: MediaQuery.of(context).size.width * (0.075)),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 7.5),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20.0,
                ),
                width: 40.0,
                height: 40.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [Color(0xffff747a), Color(0xfff7699b)]))),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedBuilder(
              animation: secondCircleAnimationController,
              builder: (context, child) {
                final double scale = secondCircleAnimation
                    .drive(Tween<double>(begin: 4, end: 3.0))
                    .value;
                final double leftAndTopPosition = secondCircleAnimation
                    .drive(Tween<double>(begin: 0.0, end: 1.0))
                    .value;

                return Positioned(
                  top:
                      -MediaQuery.of(context).size.width * (leftAndTopPosition),
                  left: -MediaQuery.of(context).size.width *
                      (0.75) *
                      leftAndTopPosition,
                  child: Transform.scale(
                    alignment: Alignment.center,
                    scale: scale,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.5),
                          gradient: const LinearGradient(
                              colors: [Color(0xffff747a), Color(0xfff7699b)])),
                    ),
                  ),
                );
              }),
          AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                final double scale =
                    animation.drive(Tween<double>(begin: 4, end: 3.0)).value;
                final double leftAndTopPosition =
                    animation.drive(Tween<double>(begin: 0.0, end: 1.0)).value;
                final double inBetweenMargin =
                    animation.drive(Tween<double>(begin: -120, end: -50)).value;
                return Positioned(
                  top: inBetweenMargin +
                      -MediaQuery.of(context).size.width * (leftAndTopPosition),
                  left: inBetweenMargin +
                      -MediaQuery.of(context).size.width *
                          (0.75) *
                          leftAndTopPosition,
                  child: Transform.scale(
                    alignment: Alignment.center,
                    scale: scale,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.5),
                          color: Colors.white),
                    ),
                  ),
                );
              }),
          _buildBackButton(),
          ..._buildVideoCards(),
          ..._buildVideoDetailsContainers(),
          _buildBottomNavigationContainer()
        ],
      ),
    );
  }
}
