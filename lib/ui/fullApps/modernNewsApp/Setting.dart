// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Color.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Session.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Login.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/ManagePref.dart';
import 'package:provider/provider.dart';
import 'Helper/String.dart';
import 'Helper/Theme.dart';
import 'Privacy.dart';
import 'NewsAppNewMain.dart';

class Setting extends StatefulWidget {
  @override
  SettingState createState() => SettingState();
}

class SettingState extends State<Setting> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ThemeNotifier? themeNotifier;
  String? theme;
  int? selectedIndex;
  List<String> languageList = [eng_lbl, span_lbl, hin_lbl, turk_lbl, port_lbl];

  List<String> langCode = ["en", "es", "hi", "tr", "pt"];

  int? selectLan;

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _updateState(int position) {
    setState(() {
      selectedIndex = position;
    });
    onThemeChanged(position);
  }

  Future<void> getUserDetails() async {
    getLocale().then((locale) {
      selectLan = langCode.indexOf(locale.languageCode);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[_showContent()],
      ),
    );
  }

  //show header and drawer data shown
  _showContent() {
    return SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(
            start: 15.0, end: 15.0, top: 45.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            setHeader(),
            setBottomContent(),
          ],
        ));
  }

  void _changeLan(String language) async {
    Locale _locale = await setLocale(language);

    NewsAppNewMain.setLocale(context, _locale);
  }

  List<Widget> getLngList() {
    return languageList
        .asMap()
        .map(
          (index, element) => MapEntry(
              index,
              InkWell(
                onTap: () {
                  setState(() {
                    selectLan = index;
                    _changeLan(langCode[index]);
                  });
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 25.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectLan == index
                                    ? colors.primary
                                    : colors.tempboxColor,
                                border: Border.all(color: colors.primary)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: selectLan == index
                                  ? Icon(
                                      Icons.check,
                                      size: 17.0,
                                      color: colors.tempboxColor,
                                    )
                                  : Icon(
                                      Icons.check_box_outline_blank,
                                      size: 15.0,
                                      color: colors.tempboxColor,
                                    ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                left: 15.0,
                              ),
                              child: Text(
                                languageList[index],
                                style: Theme.of(this.context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .fontColor),
                              ))
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ),
              )),
        )
        .values
        .toList();
  }

  languageDialog() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setStater) {
            return AlertDialog(
              contentPadding: const EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 0, 2.0),
                      child: Text(
                        getTranslated(context, 'choose_lan_lbl')!,
                        style: Theme.of(this.context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.fontColor),
                      )),
                  Divider(),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: getLngList()),
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                new TextButton(
                    child: Text(
                      getTranslated(context, 'save_lbl')!,
                      style: Theme.of(this.context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(
                              color: Theme.of(context).colorScheme.fontColor,
                              fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            );
          });
        });
  }

  //set snackbar msg
  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).colorScheme.fontColor),
      ),
      backgroundColor: isDark! ? colors.tempdarkColor : colors.bgColor,
      elevation: 1.0,
    ));
  }

  setHeader() {
    double width = MediaQuery.of(context).size.width;
    return Stack(children: <Widget>[
      Container(
        height: 340,
        width: width,
        decoration: BoxDecoration(
            color: !isDark! ? colors.primary : colors.tempdarkColor,
            borderRadius: BorderRadius.circular(20)),
      ),
      Positioned.directional(
          textDirection: Directionality.of(context),
          end: 13,
          top: 10,
          height: 35,
          width: 35,
          child: InkWell(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(35.0),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          color: colors.tempboxColor),
                      child: Icon(
                        Icons.login_sharp,
                        color: colors.darkColor1,
                        size: 22,
                      ),
                    ))),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          )),
      Positioned.directional(
          textDirection: Directionality.of(context),
          bottom: 12.0,
          start: 12,
          end: 12,
          height: 136,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(25.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: colors.tempboxColor.withOpacity(0.94),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "WrTeam",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                    color: colors.tempdarkColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 13.0),
                              child: Text(
                                "+91 1234567890",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(
                                      color: colors.tempdarkColor,
                                    ),
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 13.0),
                            child: Text(
                              "wrteam@gmail.com",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  ?.copyWith(
                                    color: colors.tempdarkColor,
                                  ),
                            ),
                          ),
                        ],
                      ))))),
      Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: Center(
            child: Icon(
              Icons.person_outline,
              size: 160.0,
              color: colors.tempboxColor,
            ),
          ))
    ]);
  }

  void onThemeChanged(int value) async {
    if (value == 1) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      themeNotifier!.setThemeMode(ThemeMode.light);
      setState(() {
        isDark = false;
      });
      setPrefrence(APP_THEME, LIGHT);
    } else if (value == 2) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
      themeNotifier!.setThemeMode(ThemeMode.dark);
      setState(() {
        isDark = true;
      });
      setPrefrence(APP_THEME, DARK);
    }
    theme = await getPrefrence(APP_THEME);
  }

  setBottomContent() {
    themeNotifier = Provider.of<ThemeNotifier>(context);
    return Padding(
        padding: EdgeInsets.only(top: 20.0, bottom: 80.0),
        child: Container(
            padding: EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Theme.of(context).colorScheme.boxColor),
            child: ListView(
              padding: EdgeInsetsDirectional.only(top: 10.0),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                setDrawerItem(
                  getTranslated(context, 'darkmode_lbl')!,
                  "assets/images/fullApps/modernNews/svg/darkmode_icon.svg",
                ),
                setDrawerItem(
                  getTranslated(context, 'notification_lbl')!,
                  "",
                ),
                setDrawerItem(
                  getTranslated(context, 'change_lang')!,
                  "assets/images/fullApps/modernNews/svg/language_icon.svg",
                ),
                setDrawerItem(
                  getTranslated(context, 'manage_prefrences')!,
                  "assets/images/fullApps/modernNews/svg/preferences_icon.svg",
                ),
                setDrawerItem(
                  getTranslated(context, 'contact_us')!,
                  "assets/images/fullApps/modernNews/svg/contactus_icon.svg",
                ),
                setDrawerItem(
                  getTranslated(context, 'about_us')!,
                  "assets/images/fullApps/modernNews/svg/about_us.svg",
                ),
                setDrawerItem(
                  getTranslated(context, 'term_cond')!,
                  "assets/images/fullApps/modernNews/svg/termscond_icon.svg",
                ),
                setDrawerItem(
                  getTranslated(context, 'rate_us')!,
                  "assets/images/fullApps/modernNews/svg/rateus_icon.svg",
                ),
                setDrawerItem(
                  getTranslated(context, 'privacy_policy')!,
                  "assets/images/fullApps/modernNews/svg/privacypolicy_icon.svg",
                ),
                setDrawerItem(
                  getTranslated(context, 'share_app')!,
                  "assets/images/fullApps/modernNews/svg/share_app.svg",
                ),
                setDrawerItem(
                  getTranslated(context, 'logout_lbl')!,
                  "assets/images/fullApps/modernNews/svg/logout_icon.svg",
                ),
              ],
            )));
  }

  //set drawer item list press
  setDrawerItem(String title, String img) {
    return ListTile(
      dense: true,
      leading: img != ""
          ? SvgPicture.asset(
              img,
              height: 20,
              width: 20,
              color: Theme.of(context).colorScheme.darkColor,
            )
          : Icon(
              Icons.notifications,
              size: 20,
              color: Theme.of(context).colorScheme.darkColor,
            ),
      trailing: title == getTranslated(context, 'darkmode_lbl')! ||
              title == getTranslated(context, 'notification_lbl')!
          ? title == getTranslated(context, 'darkmode_lbl')!
              ? isDark!
                  ? Icon(
                      Icons.toggle_on_outlined,
                      size: 25,
                      color: Theme.of(context).colorScheme.darkColor,
                    )
                  : Icon(
                      Icons.toggle_off_sharp,
                      size: 25,
                      color: Theme.of(context).colorScheme.darkColor,
                    )
              : Icon(
                  Icons.toggle_on_outlined,
                  size: 25,
                  color: colors.primary,
                )
          : null,
      title: Text(title,
          textScaleFactor: 1.07,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: Theme.of(context).colorScheme.darkColor)),
      onTap: () async {
        if (title == getTranslated(context, 'darkmode_lbl')!) {
          if (isDark!) {
            _updateState(1);
          } else {
            _updateState(2);
          }
        } else if (title == getTranslated(context, 'notification_lbl')!) {
        } else if (title == getTranslated(context, 'change_lang')!) {
          languageDialog();
        } else if (title == getTranslated(context, 'manage_prefrences')!) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ManagePref(
                        from: 1,
                      )));
        } else if (title == getTranslated(context, 'contact_us')!) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => PrivacyPolicy(
                        title: getTranslated(context, 'contact_us')!,
                        from: "home",
                      )));
        } else if (title == getTranslated(context, 'about_us')!) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => PrivacyPolicy(
                        title: getTranslated(context, 'about_us')!,
                        from: "home",
                      )));
        } else if (title == getTranslated(context, 'term_cond')!) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => PrivacyPolicy(
                        title: getTranslated(context, 'term_cond')!,
                        from: "home",
                      )));
        } else if (title == getTranslated(context, 'rate_us')!) {
        } else if (title == getTranslated(context, 'privacy_policy')!) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => PrivacyPolicy(
                        title: getTranslated(context, 'privacy_policy')!,
                        from: "home",
                      )));
        } else if (title == getTranslated(context, 'share_app')!) {
          var str =
              "$appName\n\n$APPFIND$androidLink$packageName\n\n $IOSLBL\n$iosLink\t$iosPackage";
        } else if (title == getTranslated(context, 'logout_lbl')!) {
          logOut();
        }
      },
    );
  }

  //set logout dialogue
  logOut() async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }
}
