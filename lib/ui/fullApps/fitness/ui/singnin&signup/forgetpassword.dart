import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/Utils/utlis.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/customeBackbutton.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({Key? key}) : super(key: key);

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  int currentmethod = -1;
  Widget _buildimage() {
    return Image.asset(fitnessUiUtils.getImagePath("forgetpassword.jpg"));
  }

  Widget _buildtext() {
    return Text(
      "select  which contact  should we use to \n recover password",
      style: TextStyle(
        fontSize: 18,
      ),
    );
  }

  Widget _buildForgotmethod(
    String forgetpasswordAtype,
    String forgetpassword,
    IconData iconData,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentmethod = index;
        });
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: currentmethod == index
              ? Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                )
              : Border.all(width: 0, color: Colors.transparent),
        ),
        child: Row(
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
              child: Icon(
                iconData,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  forgetpasswordAtype,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Text(
                  forgetpassword,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildmethod() {
    return Column(
      children: [
        _buildForgotmethod(
          "To SMS",
          "+1 814****574",
          Icons.message_outlined,
          0,
        ),
        _buildForgotmethod(
          "To EmMAIL",
          "php****@yahoo.in",
          Icons.email_outlined,
          1,
        ),
      ],
    );
  }

  Widget _buidsubmit() {
    return CustomeRoundedButton(
      title: "Continue",
      width: MediaQuery.of(context).size.width * 0.84,
      hight: MediaQuery.of(context).size.height * 0.08,
      borderradius: 40,
      ontap: () {
        Navigator.of(context).pushNamed(Routes.otpscreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildimage(),
              _buildtext(),
              _buildmethod(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.022,
              ),
              _buidsubmit(),
            ],
          ),
          Positioned(
            top: 15,
            left: 10,
            child: Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: CustomBackButton(),
            ),
          ),
        ],
      ),
    );
  }
}
