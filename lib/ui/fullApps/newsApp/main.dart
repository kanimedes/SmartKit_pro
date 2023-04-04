import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/SplashScreen.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/VideoView/overlay_handler.dart';

class NewsApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _NewsAppState();
  }
}

class _NewsAppState extends State<NewsApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OverlayHandlerProvider>(
      create: (_) => OverlayHandlerProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringsRes.mainappname,
        theme: ThemeData(
          fontFamily: 'MyFont',
          iconTheme: IconThemeData(
            color: ColorsRes.white,
          ),
          accentColor: ColorsRes.appcolor,
          primarySwatch: ColorsRes.appcolor_material,
          primaryTextTheme:
              TextTheme(headline6: TextStyle(color: ColorsRes.appcolor)),
        ),
        home: NewsSplashScreen(),
      ),
    );
  }
}
