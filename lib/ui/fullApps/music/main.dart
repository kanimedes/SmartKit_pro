import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/splash.dart';

import 'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Music App",
      theme: ThemeData(
        fontFamily: 'SFPro',
        textTheme: TextTheme(
            headline6: TextStyle(
          color: primary,
          fontWeight: FontWeight.w600,
        )),
      ),
      home: MusicSplashScreen(),
    );
  }
}
