import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/bottombar/bottomPage.dart';

import '../../helper/DHomeAnimation.dart';
import '../../helper/DHomeColors.dart';
import '../../helper/DHomeString.dart';
import '../../helper/DHomeconstant.dart';
import 'DHomeSignIn.dart';

class DHomeSignUp extends StatefulWidget {
  const DHomeSignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DHomeSignUpState();
  }
}

class DHomeSignUpState extends State<DHomeSignUp> {
  final int delayedAmount = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DHomeColors.bgColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: DHomeColors.bgColor,
          elevation: 0,
          leadingWidth: 65,
          toolbarHeight: 80,
          title: Text(DHomeString.signUp,
              style: TextStyle(color: DHomeColors.black, fontSize: 20)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: DHomeColors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(children: [
              userNameEnter(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              emailEnter(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              phoneEnter(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              pwdEnter(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              cnfPwdEnter(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              signUpBtn(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              socialMediaText(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              socialMedia(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              accountText()
            ])));
  }

  Widget userNameEnter() {
    return DHomeAnimation(
      child: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: DHomeColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0f000000),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                alignment: Alignment.topLeft,
                child: const Text(
                  DHomeString.UserName,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14),
                )),
            Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                alignment: Alignment.topLeft,
                child: TextFormField(
                  cursorColor: const Color(0xffa2a2a2),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    hintText: "Divy Jani",
                    hintStyle: TextStyle(color: Color(0xffa2a2a2)),
                    border: InputBorder.none,
                  ),
                ))
          ],
        ),
      ),
      delay: delayedAmount,
    );
  }

  Widget emailEnter() {
    return DHomeAnimation(
      child: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: DHomeColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0f000000),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                alignment: Alignment.topLeft,
                child: const Text(
                  DHomeString.email,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14),
                )),
            Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                alignment: Alignment.topLeft,
                child: TextFormField(
                  cursorColor: const Color(0xffa2a2a2),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    hintText: "abcexample@gmail.com",
                    hintStyle: TextStyle(color: Color(0xffa2a2a2)),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ))
          ],
        ),
      ),
      delay: delayedAmount + 100,
    );
  }

  Widget phoneEnter() {
    return DHomeAnimation(
      child: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: DHomeColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0f000000),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                alignment: Alignment.topLeft,
                child: const Text(
                  DHomeString.Phone,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14),
                )),
            Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                alignment: Alignment.topLeft,
                child: TextFormField(
                  cursorColor: const Color(0xffa2a2a2),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    hintText: "0123456789",
                    hintStyle: TextStyle(color: Color(0xffa2a2a2)),
                    border: InputBorder.none,
                  ),
                ))
          ],
        ),
      ),
      delay: delayedAmount + 200,
    );
  }

  Widget pwdEnter() {
    return DHomeAnimation(
      child: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: DHomeColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0f000000),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                alignment: Alignment.topLeft,
                child: const Text(
                  DHomeString.Password,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14),
                )),
            Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                alignment: Alignment.topLeft,
                child: TextFormField(
                  cursorColor: const Color(0xffa2a2a2),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    hintText: "**************",
                    hintStyle: TextStyle(color: Color(0xffa2a2a2)),
                    border: InputBorder.none,
                  ),
                ))
          ],
        ),
      ),
      delay: delayedAmount + 300,
    );
  }

  Widget cnfPwdEnter() {
    return DHomeAnimation(
      child: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: DHomeColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0f000000),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                alignment: Alignment.topLeft,
                child: const Text(
                  DHomeString.cnfPwd,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14),
                )),
            Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                alignment: Alignment.topLeft,
                child: TextFormField(
                  cursorColor: const Color(0xffa2a2a2),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    hintText: "**************",
                    hintStyle: TextStyle(color: Color(0xffa2a2a2)),
                    border: InputBorder.none,
                  ),
                ))
          ],
        ),
      ),
      delay: delayedAmount + 400,
    );
  }

  Widget signUpBtn() {
    return DHomeAnimation(
      child: ElevatedButton(
        onPressed: () {},
        child: const Text(
          DHomeString.signUp,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: DHomeColors.white,
              fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(340, 55),
          shape: const StadiumBorder(),
          primary: DHomeColors.black,
        ),
      ),
      delay: delayedAmount + 500,
    );
  }

  Widget socialMediaText() {
    return DHomeAnimation(
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          DHomeString.socialMedia,
          style: TextStyle(color: Color(0xffa2a2a2), fontSize: 12),
        ),
      ),
      delay: delayedAmount + 500,
    );
  }

  Widget socialMedia() {
    return DHomeAnimation(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomPage(
                      from: 1, to: 1, body: BottomPage.defaultPages[1]),
                ),
              );
            },
            child: CircleAvatar(
                radius: 20,
                backgroundColor: DHomeColors.red,
                child: SvgPicture.asset(
                  DHomeConstant.getSvgImagePath("google.svg"),
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomPage(
                        from: 1, to: 1, body: BottomPage.defaultPages[1]),
                  ),
                );
              },
              child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xff3379e4),
                  child: Icon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.white,
                  ))),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => BottomPage(
                      from: 1, to: 1, body: BottomPage.defaultPages[1]),
                ),
              );
            },
            child: CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xff38a1f3),
                child: SvgPicture.asset(
                  DHomeConstant.getSvgImagePath("twitter.svg"),
                )),
          )
        ],
      ),
      delay: delayedAmount + 550,
    );
  }

  Widget accountText() {
    return DHomeAnimation(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(DHomeString.alreadyAcc + " ",
              style: TextStyle(color: DHomeColors.black, fontSize: 14)),
          GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DHomeSignIn(),
                  ),
                );
              },
              child: const Text(DHomeString.signIn + ".",
                  style: TextStyle(
                      color: DHomeColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14)))
        ],
      ),
      delay: delayedAmount + 600,
    );
  }
}
