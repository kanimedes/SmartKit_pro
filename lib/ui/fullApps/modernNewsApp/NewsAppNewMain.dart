import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Color.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Demo_Localization.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Session.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/String.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Theme.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Home.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Splash.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Helper/Constant.dart';
import 'Home.dart';

class NewsAppNewMain extends StatefulWidget {
  const NewsAppNewMain({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _NewsAppNewMainState? state =
        context.findAncestorStateOfType<_NewsAppNewMainState>();
    state?.setLocale(newLocale);
  }

  @override
  _NewsAppNewMainState createState() => _NewsAppNewMainState();
}

class _NewsAppNewMainState extends State<NewsAppNewMain> {
  late SharedPreferences prefs;
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  sharedPreferencesData() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    sharedPreferencesData();
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    if (this._locale == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeNotifier>(create: (BuildContext context) {
            String? theme = prefs.getString(APP_THEME);
            if (theme == DARK) {
              isDark = true;
              prefs.setString(APP_THEME, DARK);
            } else if (theme == LIGHT) {
              isDark = false;
              prefs.setString(APP_THEME, LIGHT);
            }

            if (theme == null || theme == "" || theme == SYSTEM) {
              prefs.setString(APP_THEME, SYSTEM);
              var brightness =
                  SchedulerBinding.instance.window.platformBrightness;
              isDark = brightness == Brightness.dark;

              return ThemeNotifier(ThemeMode.system);
            }
            return ThemeNotifier(
                theme == LIGHT ? ThemeMode.light : ThemeMode.dark);
          }),
        ],
        child: Builder(builder: (context) {
          final themeNotifier = Provider.of<ThemeNotifier>(context);
          return MaterialApp(
            locale: _locale,
            supportedLocales: const [
              Locale("en", "US"),
              Locale("es", "ES"),
              Locale("hi", "IN"),
              Locale("tr", "TR"),
              Locale("pt", "PT"),
            ],
            localizationsDelegates: const [
              DemoLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale!.languageCode &&
                    supportedLocale.countryCode == locale.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            title: appName,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: colors.primary_app,
              primaryColor: colors.primary,
              fontFamily: 'Neue Helvetica',
              canvasColor: colors.bgColor,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              fontFamily: 'Neue Helvetica',
              primarySwatch: colors.primary_app,
              primaryColor: colors.primary,
              brightness: Brightness.dark,
              canvasColor: colors.darkModeColor,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => Splash(),
              '/home': (context) => Home(),
            },
            themeMode: themeNotifier.getThemeMode(),
          );
        }),
      );
    }
  }
}
