import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/styles/colors.dart';
import 'package:smartkit_pro/ui/fullApps/widgets/slideAnimation.dart';

import 'HappyShopLogin.dart';

class HappyShopOnbording extends StatefulWidget {
  const HappyShopOnbording({Key? key}) : super(key: key);

  @override
  _HappyShopOnbordingState createState() => _HappyShopOnbordingState();
}

class _HappyShopOnbordingState extends State<HappyShopOnbording>
    with SingleTickerProviderStateMixin {
  PageController? _pageController;
  int currentIndex = 0;
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  List<Widget> indicators = [];
  void onAddButtonTapped(int index) {
    // use this to animate to the page
    _pageController!.animateToPage(index,
        duration: Duration(milliseconds: 1000), curve: Curves.elasticInOut);

    // or this to jump to it without animating
    _pageController!.jumpToPage(index);
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 6,
        width: isActive ? 15 : 5,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isActive ? color1 : color2,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
          body: Stack(
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: const <Widget>[
              IntroPage(
                localimg: "assets/images/fullApps/happyshop/intro-1.jpg",
                imgurl:
                    "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fintro-1.jpg?alt=media&token=5703cd7c-283a-43c3-926e-b1a653588337",
                titletext: "Choose \nYour Products",
                subtext:
                    "Discover New Spring Collection \nEveryday with Happyshop",
                blurUrl: "LNRdvYkDslxW*IoJWCX8vgoyNGWE",
              ),
              IntroPage(
                localimg: "assets/images/fullApps/happyshop/intro-2.jpg",
                imgurl:
                    "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fintro-2.jpg?alt=media&token=602a542a-d283-41dc-9163-470009e4e927",
                titletext: "Easy Payment \nMethod",
                subtext:
                    "We connect you to your favourite online brands \nso let's browse it with Happyshop",
                blurUrl: "LWI~+Un\$NGtR~obbWBjF9coyskRk",
              ),
              IntroPage(
                localimg: "assets/images/fullApps/happyshop/intro-3.jpg",
                imgurl:
                    "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fintro-3.jpg?alt=media&token=50612315-e36f-4089-811b-cd6a3a2b12e5",
                titletext: "Get Your Delivery \nat Home",
                subtext:
                    "We offers best comfort product \nfor you and your family",
                blurUrl: "LQL4%fjctQtQ~mt6RQWBE9oeRjWD",
              ),
            ],
          ),
          ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              child: Container(
                height: MediaQuery.of(context).size.height / 3.9,
                color: white.withOpacity(0.5),
              )),
          Container(
            height: MediaQuery.of(context).size.height / 3.9,
            padding:
                EdgeInsets.only(left: 50, right: 50, bottom: 20, top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    currentIndex == 0
                        ? "Choose \nYour Products"
                        : currentIndex == 1
                            ? "Easy Payment \nMethod"
                            : "Get Your Delivery \nat Home",
                    style: TextStyle(
                        color: textcolor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    currentIndex == 0
                        ? "Discover New Spring Collection \nEveryday with Happyshop"
                        : currentIndex == 1
                            ? "We connect you to your favourite online brands \nso let's browse it with Happyshop"
                            : "We offers best comfort product \nfor you and your family",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: subtitle,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 15.0,
            left: MediaQuery.of(context).size.width / 8,
            right: MediaQuery.of(context).size.width / 8,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => new Container(
                            width: currentIndex == index ? 30 : 10,
                            height: 10,
                            margin: EdgeInsets.only(left: 3, right: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: currentIndex == index
                                  ? white
                                  : white.withOpacity(0.3),
                            )),
                      )),
                ),
                currentIndex == 2
                    ? SlideAnimation(
                        position: 1,
                        itemCount: 8,
                        slideDirection: SlideDirection.fromBottom,
                        animationController: _animationController,
                        child: InkWell(
                          onTap: () {
                            if (currentIndex == 0) {
                              setState(() {
                                indicators.add(_indicator(true));

                                currentIndex = 1;
                                onAddButtonTapped(currentIndex);
                              });
                            } else if (currentIndex == 1) {
                              setState(() {
                                indicators.add(_indicator(true));
                                currentIndex = 2;
                                onAddButtonTapped(currentIndex);
                              });
                            } else if (currentIndex == 2) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HappyShopLogin(),
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 50.0,
                            child: Center(
                              child: Text(
                                currentIndex == 0
                                    ? "Next"
                                    : currentIndex == 1
                                        ? "Next"
                                        : "Start Now",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      happyshopcolor3,
                                      happyshopcolor2
                                    ])),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class IntroPage extends StatefulWidget {
  const IntroPage({
    Key? key,
    required this.imgurl,
    required this.titletext,
    required this.subtext,
    required this.blurUrl,
    this.localimg,
  }) : super(key: key);

  final String? imgurl, titletext, subtext, blurUrl, localimg;
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  late AnimationController _animationController, animationController;
  bool dragFromLeft = false;

  double opacityLevel = 0.0;
  Animation? animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animationController.forward();
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OctoImage(
          image: CachedNetworkImageProvider(widget.imgurl!),
          placeholderBuilder: OctoPlaceholder.blurHash(
            widget.blurUrl!,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          errorBuilder: OctoError.icon(color: textcolor),
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
