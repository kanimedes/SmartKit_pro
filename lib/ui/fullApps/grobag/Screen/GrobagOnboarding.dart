import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';

import 'GrobagSignupMain.dart';

class GrobagOnbording extends StatefulWidget {
  const GrobagOnbording({Key? key}) : super(key: key);

  @override
  _GrobagOnbordingState createState() => _GrobagOnbordingState();
}

class _GrobagOnbordingState extends State<GrobagOnbording> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  double? height;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final slideList = [
    Slide(
      localimg: 'assets/images/fullApps/grobag/intro_a.jpg',
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fintro_a.jpg?alt=media&token=93c5aec5-680d-4a30-bab7-7b911e6463a4",
      blurUrl: "LD9B4gt+O:rr.iozS|n\$D+a1raS}",
      title: "Exiting Offers",
      description: "Get new offers and great deals everyday every hours",
    ),
    Slide(
      localimg: 'assets/images/fullApps/grobag/intro_b.jpg',
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fintro_b.jpg?alt=media&token=343e7fde-6679-43d5-8e1c-b4a54db49afc",
      blurUrl: "L7RF,~^6{,AA?a\$k;8EyRQJ6Ef,u",
      title: "Shop Your Daily Needs",
      description: "You won't find it cheaper anywhere else then Grobag",
    ),
    Slide(
      localimg: 'assets/images/fullApps/grobag/intro_c.jpg',
      imageUrl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fintro_c.jpg?alt=media&token=ba21c393-d5f7-43ea-bab2-49e51c064246",
      blurUrl: "LBR+J=%0,qNd.ht5\$NNJIDjZRkS2",
      title: '1000+ Products',
      description: "Shop and get delivery at your time and convience",
    ),
  ];

  List<T?> map<T>(List list, Function handler) {
    List<T?> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  Widget _slider() {
    return PageView.builder(
      itemCount: slideList.length,
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      onPageChanged: _onPageChanged,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            OctoImage(
              image: CachedNetworkImageProvider(slideList[index].imageUrl),
              placeholderBuilder: OctoPlaceholder.blurHash(
                slideList[index].blurUrl!,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              errorBuilder: OctoError.icon(color: black),
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: height! <= 640.0
                      ? MediaQuery.of(context).size.height / 10
                      : MediaQuery.of(context).size.height / 1.8),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height! <= 640.0 ? 20 : 45),
                    child: Text(slideList[currentIndex].title,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: height! <= 640.0 ? 10.0 : 20.0,
                          left: 10.0,
                          right: 10.0),
                      child: Text(slideList[currentIndex].description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: white.withOpacity(0.75),
                                  fontWeight: FontWeight.normal)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 6,
        width: isActive ? 25 : 7,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isActive ? white : white.withOpacity(0.5),
        ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height / 12,
          color: currentIndex == 0
              ? green
              : currentIndex == 1
                  ? pink
                  : yellow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => GrobagSignupMain(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Skip",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: white)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (currentIndex == 0) {
                    setState(() {
                      _pageController.jumpToPage(1);
                    });
                  } else if (currentIndex == 1) {
                    setState(() {
                      _pageController.jumpToPage(2);
                    });
                  } else if (currentIndex == 2) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => GrobagSignupMain(),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Next",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: white)),
                ),
              ),
            ],
          ),
        ),
        body: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: <Widget>[
              _slider(),
              Container(
                margin: EdgeInsets.only(
                    bottom: height! <= 640.0 ? 20.0 : 30,
                    top: height! <= 640.0
                        ? MediaQuery.of(context).size.height / 1.4
                        : MediaQuery.of(context).size.height / 1.3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Slide {
  final String imageUrl;
  final String title;
  final String description;
  String? blurUrl;
  String? localimg;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.description,
    this.blurUrl,
    this.localimg,
  });
}
