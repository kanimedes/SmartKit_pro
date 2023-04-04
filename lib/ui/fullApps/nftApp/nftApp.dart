import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/ui/screens/onboarding_screen/on_boarding.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/ui/styles/colors.dart';

class NFTApp extends StatelessWidget {
  const NFTApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFT MarketPlace',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
          scaffoldBackgroundColor: backgroundColor,
          colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onSecondary: onsecondaryColor,
              secondary: secoundryColor,
              onBackground: onbackgroundColor)),
      home: const OnBoardingScreen(),
    );
  }
}
