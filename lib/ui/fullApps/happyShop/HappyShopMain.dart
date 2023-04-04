import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';

import 'Screen/HappyShopSplash.dart';

class HappyShopMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Happy Shop",
      theme: ThemeData(
          primarySwatch: primary_app,
          textSelectionTheme: TextSelectionThemeData(cursorColor: primary),
          fontFamily: 'Open sans',
          textTheme: TextTheme(
              headline6: TextStyle(
            color: primary,
            fontWeight: FontWeight.w600,
          ))),
      debugShowCheckedModeBanner: false,
      home: HappyShopSplash(),
    );
  }
}
