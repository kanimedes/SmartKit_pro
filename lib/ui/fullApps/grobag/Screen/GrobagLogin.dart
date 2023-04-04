import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagEmailLogin.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagHome.dart';

import 'GrobagSignup.dart';

class GrobagLogin extends StatefulWidget {
  const GrobagLogin({Key? key}) : super(key: key);

  @override
  _GrobagLoginState createState() => _GrobagLoginState();
}

class _GrobagLoginState extends State<GrobagLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Column(
        children: [
          Expanded(
            child: SvgPicture.asset(
              'assets/images/fullApps/grobag/splashlogo.svg',
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                  child: Text(
                    "Welcome",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: fontColor),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, bottom: 10, right: 20),
                  child: Text(
                    "If you are already have Grobag account, then you can signin from below options",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: fontLight),
                  ),
                ),
                signupbtn(),
                applebtn(),
                googlebtn(),
                signup(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  signup() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account? ",
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GrobagSignup(),
                ));
              },
              child: Text(
                'Signup Here',
                style: Theme.of(context).textTheme.caption!.copyWith(
                    color: primary,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.normal),
              ))
        ],
      ),
    );
  }

  signupbtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 0)
          ],
        ),
        child: Center(
          child: Text("Continue with email",
              style: TextStyle(
                color: white,
              )),
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => GrobagEmailLogin()));
      },
    );
  }

  googlebtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 48,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 0)
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/fullApps/grobag/google.svg'),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Sign in with Google",
                  style: TextStyle(
                    color: fontColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => GrobagHome()));
      },
    );
  }

  Widget applebtn() {
    return CupertinoButton(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 48,
        decoration: BoxDecoration(
          color: fontColor,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 0)
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/fullApps/grobag/apple.svg'),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Sign in with apple",
                  style: TextStyle(
                    color: Color(0xfff8f9fb),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => GrobagHome()));
      },
    );
  }
}
