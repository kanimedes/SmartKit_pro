import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class NoSearchMovieFoundActivity extends StatefulWidget {
  const NoSearchMovieFoundActivity({Key? key}) : super(key: key);

  @override
  _NoSearchMovieFoundActivityState createState() =>
      _NoSearchMovieFoundActivityState();
}

class _NoSearchMovieFoundActivityState
    extends State<NoSearchMovieFoundActivity> {
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
          automaticallyImplyLeading: false,
          title: Container(
            decoration:
                DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
            child: Container(
              height: 43,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                style: TextStyle(color: ColorsRes.backgroundColor),
                cursorColor: ColorsRes.backgroundColor,
                decoration: InputDecoration(
                  hintText: StringsRes.searchText,
                  hintStyle: Theme.of(context).textTheme.subtitle2!.merge(
                      TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: ColorsRes.textColor)),
                  border: InputBorder.none,
                  prefixIcon: GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 0, right: 0),
                        child: Icon(Icons.search, color: ColorsRes.textColor),
                      )),
                ),
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Center(
                      child: Text(StringsRes.cancelText,
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorsRes.yellowColor,
                              fontWeight: FontWeight.normal))),
                ),
                onTap: () {
                  Navigator.pop(context);
                })
          ],
          backgroundColor: ColorsRes.backgroundColor,
          shadowColor: Colors.transparent,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorsRes.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                child: SvgPicture.asset(
                    "assets/images/fullApps/playMedia/svg/no_result_found.svg"),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(StringsRes.noResultFoundText,
                        style: TextStyle(
                            fontSize: 20,
                            color: ColorsRes.white,
                            fontWeight: FontWeight.bold)),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
