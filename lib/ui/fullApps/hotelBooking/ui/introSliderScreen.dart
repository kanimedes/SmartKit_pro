import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';

class IntroSliderScreen extends StatefulWidget {
  const IntroSliderScreen({Key? key}) : super(key: key);

  @override
  State<IntroSliderScreen> createState() => _IntroSliderScreenState();
}

class _IntroSliderScreenState extends State<IntroSliderScreen> {
  int currentIndex = 0;
  int pageIndex = 0;
  PageController pageController = PageController();

  List<String> titles = [
    'Travel Safety, Comfortability &  Easily',
    'Find the best hotel for you vacation',
    'Let\'s  discover the word with us'
  ];

  List<String> subTitles = [
    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',
    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'
  ];

  onTap(int index) {
    setState(() {
      currentIndex = index;
      pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.80,
                child: PageView.builder(
                  onPageChanged: onTap,
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(
                          '${imagePath}hotel_${index + 10}.jpg',
                          fit: BoxFit.cover,
                        ),
                        Container(
                          padding: EdgeInsetsDirectional.all(20),
                          child: Column(
                            children: [
                              Text(
                                titles[index],
                                softWrap: true,
                                style: appTextTheme(context)
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              getSizedBox(height: 10),
                              Text(subTitles[index],
                                  softWrap: true,
                                  style: appTextTheme(context).labelSmall)
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                )
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            start: 0,
            end: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.20,
              padding: EdgeInsetsDirectional.only(
                  start: 30, end: 30),
              child: Column(
                children: [
                  AppButton(
                    btnText: 'Next',
                    voidCallBack: () {
                      pageIndex++;
                      pageIndex < 2
                          ? onTap(pageIndex)
                          : Navigator.pushNamed(
                          context, signInScreen);
                    },
                  ),
                  getSizedBox(height: 20),
                  AppButton(
                    btnText: 'Skip',
                    backgroundColor: AppColors.primaryLightColor,
                    textColor: AppColors.primaryColor,
                    voidCallBack: () {
                      Navigator.pushNamed(context, signInScreen);
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
