import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/Login/passwordUpdatedSuccess.dart';

import '../Widget/AppBar.dart';

class GoRideUpdatePwd extends StatefulWidget {
  const GoRideUpdatePwd({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideUpdatePwdState();
  }
}

class GoRideUpdatePwdState extends State<GoRideUpdatePwd> {
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
              showBackBtn: false,
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
          GoRideStringRes.newCredentialSub,
          style: TextStyle(fontSize: 14, color: Color(0xffa2a2a2)),
        ));
  }

  Widget newPwdEnter() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .1,
        top: MediaQuery.of(context).size.height * .02,
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
      padding: EdgeInsets.only(top: 15),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => PasswordUpdatedSuccess(),
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
          minimumSize: Size(310, 50),
          shadowColor: Color(0x33212121),
          elevation: 6,
          primary: GoRideColors.black,
        ),
      ),
    );
  }
}
