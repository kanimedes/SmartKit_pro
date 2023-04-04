import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/DatingAppSplash.dart';

class DatingAppMain extends StatelessWidget {
  const DatingAppMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dating App",
      theme: ThemeData(
        fontFamily: "datingappfont",
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
        ),
      ),
      home: DatingAppSplash(),
    );
  }
}
