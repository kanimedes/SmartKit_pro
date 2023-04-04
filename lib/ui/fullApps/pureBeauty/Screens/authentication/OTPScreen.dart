import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/Screens/MainHomePage.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/Screens/authentication/ChangePassword.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/TextFieldPinNew.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

class OTPScreen extends StatefulWidget {
  bool? isfromsignup;
  OTPScreen({
    Key? key,
    this.isfromsignup,
  }) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool loginpress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: salonbgcolor,
        body: Column(children: [
          Container(
            height: kToolbarHeight,
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            alignment: Alignment.centerLeft,
            child: IconButton(
                icon: Icon(
                  CupertinoIcons.chevron_left,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              children: [
                Text(
                  "OTP Verification",
                  style: Theme.of(context).textTheme.headline4!.merge(TextStyle(
                      color: salonappcolor, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 8),
                Text(
                  "Please type OTP which you received on your mail.",
                  style: Theme.of(context).textTheme.subtitle1!.merge(
                      TextStyle(color: salonlightfont, letterSpacing: 0.5)),
                ),
                SizedBox(height: 40),
                TextFieldPinNew(
                  borderStyeAfterTextChange: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: salonbgcolor, width: 1)),
                  borderStyle: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: salonbgcolor, width: 1)),
                  margin: 20,
                  filled: false,
                  textStyle: Theme.of(context).textTheme.headline4!.merge(
                      TextStyle(
                          fontWeight: FontWeight.bold, color: salonappcolor)),
                  codeLength: 4,
                  boxSize: MediaQuery.of(context).size.width * 0.18,
                  //boxSize: MediaQuery.of(context).size.width * 0.15,
                  onOtpCallback: (code, isAutofill) {
                    // _otp = code;
                  },
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.button!.merge(
                          TextStyle(
                              color: salonlightfont,
                              decoration: TextDecoration.underline)),
                      text: "Resend on",
                      children: <TextSpan>[
                        TextSpan(
                            text: " 00:30",
                            style: TextStyle(color: salonappcolor)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      loginpress = !loginpress;
                    });

                    Future.delayed(DesignConfig.animationdelay, () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => widget.isfromsignup!
                              ? MainHomePage()
                              : ChangePassword()));
                      setState(() {
                        loginpress = !loginpress;
                      });
                    });
                  },
                  child: AnimatedContainer(
                    duration: DesignConfig.animationtime,

                    decoration: loginpress
                        ? DesignConfig.newInnerDecoration(15)
                        : DesignConfig.outerDecoration(15),

                    margin: EdgeInsets.only(left: 10, top: 50),
                    // decoration: DesignConfig.outerDecoration(15),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Text(
                      "Submit",
                      style: Theme.of(context).textTheme.headline5!.merge(
                          TextStyle(
                              color: salonappcolor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
