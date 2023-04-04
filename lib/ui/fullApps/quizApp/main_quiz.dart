import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/ui/splash_page.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/colors.dart';

class mainQuiz extends StatelessWidget {
  const mainQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz App",
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
          scaffoldBackgroundColor: appColors.backgroundColor,
          colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: appColors.primaryColor,
              background: appColors.backgroundColor,
              onBackground: appColors.secoundrybackgroundColor,
              outline: appColors.iconColor,
              onSecondary: appColors.secoundrytextColor)),
      home: SplashPage(),
    );
  }
}
