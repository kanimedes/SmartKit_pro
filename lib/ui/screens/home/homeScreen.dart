import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/screens/home/widgets/animatedScreensListContainer.dart';
import 'package:smartkit_pro/ui/screens/home/widgets/fullAppsListContainer.dart';
import 'package:smartkit_pro/ui/screens/home/widgets/gamesListContainer.dart';
import 'package:smartkit_pro/ui/screens/home/widgets/snippetsListContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController
      _bottomNavigationAndHomeTopBackgroundContainerAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 500));

  //current selected bottom nav index
  late int currentIndex = 0;

  //to animate the scale of bottom item
  late final List<AnimationController>
      _bottomNavigationItemScaleAnimationController = [];

  //to animate the image of bottom item
  late final List<AnimationController>
      _bottomNavigationItemContentAnimationController = [];

  void initAnimations() {
    for (var i = 0; i < bottomNavItemDetails.length; i++) {
      _bottomNavigationItemContentAnimationController.add(AnimationController(
          vsync: this, duration: const Duration(milliseconds: 500)));

      _bottomNavigationItemScaleAnimationController.add(AnimationController(
          vsync: this, duration: const Duration(milliseconds: 400)));
    }
  }

  //total number of bottom navigation item in home screen
  final List<BottomNavItem> bottomNavItemDetails = [
    BottomNavItem(
      selectedImageUrl: "assets/images/home.svg",
      disableImageUrl: "assets/images/de_home.svg",
      firstGradientColor: const Color(0xffFFCF7C),
      secondGradientColor: const Color(0xffFFAB89),
    ),
    BottomNavItem(
      selectedImageUrl: "assets/images/animation.svg",
      disableImageUrl: "assets/images/de_animation.svg",
      firstGradientColor: const Color(0xff96FCC8),
      secondGradientColor: const Color(0xff91D0FD),
    ),
    BottomNavItem(
      selectedImageUrl: "assets/images/snippets.svg",
      disableImageUrl: "assets/images/de_snippets.svg",
      firstGradientColor: const Color(0xff9BD5FF),
      secondGradientColor: const Color(0xffC091FF),
    ),
    BottomNavItem(
      selectedImageUrl: "assets/images/games.svg",
      disableImageUrl: "assets/images/de_games.svg",
      firstGradientColor: const Color(0xffFFD7B7),
      secondGradientColor: const Color(0xffFF9BAC),
    ),
  ];

  @override
  void initState() {
    initAnimations();
    startAnimations();
    super.initState();
  }

  void startAnimations() async {
    await _bottomNavigationAndHomeTopBackgroundContainerAnimationController
        .forward();
    for (var i = 0; i < bottomNavItemDetails.length; i++) {
      _bottomNavigationItemScaleAnimationController[i].forward();
      _bottomNavigationItemContentAnimationController[i].forward();
    }
  }

  void changeBottomNavItem(int index) async {
    int previousIndex = currentIndex;
    _bottomNavigationItemScaleAnimationController[index].reverse();
    await _bottomNavigationItemScaleAnimationController[currentIndex].reverse();

    setState(() {
      currentIndex = index;
    });

    _bottomNavigationItemScaleAnimationController[currentIndex].forward();
    _bottomNavigationItemContentAnimationController[currentIndex]
        .forward(from: 0.0);
    _bottomNavigationItemScaleAnimationController[previousIndex].forward();
  }

  @override
  void dispose() {
    for (var i = 0; i < bottomNavItemDetails.length; i++) {
      _bottomNavigationItemContentAnimationController[i].dispose();
      _bottomNavigationItemScaleAnimationController[i].dispose();
    }
    super.dispose();
  }

  Widget _buildBottomNavigation() {
    final List<Widget> bottomNavItems = [];
    for (var i = 0; i < bottomNavItemDetails.length; i++) {
      bottomNavItems.add(BottomNavigationItemContainer(
        bottomNavContentAnimationController:
            _bottomNavigationItemContentAnimationController[i],
        bottomNavItemScaleAnimationController:
            _bottomNavigationItemScaleAnimationController[i],
        currentIndex: currentIndex,
        bottomNavItem: bottomNavItemDetails[i],
        changeBottomNavItem: changeBottomNavItem,
        index: i,
      ));
    }
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
          .animate(CurvedAnimation(
              parent:
                  _bottomNavigationAndHomeTopBackgroundContainerAnimationController,
              curve: Curves.easeInOut)),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            boxShadow: const [
              BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(0, -3),
                  blurRadius: 6,
                  spreadRadius: 0)
            ]),
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: bottomNavItems,
        ),
        width: MediaQuery.of(context).size.width,
        height: 75,
      ),
    );
  }

  Widget _buildFullAppsContainer() {
    return FullAppsListContainer(
      topBackgroundMenuAnimationController:
          _bottomNavigationAndHomeTopBackgroundContainerAnimationController,
    );
  }

  Widget _buildAnimatedSCreensContainer() {
    return AnimatedScreenListContainer();
  }

  Widget _buildSnippetsContainer() {
    return SnippetsListContainer();
  }

  Widget _buildGamesContainer() {
    return GamesListContainer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primaryContainer
                ])),
          ),
          IndexedStack(
            index: currentIndex,
            children: [
              _buildFullAppsContainer(),
              _buildAnimatedSCreensContainer(),
              _buildSnippetsContainer(),
              _buildGamesContainer(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomNavigation(),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem {
  final String selectedImageUrl;
  final String disableImageUrl;
  final Color firstGradientColor;
  final Color secondGradientColor;

  BottomNavItem(
      {required this.disableImageUrl,
      required this.selectedImageUrl,
      required this.firstGradientColor,
      required this.secondGradientColor});
}

class BottomNavigationItemContainer extends StatefulWidget {
  final AnimationController bottomNavItemScaleAnimationController;
  final AnimationController bottomNavContentAnimationController;
  final int currentIndex;
  final int index;
  final BottomNavItem bottomNavItem;
  final Function changeBottomNavItem;
  const BottomNavigationItemContainer(
      {Key? key,
      required this.bottomNavContentAnimationController,
      required this.bottomNavItemScaleAnimationController,
      required this.currentIndex,
      required this.bottomNavItem,
      required this.changeBottomNavItem,
      required this.index})
      : super(key: key);

  @override
  State<BottomNavigationItemContainer> createState() =>
      _BottomNavigationItemContainerState();
}

class _BottomNavigationItemContainerState
    extends State<BottomNavigationItemContainer> {
  late final Animation<double> _scaleAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.bottomNavItemScaleAnimationController,
          curve: Curves.easeInOut));

  late final Animation<double> _angleStartAnimation =
      Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
          parent: widget.bottomNavContentAnimationController,
          curve: const Interval(0, 0.33, curve: Curves.easeIn)));

  late final Animation<double> _angleMiddleAnimation =
      Tween<double>(begin: 0, end: 1.0).animate(CurvedAnimation(
          parent: widget.bottomNavContentAnimationController,
          curve: const Interval(0.33, 0.66, curve: Curves.easeOut)));

  late final Animation<double> _angleEndAnimation =
      Tween<double>(begin: 0, end: 1.0).animate(CurvedAnimation(
          parent: widget.bottomNavContentAnimationController,
          curve: const Interval(0.66, 1.0, curve: Curves.easeIn)));

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: InkWell(
        onTap: () async {
          widget.changeBottomNavItem(widget.index);
        },
        child: Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          child: AnimatedBuilder(
            animation: widget.bottomNavContentAnimationController,
            builder: (context, child) {
              final angle = _angleStartAnimation.value * (-45) +
                  _angleMiddleAnimation.value * (45) -
                  _angleEndAnimation.value * (45);
              return Transform.rotate(
                alignment: Alignment.center,
                angle: (pi / 180) * angle,
                child: Padding(
                  padding: const EdgeInsets.all(12.5),
                  child: SvgPicture.asset(
                    widget.index == widget.currentIndex
                        ? widget.bottomNavItem.selectedImageUrl
                        : widget.bottomNavItem.disableImageUrl,
                    color: widget.index == widget.currentIndex
                        ? Theme.of(context).colorScheme.primary
                        : null,
                  ),
                ),
              );
            },
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: widget.index != widget.currentIndex
                      ? [
                          Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.95),
                          Theme.of(context).colorScheme.onSurface,
                        ]
                      : [
                          Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.38),
                          Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withOpacity(0.38)
                        ])),
        ),
      ),
    );
  }
}
