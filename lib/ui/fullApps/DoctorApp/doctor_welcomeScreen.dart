import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'helper/ColorRes.dart';
import 'helper/SlideAnimation.dart';
import 'helper/StringRes.dart';
import 'helper/doctore_DesignConfig.dart';
import 'login/doctor_SignInScreen.dart';
import 'login/doctore_SignUpScreen.dart';

class DoctorWelcomeScreen extends StatefulWidget {
  const DoctorWelcomeScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DoctorWelcomeScreenState();
  }
}

class DoctorWelcomeScreenState extends State<DoctorWelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .25,
            ),
            SlideAnimation(
              position: 10,
              itemCount: 20,
              slideDirection: SlideDirection.fromTop,
              animationController: _animationController,
              child: SvgPicture.asset(
                  DoctorDesignConfig.getImagePathLogo("logo.svg")),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  DoctorStringRes.welcomeText,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Text("Dr. ",
                    style: TextStyle(
                        color: ColorRes.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22)),
                Text("Live",
                    style: TextStyle(
                        color: ColorRes.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            DoctorDesignConfig.Button(
                onpress: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => DoctorSignUpScreen(),
                      ));
                },
                name: DoctorStringRes.signup,
                foreground: ColorRes.blue,
                TextColor: ColorRes.white),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => DoctorSignInScreen(),
                  ),
                );
              },
              child: Text(
                DoctorStringRes.signin,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorRes.blue,
                    fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(320, 50),
                elevation: 0,
                side: BorderSide(
                  width: 2.0,
                  color: ColorRes.blue,
                ),
                primary: ColorRes.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
