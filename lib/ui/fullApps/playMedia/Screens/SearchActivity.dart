import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/MainActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/SearchHistoryActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class SearchActivity extends StatefulWidget {
  const SearchActivity({Key? key}) : super(key: key);

  @override
  _SearchActivityState createState() => _SearchActivityState();
}

class _SearchActivityState extends State<SearchActivity> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchHistoryActivity(),
              ),
            );
          },
          child: Container(
            decoration:
                DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
            child: Container(
              height: 43,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                enabled: false,
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
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchHistoryActivity(),
                            ),
                          );
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 0, right: 0),
                        child: Icon(Icons.search, color: ColorsRes.textColor),
                      )),
                ),
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainActivity(),
                  ),
                );
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
            SvgPicture.asset(
                "assets/images/fullApps/playMedia/svg/no_result_found.svg",
                color: ColorsRes.yellowColor),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(StringsRes.findYourMovieText,
                  style: TextStyle(
                      fontSize: 20,
                      color: ColorsRes.white,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
