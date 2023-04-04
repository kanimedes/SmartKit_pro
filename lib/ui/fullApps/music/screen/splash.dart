import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/logInAndSignUpOptions.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/constanat.dart';


class MusicSplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MusicSplashScreenState();
  }
}

class MusicSplashScreenState extends State<MusicSplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    callNextPage();
  }

  callNextPage() {
    Timer(Duration(seconds: 3), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> LogInOptions()));
    });
    //Navigator.of(context).pushNamed('/signUp');

  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: primary,
        child: Center(
          child: SvgPicture.asset(
            '${imagePath}logo.svg',
            width: MediaQuery.of(context).size.width / 2,
          ),
        ),
      ),
    );
  }
}
