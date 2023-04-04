import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/animatedScreens/shoppingAnimation/models/ad.dart';
import 'package:smartkit_pro/ui/animatedScreens/shoppingAnimation/models/product.dart';
import 'package:smartkit_pro/ui/animatedScreens/shoppingAnimation/productDetailsScreen.dart';

final List<String> exploredCategoryImages = [
  "assets/images/animatedScreens/shoppingAnimation/cat_a.svg",
  "assets/images/animatedScreens/shoppingAnimation/cat_b.svg",
  "assets/images/animatedScreens/shoppingAnimation/cat_c.svg",
  "assets/images/animatedScreens/shoppingAnimation/cat_d.svg",
  "assets/images/animatedScreens/shoppingAnimation/cat_e.svg",
  "assets/images/animatedScreens/shoppingAnimation/cat_f.svg",
];

final List<Product> youMayLikeWomanProducts = [
  Product(
      color: Colors.yellow,
      company: "Puma",
      name: "Jeans",
      price: "50",
      size: "XL",
      imageUrl: "assets/images/animatedScreens/shoppingAnimation/woman-1.jpg"),
  Product(
      color: Colors.yellow,
      company: "Adidas",
      name: "Rotted Jeans",
      price: "60",
      size: "M",
      imageUrl: "assets/images/animatedScreens/shoppingAnimation/woman-2.jpg"),
  Product(
      color: Colors.yellow,
      company: "Nike",
      name: "Track",
      price: "50",
      size: "L",
      imageUrl: "assets/images/animatedScreens/shoppingAnimation/woman-3.jpg"),
];

final List<Product> youMayLikeManProducts = [
  Product(
      color: Colors.yellow,
      company: "Puma",
      name: "Jeans",
      price: "50",
      size: "XL",
      imageUrl: "assets/images/animatedScreens/shoppingAnimation/man-1.jpg"),
  Product(
      color: Colors.yellow,
      company: "Adidas",
      name: "Rotted Jeans",
      price: "60",
      size: "M",
      imageUrl: "assets/images/animatedScreens/shoppingAnimation/man-2.jpg"),
  Product(
      color: Colors.yellow,
      company: "Nike",
      name: "Track",
      price: "50",
      size: "L",
      imageUrl: "assets/images/animatedScreens/shoppingAnimation/man-3.jpg"),
];

final List<Product> youMayLikeChildProducts = [
  Product(
      color: Colors.yellow,
      company: "Puma",
      name: "Jeans",
      price: "50",
      size: "XL",
      imageUrl: "assets/images/animatedScreens/shoppingAnimation/child-1.png"),
  Product(
      color: Colors.yellow,
      company: "Adidas",
      name: "Rotted Jeans",
      price: "60",
      size: "M",
      imageUrl: "assets/images/animatedScreens/shoppingAnimation/child-2.png"),
  Product(
      color: Colors.yellow,
      company: "Nike",
      name: "Track",
      price: "50",
      size: "L",
      imageUrl: "assets/images/animatedScreens/shoppingAnimation/child-3.png"),
];

final List<Ad> homeAds = [
  Ad(
      image: "assets/images/animatedScreens/shoppingAnimation/women-min.jpg",
      title: "Trending",
      subTitle: "Women's"),
  Ad(
      image: "assets/images/animatedScreens/shoppingAnimation/man-min.jpg",
      title: "Classic",
      subTitle: "Men's"),
  Ad(
      image: "assets/images/animatedScreens/shoppingAnimation/child-min.jpg",
      title: "Awesome",
      subTitle: "Children's"),
];

const int heroDurationInMilliSeconds = 400;

class ShoppingHomeScreen extends StatefulWidget {
  const ShoppingHomeScreen({Key? key}) : super(key: key);

  @override
  _ShoppingHomeScreenState createState() => _ShoppingHomeScreenState();
}

