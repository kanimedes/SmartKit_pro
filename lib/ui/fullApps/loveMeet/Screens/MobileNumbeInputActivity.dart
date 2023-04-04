import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/OtpCodeActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/StringsRes.dart';

class MobileNumbeInputActivity extends StatefulWidget {
  const MobileNumbeInputActivity({Key? key}) : super(key: key);

  @override
  _MobileNumbeInputActivityState createState() =>
      _MobileNumbeInputActivityState();
}

class _MobileNumbeInputActivityState extends State<MobileNumbeInputActivity> {
  String? countrycode;
  @override
  void initState() {
    super.initState();
  }

  setCountryCode() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.9;
    return CountryCodePicker(
        textStyle: TextStyle(
            color: ColorsRes.darkColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
        showCountryOnly: false,
        showFlag: false,
        searchDecoration: InputDecoration(
          //hintText: CountryCodeLbl,
          hintStyle: TextStyle(
              color: ColorsRes.darkColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        showOnlyCountryWhenClosed: false,
        initialSelection: 'IN',
        dialogSize: Size(width, height),
        alignLeft: true,
        onChanged: (CountryCode countryCode) {
          countrycode = countryCode.toString().replaceFirst("+", "");
        },
        onInit: (code) {
          countrycode = code.toString().replaceFirst("+", "");
        });
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
                      height: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text(
                        StringsRes.whatNumberText,
                        style: TextStyle(
                            color: ColorsRes.gradientTwo,
                            fontWeight: FontWeight.normal,
                            fontSize: 50),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text(
                        StringsRes.otpVerificationText,
                        style: TextStyle(
                            color: ColorsRes.darkColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextFormField(
                              readOnly: true,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  color: ColorsRes.darkColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                focusColor: ColorsRes.gradientTwo,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ColorsRes.gradientTwo, width: 2),
                                ),
                                //hintText: Mobile,
                                prefixIcon: SizedBox(
                                  width: 90,
                                  child: setCountryCode(),
                                ),
                                suffixIcon: Icon(Icons.arrow_drop_down,
                                    color: ColorsRes.darkColor),
                              ),
                              onChanged: (v) => setState(() {}),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 9.0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: ColorsRes.darkColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                  focusColor: ColorsRes.gradientTwo,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ColorsRes.gradientTwo, width: 2),
                                  ),
                                ),
                                onChanged: (v) => setState(() {}),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpCodeActivity(),
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
