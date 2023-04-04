import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';

import '../Widget/AppBar.dart';
import 'GoRideUpdatePwd.dart';

class GoRideOtpScreen extends StatefulWidget {
  const GoRideOtpScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideOtpScreenState();
  }
}

class GoRideOtpScreenState extends State<GoRideOtpScreen> {
  //TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GoRideColors.yellow,
        resizeToAvoidBottomInset: false,
        //"forgot_password.svg"
        appBar: PreferredSize(
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * .24,
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
              SizedBox(
                height: MediaQuery.of(context).size.height * .06,
              ),
              otpEnter(),
              SizedBox(
                height: 10,
              ),
              verifyCodeBtn()
            ])));
  }

  Widget welcomeText() {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .1,
            top: MediaQuery.of(context).size.height * .07),
        child: Text(
          GoRideStringRes.resetCode,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
        ));
  }

  Widget welcomeSubText() {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .1,
        ),
        child: Text(
          GoRideStringRes.resetCodeSub,
          style: TextStyle(fontSize: 14, color: Color(0xffa2a2a2)),
        ));
  }

  Widget otpEnter() {
    return Padding(
        padding: EdgeInsetsDirectional.only(
          start: MediaQuery.of(context).size.width * .12,
          end: MediaQuery.of(context).size.width * .12,
        ),
        child: PinCodeTextField(
          length: 4,
          obscureText: false, cursorColor: Color(0xff707070),
          animationType: AnimationType.fade,
          textStyle: TextStyle(fontWeight: FontWeight.normal),
          keyboardType: TextInputType.number,
          //You can change here colors
          pinTheme: PinTheme(
            inactiveFillColor: Colors.white,
            errorBorderColor: Colors.black,
            activeColor: Colors.black,
            selectedColor: Colors.black,
            inactiveColor: Color(0xff707070),
            disabledColor: GoRideColors.white,
            selectedFillColor: GoRideColors.white,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 40,
            fieldWidth: 60,
            activeFillColor: Colors.white,
          ),
          //  mainAxisAlignment: MainAxisAlignment.center,
          animationDuration: Duration(milliseconds: 300),
          enableActiveFill: true,
          // controller: textEditingController,

          onChanged: (value) {
            print(value);
          },
          appContext: context,
        ));
  }

  Widget verifyCodeBtn() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => GoRideUpdatePwd(),
            ),
          );
        },
        child: Text(
          GoRideStringRes.verifyCode,
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
