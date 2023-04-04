import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/StringsRes.dart';

class TextSizePage extends StatefulWidget {
  @override
  _TextSizePageState createState() => _TextSizePageState();
}

class _TextSizePageState extends State<TextSizePage> {
  String selectedsize = StringsRes.medium;
  TextStyle? settingtextstyle;
  TextStyle? fonttextstyle;
  bool isfirsttime = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isfirsttime) {
      settingtextstyle = Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorsRes.black.withOpacity(0.5)));

      fonttextstyle = Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorsRes.white,
          height: 1,
          letterSpacing: 0.5));
      isfirsttime = false;
    }

    return Scaffold(
      appBar:
          DesignConfig.setAppbar(StringsRes.textsize) as PreferredSizeWidget?,
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
        child: Column(children: [
          ButtonClickAnimation(
            onTap: () {
              setState(() {
                selectedsize = StringsRes.big;

                fonttextstyle = Theme.of(context).textTheme.headline6!.merge(
                    TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorsRes.white,
                        height: 1.5,
                        letterSpacing: 0.5));
              });
            },
            child: Row(children: [
              Expanded(
                  child: Text(
                StringsRes.big,
                style: settingtextstyle,
              )),
              if (selectedsize == StringsRes.big)
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
                selectedsize = StringsRes.medium;

                fonttextstyle = Theme.of(context).textTheme.subtitle1!.merge(
                    TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorsRes.white,
                        height: 1.5,
                        letterSpacing: 0.5));
              });
            },
            child: Row(children: [
              Expanded(
                  child: Text(
                StringsRes.medium,
                style: settingtextstyle,
              )),
              if (selectedsize == StringsRes.medium)
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
                selectedsize = StringsRes.small;

                fonttextstyle = Theme.of(context).textTheme.caption!.merge(
                    TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorsRes.white,
                        height: 1.5,
                        letterSpacing: 0.5));
              });
            },
            child: Row(children: [
              Expanded(
                  child: Text(
                StringsRes.small,
                style: settingtextstyle,
              )),
              if (selectedsize == StringsRes.small)
                Icon(
                  Icons.check,
                  color: ColorsRes.blue,
                )
            ]),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                  color: ColorsRes.blue,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday.",
                style: fonttextstyle,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
