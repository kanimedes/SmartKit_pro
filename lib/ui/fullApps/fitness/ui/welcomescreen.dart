import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController textanimationcontroller;
  late Animation<Offset> textanimation;
  late Animation<double> imageanimation;

  @override
  void initState() {
    textanimationcontroller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    textanimation =
        Tween<Offset>(begin: Offset(1.5, 0.0), end: Offset(0.0, 0.0)).animate(
            CurvedAnimation(
                parent: textanimationcontroller, curve: Curves.easeIn));
    textanimationcontroller.forward();
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushNamed(Routes.introscreen);
    });
  }

  Widget _buildimage() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        "assets/images/fullApps/fitness/screen.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildtextvalue() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlideTransition(
              position: textanimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome To",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).backgroundColor),
                  ),
                ],
              ),
            ),
            SlideTransition(
              position: textanimation,
              child: Text(
                "Fitness",
                style: TextStyle(
                  fontSize: 60,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ),
            SlideTransition(
              position: textanimation,
              child: Text(
                "To keep the body in good health is duty \n otherwise we shall  not be able to keep our \n mind strong and clear. there is no \n'I'll start tomorrow'.",
                style: TextStyle(
                  height: 1.8,
                  fontSize: 15,
                  color: Theme.of(context).backgroundColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      _buildimage(),
      _buildtextvalue(),
    ]));
  }
}
