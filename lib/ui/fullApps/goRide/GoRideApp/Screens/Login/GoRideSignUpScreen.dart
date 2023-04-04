import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Screens/Widget/animatedFadeAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/widgets/slideAnimation.dart';
import '../GoRideDrawerHome.dart';
import '../GoRideHomeScreen.dart';
import '../Widget/AppBar.dart';

class GoRideSignUpScreen extends StatefulWidget {
  const GoRideSignUpScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideSignUpScreenState();
  }
}

class GoRideSignUpScreenState extends State<GoRideSignUpScreen>
    with SingleTickerProviderStateMixin {
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
          child: Column(children: [
            welcomeText(),
            welcomeSubText(),
            nameEnter(),
            emailEnter(),
            phoneNoEnter(),
            pwdEnter(),
            creteAccountBtn(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .045,
            ),
            Text(
              GoRideStringRes.socialMedia,
              style: TextStyle(fontSize: 12, color: Color(0xff7b859a)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .025,
            ),
            socialMedia(),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            termText()
          ])),
    );
  }

  Widget welcomeText() {
    return SlideAnimation(
        position: 3,
        itemCount: 10,
        slideDirection: SlideDirection.fromLeft,
        animationController: _animationController,
        child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .1,
                top: MediaQuery.of(context).size.height * .07),
            child: Text(
              GoRideStringRes.signUp,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
            )));
  }

  Widget welcomeSubText() {
    return SlideAnimation(
        position: 3,
        itemCount: 10,
        slideDirection: SlideDirection.fromLeft,
        animationController: _animationController,
        child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .1,
            ),
            child: Text(
              GoRideStringRes.signUpSub,
              style: TextStyle(fontSize: 14, color: Color(0xffa2a2a2)),
            )));
  }

  Widget nameEnter() {
    return SlideAnimation(
        position: 3,
        itemCount: 10,
        slideDirection: SlideDirection.fromRight,
        animationController: _animationController,
        child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .1,
              top: MediaQuery.of(context).size.height * .03,
              right: MediaQuery.of(context).size.width * .1,
            ),
            child: TextFormField(
              cursorColor: Color(0xffa2a2a2),
              decoration: InputDecoration(
                prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.person,
                      color: Color(0xff212121).withOpacity(0.7),
                    )),
                hintText: "Enter Name",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff707070)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff707070)),
                ),
              ),
            )));
  }

  Widget emailEnter() {
    return SlideAnimation(
        position: 3,
        itemCount: 10,
        slideDirection: SlideDirection.fromRight,
        animationController: _animationController,
        child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .1,
              top: MediaQuery.of(context).size.height * .03,
              right: MediaQuery.of(context).size.width * .1,
            ),
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
            )));
  }

  Widget phoneNoEnter() {
    return SlideAnimation(
        position: 3,
        itemCount: 10,
        slideDirection: SlideDirection.fromLeft,
        animationController: _animationController,
        child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .1,
              top: MediaQuery.of(context).size.height * .03,
              right: MediaQuery.of(context).size.width * .1,
            ),
            child: TextFormField(
              cursorColor: Color(0xffa2a2a2),
              decoration: InputDecoration(
                prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.call_outlined,
                      color: Color(0xff212121).withOpacity(0.7),
                    )),
                hintText: "0123456789",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff707070)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff707070)),
                ),
              ),
            )));
  }

  Widget pwdEnter() {
    return SlideAnimation(
        position: 3,
        itemCount: 10,
        slideDirection: SlideDirection.fromLeft,
        animationController: _animationController,
        child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .1,
            top: MediaQuery.of(context).size.height * .03,
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
        ));
  }

  Widget creteAccountBtn() {
    return AnimatedFadeAnimation(
        2.5,
        Container(
          padding: EdgeInsets.only(top: 15),
          child: ElevatedButton(
            onPressed: () {
              xOffset = 0;
              yOffset = 0;
              scaleFactor = 1;
              isDrawerOpen = false;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HomePage(),
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
              minimumSize: Size(315, 50),
              shadowColor: Color(0x33212121),
              elevation: 6,
              primary: GoRideColors.black,
            ),
          ),
        ));
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
                    )))),
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
                    )))),
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
