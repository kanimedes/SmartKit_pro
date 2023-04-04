import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/Screens/HomePage.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/Screens/Message/ChatUserListPage.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';
import 'BookAppointment/BookAppointmentListPage.dart';
import 'Profile/ProfilePage.dart';
import 'SearchDirectionPage.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage>
    with TickerProviderStateMixin {
  // double topheight = 140;

  int currentpage = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: salonbgcolor,
      bottomNavigationBar:
          DesignConfig.bottomNavigationWidget(bottomNavbtnClick, currentpage),
      body: viewCurrentPage(),
      //body: currentpage == 0 ? HomePage() : Container(),
    );
  }

  viewCurrentPage() {
    switch (currentpage) {
      case 0:
        return HomePage();

      case 1:
        return SearchDirectionPage();

      case 2:
        return BookAppointmentListPage();

      case 3:
        return ChatUserListPage();

      case 4:
        return ProfilePage();

      default:
        return Container();
    }
  }

  bottomNavbtnClick(int index) {
    if (currentpage != index) {
      setState(() {
        currentpage = index;
      });
    }
  }
}
