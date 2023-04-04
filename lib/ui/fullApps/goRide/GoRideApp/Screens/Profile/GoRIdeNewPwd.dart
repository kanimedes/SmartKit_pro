import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/Profile/GoRideEditProfileShowData.dart';

import '../Widget/AppBar.dart';

class GoRideNewPwd extends StatefulWidget {
  const GoRideNewPwd({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideNewPwdState();
  }
}

class GoRideNewPwdState extends State<GoRideNewPwd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GoRideColors.yellow,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * .24,
            ),
            child: AppbarImageDesign(
              image: 'new_pass.svg',
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
              oldPwdEnter(),
              newPwdEnter(),
              cnfPwdEnter(),
              updatePwdBtn()
            ])));
  }

  Widget welcomeText() {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .1,
            top: MediaQuery.of(context).size.height * .07),
        child: Text(
          GoRideStringRes.newCredential,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
        ));
  }

  Widget welcomeSubText() {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .1,
          right: MediaQuery.of(context).size.width * .1,
        ),
        child: Text(
          "Set your new password",
          style: TextStyle(fontSize: 14, color: Color(0xffa2a2a2)),
        ));
  }

  Widget oldPwdEnter() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .1,
        top: MediaQuery.of(context).size.height * .05,
        right: MediaQuery.of(context).size.width * .1,
      ),
      child: TextFormField(
          obscureText: true,
          cursorColor: Color(0xffa2a2a2),
          obscuringCharacter: '●',
          decoration: InputDecoration(
            prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset(
                  GoRideConstant.getSvgImagePath("pass_icon.svg"),
                  fit: BoxFit.scaleDown,
                )),
            suffixIcon: SvgPicture.asset(
              GoRideConstant.getSvgImagePath("eye_icon.svg"),
              fit: BoxFit.scaleDown,
            ),
            hintText: "Old Passsword",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff707070)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff707070)),
            ),
          )),
    );
  }

  Widget newPwdEnter() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .1,
        top: MediaQuery.of(context).size.height * .05,
        right: MediaQuery.of(context).size.width * .1,
      ),
      child: TextFormField(
          obscureText: true,
          cursorColor: Color(0xffa2a2a2),
          obscuringCharacter: '●',
          decoration: InputDecoration(
            prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset(
                  GoRideConstant.getSvgImagePath("pass_icon.svg"),
                  fit: BoxFit.scaleDown,
                )),
            suffixIcon: SvgPicture.asset(
              GoRideConstant.getSvgImagePath("eye_icon.svg"),
              fit: BoxFit.scaleDown,
            ),
            hintText: "New Password",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff707070)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff707070)),
            ),
          )),
    );
  }

  Widget cnfPwdEnter() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .1,
        top: MediaQuery.of(context).size.height * .05,
        right: MediaQuery.of(context).size.width * .1,
      ),
      child: TextFormField(
          obscureText: true,
          cursorColor: Color(0xffa2a2a2),
          obscuringCharacter: '●',
          decoration: InputDecoration(
            prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: SvgPicture.asset(
                  GoRideConstant.getSvgImagePath("pass_icon.svg"),
                  fit: BoxFit.scaleDown,
                )),
            suffixIcon: SvgPicture.asset(
              GoRideConstant.getSvgImagePath("eye_icon.svg"),
              fit: BoxFit.scaleDown,
            ),
            hintText: "Confirm Password",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff707070)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff707070)),
            ),
          )),
    );
  }

  Widget updatePwdBtn() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => GoRideEditProfileShow(),
            ),
          );
        },
        child: Text(
          GoRideStringRes.updatePassBtn,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: GoRideColors.white,
              fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(315, 50),
          shadowColor: Color(0x33212121),
          elevation: 6,
          primary: GoRideColors.black,
        ),
      ),
    );
  }
}
