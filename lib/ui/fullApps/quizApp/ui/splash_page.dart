import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/ui/login_page.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/utils/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/animation/showdown.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/app_text.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () => Navigator.push(context, _createRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Color(0xffB6DADF),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ShowDown(
                  delay: 500,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: MediaQuery.of(context).size.width * 0.40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.2),
                      border: Border.all(color: Colors.black),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.2),
                        child: SvgPicture.asset(
                          QuizappConstant.getImagePath("appicon.svg"),
                          fit: BoxFit.contain,
                        )),
                    //  child: Image(image: AssetImage(QuizappConstant.getImagePath("smoke.jpg")),fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ShowDown(
                    delay: 600,
                    child: AppText(
                      text: "QuizApp",
                      size: 24,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                ShowDown(
                    delay: 700,
                    child: AppText(
                      text: "Let's play together",
                      size: 18,
                    )),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.05),
              child: ShowDown(
                  delay: 700,
                  child: AppText(
                    text: "By wrteam",
                    size: 18,
                  )),
            ),
          )
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const loginPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