class _ShoppingHomeScreenState extends State<ShoppingHomeScreen>
    with TickerProviderStateMixin {
  Alignment _bottomNavigationContainerAlignment = Alignment.centerLeft;
  final Duration _bottomNavigationAnimationDuration =
      const Duration(milliseconds: 300);
  int _currentSelectedBottomMenu = 0;

  //

  late final PageController _adsPageController = PageController();

  late final List<AnimationController> _adsTextAnimationControllers = [];

  @override
  void initState() {
    super.initState();
    for (var _ in homeAds) {
      _adsTextAnimationControllers.add(AnimationController(
          vsync: this, duration: const Duration(milliseconds: 800)));
    }
    _adsTextAnimationControllers.first.forward();
  }

  @override
  void dispose() {
    _adsPageController.dispose();
    for (var element in _adsTextAnimationControllers) {
      element.dispose();
    }
    super.dispose();
  }

  void chanhgeBottomNavItem(int index) {
    _adsPageController
        .animateToPage(index,
            curve: Curves.easeInOut,
            duration: _bottomNavigationAnimationDuration)
        .then((value) {
      for (var i = 0; i < _adsTextAnimationControllers.length; i++) {
        if (i == _currentSelectedBottomMenu) {
          _adsTextAnimationControllers[i].forward();
        } else {
          _adsTextAnimationControllers[i].reverse();
        }
      }
    });
    setState(() {
      if (index != _currentSelectedBottomMenu) {
        //change bottom container alignment
        if (index == 0) {
          _bottomNavigationContainerAlignment = Alignment.centerLeft;
        } else if (index == 1) {
          _bottomNavigationContainerAlignment = Alignment.center;
        } else {
          _bottomNavigationContainerAlignment = Alignment.centerRight;
        }
        //update index of bottm menu
        _currentSelectedBottomMenu = index;
      }
    });
  }

  //to change the bottom nav item after page has changed
  void onPageChangeCallback(int index) {
    setState(() {
      if (index != _currentSelectedBottomMenu) {
        //change bottom container alignment
        if (index == 0) {
          _bottomNavigationContainerAlignment = Alignment.centerLeft;
        } else if (index == 1) {
          _bottomNavigationContainerAlignment = Alignment.center;
        } else {
          _bottomNavigationContainerAlignment = Alignment.centerRight;
        }
        //update index of bottm menu
        _currentSelectedBottomMenu = index;
      }
    });
    for (var i = 0; i < _adsTextAnimationControllers.length; i++) {
      if (i == _currentSelectedBottomMenu) {
        _adsTextAnimationControllers[i].forward();
      } else {
        _adsTextAnimationControllers[i].reverse();
      }
    }
  }

  Widget _buildBottomNavContainer(int index, String title, double width) {
    return GestureDetector(
      onTap: () {
        chanhgeBottomNavItem(index);
      },
      child: Container(
        alignment: Alignment.center,
        width: width,
        child: AnimatedDefaultTextStyle(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16.0),
            ),
            style: _currentSelectedBottomMenu == index
                ? const TextStyle(color: Colors.white)
                : const TextStyle(color: Colors.black),
            duration: _bottomNavigationAnimationDuration),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              AnimatedAlign(
                curve: Curves.easeInOut,
                duration: _bottomNavigationAnimationDuration,
                alignment: _bottomNavigationContainerAlignment,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.orange),
                  width: constraints.maxWidth * (0.29),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildBottomNavContainer(
                      0, "Women", constraints.maxWidth * 0.29),
                  _buildBottomNavContainer(
                      1, "Men", constraints.maxWidth * 0.29),
                  _buildBottomNavContainer(
                      2, "Kids", constraints.maxWidth * 0.29),
                ],
              )
            ],
          );
        }),
        margin: EdgeInsets.only(
            bottom: 10.0,
            right: MediaQuery.of(context).size.width * (0.1),
            left: MediaQuery.of(context).size.width * (0.1)),
        width: MediaQuery.of(context).size.width * (0.8),
        height: MediaQuery.of(context).size.height * (0.06),
      ),
    );
  }

  Widget _buildYouMayLikeItemContainer(
      Product product, BoxConstraints boxConstraints) {
    double itemContainerHeight = boxConstraints.maxHeight * (0.6);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
            reverseTransitionDuration:
                const Duration(milliseconds: heroDurationInMilliSeconds),
            transitionDuration:
                const Duration(milliseconds: heroDurationInMilliSeconds),
            pageBuilder: (context, animation, _) {
              return ProductDetailsScreen(product: product);
            }));
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        margin: const EdgeInsets.only(right: 20.0),
        width: boxConstraints.maxWidth * (0.4),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: boxConstraints.maxWidth * (0.025),
              bottom: boxConstraints.maxWidth * (0.35) * (0.115),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 20.0,
                      )
                    ]),
                width: boxConstraints.maxWidth * (0.35),
                height: boxConstraints.maxWidth * (0.35),
              ),
            ),
            Container(
              height: itemContainerHeight * 0.9,
              color: Colors.white,
              child: Column(
                children: [
                  Hero(
                    tag: product.imageUrl,
                    child: Container(
                      height: itemContainerHeight * (0.725) * (0.9),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(product.imageUrl)),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: itemContainerHeight * (0.045),
                  ),
                  Text(
                    product.name,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: itemContainerHeight * (0.02),
                  ),
                  Text(
                    "\$ ${product.price}",
                    style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildYouMayLikeItemList(
      List<Product> items, BoxConstraints constraints) {
    return ListView.builder(
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * (0.1)),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildYouMayLikeItemContainer(items[index], constraints);
        });
  }

  Widget _buildYouMayLikeContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: constraints.maxHeight * (0.1),
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * (0.1),
                  ),
                  const Text(
                    "You may like",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  //Icon(Icons.arrow_forward_ios_rounded),
                  SizedBox(
                    width: constraints.maxWidth * (0.1),
                  ),
                ],
              ),
              SizedBox(
                height: constraints.maxHeight * (0.075),
              ),
              SizedBox(
                height: constraints.maxHeight * (0.6),
                child: AnimatedSwitcher(
                  duration: _bottomNavigationAnimationDuration,
                  switchInCurve: Curves.easeInOut,
                  child: _currentSelectedBottomMenu == 0
                      ? _buildYouMayLikeItemList(
                          youMayLikeWomanProducts, constraints)
                      : _currentSelectedBottomMenu == 1
                          ? _buildYouMayLikeItemList(
                              youMayLikeManProducts, constraints)
                          : _buildYouMayLikeItemList(
                              youMayLikeChildProducts, constraints),
                ),
              )
            ],
          );
        }),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * (0.45),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
            )),
      ),
    );
  }

  Widget _buildAdContainer() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * (0.625),
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
          onPageChanged: (index) {
            onPageChangeCallback(index);
          },
          controller: _adsPageController,
          itemCount: homeAds.length,
          itemBuilder: (context, index) {
            return Container(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Color(0xff464646), Color(0x00808080)])),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * (0.15),
                            left: MediaQuery.of(context).size.width * (0.125)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeTransition(
                              opacity: Tween<double>(begin: 0.0, end: 1.0)
                                  .animate(CurvedAnimation(
                                      parent:
                                          _adsTextAnimationControllers[index],
                                      curve: const Interval(0.0, 0.8,
                                          curve: Curves.easeInOut))),
                              child: Text(
                                homeAds[index].title,
                                style: const TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            FadeTransition(
                              opacity: Tween<double>(begin: 0.0, end: 1.0)
                                  .animate(CurvedAnimation(
                                      parent:
                                          _adsTextAnimationControllers[index],
                                      curve: const Interval(0.3, 1.0,
                                          curve: Curves.easeInOut))),
                              child: Text(
                                homeAds[index].subTitle,
                                style: const TextStyle(
                                  fontSize: 45,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            FadeTransition(
                              opacity: Tween<double>(begin: 0.0, end: 1.0)
                                  .animate(CurvedAnimation(
                                      parent:
                                          _adsTextAnimationControllers[index],
                                      curve: const Interval(0.45, 1.0,
                                          curve: Curves.easeInOut))),
                              child: const Text(
                                "Collection",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(homeAds[index].image)),
                ));
          }),
    );
  }

  Widget _buildExploreButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * (0.51),
        ),
        child: GestureDetector(
          onTap: () {
            //open bottom sheet
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )),
                context: context,
                builder: (context) {
                  return const BottomSheetContainer();
                });
          },
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              "Explore",
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                )),
            height: MediaQuery.of(context).size.height * 0.075,
            width: MediaQuery.of(context).size.width * (0.3),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildAdContainer(),
          _buildYouMayLikeContainer(),
          _buildExploreButton(),
          _buildBottomNavigation(),
        ],
      ),
    );
  }
}

