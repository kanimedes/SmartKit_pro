// ignore_for_file: unnecessary_import, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';

import '../Widget/AppBar.dart';
import 'GoRideOtpScreen.dart';

class GoRideForgotPass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GoRideForgotPassState();
  }
}

class GoRideForgotPassState extends State<GoRideForgotPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GoRideColors.yellow,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * .22,
            ),
            child: AppbarImageDesign(
              image: 'forgot_password.svg',
              bottomPadding: 0,
              showBackBtn: true,
              onPress: () {
                Navigator.pop(context);
              },
            )),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: GoRideConstant.boxDecorationContainer(
                GoRideColors.white, false),
            child: Column(children: [
              welcomeText(),
              welcomeSubText(),
              emailEnter(),
              SizedBox(
                height: 20,
              ),
              resetPwdBtn()
            ])));
  }

  Widget welcomeText() {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .1,
            top: MediaQuery.of(context).size.height * .08),
        child: Text(
          GoRideStringRes.forgotPwd,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
        ));
  }

  Widget welcomeSubText() {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .1,
            right: MediaQuery.of(context).size.width * .05),
        child: Text(
          GoRideStringRes.resetPwd,
          style: TextStyle(fontSize: 14, color: Color(0xffa2a2a2)),
        ));
  }

  Widget emailEnter() {
    return Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .02,
          top: MediaQuery.of(context).size.height * .02,
          right: MediaQuery.of(context).size.width * .04,
        ),
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .1,
          top: MediaQuery.of(context).size.height * .02,
          right: MediaQuery.of(context).size.width * .08,
        ),
        child: TextFormField(
          cursorColor: Color(0xffa2a2a2),
          decoration: InputDecoration(
            prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.email_outlined,
                  color: Color(0xff212121).withOpacity(0.7),
                )),
            hintText: GoRideStringRes.hintEmail,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff707070)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff707070)),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
        ));
  }

  Widget resetPwdBtn() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => GoRideOtpScreen(),
            ),
          );
        },
        child: Text(
          GoRideStringRes.resetBtn,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: GoRideColors.white,
              fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(310, 50),
          shadowColor: Color(0x33212121),
          elevation: 6,
          primary: GoRideColors.black,
        ),
      ),
    );
  }
}
