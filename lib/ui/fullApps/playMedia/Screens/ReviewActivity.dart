import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ratingWidget.dart';

class ReviewActivity extends StatefulWidget {
  const ReviewActivity({Key? key}) : super(key: key);

  @override
  _ReviewActivityState createState() => _ReviewActivityState();
}

class _ReviewActivityState extends State<ReviewActivity> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return navigationPage() as Future<bool>;
      },
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          title: Text(StringsRes.writeReviewText,
              style: TextStyle(
                  fontSize: 20,
                  color: ColorsRes.white,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: GestureDetector(
              child: Icon(Icons.arrow_back_ios, color: ColorsRes.white),
              onTap: () {
                Navigator.pop(context);
              }),
          backgroundColor: ColorsRes.backgroundColor,
          shadowColor: Colors.transparent,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorsRes.backgroundColor,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Divider(),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                  StringsRes.yourReviewWillBePostedPubliclyText,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: ColorsRes.white,
                                      fontWeight: FontWeight.normal)),
                            )),
                        FlutterRatingBar(
                          initialRating: 3,
                          fillColor: ColorsRes.white,
                          borderColor: ColorsRes.white.withAlpha(50),
                          allowHalfRating: true,
                          onRatingUpdate: (rating) {},
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            decoration: DesignConfig.boxDecorationContainer(
                                ColorsRes.white.withAlpha(50), 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: ColorsRes.white,
                                      fontWeight: FontWeight.normal),
                                  border: InputBorder.none,
                                  filled: true,
                                  hintText: StringsRes.typeSomethingHereText),
                              keyboardType: TextInputType.multiline,
                              maxLines: 10,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              //Navigator.pop(context);
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 20.0, right: 20.0),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            decoration: DesignConfig.boxDecorationButtonColor(
                                ColorsRes.yellowColor,
                                ColorsRes.yellowColor,
                                10),
                            child: Text(
                              StringsRes.submitText,
                              style: TextStyle(
                                color: ColorsRes.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
