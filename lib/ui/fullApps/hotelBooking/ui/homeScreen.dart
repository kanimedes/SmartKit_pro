import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/model/hotel.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/navigationBookingScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/navigationHomeScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/navigationProfileScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/navigationSearchScreen.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/imageAsset.dart';

String currentSelectedPage = 'Hi, There!';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController? tabController;

  final PageController _pageController = PageController();

  List pages = [
    NavigationHomeScreen(),
    NavigationSearchScreen(),
    NavigationBookingScreen(),
    NavigationProfileScreen()
  ];

  var currentIndex = 0;
  List<Tab> myTabs = [
    Tab(
      icon: Icon(Icons.home_outlined),
      text: "Home",
    ),
    Tab(
      icon: Icon(Icons.search),
      text: "Search",
    ),
    Tab(
      icon: Icon(Icons.my_library_books_outlined),
      text: "Booking",
    ),
    Tab(
      icon: Icon(Icons.person_outline),
      text: "Profile",
    ),
  ];

  @override
  void initState() {
    tabController = TabController(
        length: myTabs.length, vsync: this, initialIndex: currentIndex);
    super.initState();
  }

  void onTap(int selectedIndex) {
    setState(() {
      currentIndex = selectedIndex;
    });
    tabController!.animateTo(currentIndex);
    currentSelectedPage = currentIndex == 0
        ? 'Hi, There!'
        : currentIndex == 1
            ? 'Search Hotels'
            : currentIndex == 2
                ? 'My Bookings'
                : 'Profile';
    _pageController.jumpToPage(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 10, end: 10),
        child: Stack(
          children: [
            PositionedDirectional(
                top: 50,
                start: 5,
                end: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          padding: EdgeInsetsDirectional.all(3),
                          height: 45,
                          width: 45,
                          child: imageAsset(
                              fileName: 'logo_white.svg', isNormalImage: false),
                        ),
                        getSizedBox(width: 15),
                        Text(
                          currentSelectedPage,
                          style: appTextTheme(context)
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            splashRadius: 1,
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, profileNotificationsListScreen);
                            },
                            icon: Icon(
                              Icons.notifications_none,
                              color: AppColors.textColorLight,
                            )),
                        IconButton(
                            splashRadius: 1,
                            onPressed: () {
                              Navigator.pushNamed(context, hotelListingScreen,
                                  arguments: hotelList);
                            },
                            icon: Icon(Icons.bookmark_border,
                                color: AppColors.textColorLight))
                      ],
                    )
                  ],
                )),
            PositionedDirectional(
              top: 105,
              bottom: 5,
              start: 5,
              end: 5,
              child: PageView(
                allowImplicitScrolling: true,
                controller: _pageController,
                onPageChanged: (int index) {
                  onTap(index);
                },
                children: <Widget>[
                  NavigationHomeScreen(
                    tabController: tabController,
                    pageController: _pageController,
                  ),
                  NavigationSearchScreen(),
                  NavigationBookingScreen(),
                  NavigationProfileScreen()
                ],
              ),
            ),
            PositionedDirectional(
              bottom: 5,
              start: 5,
              end: 5,
              child: Container(
                height: MediaQuery.of(context).size.height * .09,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 10,
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(17),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: TabBar(
                    onTap: onTap,
                    labelColor: Colors.white,
                    unselectedLabelColor: AppColors.textColorLight,
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: AppColors.primaryColor,
                    ),
                    tabs: myTabs,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
