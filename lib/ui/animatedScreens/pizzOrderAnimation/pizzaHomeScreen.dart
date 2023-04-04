import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/animatedScreens/pizzOrderAnimation/colors.dart';
import 'package:smartkit_pro/ui/animatedScreens/pizzOrderAnimation/models/pizza.dart';
import 'package:smartkit_pro/ui/animatedScreens/pizzOrderAnimation/pizzaDetailsScreen.dart';

const List<String> foodItems = [
  "Pizza",
  "Sandwich",
  "Pasta",
  "Rolls",
  "Burger"
];

class PizzaHomeScreen extends StatefulWidget {
  const PizzaHomeScreen({Key? key}) : super(key: key);

  @override
  _PizzaHomeScreenState createState() => _PizzaHomeScreenState();
}

class _PizzaHomeScreenState extends State<PizzaHomeScreen>
    with TickerProviderStateMixin {
  final double horizontalPaddingPercentage = 0.075;

  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 3000))
    ..forward();
  //test responsiveness
  late final Animation<double> _titleAndProfileAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.0, 0.175, curve: Curves.easeInOut)));

  late final Animation<double> _bannerAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.175, 0.325, curve: Curves.easeInOut)));
  late final Animation<double> _foodCategoryTabBarAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.325, 0.475, curve: Curves.easeInOut)));

  late final TabController _tabController =
      TabController(length: 5, vsync: this, initialIndex: 0)
        ..addListener(tabControllerListener);

  late ScrollController scrollController = ScrollController();

  int currentTabIndex = 0;

  void tabControllerListener() {
    setState(() {
      currentTabIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _tabController.removeListener(tabControllerListener);
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildNameAndToggle() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double dy = MediaQuery.of(context).size.height *
                (0.05) *
                _titleAndProfileAnimation.value -
            MediaQuery.of(context).size.height * (0.05);
        return Transform.translate(
            child:
                Opacity(opacity: _titleAndProfileAnimation.value, child: child),
            offset: Offset(0.0, dy));
      },
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(
                top: 15.0,
                left: MediaQuery.of(context).size.width *
                    horizontalPaddingPercentage,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hello",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 2.5,
                  ),
                  Text(
                    "Tasty Food",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: secondaryfontsColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width:
                MediaQuery.of(context).size.width * horizontalPaddingPercentage,
          ),
        ],
      ),
    );
  }

  Widget _buildBannerImage() {
    return Align(
      alignment: Alignment.topCenter,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          double dx = MediaQuery.of(context).size.width * 0.075 -
              MediaQuery.of(context).size.width *
                  0.075 *
                  _bannerAnimation.value;
          return Opacity(
            opacity: _bannerAnimation.value,
            child: Hero(
              tag: "banner",
              child: Container(
                margin: const EdgeInsets.only(
                  top: 25.0,
                  bottom: 5.0,
                ),
                transformAlignment: Alignment.center,
                transform: Matrix4.identity()..setEntry(0, 3, dx),
                width: MediaQuery.of(context).size.width * (0.85),
                height: MediaQuery.of(context).size.height * (0.175),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                        "assets/images/animatedScreens/pizzOrderAnimation/images/banner.png"),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: lightShadowColor,
                      blurRadius: 30.0,
                      offset: const Offset(0, 15),
                    )
                  ],
                  color: lightBackgroundColor,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFoodItemGridView(int foodItemindex) {
    return SliverPadding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * (0.075),
        right: MediaQuery.of(context).size.width * (0.075),
        bottom: 50.0,
      ),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.575,
          mainAxisSpacing: 35.0,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          return FoodGridItem(
            foodItemIndex: foodItemindex,
            pizza: pizzas[index],
            index: index,
            rootAnimationController: _animationController,
          );
        }, childCount: pizzas.length),
      ),
    );
  }

  Widget _buildFoodItems() {
    return _buildFoodItemGridView(currentTabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildNameAndToggle()),
            SliverToBoxAdapter(child: _buildBannerImage()),
            SliverPersistentHeader(
              delegate: TabbarHeaderDelegate(
                animationController: _animationController,
                foodCategoryTabbarAnimation: _foodCategoryTabBarAnimation,
                tabController: _tabController,
              ),
              pinned: true,
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 5.0,
              ),
            ),
            _buildFoodItems(),
          ],
        ),
      ),
    );
  }
}

