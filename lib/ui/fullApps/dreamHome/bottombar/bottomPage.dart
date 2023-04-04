import 'package:flutter/material.dart';

import '../screens/dHomeFavorite.dart';
import '../screens/dHomeHomeScreen.dart';
import '../screens/dHomeMessage.dart';
import '../screens/dHomeSetting.dart';
import 'bottomAppBar.dart';

class BottomPage extends StatelessWidget {
  static List<Widget> defaultPages = [
    Container(),
    const DHomeHomeScreen(),
    const DHomeFavorite(),
    const DHomeMessage(),
    const DHomeSetting(),
  ];

  final Widget body;
  final int from, to;
  const BottomPage(
      {required this.from, required this.to, required this.body, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HeartBeatAppBar(
        from: from,
        to: to,
      ),
      extendBody: true,
      body: body,
    );
  }
}
