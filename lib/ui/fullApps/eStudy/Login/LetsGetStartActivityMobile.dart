// ignore_for_file: avoid_unnecessary_containers

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Login/VerificationActivityMobile.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/StringsRes.dart';

class LetsGetStartActivityMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LetsGetStartActivityMobileState();
  }
}

class LetsGetStartActivityMobileState
    extends State<LetsGetStartActivityMobile> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.bgPage,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: ColorsRes.appcolor,
        ),
        title: Text(
          StringsRes.Lets_Get_Started_lb,
          style: TextStyle(color: ColorsRes.introTitlecolor, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 25),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  StringsRes.Enter_Mobile_Number_lb,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Nunito-Regular',
                      fontSize: 24,
                      color: ColorsRes.introMessagecolor),
                )),
            SizedBox(height: 35),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration:
                  DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
              child: Container(
                  height: 61,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: CountryCodePicker(
                              showCountryOnly: false,
                              boxDecoration:
                                  BoxDecoration(color: ColorsRes.white),
                              searchDecoration: InputDecoration(
                                hintText: "getTranslated(context,countrylb)",
                                hintStyle: TextStyle(color: ColorsRes.black),
                                fillColor: ColorsRes.black,
                              ),
                              showOnlyCountryWhenClosed: false,
                              initialSelection: 'IN',
                              flagWidth: 20,
                              dialogSize: Size(
                                  MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height),
                              alignLeft: true,
                              textStyle: TextStyle(
                                  color: ColorsRes.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                              onChanged: (CountryCode countryCode) {},
                              onInit: (code) {})),
                      Expanded(
                          flex: 3,
                          child: TextFormField(
                            style: TextStyle(color: ColorsRes.black),
                            cursorColor: ColorsRes.black,
                            decoration: InputDecoration(
                              hintText: StringsRes.Mobile_Number_lb,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .merge(TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: ColorsRes.introMessagecolor)),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.phone,
                          )),
                    ],
                  )),
            ),
            SizedBox(height: MediaQuery.of(context).size.width / 10),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => VerificationActivityMobile()));
                },
                child: Container(
                    padding: EdgeInsets.only(left: 65),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    alignment: Alignment.center,
                    height: 65,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: const [
                            ColorsRes.secondgradientcolor,
                            ColorsRes.firstgradientcolor,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringsRes.Continue_Button_lb,
                            style:
                                TextStyle(color: ColorsRes.white, fontSize: 20),
                          ),
                          SizedBox(width: 65),
                          Align(
                              alignment: Alignment.center,
                              child: SvgPicture.asset(
                                  "assets/images/fullApps/eStudy/continue.svg"))
                        ]))),
          ],
        ),
      ),
    );
  }
}
