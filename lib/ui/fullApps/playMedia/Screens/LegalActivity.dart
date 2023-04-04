import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class LegalActivity extends StatefulWidget {
  const LegalActivity({Key? key}) : super(key: key);

  @override
  _LegalActivityState createState() => _LegalActivityState();
}

class _LegalActivityState extends State<LegalActivity> {
  List<String> legalList = [
    StringsRes.privacyPolicyText,
    StringsRes.termsConditionsText,
  ];
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
          title: Text(StringsRes.legalText,
              style: TextStyle(
                  fontSize: 20,
                  color: ColorsRes.white,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          leading: GestureDetector(
              child: Icon(Icons.arrow_back_ios, color: ColorsRes.white),
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
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: legalList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(legalList[index],
                          style: TextStyle(
                              fontSize: 18,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.normal)),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: ColorsRes.white),
                    );
                  },
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
