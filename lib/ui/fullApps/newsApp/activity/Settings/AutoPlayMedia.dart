import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/StringsRes.dart';

class AutoPlayMedia extends StatefulWidget {
  @override
  _AutoPlayMediaState createState() => _AutoPlayMediaState();
}

class _AutoPlayMediaState extends State<AutoPlayMedia> {
  String autoplayon = StringsRes.never;
  TextStyle? settingtextstyle;

  @override
  Widget build(BuildContext context) {
    settingtextstyle = Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
        fontWeight: FontWeight.bold, color: ColorsRes.black.withOpacity(0.5)));
    return Scaffold(
      appBar: DesignConfig.setAppbar(StringsRes.autoplaymedia)
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
                autoplayon = StringsRes.never;
              });
            },
            child: Row(children: [
              Expanded(
                  child: Text(
                StringsRes.never,
                style: settingtextstyle,
              )),
              if (autoplayon == StringsRes.never)
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
                autoplayon = StringsRes.onlywifi;
              });
            },
            child: Row(children: [
              Expanded(
                  child: Text(
                StringsRes.onlywifi,
                style: settingtextstyle,
              )),
              if (autoplayon == StringsRes.onlywifi)
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
                autoplayon = StringsRes.onlydata;
              });
            },
            child: Row(children: [
              Expanded(
                  child: Text(
                StringsRes.onlydata,
                style: settingtextstyle,
              )),
              if (autoplayon == StringsRes.onlydata)
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
                autoplayon = StringsRes.wifianddata;
              });
            },
            child: Row(children: [
              Expanded(
                  child: Text(
                StringsRes.wifianddata,
                style: settingtextstyle,
              )),
              if (autoplayon == StringsRes.wifianddata)
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
