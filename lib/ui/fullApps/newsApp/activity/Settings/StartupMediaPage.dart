import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/StringsRes.dart';

class StartupMediaPage extends StatefulWidget {
  @override
  _StartupMediaPageState createState() => _StartupMediaPageState();
}

class _StartupMediaPageState extends State<StartupMediaPage> {
  String startupmedia = StringsRes.latestview;
  TextStyle? settingtextstyle;

  @override
  Widget build(BuildContext context) {
    settingtextstyle = Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
        fontWeight: FontWeight.bold, color: ColorsRes.black.withOpacity(0.5)));
    return Scaffold(
      appBar: DesignConfig.setAppbar(StringsRes.startupscreen)
          as PreferredSizeWidget?,
      bottomNavigationBar: IntrinsicHeight(
          child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration:
            DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor, 10),
        child: Text(
          StringsRes.lblsave,
          style: Theme.of(context).textTheme.subtitle1!.merge(
              TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
        ),
      )),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: ListView(children: [
          ButtonClickAnimation(
            onTap: () {
              setState(() {
                startupmedia = StringsRes.latestview;
              });
            },
            child: Row(children: [
              Expanded(
                  child: Text(
                StringsRes.latestview,
                style: settingtextstyle,
              )),
              if (startupmedia == StringsRes.latestview)
                Icon(
                  Icons.check,
                  color: ColorsRes.blue,
                )
            ]),
          ),
          Divider(
            color: ColorsRes.grey,
            height: 30,
          ),
          ButtonClickAnimation(
            onTap: () {
              setState(() {
                startupmedia = StringsRes.topstories;
              });
            },
            child: Row(children: [
              Expanded(
                  child: Text(
                StringsRes.topstories,
                style: settingtextstyle,
              )),
              if (startupmedia == StringsRes.topstories)
                Icon(
                  Icons.check,
                  color: ColorsRes.blue,
                )
            ]),
          ),
        ]),
      ),
    );
  }
}