class TabbarHeaderDelegate extends SliverPersistentHeaderDelegate {
  TabController tabController;
  AnimationController animationController;
  Animation<double> foodCategoryTabbarAnimation;

  TabbarHeaderDelegate(
      {required this.tabController,
      required this.animationController,
      required this.foodCategoryTabbarAnimation});

  final tabBarHeight = 70.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        double dx = MediaQuery.of(context).size.width * 0.075 -
            MediaQuery.of(context).size.width *
                0.075 *
                foodCategoryTabbarAnimation.value;

        return Opacity(
          opacity: foodCategoryTabbarAnimation.value,
          child: Material(
            elevation: shrinkOffset == tabBarHeight ? 1.5 : 0.0,
            child: Container(
              transformAlignment: Alignment.center,
              transform: Matrix4.identity()..setEntry(0, 3, dx),
              width: MediaQuery.of(context).size.width,
              height: tabBarHeight,
              child: child,
            ),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(color: lightBackgroundColor),
        child: TabBar(
          indicatorColor: Colors.transparent,
          isScrollable: true,
          unselectedLabelColor: const Color(0xff7C7C7C),
          tabs: foodItems
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
          controller: tabController,
        ),
      ),
    );
  }

  @override
  double get maxExtent => tabBarHeight;

  @override
  double get minExtent => tabBarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class FoodGridItem extends StatefulWidget {
  final int foodItemIndex;
  final int index;
  final Pizza pizza;
  final AnimationController rootAnimationController;
  const FoodGridItem(
      {Key? key,
      required this.foodItemIndex,
      required this.pizza,
      required this.index,
      required this.rootAnimationController})
      : super(key: key);

  @override
  _FoodGridItemState createState() => _FoodGridItemState();
}

