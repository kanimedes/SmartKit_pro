import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../helper/ColorRes.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import 'doctor_resetPassScreen.dart';

class DoctorOtpVerify extends StatefulWidget {
  final String? type;

  const DoctorOtpVerify({Key? key, this.type}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DoctorOtpVerifyState();
  }
}

class DoctorOtpVerifyState extends State<DoctorOtpVerify> {
  Timer? _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            _start = 60;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: DoctorDesignConfig.appBar(
          context: context,
          isIcon: false,
          size: size,
          title: DoctorStringRes.forgotPass,
          textColor: Colors.black,
          iconColor: ColorRes.blue),

      /*  AppBar(
       backgroundColor: Colors.transparent,
       elevation: 0,
       iconTheme: IconThemeData(color: Colors.blue),
       title: Text(DoctorStringRes.forgotPass,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.black),),
     ),*/
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: size.width * .06,
            right: size.width * .06,
            bottom: size.width * .06),
        child: DoctorDesignConfig.Button(
            onpress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => DoctorResetPassScreen(),
                ),
              );
            },
            name: DoctorStringRes.verify,
            foreground: ColorRes.blue,
            TextColor: ColorRes.white),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              height: size.height * .2,
            ),
            Text(
              "Code has been send to ${widget.type}",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Color(0xff7c7f85)),
            ),
            SizedBox(
              height: size.height * .08,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width * .06, right: size.width * .06),
              child: PinCodeTextField(
                pinTheme: PinTheme(
                  selectedColor: Colors.blue,
                  activeColor: Colors.blue,
                  activeFillColor: Colors.white,
                  inactiveColor: Colors.black12,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  borderWidth: 1,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 60,
                  fieldWidth: 70,
                ),
                cursorColor: Theme.of(context).backgroundColor,
                animationDuration: Duration(milliseconds: 300),
                //backgroundColor:  Theme.of(context).backgroundColor,
                enableActiveFill: true, onChanged: (String value) {}, length: 4,
                appContext: context,
              ),
            ),
            SizedBox(
              height: size.height * .08,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: "Resend code in ",
                      style: TextStyle(
                          color: Color(0xff7c7f85),
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                      text: _start.toString(),
                      style: TextStyle(
                          color: ColorRes.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                  TextSpan(
                      text: " s",
                      style: TextStyle(
                          color: Color(0xff7c7f85),
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
