import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/ui/splashScreen.dart';

class HotelBookingApp extends StatelessWidget {
  const HotelBookingApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextTheme googleTextTheme =
        GoogleFonts.interTextTheme(appTextTheme(context));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel Booking App',
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: "/",
      theme: ThemeData(
        textTheme: googleTextTheme.copyWith(
          titleLarge: googleTextTheme.titleLarge!.copyWith(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
              height: 1.3),
          titleMedium: googleTextTheme.titleMedium!.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
              height: 1.3),
          titleSmall: googleTextTheme.titleSmall!.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
              height: 1.3),
          labelLarge: googleTextTheme.labelLarge!
              .copyWith(fontSize: 30, color: AppColors.textColor, height: 1.3),
          labelMedium: googleTextTheme.labelMedium!
              .copyWith(fontSize: 20, color: AppColors.textColor, height: 1.3),
          labelSmall: googleTextTheme.labelSmall!
              .copyWith(fontSize: 15, color: AppColors.textColor, height: 1.3),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.primaryColor,
          selectionColor: AppColors.primaryColor,
          selectionHandleColor: AppColors.primaryColor,
        ),
        primarySwatch: AppColors.primaryApp,
        scaffoldBackgroundColor: AppColors.scafoldColor,
      ),
      home: SplashScreen(),
    );
  }
}
