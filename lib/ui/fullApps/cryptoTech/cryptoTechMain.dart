import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/SplashScreen.dart';

import 'helper/ColorsRes.dart';
import 'helper/StringsRes.dart';

class CryptoTechMain extends StatelessWidget {
  const CryptoTechMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringsRes.mainappname,
      theme: ThemeData(
        fontFamily: 'MyFont',
        iconTheme: IconThemeData(
          color: ColorsRes.white,
        ),
        primaryTextTheme:
            TextTheme(headline6: TextStyle(color: ColorsRes.appcolor)),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: ColorsRes.appcolor_material)
                .copyWith(secondary: ColorsRes.appcolor),
      ),
      home: CryptoSplashScreen(),
    );
  }
}

//
