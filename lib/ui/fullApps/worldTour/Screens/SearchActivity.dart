import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBoxFull.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/StringsRes.dart';

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
      extendBody: true,
      body: GlassBoxFull(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 30.0, left: 20.0, right: 20.0, bottom: 20.0),
          child: TextFormField(
            enabled: true,
            style: TextStyle(color: ColorsRes.bottomColor),
            cursorColor: ColorsRes.bottomColor,
            decoration: InputDecoration(
              focusColor: ColorsRes.iconColor,
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorsRes.iconColor, width: 2)),
              hintText: StringsRes.searchForText,
              hintStyle: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20.0,
                  color: ColorsRes.bottomColor)),
              //border: InputBorder.none,
              prefixIcon: GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 0, bottom: 0, right: 0),
                    child: Icon(Icons.search, color: ColorsRes.bottomColor),
                  )),
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
