import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/activity/SplashScreenMobile.dart';

class EStudyMain extends StatefulWidget {
  @override
  State<EStudyMain> createState() => _EStudyMainState();
}

class _EStudyMainState extends State<EStudyMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eStuddy',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EstudySplashScreen(),
    );
  }
}
