import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Screens/MovieAppSplash.dart';

class MovieAppMain extends StatefulWidget {
  const MovieAppMain({Key? key}) : super(key: key);

  @override
  _MovieAppMainState createState() => _MovieAppMainState();
}

class _MovieAppMainState extends State<MovieAppMain> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movie App",
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
        ),
      ),
      home: MovieAppSplash(),
    );
  }
}
