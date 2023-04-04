import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';

class FitnessSplashScreen extends StatefulWidget {
  const FitnessSplashScreen({Key? key}) : super(key: key);

  @override
  State<FitnessSplashScreen> createState() => _FitnessSplashScreenState();
}

class _FitnessSplashScreenState extends State<FitnessSplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> imageanimation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    imageanimation =
        Tween<Offset>(begin: Offset(0.0, 0.1), end: Offset(0.0, 0.0)).animate(
            CurvedAnimation(
                parent: _controller,
                curve: Interval(0.1, 0.4, curve: Curves.easeIn)));
    _controller.forward();
    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pushNamed(Routes.welcomescreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildlogo() {
      return SlideTransition(
        position: imageanimation,
        child: Center(
          child: Image.asset(
            "assets/images/fullApps/fitness/logo.png",
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width * 0.4,
          ),
        ),
      );
    }

    // Widget _circular() {
    //   return Padding(
    //     padding: const EdgeInsets.only(bottom: 20.0),
    //     child: CircularProgressIndicator(),
    //   );
    // }

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: [
            _buildlogo(),
          ],
        ));
  }
}
