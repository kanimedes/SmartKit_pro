import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';

import 'GoRideLoginScreen.dart';

class PasswordUpdatedSuccess extends StatefulWidget {
  const PasswordUpdatedSuccess({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PasswordUpdatedSuccessState();
  }
}

class PasswordUpdatedSuccessState extends State<PasswordUpdatedSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GoRideColors.yellow,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * .07,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * .07,
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration:
              GoRideConstant.boxDecorationContainer(GoRideColors.white, false),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .23,
              ),
              pwdText(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              imageShow(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              pwdUpdateText(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              loginBtn()
            ],
          ),
        ));
  }

  Widget pwdText() {
    return Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Text(
          GoRideStringRes.password + "\n UPDATED",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
        ));
  }

  Widget imageShow() {
    return SvgPicture.asset(GoRideConstant.getSvgImagePath("update_pass.svg"));
  }

  Widget pwdUpdateText() {
    return Text(
      GoRideStringRes.pwdUpdated,
      style: TextStyle(fontSize: 16, color: Color(0xff212121)),
    );
  }

  Widget loginBtn() {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .017),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => GoRideLoginScreen(),
            ),
          );
        },
        child: Text(
          GoRideStringRes.loginBtn,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: GoRideColors.white,
              fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(310, 50),
          primary: GoRideColors.black,
        ),
      ),
    );
  }
}
