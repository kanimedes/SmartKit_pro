import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/NoSearchMovieFoundActivity.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class SearchHistoryActivity extends StatefulWidget {
  const SearchHistoryActivity({Key? key}) : super(key: key);

  @override
  _SearchHistoryActivityState createState() => _SearchHistoryActivityState();
}

class _SearchHistoryActivityState extends State<SearchHistoryActivity> {
  List<String> searchHistoryList = [
    StringsRes.actionText,
    StringsRes.dramaText,
    StringsRes.adventureText,
    StringsRes.musicText,
    StringsRes.comedyText,
    StringsRes.horrorText,
    StringsRes.animatedText,
  ];
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  Widget displayHistory() {
    return Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 10,
        runSpacing: 15.0,
        children: List.generate(
            searchHistoryList.length >= 10 ? 10 : searchHistoryList.length,
            (i) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoSearchMovieFoundActivity(),
                      ),
                    );
                  },
                  child: Container(
                      decoration: DesignConfig.boxDecorationBorderButtonColor(
                          ColorsRes.textColor, 50),
                      padding: EdgeInsetsDirectional.only(
                          start: 10, end: 10, top: 10, bottom: 10),
                      child: Text(searchHistoryList[i].trim(),
                          style: TextStyle(
                            height: 1.0,
                            color: ColorsRes.white,
                            fontSize: 16,
                          ))),
                )));
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
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(StringsRes.historyText,
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(
                          "assets/images/fullApps/playMedia/svg/delete.svg",
                          height: 30,
                          width: 30),
                    ),
                  ],
                ),
              ),
              displayHistory(),
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
