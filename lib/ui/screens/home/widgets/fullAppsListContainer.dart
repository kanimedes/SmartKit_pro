import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/app/routes.dart';
import 'package:smartkit_pro/ui/screens/home/widgets/moreFeaturesComingSoonContainer.dart';
import 'package:smartkit_pro/ui/screens/home/widgets/topBackgroundContainer.dart';
import 'package:smartkit_pro/utils/constants.dart';
import 'package:smartkit_pro/utils/uiUtils.dart';

class FullAppsListContainer extends StatefulWidget {
  final AnimationController topBackgroundMenuAnimationController;
  const FullAppsListContainer(
      {Key? key, required this.topBackgroundMenuAnimationController})
      : super(key: key);

  @override
  State<FullAppsListContainer> createState() => _FullAppsListContainerState();
}

class _FullAppsListContainerState extends State<FullAppsListContainer>
    with TickerProviderStateMixin {
  late final List<AnimationController> _appCardAnimationControllers = [];

  final List<Map<String, dynamic>> _fullApps = [
    {
      "appTitle": "NFT App",
      "route": Routes.nftApp,
      "totalScreens": "20",
      "imageUrl": "assets/images/fullApps/nft/logo_color.svg",
    },
    {
      "appTitle": "Hotel Booking App",
      "route": Routes.hotelBookingApp,
      "totalScreens": "25",
      "imageUrl": "assets/images/fullApps/hotelBookingApp/fullAppLogo.svg",
    },
    {
      "appTitle": "Music App",
      "route": Routes.musicApp,
      "totalScreens": "12",
      "imageUrl": "assets/images/fullApps/music/mainlogo.svg",
    },
    {
      "appTitle": "Fitness App",
      "route": Routes.fitnessApp,
      "totalScreens": "20",
      "imageUrl": "assets/images/fullApps/fitness/splash.svg",
    },
    {
      "appTitle": "Modern News App",
      "route": Routes.modernNewsApp,
      "totalScreens": "15",
      "imageUrl": "assets/images/fullApps/modernNews/splash_Icon.png",
    },
    {
      "appTitle": "Quiz App",
      "route": Routes.quizApp,
      "totalScreens": "10",
      "imageUrl": "assets/images/fullApps/quizapp/appicon.svg",
    },
    {
      "appTitle": "Job Search App",
      "route": Routes.jobseekApp,
      "totalScreens": "20",
      "imageUrl": "assets/images/fullApps/jobseekApp/jobs_greenlogo.svg",
    },
    {
      "appTitle": "Doctor Search App",
      "route": Routes.doctorLive,
      "totalScreens": "43",
      "imageUrl": "assets/images/fullApps/doctorapp/logo/logo.svg",
    },
    {
      "appTitle": "Property App",
      "route": Routes.dreamHome,
      "totalScreens": "22",
      "imageUrl": "assets/images/fullApps/dreamhome/logo.svg",
    },
    {
      "appTitle": "Furniture App",
      "route": Routes.furnitureHub,
      "totalScreens": "20",
      "imageUrl": "assets/images/fullApps/furnitureHub/app_logo.svg",
    },
    {
      "appTitle": "Taxi App",
      "route": Routes.goRide,
      "totalScreens": "20",
      "imageUrl": "assets/images/fullApps/goRide/appicon.svg",
    },
    {
      "appTitle": "Meditation App",
      "route": Routes.meditationApp,
      "totalScreens": "20",
      "imageUrl": "assets/images/fullApps/meditationApp/meditationLogo.svg",
    },
    {
      "appTitle": "Salon App",
      "route": Routes.pureBeauty,
      "totalScreens": "20",
      "imageUrl": "assets/images/fullApps/pureBeauty/svgimg/logo.svg",
    },
    {
      "appTitle": "Travel App",
      "route": Routes.worldTour,
      "totalScreens": "18",
      "imageUrl": "assets/images/fullApps/worldTour/appLogo.png",
    },
    {
      "appTitle": "Dating App",
      "route": Routes.loveMeet,
      "totalScreens": "18",
      "imageUrl": "assets/images/fullApps/loveMeet/datinglogo.svg",
    },
    {
      "appTitle": "Movie App",
      "route": Routes.playMedia,
      "totalScreens": "20",
      "imageUrl": "assets/images/fullApps/playMedia/svg/logo.svg",
    },
    {
      "appTitle": "Grocery App",
      "route": Routes.grobag,
      "totalScreens": "25",
      "imageUrl": "assets/images/fullApps/grobag/appLogo.svg",
    },
    {
      "appTitle": "Food App",
      "route": Routes.foodMaster,
      "totalScreens": "30",
      "imageUrl": "assets/images/fullApps/foodMaster/appLogo.svg",
    },
    {
      "appTitle": "Crypto App",
      "route": Routes.cryptoTech,
      "totalScreens": "40",
      "imageUrl": "assets/images/fullApps/cryptotech/cryptoking.svg",
    },
    {
      "appTitle": "E-commerce App",
      "route": Routes.happyShop,
      "totalScreens": "22",
      "imageUrl": "assets/images/fullApps/happyshop/appLogo.svg",
    },
    {
      "appTitle": "Learning App",
      "route": Routes.eStudy,
      "totalScreens": "22",
      "imageUrl": "assets/images/fullApps/eStudy/appLogo.svg",
    },
    {
      "appTitle": "News App",
      "route": Routes.newsApp,
      "totalScreens": "30",
      "imageUrl": "assets/images/fullApps/newsapp/appLogo.svg",
    },
  ];

  @override
  void initState() {
    super.initState();
    initAnimations();
  }

  void initAnimations() {
    for (var i = 0; i < _fullApps.length; i++) {
      _appCardAnimationControllers.add(AnimationController(
          vsync: this, duration: const Duration(milliseconds: 500)));
    }
  }

  void onAppDetailsCardTap(String route) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, -1.25),
                end: Offset.zero,
              ).animate(widget.topBackgroundMenuAnimationController),
              child: const TopBackgroundContainer(
                title: "Applications",
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * (0.15)),
                child: Column(
                  children: [
                    ..._fullApps.map((e) {
                      final int index = _fullApps.indexWhere(
                          (element) => element['appTitle'] == e['appTitle']);
                      return AppDetailsCard(
                          appTitle: e['appTitle'],
                          imageUrl: e['imageUrl'],
                          totalScreens: e['totalScreens'],
                          onTap: () {
                            onAppDetailsCardTap(e['route']);
                          },
                          index: index,
                          animationController:
                              _appCardAnimationControllers[index]);
                    }).toList(),
                    const MoreFeatureComingSoonContainer(
                        googleFormLink: fullAppsGoogleForm,
                        featureTitle: "Full apps")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDetailsCard extends StatefulWidget {
  final int index;
  final Function onTap;
  final String imageUrl;
  final String totalScreens;
  final AnimationController animationController;

  final String appTitle;
  const AppDetailsCard(
      {Key? key,
      required this.totalScreens,
      required this.appTitle,
      required this.imageUrl,
      required this.index,
      required this.animationController,
      required this.onTap})
      : super(key: key);

  @override
  State<AppDetailsCard> createState() => _AppDetailsCardState();
}

class _AppDetailsCardState extends State<AppDetailsCard> {
  late final Animation<Offset> _cardSlideAnimation =
      Tween<Offset>(begin: const Offset(0.0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
              parent: widget.animationController, curve: Curves.easeInOut));

  late final Animation<double> _cardFadeAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController, curve: Curves.easeInOut));

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(
          milliseconds: 550 + widget.index * 250,
        ), () {
      widget.animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _cardFadeAnimation,
      child: SlideTransition(
        position: _cardSlideAnimation,
        child: Container(
          width: MediaQuery.of(context).size.width * (0.85),
          height: 120, //MediaQuery.of(context).size.height * (0.15),
          margin: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: LayoutBuilder(builder: (context, boxConstraints) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    top: 0,
                    left: boxConstraints.maxWidth * (0.06),
                    right: boxConstraints.maxWidth * (0.06),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 40),
                                blurRadius: 30,
                                spreadRadius: 5,
                                color: Color(0xbf000000))
                          ],
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(
                                  boxConstraints.maxWidth * (0.525)),
                              bottomLeft: Radius.circular(
                                  boxConstraints.maxWidth * (0.525)))),
                      width: boxConstraints.maxWidth,
                      height: boxConstraints.maxHeight * (0.6),
                    )),
                Positioned(
                    child: GestureDetector(
                  onTap: () {
                    widget.onTap();
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.appTitle,
                                style: TextStyle(
                                    fontSize: UiUtils.titleTextFontSize, //
                                    fontWeight: FontWeight.w600,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  width: 40,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius:
                                          BorderRadius.circular(2.0))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${widget.totalScreens}+ Screens",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                              child: widget.imageUrl.contains('.png')
                                  ? Image.asset(widget.imageUrl)
                                  : SvgPicture.asset(widget.imageUrl)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.075)),
                          height: 70.0,
                          width: 70.0,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.5, horizontal: 20.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(15.0)),
                    width: boxConstraints.maxWidth,
                    height: boxConstraints.maxHeight,
                  ),
                )),
              ],
            );
          }),
        ),
      ),
    );
  }
}
