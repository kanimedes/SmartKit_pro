import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

import 'Screens/SalonSplashScreen.dart';

class SalonMain extends StatelessWidget {
  const SalonMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pure Beauty",
      theme: ThemeData(
        fontFamily: 'salonfont',
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        primaryTextTheme: TextTheme(headline6: TextStyle(color: salonappcolor)),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: salonappcolor),
      ),
      home: SalonSplashScreen(),
    );
  }
}
