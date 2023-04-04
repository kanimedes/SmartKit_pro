import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

import 'OTPScreen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController edtemail = TextEditingController();
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
                  "Forgot Password",
                  style: Theme.of(context).textTheme.headline4!.merge(TextStyle(
                      color: salonappcolor, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 8),
                Text(
                  "We'll send OTP on your E-mail Address.",
                  style: Theme.of(context).textTheme.subtitle1!.merge(
                      TextStyle(color: salonlightfont, letterSpacing: 0.5)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 25),
                  alignment: Alignment.centerLeft,
                  decoration: DesignConfig.newInnerDecoration(15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    style: TextStyle(color: salonappcolor),
                    cursorColor: salonappcolor,
                    decoration: InputDecoration(
                      hintText: "Email Address",
                      hintStyle: Theme.of(context).textTheme.subtitle2!.merge(
                          TextStyle(color: salonlightfont, letterSpacing: 0.5)),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: edtemail,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      loginpress = !loginpress;
                    });

                    Future.delayed(DesignConfig.animationdelay, () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OTPScreen(
                                isfromsignup: false,
                              )));
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
                    //decoration: DesignConfig.outerDecoration(15),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Text(
                      "Send OTP",
                      style: Theme.of(context).textTheme.headline6!.merge(
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
