import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Login/LoginActivityMobile.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/StringsRes.dart';

class CreateNewPasswordActivityMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CreateNewPasswordActivityMobileState();
  }
}

class CreateNewPasswordActivityMobileState
    extends State<CreateNewPasswordActivityMobile> {
  bool _conobscureText = true;
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
          StringsRes.Create_Password_Title_lb,
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
            child: Container(
              height: 61,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10),
              child: TextFormField(
                obscureText: _conobscureText,
                obscuringCharacter: "*",
                style: TextStyle(color: ColorsRes.black),
                cursorColor: ColorsRes.black,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  hintText: StringsRes.Password_lb,
                  hintStyle: Theme.of(context).textTheme.subtitle2!.merge(
                      TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: ColorsRes.introMessagecolor)),
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _conobscureText = !_conobscureText;
                      });
                    },
                    child: Padding(
                        padding:
                            EdgeInsets.only(top: 20, bottom: 20, right: 10),
                        child: Text(
                          _conobscureText
                              ? StringsRes.Show_lb
                              : StringsRes.Hide_lb,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorsRes.introMessagecolor,
                            fontSize: 18,
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 69),
          TextButton(
              onPressed: () {},
              child: Text(
                StringsRes.Already_Have_Account_lb,
                style:
                    TextStyle(color: ColorsRes.introMessagecolor, fontSize: 20),
              )),
          SizedBox(height: 12),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => LoginActivityMobile()));
              },
              child: Text(
                StringsRes.Sign_In_lb,
                style: TextStyle(color: ColorsRes.appcolor, fontSize: 20),
              )),
          SizedBox(height: 43),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => LoginActivityMobile()));
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
        ],
      ),
    );
  }
}
