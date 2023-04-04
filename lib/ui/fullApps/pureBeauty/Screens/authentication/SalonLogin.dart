import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/Screens/MainHomePage.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/Screens/authentication/ForgotPassword.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/Screens/authentication/SalonSignup.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

class SalonLogin extends StatefulWidget {
  const SalonLogin({Key? key}) : super(key: key);

  @override
  _SalonLoginState createState() => _SalonLoginState();
}

const exteriorShadow = Color.fromRGBO(209, 207, 205, 1);
const interiorShadow = Color.fromRGBO(224, 221, 217, 1);

class _SalonLoginState extends State<SalonLogin> {
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  bool _obscureText = true;
  bool loginpress = false,
      fbpress = false,
      instapress = false,
      googlepress = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: salonbgcolor,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Don't have an account ? ",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .merge(TextStyle(color: salonlightfont)),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SalonSignup()));
              },
              child: Text(
                "Sign up",
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: salonappcolor,
                    decoration: TextDecoration.underline)),
              ),
            ),
          ]),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: 15, vertical: MediaQuery.of(context).padding.top * 2),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
                child: SvgPicture.asset(
                    "assets/images/fullApps/pureBeauty/svgimg/fulllogo.svg")),
            SizedBox(height: kToolbarHeight),
            Text(
              "Welcome",
              style: Theme.of(context).textTheme.headline4!.merge(
                  TextStyle(color: salonappcolor, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 8),
            Text(
              "Let's get start",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .merge(TextStyle(color: salonlightfont, letterSpacing: 0.5)),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: DesignConfig.newInnerDecoration(15),
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
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              decoration: DesignConfig.newInnerDecoration(15),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                obscureText: _obscureText,
                controller: edtpsw,
                style: TextStyle(color: salonappcolor),
                cursorColor: salonappcolor,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: Theme.of(context).textTheme.subtitle2!.merge(
                        TextStyle(color: salonlightfont, letterSpacing: 0.5)),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ForgotPassword()));
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      color: salonappcolor,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  loginpress = !loginpress;
                });

                Future.delayed(DesignConfig.animationdelay, () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MainHomePage()));
                  setState(() {
                    loginpress = !loginpress;
                  });
                });
              },
              child: AnimatedContainer(
                duration: DesignConfig.animationtime,
                margin: EdgeInsets.only(left: 10, top: 30, bottom: 30),
                decoration: loginpress
                    ? DesignConfig.newInnerDecoration(15)
                    : DesignConfig.outerDecoration(15),
                //decoration: DesignConfig.outerDecoration(15),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 18),
                child: Text(
                  "Sign In",
                  style: Theme.of(context).textTheme.headline5!.merge(TextStyle(
                      color: salonappcolor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5)),
                ),
              ),
            ),
            Row(children: [
              Expanded(
                  child: Divider(
                color: salonappcolor,
                endIndent: 10,
                indent: 10,
                thickness: 1,
              )),
              Text("Or Connect With",
                  style: Theme.of(context).textTheme.subtitle1!.merge(
                        TextStyle(color: salonlightfont, letterSpacing: 0.5),
                      )),
              Expanded(
                  child: Divider(
                color: salonappcolor,
                endIndent: 10,
                indent: 10,
                thickness: 1,
              )),
            ]),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    fbpress = !fbpress;
                  });

                  Future.delayed(DesignConfig.animationdelay, () {
                    setState(() {
                      fbpress = !fbpress;
                    });
                  });
                },
                child: AnimatedContainer(
                  duration: DesignConfig.animationtime,
                  decoration: fbpress
                      ? DesignConfig.newInnerDecorationCircle()
                      : DesignConfig.outerCircularDecorationtest(),
                  //decoration: DesignConfig.outerCircularDecorationtest(),
                  padding: EdgeInsets.all(20),
                  child: SvgPicture.asset(
                      "assets/images/fullApps/pureBeauty/svgimg/facebook.svg"),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    instapress = !instapress;
                  });

                  Future.delayed(DesignConfig.animationdelay, () {
                    setState(() {
                      instapress = !instapress;
                    });
                  });
                },
                child: AnimatedContainer(
                  duration: DesignConfig.animationtime,
                  decoration: instapress
                      ? DesignConfig.newInnerDecorationCircle()
                      : DesignConfig.outerCircularDecorationtest(),
                  // decoration: DesignConfig.outerCircularDecorationtest(),
                  padding: EdgeInsets.all(15),
                  child: SvgPicture.asset(
                      "assets/images/fullApps/pureBeauty/svgimg/instagram.svg"),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      googlepress = !googlepress;
                    });

                    Future.delayed(DesignConfig.animationdelay, () {
                      setState(() {
                        googlepress = !googlepress;
                      });
                    });
                  },
                  child: AnimatedContainer(
                    duration: DesignConfig.animationtime,
                    decoration: googlepress
                        ? DesignConfig.newInnerDecorationCircle()
                        : DesignConfig.outerCircularDecorationtest(),
                    //decoration: DesignConfig.outerCircularDecorationtest(),
                    padding: EdgeInsets.all(15),
                    child: SvgPicture.asset(
                        "assets/images/fullApps/pureBeauty/svgimg/google.svg"),
                  )),
            ]),
          ]),
        ),
      ),
    );
  }
}
