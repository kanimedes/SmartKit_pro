import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/colors.dart';
import 'Pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JobSeek',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(

          scaffoldBackgroundColor: AppColors.pagebackgroundColor,
          colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppColors.primaryColor,
              background: AppColors.backgroundColor,
              secondary: AppColors.secondaryColor,
              onPrimary: AppColors.onprimaryColor,
              onSecondary: AppColors.secoundarytextColor)),
      home:  SplashPage(),
    );
  }
}
