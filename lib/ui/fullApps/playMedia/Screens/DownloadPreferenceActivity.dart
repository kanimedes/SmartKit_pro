import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DownloadPreferenceActivity extends StatefulWidget {
  const DownloadPreferenceActivity({Key? key}) : super(key: key);

  @override
  _DownloadPreferenceActivityState createState() =>
      _DownloadPreferenceActivityState();
}

class _DownloadPreferenceActivityState
    extends State<DownloadPreferenceActivity> {
  List<String> moreList = [
    StringsRes.downloadOnWifiOnlyText,
    StringsRes.videoDownloadQualityText,
    StringsRes.deleteAllDownloadsText,
  ];
  bool isSwitched = false;
  var textValue = 'OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'ON';
      });
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'OFF';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return navigationPage() as Future<bool>;
      },
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          title: Text(StringsRes.downloadPreferencesText,
              style: TextStyle(
                  fontSize: 20,
                  color: ColorsRes.white,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: GestureDetector(
              child: Icon(
                Icons.arrow_back_ios,
                color: ColorsRes.white,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
          backgroundColor: ColorsRes.backgroundColor,
          shadowColor: Colors.transparent,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorsRes.backgroundColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: moreList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(moreList[index],
                          style: TextStyle(
                              fontSize: 18,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.normal)),
                      trailing:
                          moreList[index] == StringsRes.downloadOnWifiOnlyText
                              ? Switch(
                                  onChanged: toggleSwitch,
                                  value: isSwitched,
                                  activeColor: ColorsRes.yellowColor,
                                  activeTrackColor: ColorsRes.yellowColor,
                                  inactiveThumbColor: ColorsRes.white,
                                  inactiveTrackColor: ColorsRes.white,
                                )
                              : moreList[index] ==
                                      StringsRes.videoDownloadQualityText
                                  ? Icon(Icons.arrow_forward_ios,
                                      color: ColorsRes.white)
                                  : moreList[index] ==
                                          StringsRes.deleteAllDownloadsText
                                      ? SvgPicture.asset(
                                          "assets/images/fullApps/playMedia/svg/delete.svg",
                                          color: ColorsRes.white,
                                          width: 20,
                                          height: 20,
                                        )
                                      : "" as Widget?,
                    );
                  },
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(StringsRes.storageText,
                          style: TextStyle(
                              fontSize: 15,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.normal)),
                    )),
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width,
                  lineHeight: 8.0,
                  percent: 0.4,
                  progressColor: Colors.red,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("5GB used",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsRes.white,
                                  fontWeight: FontWeight.normal)),
                        )),
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("16GB free",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsRes.white,
                                  fontWeight: FontWeight.normal)),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
