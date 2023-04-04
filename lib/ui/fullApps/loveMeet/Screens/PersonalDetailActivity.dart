import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/RegistrationSuccessfullActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/StringsRes.dart';

class PersonalDetailActivity extends StatefulWidget {
  const PersonalDetailActivity({Key? key}) : super(key: key);

  @override
  _PersonalDetailActivityState createState() => _PersonalDetailActivityState();
}

class _PersonalDetailActivityState extends State<PersonalDetailActivity> {
  String gender = StringsRes.maleText;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: ColorsRes.backgroundColor,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text(
                        StringsRes.identifyYourselfTitleText,
                        style: TextStyle(
                            color: ColorsRes.gradientTwo,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text(
                        StringsRes.identifyYourselfDescriptionText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorsRes.darkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0, top: 25.0),
                        child: Text(
                          StringsRes.iAmaText,
                          style: TextStyle(
                              color: ColorsRes.gradientTwo,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  gender = StringsRes.maleText;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 10, left: 20),
                                padding: EdgeInsets.only(top: 15, bottom: 15),
                                decoration: gender == StringsRes.maleText
                                    ? DesignConfig.boxDecorationButton(
                                        ColorsRes.gradientOne,
                                        ColorsRes.gradientTwo)
                                    : DesignConfig.boxDecorationButton(
                                        ColorsRes.white, ColorsRes.white),
                                child: Text(
                                  StringsRes.maleText,
                                  style: TextStyle(
                                    color: gender == StringsRes.maleText
                                        ? ColorsRes.white
                                        : ColorsRes.darkColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  gender = StringsRes.femaleText;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 20, left: 10),
                                padding: EdgeInsets.only(top: 15, bottom: 15),
                                decoration: gender == StringsRes.femaleText
                                    ? DesignConfig.boxDecorationButton(
                                        ColorsRes.gradientOne,
                                        ColorsRes.gradientTwo)
                                    : DesignConfig.boxDecorationButton(
                                        ColorsRes.white, ColorsRes.white),
                                child: Text(
                                  StringsRes.femaleText,
                                  style: TextStyle(
                                    color: gender == StringsRes.femaleText
                                        ? ColorsRes.white
                                        : ColorsRes.darkColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0, top: 25.0),
                        child: Text(
                          StringsRes.birthdayText,
                          style: TextStyle(
                              color: ColorsRes.gradientTwo,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 5),
                            decoration: DesignConfig.boxDecorationContainer(
                                ColorsRes.white, 10),
                            child: Container(
                              height: 61,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                style: TextStyle(
                                    color: ColorsRes.darkColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                cursorColor: ColorsRes.darkColor,
                                decoration: InputDecoration(
                                  hintText: StringsRes.monthText,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .merge(TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: ColorsRes.darkColor)),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.datetime,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 5),
                            decoration: DesignConfig.boxDecorationContainer(
                                ColorsRes.white, 10),
                            child: Container(
                              height: 61,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                style: TextStyle(
                                    color: ColorsRes.darkColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                cursorColor: ColorsRes.darkColor,
                                decoration: InputDecoration(
                                  hintText: StringsRes.dateText,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .merge(TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: ColorsRes.darkColor)),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.datetime,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(left: 5, right: 20),
                            decoration: DesignConfig.boxDecorationContainer(
                                ColorsRes.white, 10),
                            child: Container(
                              height: 61,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                style: TextStyle(
                                    color: ColorsRes.darkColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                cursorColor: ColorsRes.darkColor,
                                decoration: InputDecoration(
                                  hintText: StringsRes.yearText,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .merge(TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: ColorsRes.darkColor)),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.datetime,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, bottom: 10.0, top: 25.0),
                        child: Text(
                          StringsRes.userNameText,
                          style: TextStyle(
                              color: ColorsRes.gradientTwo,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      decoration: DesignConfig.boxDecorationContainer(
                          ColorsRes.white, 10),
                      child: Container(
                        height: 61,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 10),
                        child: TextFormField(
                          style: TextStyle(
                              color: ColorsRes.darkColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          cursorColor: ColorsRes.darkColor,
                          decoration: InputDecoration(
                            hintText: StringsRes.addYourNameHereText,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .merge(TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: ColorsRes.darkColor)),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    GestureDetector(
                      onTap: () {
                        //Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RegistrationSuccessfullActivity(),
                          ),
                        );
                      },
                      child: Container(
                          decoration: DesignConfig.boxDecorationButton(
                              ColorsRes.gradientOne, ColorsRes.gradientTwo),
                          margin: EdgeInsets.only(right: 20, left: 20),
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          alignment: Alignment.center,
                          child: Text(StringsRes.continueText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: ColorsRes.white,
                              ))),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginActivity(),
      ),
    );
  }
}
