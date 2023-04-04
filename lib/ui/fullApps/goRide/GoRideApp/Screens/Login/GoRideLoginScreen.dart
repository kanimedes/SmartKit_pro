import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/Widget/animatedFadeAnimation.dart';
import '../../../../widgets/slideAnimation.dart';
import '../GoRideDrawerHome.dart';
import '../GoRideHomeScreen.dart';
import '../Widget/AppBar.dart';
import 'GoRideForgotPass.dart';
import 'GoRideSignUpScreen.dart';

class GoRideLoginScreen extends StatefulWidget {
  const GoRideLoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideLoginScreenState();
  }
}

class GoRideLoginScreenState extends State<GoRideLoginScreen>
    with SingleTickerProviderStateMixin {
  bool checkBoxValue = true;
  AnimationController? _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GoRideColors.yellow,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * .22,
          ),
          child: AppbarImageDesign(
            image: 'login.svg',
            bottomPadding: 20,
            showBackBtn: true,
            onPress: () {
              Navigator.pop(context);
            },
          )),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration:
              GoRideConstant.boxDecorationContainer(GoRideColors.white, false),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AnimatedFadeAnimation(1, welcomeText()),
                AnimatedFadeAnimation(1, welcomeSubText()),
                AnimatedFadeAnimation(1.3, emailEnter()),
                AnimatedFadeAnimation(1.6, pwdEnter()),
                AnimatedFadeAnimation(1.9, rememberOrForgotPwd()),
                AnimatedFadeAnimation(1.12, loginBtn()),
                AnimatedFadeAnimation(1.15, creteAccountBtn()),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .045,
                ),
                AnimatedFadeAnimation(
                    1.18,
                    Text(
                      GoRideStringRes.socialMedia,
                      style: TextStyle(fontSize: 12, color: Color(0xff7b859a)),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .025,
                ),
                socialMedia(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .055,
                ),
                AnimatedFadeAnimation(1.24, termText())
              ],
            ),
          )),
    );
  }

  Widget welcomeText() {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .1,
            top: MediaQuery.of(context).size.height * .07),
        child: Text(
          GoRideStringRes.welcomeBack,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
        ));
  }

  Widget welcomeSubText() {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .1,
        ),
        child: Text(
          GoRideStringRes.welSub,
          style: TextStyle(fontSize: 14, color: Color(0xffa2a2a2)),
        ));
  }

  Widget emailEnter() {
    return Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .1,
          top: MediaQuery.of(context).size.height * .03,
          right: MediaQuery.of(context).size.width * .1,
        ),
        // padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*.1,top:MediaQuery.of(context).size.height*.03,right:MediaQuery.of(context).size.width*.08,),
        child: TextFormField(
          cursorColor: Color(0xffa2a2a2),
          decoration: InputDecoration(
            prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.email_outlined,
                  color: Color(0xff212121).withOpacity(0.7),
                )),
            hintText: GoRideStringRes.hintEmail,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff707070)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff707070)),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
        ));
  }

  Widget pwdEnter() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .1,
        top: MediaQuery.of(context).size.height * .04,
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
            hintText: "●●●●●●●",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff707070)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff707070)),
            ),
          )),
    );
  }

  Widget rememberOrForgotPwd() {
    return Row(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .07,
              top: MediaQuery.of(context).size.height * .02),
          child: Row(
            children: [
              Checkbox(
                  value: checkBoxValue,
                  activeColor: GoRideColors.yellow,
                  onChanged: (bool? newValue) {
                    setState(() {
                      checkBoxValue = newValue!;
                    });
                  }),
              Text(
                GoRideStringRes.rememberMe,
                style: TextStyle(color: Color(0xff7b859a), fontSize: 14),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => GoRideForgotPass(),
              ),
            );
          },
          child: Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .18,
                  top: MediaQuery.of(context).size.height * .012),
              child: Text(
                GoRideStringRes.forgotPwd + "?",
                style: TextStyle(color: Color(0xff7b859a), fontSize: 14),
              )),
        )
      ],
    );
  }

  Widget loginBtn() {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .017),
      child: ElevatedButton(
        onPressed: () {
          xOffset = 0;
          yOffset = 0;
          scaleFactor = 1;
          isDrawerOpen = false;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomePage(),
            ),
          );
        },
        child: Text(
          GoRideStringRes.loginBtn,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: GoRideColors.black,
              fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(310, 50),
          primary: GoRideColors.yellow,
        ),
      ),
    );
  }

  Widget creteAccountBtn() {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .02),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => GoRideSignUpScreen(),
            ),
          );
        },
        child: Text(
          GoRideStringRes.createAcc,
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

  Widget socialMedia() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideAnimation(
            position: 5,
            itemCount: 15,
            slideDirection: SlideDirection.fromLeft,
            animationController: _animationController,
            child: GestureDetector(
              onTap: () {
                xOffset = 0;
                yOffset = 0;
                scaleFactor = 1;
                isDrawerOpen = false;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomePage(),
                  ),
                );
              },
              child: CircleAvatar(
                  radius: 20,
                  backgroundColor: GoRideColors.red,
                  child: SvgPicture.asset(
                    GoRideConstant.getSvgImagePath("google.svg"),
                  )),
            )),
        SizedBox(
          width: 10,
        ),
        SlideAnimation(
            position: 5,
            itemCount: 15,
            slideDirection: SlideDirection.fromBottom,
            animationController: _animationController,
            child: GestureDetector(
                onTap: () {
                  xOffset = 0;
                  yOffset = 0;
                  scaleFactor = 1;
                  isDrawerOpen = false;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomePage(),
                    ),
                  );
                },
                child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xff3379e4),
                    child: Icon(
                      FontAwesomeIcons.facebookF,
                      color: Colors.white,
                    )))),
        SizedBox(
          width: 10,
        ),
        SlideAnimation(
            position: 5,
            itemCount: 15,
            slideDirection: SlideDirection.fromRight,
            animationController: _animationController,
            child: GestureDetector(
              onTap: () {
                xOffset = 0;
                yOffset = 0;
                scaleFactor = 1;
                isDrawerOpen = false;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomePage(),
                  ),
                );
              },
              child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xff38a1f3),
                  child: SvgPicture.asset(
                    GoRideConstant.getSvgImagePath("twitter.svg"),
                  )),
            ))
      ],
    );
  }

  Widget termText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: const <TextSpan>[
          TextSpan(
              text: GoRideStringRes.agree + " ",
              style: TextStyle(color: Color(0xffa2a2a2), fontSize: 12)),
          TextSpan(
              text: GoRideStringRes.term,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color(0xff1f59b6),
                  fontSize: 12)),
        ],
      ),
    );
  }
}