class BottomSheetContainer extends StatefulWidget {
  const BottomSheetContainer({Key? key}) : super(key: key);

  @override
  _BottomSheetContainerState createState() => _BottomSheetContainerState();
}

class _BottomSheetContainerState extends State<BottomSheetContainer>
    with TickerProviderStateMixin {
  late final AnimationController _bottomSheetHeightAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1000))
        ..forward();

  late final Animation<double> _bottomSheetHeightDownAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _bottomSheetHeightAnimationController,
          curve: const Interval(0.6, 1.0, curve: Curves.easeInOut)));

  late final Animation<double> _bottomSheetHeightUpAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _bottomSheetHeightAnimationController,
          curve: const Interval(0.0, 0.6, curve: Curves.easeInOut)));

  late List<String> categoryImages = exploredCategoryImages..shuffle();

  @override
  void dispose() {
    _bottomSheetHeightAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bottomSheetHeightAnimationController,
      builder: (context, child) {
        final height = _bottomSheetHeightUpAnimation.value *
                MediaQuery.of(context).size.height *
                (0.65) -
            MediaQuery.of(context).size.height *
                (0.1) *
                _bottomSheetHeightDownAnimation.value;

        return ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * (0.125),
                    ),
                    SlideTransition(
                      position: Tween<Offset>(
                              begin: const Offset(0.0, 0.5), end: Offset.zero)
                          .animate(CurvedAnimation(
                              parent: _bottomSheetHeightAnimationController,
                              curve: const Interval(0.3, 0.7,
                                  curve: Curves.easeInOut))),
                      child: ScaleTransition(
                        alignment: Alignment.bottomCenter,
                        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: _bottomSheetHeightAnimationController,
                                curve: const Interval(0.3, 0.7,
                                    curve: Curves.easeInOut))),
                        child: Container(
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/animatedScreens/shoppingAnimation/categoryBanner.jpg")),
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white),
                          width: constraints.maxWidth,
                          height: constraints.maxHeight * (0.25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * (0.075),
                    ),
                    Flexible(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 15.0,
                                  mainAxisSpacing: 15.0),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return CategoryContainer(
                              categoryImageUrl: categoryImages[index],
                              index: index,
                            );
                          }),
                    )
                  ],
                );
              }),
              width: MediaQuery.of(context).size.width,
              height: height,
              decoration: const BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
            ),
          ),
        );
      },
    );
  }
}

class CategoryContainer extends StatefulWidget {
  final int index;
  final String categoryImageUrl;
  const CategoryContainer(
      {Key? key, required this.index, required this.categoryImageUrl})
      : super(key: key);

  @override
  _CategoryContainerState createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer>
    with TickerProviderStateMixin {
  late AnimationController animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 600));

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 150));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(0, 2.5), end: Offset.zero)
          .animate(CurvedAnimation(
              parent: animationController, curve: Curves.easeInOut)),
      child: ScaleTransition(
        alignment: Alignment.center,
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeInOut)),
        child: Container(
          padding: const EdgeInsets.all(25.0),
          child: SvgPicture.asset(widget.categoryImageUrl),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), color: Colors.white),
        ),
      ),
    );
  }
}
