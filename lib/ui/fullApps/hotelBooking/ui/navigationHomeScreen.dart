import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/model/hotel.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/actionChip.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appTextField.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/navigationHomeScreen/sectionView.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/sliderImage.dart';

class NavigationHomeScreen extends StatefulWidget {
  late TabController? tabController;
  late PageController? pageController;

  NavigationHomeScreen({Key? key, this.tabController, this.pageController})
      : super(key: key);

  @override
  State<NavigationHomeScreen> createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  var currentSelectedIndex = 0;

  void onChipTap(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  void onTap() {
    setState(() {});
    widget.tabController!.animateTo(1);
    widget.pageController!.jumpToPage(1);
  }

  List<String> labels = [
    'Recommended',
    'Top Rated',
    'Bookmarked',
    'Popular',
    'Trending',
    'Top Cheapest',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              bottom: MediaQuery.of(context).size.height * .09 + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, alex',
                style: appTextTheme(context).titleMedium,
              ),
              getSizedBox(height: 15),
              GestureDetector(
                onTap: onTap,
                child: AppTextField(
                  prefixIcon: Icons.search_outlined,
                  focusNode: FocusNode(),
                  hintText: 'Search Hotels',
                  isEnabled: false,
                ),
              ),
              SizedBox(
                height: 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: labels.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return actionChip(
                        context, labels[index], currentSelectedIndex, index,
                        () {
                      onChipTap(index);
                    });
                  },
                ),
              ),
              getSizedBox(height: 15),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsetsDirectional.only(end: 10),
                      child: sliderImages(context, index),
                    );
                  },
                ),
              ),
              getSizedBox(height: 15),
              Column(children: [
                SectionView(title: labels[0], hotelList: recommendedHotelList),
                SectionView(title: labels[1], hotelList: topRatedHotelList),
                SectionView(title: labels[2], hotelList: bookMarkedHotelList),
                SectionView(title: labels[3], hotelList: popularHotelList),
                SectionView(title: labels[4], hotelList: trendingHotelList),
                SectionView(title: labels[5], hotelList: topCheapestHotelList),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
