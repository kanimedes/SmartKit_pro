import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/Settings/AutoPlayMedia.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/Settings/LanguagePage.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/Settings/StartupMediaPage.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/Settings/TextSizePage.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/VideoView/overlay_handler.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool compactlayout = true;
  bool bgapprefresh = false;
  bool nightmode = false;
  TextStyle? settingtextstyle;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    settingtextstyle = Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
        fontWeight: FontWeight.bold, color: ColorsRes.black.withOpacity(0.5)));

    return Consumer<OverlayHandlerProvider>(
        builder: (context, overlayProvider, _) {
      return Scaffold(
          appBar: DesignConfig.setAppbar(StringsRes.settings)
              as PreferredSizeWidget?,
          body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      StringsRes.compactlayout,
                      style: settingtextstyle,
                    )),
                    CupertinoSwitch(
                      activeColor: ColorsRes.appcolor,
                      value: compactlayout,
                      onChanged: (newValue) =>
                          setState(() => compactlayout = newValue),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  height: 25,
                  color: ColorsRes.grey.withOpacity(0.2),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      StringsRes.bgappref,
                      style: settingtextstyle,
                    )),
                    CupertinoSwitch(
                      activeColor: ColorsRes.appcolor,
                      value: bgapprefresh,
                      onChanged: (newValue) =>
                          setState(() => bgapprefresh = newValue),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  height: 35,
                  color: ColorsRes.grey.withOpacity(0.2),
                ),
                ButtonClickAnimation(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => TextSizePage()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        StringsRes.textsize,
                        style: settingtextstyle,
                      )),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: ColorsRes.grey,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  height: 35,
                  color: ColorsRes.grey.withOpacity(0.2),
                ),
                ButtonClickAnimation(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => LanguagePage()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        StringsRes.languages,
                        style: settingtextstyle,
                      )),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: ColorsRes.grey,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  height: 35,
                  color: ColorsRes.grey.withOpacity(0.2),
                ),
                ButtonClickAnimation(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => AutoPlayMedia()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        StringsRes.autoplaymedia,
                        style: settingtextstyle,
                      )),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: ColorsRes.grey,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  height: 35,
                  color: ColorsRes.grey.withOpacity(0.2),
                ),
                ButtonClickAnimation(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => StartupMediaPage()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        StringsRes.startupscreen,
                        style: settingtextstyle,
                      )),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: ColorsRes.grey,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  height: 25,
                  color: ColorsRes.grey.withOpacity(0.2),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      StringsRes.nightmode,
                      style: settingtextstyle,
                    )),
                    CupertinoSwitch(
                        activeColor: ColorsRes.appcolor,
                        value: nightmode,
                        onChanged: (newValue) {
                          setState(() {
                            nightmode = newValue;
                          });
                        }),
                  ],
                ),
                Divider(
                  thickness: 2,
                  height: 25,
                  color: ColorsRes.grey.withOpacity(0.2),
                ),
                ButtonClickAnimation(
                  onTap: () {},
                  child: Text(
                    StringsRes.termsofservices,
                    style: settingtextstyle,
                  ),
                )
              ]));
    });
  }
}
