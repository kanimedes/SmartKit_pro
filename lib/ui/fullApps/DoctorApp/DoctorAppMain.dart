import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartkit_pro/ui/fullApps/DoctorApp/helper/ColorRes.dart';

import 'doctor_splashScreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  runApp(const DoctorMyApp());
}

class DoctorMyApp extends StatelessWidget {
  const DoctorMyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        return ScrollConfiguration(
            behavior: GlobalScrollBehavior(), child: widget!);
      },
      title: 'Doctor App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: ColorRes.white,
        textTheme: GoogleFonts.sarabunTextTheme(Theme.of(context).textTheme),
      ),
      home: const DoctorSplashScreen(),
    );
  }
}

class GlobalScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return BouncingScrollPhysics();
  }
}