class _FoodGridItemState extends State<FoodGridItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 450));

  late final Animation<double> _baseAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
    curve: Curves.easeOutQuart,
    parent: _animationController,
  ));

  late String heroTag = "pizza${widget.index}";

  @override
  void initState() {
    if (widget.rootAnimationController.isAnimating) {
      Future.delayed(Duration(milliseconds: 1500 + 500 * widget.index), () {
        if (mounted) {
          _animationController.forward(from: 0.0);
        }
      });
    } else {
      _animationController.forward(from: 0.0);
    }
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /*
  @override
  void didUpdateWidget(FoodGridItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    Future.delayed(Duration(milliseconds: widget.index * 500), () {
      _animationController.forward(from: 0.0);
    });
  }
  */

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _baseAnimation,
      child: SlideTransition(
        position: _baseAnimation.drive(
            Tween<Offset>(begin: const Offset(0.2, 0), end: Offset.zero)),
        child: GestureDetector(
          onTap: () async {
            if (heroTag == "reverse${widget.index}") {
              setState(() {
                heroTag = "pizza${widget.index}";
              });
            }
            Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (context, firstAnimation, secondAnimation) {
                return PizzaDetailsScreen(
                  initialIndex: widget.index,
                  dheight: MediaQuery.of(context).size.height,
                  dwidth: MediaQuery.of(context).size.width,
                );
              },
              transitionDuration: const Duration(milliseconds: 500),
            ));
            await Future.delayed(const Duration(milliseconds: 550));
            heroTag = "reverse${widget.index}";
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: LayoutBuilder(
                  builder: (context, constraits) {
                    return Container(
                      width: constraits.maxWidth * (0.9),
                      height: constraits.maxHeight * (0.75),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: lightDetailsBackgroundColor,
                      ),
                      child: SlideTransition(
                        position: _baseAnimation.drive(Tween<Offset>(
                            begin: const Offset(0.5, 0.0), end: Offset.zero)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 3.0,
                            ),
                            Container(
                              height: constraits.maxHeight * (0.19), //
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7.5),
                              child: Text(
                                widget.pizza.name,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.5),
                              ),
                            ),
                            SizedBox(
                              height: constraits.maxHeight * (0.05),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                      widget.pizza.ratings, (index) => index)
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
                              height: constraits.maxHeight * (0.04),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("${widget.pizza.minutes}"),
                                    const SizedBox(
                                      height: 1.0,
                                    ),
                                    const Text(
                                      "Min",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  height: 20.0,
                                  width: 2.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.black54,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("${widget.pizza.sizeInInch}"),
                                    const SizedBox(
                                      height: 1.0,
                                    ),
                                    const Text(
                                      "Inch",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: constraits.maxHeight * (0.045),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              //build shadow
              Align(
                alignment: Alignment.topCenter,
                child: LayoutBuilder(
                  builder: (context, constraits) {
                    return AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        double angle = _baseAnimation
                            .drive(Tween<double>(begin: 180, end: 0.0))
                            .value;
                        double scale = _baseAnimation
                            .drive(Tween<double>(begin: 0.5, end: 1.0))
                            .value;
                        double shadow = _baseAnimation
                            .drive(Tween<double>(begin: 0.0, end: 30.0))
                            .value;
                        double initialDx = constraits.maxWidth * (0.5);
                        double dx = _baseAnimation
                            .drive(Tween<double>(begin: initialDx, end: 0.0))
                            .value;
                        return Container(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..rotateZ((angle * pi) / 180)
                            ..scale(scale)
                            ..setEntry(1, 3, 17.5)
                            ..setEntry(0, 3, dx),
                          transformAlignment: Alignment.center,
                          height: constraits.maxHeight * (0.41),
                          width: constraits.maxHeight * (0.41),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(
                                constraits.maxHeight * 0.2),
                            boxShadow: [
                              BoxShadow(
                                color: lightShadowColor,
                                blurRadius: shadow,
                                offset: const Offset(0, 15),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              //build pan
              Align(
                alignment: Alignment.topCenter,
                child: LayoutBuilder(
                  builder: (context, constraits) {
                    return AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        double angle = _baseAnimation
                            .drive(Tween<double>(begin: 180, end: 0.0))
                            .value;
                        double scale = _baseAnimation
                            .drive(Tween<double>(begin: 0.5, end: 1.0))
                            .value;
                        double initialDx = constraits.maxWidth * (0.5);
                        double dx = _baseAnimation
                            .drive(Tween<double>(begin: initialDx, end: 0.0))
                            .value;
                        return Container(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..rotateZ((angle * pi) / 180)
                            ..scale(scale)
                            ..setEntry(0, 3, dx),
                          transformAlignment: Alignment.center,
                          height: constraits.maxHeight * (0.45),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/images/animatedScreens/pizzOrderAnimation/images/pan.png"),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              //build pizza image
              Align(
                alignment: Alignment.topCenter,
                child: LayoutBuilder(
                  builder: (context, constraits) {
                    return AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        double angle = _baseAnimation
                            .drive(Tween<double>(begin: 180, end: 0.0))
                            .value;
                        double scale = _baseAnimation
                            .drive(Tween<double>(begin: 0.5, end: 1.0))
                            .value;
                        double initialDx = constraits.maxWidth * (0.5);
                        double dx = _baseAnimation
                            .drive(Tween<double>(begin: initialDx, end: 0.0))
                            .value;
                        return Hero(
                          flightShuttleBuilder: (context, animation, direction,
                              fromContext, toContext) {
                            return fromContext.widget;
                          },
                          tag: heroTag, //
                          child: Container(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..rotateZ((angle * pi) / 180)
                              ..scale(scale)
                              ..setEntry(1, 3, 6.5)
                              ..setEntry(0, 3, dx),
                            transformAlignment: Alignment.center,
                            height: constraits.maxHeight * (0.39),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(widget.pizza.image),
                                )),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
