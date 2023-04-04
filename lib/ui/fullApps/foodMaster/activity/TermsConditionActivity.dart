import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';

class TermsConditionActivity extends StatelessWidget {
  const TermsConditionActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        appBar: DesignConfig.setAppbar("Terms and Conditions", context),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Container(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                      "Last update: 11/01/2018\n\nPlease read these terms of service, carefully before using our website operated by us.\n\n1. Conditions of Use\n\nWe will provide their services to you, which are subject to the conditions stated below in this document. Every time you visit this website, use its services or make a purchase, you accept the following conditions. This is why we urge you to read them carefully.\n\n2. Privacy Policy\n\nBefore you continue using our website we advise you to read our privacy policy regarding our user data collection. It will help you better understand our practices.\n\n3. CopyrightContent\n\n published on this website is the property of SmartKit Pro and/or its content creators and protected by international"),
                )),
          ),
        ));
  }
}

class TermsConditionPage extends StatefulWidget {
  const TermsConditionPage({Key? key}) : super(key: key);

  @override
  TermsData createState() {
    return TermsData();
  }
}

class TermsData extends State<TermsConditionPage> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Terms and Conditions"),
    );
  }
}
