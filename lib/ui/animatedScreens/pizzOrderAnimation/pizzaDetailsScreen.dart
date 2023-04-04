import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:smartkit_pro/ui/animatedScreens/pizzOrderAnimation/colors.dart';
import 'package:smartkit_pro/ui/animatedScreens/pizzOrderAnimation/models/pizza.dart';
import 'package:smartkit_pro/ui/animatedScreens/pizzOrderAnimation/utils/uiUtils.dart';
import 'package:smartkit_pro/utils/convertNumber.dart';
import 'package:sprung/sprung.dart';

class PizzaDetailsScreen extends StatefulWidget {
  final double dwidth;
  final double dheight;
  final int initialIndex;
  const PizzaDetailsScreen(
      {Key? key,
      required this.initialIndex,
      required this.dheight,
      required this.dwidth})
      : super(key: key);

  @override
  _PizzaDetailsScreenState createState() => _PizzaDetailsScreenState();
}

class _PizzaDetailsScreenState extends State<PizzaDetailsScreen>
    with TickerProviderStateMixin {
  final double pizzaTopMargin = 0.15;
  final double topMenuTopMargin = 0.05;
  final double panAngle = 2.0;
  final double pizzaAngle = 120.0;
  late double defaultPizzaPanScale = UiUtils.getPizzaPanScale(widget
      .dheight); //default size is M differnce between s m l is 0.25 respectively 0.1
  final double leafAngle = 2.0;
  final double translatePageToppingDy = -35.0; //distance between two topping
  final double defaultPizzzaPanShadow =
      15.0; //fix shadow for screen with more than 850px height
  final double defaultLeafHeight =
      0.4; //height of leaf //differnce between s m l is 0.25 respectively
  final double defaultLeafDy =
      -6.0; // differnce between s m l is 4 in minus respectively

  late double defaultToppingsScale = UiUtils.getToppingsScale(widget.dheight);
  late double defaultToppingsDyPercentage =
      UiUtils.getToppingsDy(widget.dheight);
  late double defaultToppingsDx = UiUtils.getToppingsDx(widget.dheight); //

  //for initial animation
  late final AnimationController _initialLoadAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 3000));
  late final Animation<double> _initialAppbarBaseAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _initialLoadAnimationController,
          curve: const Interval(0.0, 0.15, curve: Curves.easeInOut)));
  late final Animation<double> _initialLeafBaseAnimation =
      Tween<double>(begin: 0.0, end: 0.65).animate(CurvedAnimation(
          parent: _initialLoadAnimationController,
          curve: const Interval(0.15, 0.30, curve: Curves.easeInOut)));
  late final Animation<double> _initialPizzaDetailsBaseAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _initialLoadAnimationController,
          curve: const Interval(0.30, 0.45, curve: Curves.easeInOut)));
  late final Animation<double> _initialPizzaSizeBaseAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _initialLoadAnimationController,
          curve: const Interval(0.45, 0.60, curve: Curves.easeInOut)));
  late final Animation<double> _initialToppingListBaseAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _initialLoadAnimationController,
          curve: const Interval(0.60, 0.75, curve: Curves.easeInOut)));
  late final Animation<double> _initialButtonsBaseAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _initialLoadAnimationController,
          curve: const Interval(0.75, 0.9, curve: Curves.easeInOut)));

  //

  //changePizzaController to perform animation after any pizza change
  late AnimationController changePizzaController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 500));
  //to change angle of pan
  late Tween<double> angleTween = Tween<double>(begin: 0.0, end: -panAngle);
  //pan angle animation
  late Animation<double> angleAnimation = angleTween.animate(CurvedAnimation(
    parent: changePizzaController,
    curve: Sprung.underDamped,
  ));
  //pizzaSizeController to perform pizza size animation (S,M,L)
  late AnimationController pizzaSizeController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 500));
  //pizzaSizeAlignmentTween is for position of background circle that is behind currnet selected pizza size
  late AlignmentTween pizzaSizeAlignmentTween =
      AlignmentTween(begin: Alignment.center, end: Alignment.center);
  //background circle alignment animation
  late Animation<Alignment> pizzaSizeAlignmentAnimation =
      pizzaSizeAlignmentTween.animate(CurvedAnimation(
    parent: pizzaSizeController,
    curve: Sprung.underDamped,
  ));
  //pizzPanScale tween for s,m and l size pizza
  late Tween<double> pizzaPanScaleTween =
      Tween<double>(begin: defaultPizzaPanScale, end: defaultPizzaPanScale);
  //pizzaPanScale animation
  late Animation<double> pizzaPanScaleAnimation =
      pizzaPanScaleTween.animate(CurvedAnimation(
    parent: pizzaSizeController,
    curve: Sprung.underDamped,
  ));

  //to change pizza scale
  late Tween<double> pizzaPanShadowTween =
      Tween<double>(begin: defaultPizzzaPanShadow, end: defaultPizzzaPanShadow);
  //pizzaScale animation

  late Animation<double> pizzaPanShadowAnimation =
      pizzaPanShadowTween.animate(CurvedAnimation(
    parent: pizzaSizeController,
    curve: Sprung.underDamped,
  ));

  //to change pizza scale
  late Tween<double> pizzaScaleTween = Tween<double>(
      begin: UiUtils.getPizzaScale(widget.dheight),
      end: UiUtils.getPizzaScale(widget.dheight));
  //pizzaScale animation

  late Animation<double> pizzaSizeAnimation =
      pizzaScaleTween.animate(CurvedAnimation(
    parent: pizzaSizeController,
    curve: Sprung.underDamped,
  ));

  //leaf angle tween
  late Tween<double> leafAngleTween = Tween<double>(begin: 0.0, end: leafAngle);

  //leaf height
  late Tween<double> leafHeightTween =
      Tween<double>(begin: defaultLeafHeight, end: defaultLeafHeight);
  late Animation<double> leafHeightAnimation =
      leafHeightTween.animate(CurvedAnimation(
    parent: pizzaSizeController,
    curve: Sprung.underDamped,
  ));

  //leaf dy in reverse direction
  late Tween<double> leafDyTween =
      Tween<double>(begin: defaultLeafDy, end: defaultLeafDy);
  late Animation<double> leafDyAnimation = leafDyTween.animate(CurvedAnimation(
    parent: pizzaSizeController,
    curve: Sprung.underDamped,
  ));

  //leaf angle animation
  late Animation<double> leafAngleAnimation =
      leafAngleTween.animate(CurvedAnimation(
    parent: changePizzaController,
    curve: Sprung.underDamped,
  ));

  //change pizza price perform animation after any pizza change or size of pizza change
  late AnimationController changePizzaPriceController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 500));

  //change pizza price with animation
  late IntTween pizzaPriceTween = IntTween(
      begin: pizzas[widget.initialIndex].price,
      end: pizzas[widget.initialIndex].price);
  late Animation<int> pizzaPriceAnimation =
      pizzaPriceTween.animate(CurvedAnimation(
    parent: changePizzaPriceController,
    curve: Curves.easeIn,
  ));

  //changePizzaTitleController to perform animation after any pizza change
  late AnimationController changePizzaTitleController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 250));

  //to change pizzza title and desc.
  late Animation<double> pizzaTitleBaseAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: changePizzaTitleController, curve: Curves.easeInOut));

  late PageController pizzaPageController =
      PageController(viewportFraction: 0.8, initialPage: widget.initialIndex)
        ..addListener(pageViewScrolllistener);
  late double currentPage = widget.initialIndex * 1.0;
  late int currentIndex = widget.initialIndex;

  List<Topping> addedToppings = [];
  List<AnimationController> toppingsAnimationController = [];

  late Tween<double> toppingsScaleTween =
      Tween<double>(begin: defaultToppingsScale, end: defaultToppingsScale);
  late Animation<double> toppingsScaleAnimation = toppingsScaleTween.animate(
      CurvedAnimation(parent: pizzaSizeController, curve: Sprung.underDamped));
  //

  late Tween<double> toppingsDyTween = Tween<double>(
      begin: defaultToppingsDyPercentage, end: defaultToppingsDyPercentage);
  late Animation<double> toppingsDyAnimation = toppingsDyTween.animate(
      CurvedAnimation(parent: pizzaSizeController, curve: Sprung.underDamped));
  //

  late Tween<double> toppingsDxTween =
      Tween<double>(begin: defaultToppingsDx, end: defaultToppingsDx);
  late Animation<double> toppingsDxAnimation = toppingsDxTween.animate(
      CurvedAnimation(parent: pizzaSizeController, curve: Sprung.underDamped));

  //add to cart animation controller
  late AnimationController addToCartAnimationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 500));

  //add to cart pizza alignment animation
  late Animation<Alignment> addToCartPizzaAnimation = AlignmentTween(
    begin: Alignment.topCenter,
    end: UiUtils.getAddToCardEndAlignment(widget.dheight),
  ).animate(CurvedAnimation(
    parent: addToCartAnimationController,
    curve: Curves.easeInOut,
  ));

  //to show pizza image which is top of pizza pageview
  int addedCartPizzaIndex = -1;

  //added cart number
  int addedCartPizzaNumber = 0;

  //
  late PageController toppingsPageController =
      PageController(initialPage: 3, viewportFraction: 0.235)
        ..addListener(toppingPageListener);

  int currentToppingIndex = 3;
  double currentToppingPage = 3.0;

  late bool enableTapEvent = false;

  void initToppingsAnimation() {
    for (var _ in toppings) {
      toppingsAnimationController.add(AnimationController(
          vsync: this, duration: const Duration(milliseconds: 650)));
    }
  }

  void toppingPageListener() {
    setState(() {
      currentToppingPage = toppingsPageController.page!;
    });
  }

  void pageViewScrolllistener() {
    if (addedToppings.isNotEmpty) {
      setState(() {
        addedToppings = [];
      });
    }
    setState(() {
      currentPage = pizzaPageController.page!;
    });
  }

  @override
  void initState() {
    initToppingsAnimation();
    Future.delayed(const Duration(milliseconds: 500), () {
      changePizzaTitleController.forward();
      _initialLoadAnimationController.forward();
    });
    super.initState();
  }

  int _determineNextPizzaPrice(int price) {
    if (pizzaSizeAlignmentAnimation.value == Alignment.centerLeft) {
      //means current size of pizza is set to small so we need to
      //animate to small size price of next pizza
      return price - 5;
    }
    if (pizzaSizeAlignmentAnimation.value == Alignment.centerRight) {
      //means current size of pizza is set to large so we need to
      //animate to large size price of next pizza
      return price + 5;
    }
    //means current size of pizza is set to default so we need to
    //animate to default size price of next pizza
    return price;
  }

  void changePizzaTitleAndPrice(int index) {
    if (currentIndex > index) {
      angleTween.begin = currentIndex * 1.0 * panAngle;
      angleTween.end = (currentIndex + 1) * 1.0 * panAngle;

      //

      leafAngleTween.begin = leafAngleTween.end;
      leafAngleTween.end = leafAngleTween.begin! + leafAngle;

      //change pizza price
      pizzaPriceTween.begin = pizzaPriceTween.end;
      pizzaPriceTween.end =
          _determineNextPizzaPrice(pizzas[currentIndex - 1].price);
    } else {
      angleTween.begin = currentIndex * 1.0 * -panAngle;
      angleTween.end = (currentIndex + 1) * 1.0 * -panAngle;

      //

      leafAngleTween.begin = currentIndex * 1.0 * -leafAngle;
      leafAngleTween.end = (currentIndex + 1) * 1.0 * -leafAngle;

      //change pizza price
      pizzaPriceTween.begin = pizzaPriceTween.end;
      pizzaPriceTween.end =
          _determineNextPizzaPrice(pizzas[currentIndex + 1].price);
    }

    changePizzaTitleController.reverse().then((value) {
      setState(() {
        currentIndex = index;
      });
      changePizzaTitleController.forward();
    });

    changePizzaController.forward(from: 0.0);
    //to change pizza price
    changePizzaPriceController.forward(from: 0.0);
  }

  @override
  void dispose() {
    for (var element in toppingsAnimationController) {
      element.dispose();
    }
    changePizzaController.dispose();
    pizzaSizeController.dispose();
    pizzaPageController.removeListener(pageViewScrolllistener);
    toppingsPageController.removeListener(toppingPageListener);
    changePizzaTitleController.dispose();
    toppingsPageController.dispose();
    pizzaPageController.dispose();
    _initialLoadAnimationController.dispose();
    addToCartAnimationController.dispose();
    super.dispose();
  }

  List<Widget> _buildToppingsAnimation() {
    List<Widget> _toppings = [];

    for (var i = 0; i < toppings.length; i++) {
      _toppings.add(
        Align(
          alignment: Alignment.topCenter,
          child: Opacity(
            opacity: addedToppings.indexWhere(
                        (element) => element.name == toppings[i].name) ==
                    -1
                ? 0.0
                : 1.0,
            child: IgnorePointer(
              ignoring: true,
              child: AnimatedBuilder(
                animation: pizzaSizeController,
                builder: (context, index) {
                  return Container(
                    transformAlignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(
                          1,
                          3,
                          -widget.dheight *
                              toppingsDyAnimation.value) //0.04,0.04,0.045
                      ..setEntry(
                          0, 3, toppingsDxAnimation.value) //-1.5,-2.5,-3.5
                      ..scale(toppingsScaleAnimation.value), // 1.025,1.0,0.9
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Lottie.asset(
                      toppings[i].lottieAnimationPath,
                      controller: toppingsAnimationController[i],
                      onLoaded: (lottieComposition) {},
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
    }

    return _toppings;
  }

  Widget _buildToppingList() {
    return FadeTransition(
      opacity: _initialToppingListBaseAnimation,
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height *
              (topMenuTopMargin + 0.635 + 0.08),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Text(
                    "${addedToppings.length}/3",
                    style:
                        const TextStyle(fontSize: 15, color: Color(0xff7C7C7C)),
                  )),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * (0.245),
                child: PageView.builder(
                  clipBehavior: Clip.none,
                  controller: toppingsPageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentToppingIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    double dy =
                        (currentToppingIndex - index) * translatePageToppingDy;
                    if (dy > 0) {
                      dy = -dy;
                    }
                    double scale = currentToppingIndex == index ? 1.5 : 1.2;
                    double begin;
                    double end;

                    double pageOffset = index * 1.0 - currentToppingPage;

                    if (pageOffset <= 0.0) {
                      begin = (currentToppingPage.floor() - index) *
                          translatePageToppingDy;
                      end = (currentToppingPage.ceil() - index) *
                          translatePageToppingDy;
                      if (pageOffset > -1.0 && pageOffset < 0.0) {
                        scale = ConvertNumber.inRange(
                            currentValue: pageOffset,
                            minValue: -1.0,
                            maxValue: 0.0,
                            newMaxValue: 1.5,
                            newMinValue: 1.2);
                        dy = ConvertNumber.inRange(
                            currentValue: pageOffset,
                            minValue: -1.0,
                            maxValue: 0.0,
                            newMaxValue: begin,
                            newMinValue: end);
                      } else if (pageOffset > -2.0 && pageOffset < -1.0) {
                        dy = ConvertNumber.inRange(
                            currentValue: pageOffset + 1,
                            minValue: -1.0,
                            maxValue: 0.0,
                            newMaxValue: begin,
                            newMinValue: end);
                      } else if (pageOffset < -2.0) {
                        dy = ConvertNumber.inRange(
                            currentValue: pageOffset + 2,
                            minValue: -0.8,
                            maxValue: 0.0,
                            newMaxValue: begin,
                            newMinValue: end);
                      }
                    } else {
                      begin = (index - currentToppingPage.ceil()) *
                          translatePageToppingDy;
                      end = (index - currentToppingPage.floor()) *
                          translatePageToppingDy;

                      if (pageOffset >= 0.0 && pageOffset < 1.0) {
                        scale = ConvertNumber.inRange(
                            currentValue: pageOffset,
                            minValue: 0.0,
                            maxValue: 1.0,
                            newMaxValue: 1.2,
                            newMinValue: 1.5);
                        dy = ConvertNumber.inRange(
                            currentValue: pageOffset,
                            minValue: 0.0,
                            maxValue: 1.0,
                            newMaxValue: end,
                            newMinValue: begin);
                      } else if (pageOffset > 1.0 && pageOffset < 2.0) {
                        dy = ConvertNumber.inRange(
                            currentValue: pageOffset - 1,
                            minValue: 0.0,
                            maxValue: 1.0,
                            newMaxValue: end,
                            newMinValue: begin);
                      } else if (pageOffset > 2.0) {
                        dy = ConvertNumber.inRange(
                            currentValue: pageOffset - 2,
                            minValue: 0.0,
                            maxValue: 0.8,
                            newMaxValue: end,
                            newMinValue: begin);
                      }
                    }

                    return GestureDetector(
                      onTap: () {
                        if (_initialLoadAnimationController.isAnimating) {
                          return;
                        }
                        if (addedToppings.contains(toppings[index])) {
                          setState(() {
                            addedToppings.remove(toppings[index]);
                          });
                        } else {
                          if (addedToppings.length < 3) {
                            setState(() {
                              addedToppings.add(toppings[index]);
                            });
                            toppingsAnimationController[index]
                                .forward(from: 0.0);
                          }
                        }
                      },
                      child: Opacity(
                        opacity:
                            addedToppings.contains(toppings[index]) ? 0.5 : 1.0,
                        child: Container(
                          transformAlignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..scale(scale) //1.5
                            ..setEntry(1, 3, dy),
                          child: Image.asset(
                            toppings[index].image,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: toppings.length,
                ),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * (0.16),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * (0.085),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildPizzaSizeMenu() {
    return FadeTransition(
      opacity: _initialPizzaSizeBaseAnimation,
      child: SlideTransition(
        position: _initialPizzaSizeBaseAnimation.drive(
            Tween<Offset>(begin: const Offset(0.05, 0.0), end: Offset.zero)),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height *
                    (topMenuTopMargin + 0.43 + 0.1775))),
            width: MediaQuery.of(context).size.width * (0.55),
            height: MediaQuery.of(context).size.height * (0.1),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedBuilder(
                  animation: pizzaSizeController,
                  builder: (context, child) {
                    return Align(
                      alignment: pizzaSizeAlignmentAnimation.value,
                      child: child,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: lightShadowColor, blurRadius: 10.0)
                      ],
                      color: lightBackgroundColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      if (_initialLoadAnimationController.isAnimating) {
                        return;
                      }
                      if (pizzaSizeAlignmentAnimation.value !=
                          Alignment.centerLeft) {
                        pizzaPanScaleTween.begin = pizzaPanScaleTween.end;
                        pizzaPanScaleTween.end = defaultPizzaPanScale - 0.1;
                        //

                        pizzaScaleTween.begin = pizzaScaleTween.end;
                        pizzaScaleTween.end =
                            UiUtils.getPizzaScale(widget.dheight) - 0.1;

                        //
                        pizzaSizeAlignmentTween.begin =
                            pizzaSizeAlignmentTween.end;
                        pizzaSizeAlignmentTween.end = Alignment.centerLeft;

                        //change leaf height
                        leafHeightTween.begin = leafHeightTween.end;
                        leafHeightTween.end = defaultLeafHeight - 0.025;

                        //change leaf dy

                        leafDyTween.begin = leafDyTween.end;
                        leafDyTween.end = defaultLeafDy + 4;

                        //
                        pizzaPanShadowTween.begin = pizzaPanShadowTween.end;
                        pizzaPanShadowTween.end = defaultPizzzaPanShadow + 5;

                        toppingsDyTween.begin = toppingsDyTween.end;
                        toppingsDyTween.end =
                            defaultToppingsDyPercentage + 0.01;

                        toppingsDxTween.begin = toppingsDxTween.end;
                        toppingsDxTween.end = defaultToppingsDx + 1.0;

                        toppingsScaleTween.begin = toppingsScaleTween.end;
                        toppingsScaleTween.end = defaultToppingsScale - 0.1;

                        //to change the price of pizza
                        pizzaPriceTween.begin = pizzaPriceTween.end;
                        pizzaPriceTween.end = pizzas[currentIndex].price - 5;

                        pizzaSizeController.forward(from: 0.0);
                        //
                        changePizzaPriceController.forward(from: 0.0);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.5, vertical: 5.5),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.transparent,
                      )),
                      margin: const EdgeInsets.only(left: 12.5),
                      child: const Text(
                        "S",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      if (_initialLoadAnimationController.isAnimating) {
                        return;
                      }
                      if (pizzaSizeAlignmentAnimation.value !=
                          Alignment.center) {
                        pizzaPanScaleTween.begin = pizzaPanScaleTween.end;
                        pizzaPanScaleTween.end = defaultPizzaPanScale;
                        //

                        pizzaScaleTween.begin = pizzaScaleTween.end;
                        pizzaScaleTween.end =
                            UiUtils.getPizzaScale(widget.dheight);

                        //
                        pizzaSizeAlignmentTween.begin =
                            pizzaSizeAlignmentTween.end;
                        pizzaSizeAlignmentTween.end = Alignment.center;

                        //change leaf height
                        leafHeightTween.begin = leafHeightTween.end;
                        leafHeightTween.end = defaultLeafHeight;

                        //change leaf dy

                        leafDyTween.begin = leafDyTween.end;
                        leafDyTween.end = defaultLeafDy;

                        //

                        pizzaPanShadowTween.begin = pizzaPanShadowTween.end;
                        pizzaPanShadowTween.end = defaultPizzzaPanShadow;

                        toppingsDyTween.begin = toppingsDyTween.end;
                        toppingsDyTween.end = defaultToppingsDyPercentage;

                        toppingsDxTween.begin = toppingsDxTween.end;
                        toppingsDxTween.end = defaultToppingsDx;

                        toppingsScaleTween.begin = toppingsScaleTween.end;
                        toppingsScaleTween.end = defaultToppingsScale;

                        //to change the price of pizza
                        pizzaPriceTween.begin = pizzaPriceTween.end;
                        pizzaPriceTween.end = pizzas[currentIndex].price;

                        pizzaSizeController.forward(from: 0.0);
                        changePizzaPriceController.forward(from: 0.0);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      child: const Text(
                        "M",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      if (_initialLoadAnimationController.isAnimating) {
                        return;
                      }
                      if (pizzaSizeAlignmentAnimation.value !=
                          Alignment.centerRight) {
                        //change pizza pan scale
                        pizzaPanScaleTween.begin = pizzaPanScaleTween.end;
                        pizzaPanScaleTween.end = defaultPizzaPanScale + 0.1;

                        //change pizza scale

                        pizzaScaleTween.begin = pizzaScaleTween.end;
                        pizzaScaleTween.end =
                            UiUtils.getPizzaScale(widget.dheight) + 0.1;

                        //change pizza size indicator alignment

                        pizzaSizeAlignmentTween.begin =
                            pizzaSizeAlignmentTween.end;
                        pizzaSizeAlignmentTween.end = Alignment.centerRight;

                        //change leaf height
                        leafHeightTween.begin = leafHeightTween.end;
                        leafHeightTween.end = defaultLeafHeight + 0.025;

                        //change leaf dy

                        leafDyTween.begin = leafDyTween.end;
                        leafDyTween.end = defaultLeafDy - 4.0;

                        //change pizza shadow
                        pizzaPanShadowTween.begin = pizzaPanShadowTween.end;
                        pizzaPanShadowTween.end = defaultPizzzaPanShadow - 5;

                        /*
                        ..setEntry(1, 3, -widget.dheight * (0.045)) //0.0,035.04,0.05
                        ..setEntry(0, 3, -3.5) //-1.5,-2.5,-3.5
                        ..scale(0.9), // 1.025,1.0,0.9
                        */

                        toppingsDyTween.begin = toppingsDyTween.end;
                        toppingsDyTween.end =
                            defaultToppingsDyPercentage - 0.005;

                        toppingsDxTween.begin = toppingsDxTween.end;
                        toppingsDxTween.end = defaultToppingsDx + 1.0;

                        toppingsScaleTween.begin = toppingsScaleTween.end;
                        toppingsScaleTween.end = defaultToppingsScale + 0.025;

                        //to change the price of pizza
                        pizzaPriceTween.begin = pizzaPriceTween.end;
                        pizzaPriceTween.end = pizzas[currentIndex].price + 5;

                        pizzaSizeController.forward(from: 0.0);

                        changePizzaPriceController.forward(from: 0.0);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.5, vertical: 5.5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      margin: const EdgeInsets.only(right: 12.5),
                      child: const Text(
                        "L",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPizzaWithPanAndLeaf() {
    const topMargin = 25.0;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height *
              (topMenuTopMargin + 0.09), //change height
        ),
        height: MediaQuery.of(context).size.height * (0.43),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            FadeTransition(
              opacity: _initialLeafBaseAnimation,
              child: Align(
                alignment: Alignment.topCenter,
                child: AnimatedBuilder(
                  animation: changePizzaController,
                  builder: (context, child) {
                    return AnimatedBuilder(
                      animation: pizzaSizeController,
                      builder: (context, child) {
                        return Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          transform: Matrix4.identity()
                            ..rotateZ((leafAngleAnimation.value * pi) / 180)
                            ..setEntry(
                                1, 3, leafDyAnimation.value), //-10,-6.0,-2
                          height: MediaQuery.of(context).size.height *
                              leafHeightAnimation.value, //0.425,0.4,0.375
                          transformAlignment: Alignment.center,
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            "assets/images/animatedScreens/pizzOrderAnimation/images/leafs.png",
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: AnimatedBuilder(
                animation: pizzaSizeController,
                builder: (context, child) {
                  return Container(
                    margin: const EdgeInsets.only(
                      top: topMargin,
                    ),
                    transform: Matrix4.identity()
                      ..setEntry(1, 3, pizzaPanShadowAnimation.value)
                      ..scale(pizzaSizeAnimation.value),
                    transformAlignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x80AD4420),
                              blurRadius: 30,
                              offset: Offset(2.5, 30.0)),
                        ]),
                    height: MediaQuery.of(context).size.height *
                        (0.27), //change height for more shadow
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: AnimatedBuilder(
                animation: changePizzaController,
                builder: (context, child) {
                  return AnimatedBuilder(
                    animation: pizzaSizeController,
                    builder: (context, child) {
                      return Container(
                        transformAlignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..rotateZ((pi * angleAnimation.value / 180))
                          ..scale(pizzaPanScaleAnimation.value)
                          ..setEntry(
                              1,
                              3,
                              UiUtils.getPizzaPanVerticalTranslate(
                                  widget.dheight)),
                        margin: const EdgeInsets.only(
                          top: topMargin,
                        ),
                        decoration: const BoxDecoration(
                          //border: Border.all(),
                          shape: BoxShape.circle,
                        ),
                        height: MediaQuery.of(context).size.height * (0.3),
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/animatedScreens/pizzOrderAnimation/images/pan.png",
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(
                  top: topMargin,
                ),
                height: MediaQuery.of(context).size.height *
                    UiUtils.getPizzaHeight(widget.dheight),
                child: AnimatedBuilder(
                  animation: pizzaSizeController,
                  builder: (context, child) {
                    return PageView.builder(
                      onPageChanged: (index) {
                        changePizzaTitleAndPrice(index);
                      },
                      controller: pizzaPageController,
                      itemBuilder: (context, index) {
                        double pageOffset = index * 1.0 - currentPage;
                        double scale;
                        double angle;
                        //double dx = 0.0;

                        if (pageOffset <= 0.0) {
                          scale = ConvertNumber.inRange(
                              currentValue: pageOffset,
                              minValue: -1.0,
                              maxValue: 0.0,
                              newMaxValue: pizzaSizeAnimation.value,
                              newMinValue: 0.5); //scale of pizza

                          angle = ConvertNumber.inRange(
                              currentValue: pageOffset,
                              minValue: -1.0,
                              maxValue: 0.0,
                              newMaxValue: 0.0,
                              newMinValue: -120.0);
                        } else {
                          scale = ConvertNumber.inRange(
                              currentValue: pageOffset,
                              minValue: 0.0,
                              maxValue: 1.0,
                              newMaxValue: 0.5,
                              newMinValue:
                                  pizzaSizeAnimation.value); //scale of pizza

                          if (pizzaPageController
                                  .position.userScrollDirection ==
                              ScrollDirection.reverse) {
                            angle = ConvertNumber.inRange(
                                currentValue: pageOffset,
                                minValue: 0.0,
                                maxValue: 1.0,
                                newMaxValue: 120.0,
                                newMinValue: 0.0);
                          } else {
                            angle = ConvertNumber.inRange(
                                currentValue: pageOffset,
                                minValue: 0.0,
                                maxValue: 1.0,
                                newMaxValue: 120.0,
                                newMinValue: 0.0);
                          }
                        }

                        return Hero(
                          tag: widget.initialIndex == index
                              ? "pizza$index"
                              : "$index",
                          flightShuttleBuilder: (context, animation, direction,
                              fromContext, toContext) {
                            return toContext.widget;
                          },
                          child: Opacity(
                            opacity: addedCartPizzaIndex == index ? 0.0 : 1.0,
                            child: Container(
                              decoration: const BoxDecoration(
                                  //border: Border.all(),
                                  ),
                              transformAlignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..scale(scale) //
                                ..setEntry(
                                    1,
                                    3,
                                    UiUtils.getPizzaTranslateVertical(
                                        widget.dheight)) //
                                ..setEntry(0, 3, -1.0) //
                                ..rotateZ((angle * pi) / 180),
                              child: Image.asset(
                                pizzas[index].image,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: pizzas.length,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * topMenuTopMargin,
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 20.0,
            ),
            FadeTransition(
              opacity: _initialAppbarBaseAnimation,
              child: SlideTransition(
                position: _initialAppbarBaseAnimation.drive(Tween<Offset>(
                    begin: const Offset(0.25, 0.0), end: Offset.zero)),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      CupertinoIcons.back,
                      size: 30,
                    )),
              ),
            ),
            const Spacer(),
            AnimatedBuilder(
                animation: changePizzaTitleController,
                builder: (context, child) {
                  double scale = pizzaTitleBaseAnimation
                      .drive(Tween(begin: 0.25, end: 1.0))
                      .value;

                  return Opacity(
                    opacity: pizzaTitleBaseAnimation.value,
                    child: Container(
                      transform: Matrix4.identity()..scale(scale),
                      transformAlignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(pizzas[currentIndex].name,
                              style: const TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w500)),
                          const SizedBox(
                            height: 2.5,
                          ),
                          Text(
                            pizzas[currentIndex].subTitle,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
            const Spacer(),
            FadeTransition(
              opacity: _initialAppbarBaseAnimation,
              child: SlideTransition(
                position: _initialAppbarBaseAnimation.drive(Tween<Offset>(
                    begin: const Offset(0.25, 0.0), end: Offset.zero)),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          CupertinoIcons.cart,
                          size: 30,
                        )),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor:
                            const Color(0xff541414).withOpacity(0.9),
                        radius: 10.0,
                        child: Text(
                          "$addedCartPizzaNumber",
                          style: const TextStyle(
                            fontSize: 11.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPizzaDetails() {
    return FadeTransition(
      opacity: _initialPizzaDetailsBaseAnimation,
      child: SlideTransition(
        position: _initialPizzaDetailsBaseAnimation.drive(
            Tween<Offset>(begin: const Offset(0.05, 0.0), end: Offset.zero)),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height *
                    (topMenuTopMargin + 0.43 + 0.08)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: changePizzaPriceController,
                  builder: (context, child) {
                    return Text(
                      "\$ ${pizzaPriceAnimation.value}",
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                          pizzas[currentIndex].ratings, (index) => index)
                      .map(
                        (e) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2.0,
                            ),
                            child: SvgPicture.asset(
                                "assets/images/animatedScreens/pizzOrderAnimation/images/star.svg")),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * (0.025),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBuyAndAddCartButtons() {
    return FadeTransition(
      opacity: _initialButtonsBaseAnimation,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 40.0,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (_initialLoadAnimationController.isAnimating) {
                      return;
                    }
                    //update add to cart pizza index
                    setState(() {
                      addedCartPizzaIndex = currentIndex;
                      addedToppings = [];
                    });

                    //add pizza to cart
                    addToCartAnimationController
                        .forward(from: 0.0)
                        .then((value) {
                      //if pizza index is last index then move pizza to previous one
                      if (addedCartPizzaIndex == pizzas.length - 1) {
                        pizzaPageController
                            .animateToPage(addedCartPizzaIndex - 1,
                                duration: const Duration(
                                  milliseconds: 400,
                                ),
                                curve: Curves.easeInOut)
                            .then((value) {
                          setState(() {
                            addedCartPizzaIndex = -1;
                            addedCartPizzaNumber++;
                          });
                        });
                      } else {
                        //if pizza index is last index then move pizza to next one

                        pizzaPageController
                            .nextPage(
                                duration: const Duration(
                                  milliseconds: 400,
                                ),
                                curve: Curves.easeInOut)
                            .then((value) {
                          //after changing to next pizza
                          //increase addedCartPizzaNumber
                          setState(() {
                            addedCartPizzaIndex = -1;
                            addedCartPizzaNumber++;
                          });
                        });
                      }
                    });
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                        )),
                    height: 40.0,
                    child: const Center(
                        child: Text(
                      "Add to cart",
                      style: TextStyle(color: lightDetailsBackgroundColor),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    addToCartAnimationController.reverse();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: buttonColor),
                        color: lightDetailsBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15.0),
                        )),
                    height: 40.0,
                    child: const Center(
                        child: Text(
                      "Buy Now",
                      style: TextStyle(color: buttonColor),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddToCartPizza() {
    return Opacity(
      opacity: addedCartPizzaIndex == -1 ? 0.0 : 1.0,
      child: AnimatedBuilder(
        animation: addToCartAnimationController,
        builder: (context, child) {
          return Align(
            alignment: addToCartPizzaAnimation.value,
            child: Transform.scale(
                scale: 1.0 - addToCartAnimationController.value,
                alignment: Alignment.center,
                child: child),
          );
        },
        child: AnimatedBuilder(
          animation: pizzaSizeController,
          builder: (context, child) {
            return IgnorePointer(
              ignoring: true,
              child: Container(
                transformAlignment: Alignment.center,
                transform: Matrix4.identity()
                  ..scale(pizzaSizeAnimation.value) //
                  ..setEntry(1, 3,
                      UiUtils.getPizzaTranslateVertical(widget.dheight)) //
                  ..setEntry(0, 3, -1.0),
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height *
                          (topMenuTopMargin + 0.09) +
                      25.0, //change height
                ),
                height: MediaQuery.of(context).size.height *
                    UiUtils.getPizzaHeight(widget.dheight),
                child: Image.asset(pizzas[currentIndex].image),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightDetailsBackgroundColor,
        body: Stack(
          children: [
            _buildAppBar(),
            _buildPizzaWithPanAndLeaf(),
            _buildAddToCartPizza(),
            _buildPizzaDetails(),
            _buildPizzaSizeMenu(),
            _buildToppingList(),
            _buildBuyAndAddCartButtons(),
            ..._buildToppingsAnimation(),
          ],
        ));
  }
}
