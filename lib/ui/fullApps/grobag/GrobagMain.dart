import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagSplash.dart';

class GrobagMain extends StatelessWidget {
  const GrobagMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Grobag",
      theme: ThemeData(
          primarySwatch: primary_app,
          fontFamily: 'HelveticaNeue',
          textTheme: TextTheme(
              headline6: TextStyle(
            color: primary,
          ))),
      debugShowCheckedModeBanner: false,
      home: GrobagSplash(),
    );
  }
}
