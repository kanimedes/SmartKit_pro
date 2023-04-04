// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';

import '../MainHomePage.dart';

class Order_Place extends StatefulWidget {
  const Order_Place({Key? key}) : super(key: key);

  @override
  _Order_Place createState() => _Order_Place();
}

class _Order_Place extends State<Order_Place> {
  @override
  void initState() {
    super.initState();
    imageCache.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.backgroundColor,
      body: Stack(children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              child: Lottie.asset(
            'assets/images/fullApps/foodMaster/json/Order complete.json',
            height: 200,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StringsRes.OrderPlace,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins",
                    color: ColorsRes.orangeColor),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringsRes.OrderSucess,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins",
                      color: ColorsRes.grayColor),
                )
              ],
            ),
          ),
          ButtonClickAnimation(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(
                      builder: (context) => MainHomePage(
                            from: "pagefrom",
                          )),
                  (Route<dynamic> route) => false);
            },
            child: IntrinsicHeight(
              child: Container(
                height: 67.0,
                padding: EdgeInsets.only(top: 13, bottom: 13),
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                alignment: Alignment.center,
                decoration: DesignConfig.buttonShadowColor(
                    ColorsRes.continueShoppingGradient1Color,
                    37,
                    ColorsRes.continueShoppingGradient2Color),
                child: Text(
                  StringsRes.btnContinueShopping,
                  style: TextStyle(
                      fontSize: 17,
                      color: ColorsRes.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Poppins"),
                ),
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
