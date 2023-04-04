import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/model/Language.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  late List<Language> languagelist;
  TextStyle? settingtextstyle;
  late Language selectedlanguage;
  @override
  void initState() {
    super.initState();
    languagelist = [];
    setLanguageList();
  }

  @override
  Widget build(BuildContext context) {
    settingtextstyle = Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
        fontWeight: FontWeight.bold, color: ColorsRes.black.withOpacity(0.5)));
    return Scaffold(
      appBar:
          DesignConfig.setAppbar(StringsRes.languages) as PreferredSizeWidget?,
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
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: ColorsRes.grey,
          height: 30,
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        itemCount: languagelist.length,
        itemBuilder: (context, index) {
          Language language = languagelist[index];
          return ButtonClickAnimation(
            onTap: () {
              setState(() {
                selectedlanguage = language;
              });
            },
            child: Row(children: [
              Expanded(
                  child: Text(
                language.name!,
                style: settingtextstyle,
              )),
              if (selectedlanguage.id == language.id)
                Icon(
                  Icons.check,
                  color: ColorsRes.blue,
                )
            ]),
          );
        },
      ),
    );
  }

  /*List<Language>*/ setLanguageList() {
    languagelist.add(new Language(id: 1, name: "Gujarati"));
    languagelist.add(new Language(id: 2, name: "English"));
    languagelist.add(new Language(id: 3, name: "Hindi"));
    selectedlanguage = languagelist[0];
  }
}
