import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/DesignConfig.dart';

class NoInternetScreen extends StatefulWidget {
  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.white,
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
                "assets/images/fullApps/newsapp/svg/no_internet.svg"),
            SizedBox(height: 30),
            Text(
              "No Internet Connection",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                  color: ColorsRes.black, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Text(
              "Your internet connection is currently not available please check or try again",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .merge(TextStyle(color: ColorsRes.grey)),
            ),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 15),
              margin: EdgeInsets.only(top: 25, left: 30, right: 30),
              alignment: Alignment.center,
              decoration: DesignConfig.boxDecorationContainerColor(
                  ColorsRes.appcolor, 20),
              child: Text(
                "Try Again",
                style: TextStyle(
                    color: ColorsRes.white, fontWeight: FontWeight.bold),
              ),
            )
          ]),
    );
  }
}
