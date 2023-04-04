import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/SplashScreen.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';

class FoodMasterMain extends StatefulWidget {
  const FoodMasterMain({
    Key? key,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return FoodMasterMainState();
  }
}

class FoodMasterMainState extends State<FoodMasterMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringsRes.appname,
      theme: ThemeData(
        fontFamily: 'Poppins',
        iconTheme: IconThemeData(
          color: ColorsRes.white,
        ),
        accentColor: ColorsRes.orangeColor,
        primarySwatch: ColorsRes.appcolor_material,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FoodMasterSplashScreen(),
    );
  }
}
