import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Login/CreateNewAccountActivityMobile.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Login/CreateNewPasswordActivityMobile.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/activity/HomeActivityMobile.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/StringsRes.dart';

class LoginActivityMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginActivityMobileState();
  }
}

class LoginActivityMobileState extends State<LoginActivityMobile> {
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
    return new Scaffold(
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
          StringsRes.Login_lb,
          style: TextStyle(color: ColorsRes.introTitlecolor, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 25),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                StringsRes.Login_Detail_Title_lb,
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
              child: Column(children: [
                Container(
                  height: 61,
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    style: TextStyle(color: ColorsRes.black),
                    cursorColor: ColorsRes.black,
                    decoration: InputDecoration(
                      hintText: StringsRes.Email_lb,
                      hintStyle: Theme.of(context).textTheme.subtitle2!.merge(
                          TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: ColorsRes.introMessagecolor)),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Divider(
                  height: 0.0,
                  thickness: 2,
                ),
                Container(
                  height: 61,
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    style: TextStyle(color: ColorsRes.black),
                    cursorColor: ColorsRes.black,
                    decoration: InputDecoration(
                      hintText: StringsRes.Password_lb,
                      hintStyle: Theme.of(context).textTheme.subtitle2!.merge(
                          TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: ColorsRes.introMessagecolor)),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Divider(
                  height: 0.0,
                  thickness: 2,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  CreateNewPasswordActivityMobile()));
                    },
                    child: Container(
                        margin: EdgeInsets.only(right: 20),
                        height: 61,
                        alignment: Alignment.centerRight,
                        child: Text(StringsRes.Forgot_lb,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18,
                                color: ColorsRes.introMessagecolor))))
              ])),
          SizedBox(height: 43),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => HomeActivityMobile()));
              },
              child: Container(
                  padding: EdgeInsets.only(left: 65),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.center,
                  height: 65,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: const [
                      ColorsRes.secondgradientcolor,
                      ColorsRes.firstgradientcolor,
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
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
          SizedBox(
            height: MediaQuery.of(context).size.width / 20,
          ),
          Container(
              margin: EdgeInsets.only(right: 20),
              alignment: Alignment.center,
              child: Text("Don't have Account ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18, color: ColorsRes.introMessagecolor))),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CreateNewAccountActivityMobile()));
            },
            child: Container(
                margin: EdgeInsets.only(right: 20),
                alignment: Alignment.center,
                child: Text("Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorsRes.appcolor,
                    ))),
          )
        ],
      ),
    );
  }
}
