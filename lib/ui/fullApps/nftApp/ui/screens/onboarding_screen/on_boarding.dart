import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/ui/screens/auth/login_page.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/ui/styles/onboard_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              OnBoardimage(
                firstColor: Color(0xff2a355e),
                secoundColor: Theme.of(context).scaffoldBackgroundColor,
                flextwo: 1,
                flexone: 2,
                txtMain: 'The image Art\nIndustry gets a \nMakeover',
                txtSub:
                    'image artiste can now easily sell their artwork\nwith the help of a new mobile applicaiton',
                imageName: 'image_a.jpg',
              ),
              OnBoardimage(
                firstColor: Color(0xffcf5151),
                secoundColor: Color(0xffcf5151),
                flextwo: 3,
                flexone: 0,
                txtMain:
                    'New App will Enable\nImage Artist to Easily\nSell Their Artwork',
                txtSub:
                    'image artiste can now easily sell their artwork\nwith the help of a new mobile applicaiton',
                imageName: 'image_b.jpg',
              ),
              OnBoardimage(
                firstColor: Theme.of(context).scaffoldBackgroundColor,
                secoundColor: Color(0xff144746),
                flexone: 1,
                flextwo: 2,
                txtMain: 'NFTs Now\nOnboarded to\nSell Image Art',
                txtSub:
                    'image artiste can now easily sell their artwork\nwith the help of a new mobile applicaiton',
                imageName: 'image_c.jpg',
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10, right: 10),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                "skip",
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment(0, 0.90),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: SlideEffect(
                        spacing: 3,
                        radius: 4,
                        dotWidth: 10,
                        dotHeight: 6,
                        activeDotColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => loginPage(),
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary),
                        child: Icon(
                          Icons.navigate_next,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
