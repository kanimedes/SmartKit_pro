import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/TravelAppSplash.dart';

class TravelAppMain extends StatefulWidget {
  const TravelAppMain({Key? key}) : super(key: key);

  @override
  _TravelAppMainState createState() => _TravelAppMainState();
}

class _TravelAppMainState extends State<TravelAppMain> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travel App",
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
        ),
      ),
      home: TravelAppSplash(),
    );
  }
}
