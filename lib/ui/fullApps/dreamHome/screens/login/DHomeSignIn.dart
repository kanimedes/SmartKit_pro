import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:smartkit_pro/ui/fullApps/dreamHome/bottombar/bottomPage.dart';

import '../../helper/DHomeAnimation.dart';
import '../../helper/DHomeColors.dart';
import '../../helper/DHomeString.dart';
import '../../helper/DHomeconstant.dart';
import 'DHomeSignUp.dart';

class DHomeSignIn extends StatefulWidget {
  const DHomeSignIn({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DHomeSignInState();
  }
}

class DHomeSignInState extends State<DHomeSignIn>
    with TickerProviderStateMixin {
  final _formKeyDialog = GlobalKey<FormState>();
  final _formKeyDialog1 = GlobalKey<FormState>();
  final _formKeyDialog2 = GlobalKey<FormState>();
  final _formKeyDialog3 = GlobalKey<FormState>();

  late AnimationController scaleController = AnimationController(
      duration: const Duration(milliseconds: 800), vsync: this);
  late Animation<double> scaleAnimation =
      CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
  late AnimationController checkController =
      AnimationController(duration: const Duration(seconds: 1), vsync: this);
  late Animation<double> checkAnimation =
      CurvedAnimation(parent: checkController, curve: Curves.linear);
  double circleSize = 90;
  double iconSize = 60;
  final int delayedAmount = 200;
  @override
  void dispose() {
    scaleController.dispose();
    checkController.dispose();
    super.dispose();
  }

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
        title: Text(DHomeString.signIn,
            style: TextStyle(color: DHomeColors.black, fontSize: 20)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: DHomeColors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            DHomeAnimation(
              child: welcomeText(),
              delay: delayedAmount,
            ),
            const SizedBox(
              height: 5,
            ),
            DHomeAnimation(
              child: welcomeSub(),
              delay: delayedAmount,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            DHomeAnimation(
              child: emailEnter(),
              delay: delayedAmount + 400,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
            DHomeAnimation(
              child: pwdEnter(),
              delay: delayedAmount + 600,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            DHomeAnimation(
              child: forgotPwd(),
              delay: delayedAmount + 800,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            DHomeAnimation(
              child: signInBtn(),
              delay: delayedAmount + 1000,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            DHomeAnimation(
              child: socialMediaText(),
              delay: delayedAmount + 1200,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            DHomeAnimation(
              child: socialMedia(),
              delay: delayedAmount + 1400,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .09,
            ),
            DHomeAnimation(
              child: accountText(),
              delay: delayedAmount + 1600,
            ),
          ],
        ),
      ),
    );
  }

  Widget welcomeText() {
    return Container(
        alignment: Alignment.topLeft,
        child: const Text(
          DHomeString.welcomeText,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ));
  }

  Widget welcomeSub() {
    return Container(
        alignment: Alignment.topLeft,
        child: const Text(
          DHomeString.welSub,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xffa2a2a2)),
        ));
  }

  Widget emailEnter() {
    return Container(
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
    );
  }

  Widget pwdEnter() {
    return Container(
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
              padding: const EdgeInsets.only(left: 10, bottom: 5),
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
    );
  }

  Widget cnfpwdEnter() {
    return Container(
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
                DHomeString.ConfirmPassword,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14),
              )),
          Container(
              padding: const EdgeInsets.only(left: 10, bottom: 5),
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
    );
  }

  Widget forgotPwd() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            elevation: 0,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            )),
            context: context,
            builder: (context) => BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                child: Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      decoration: const BoxDecoration(
                          // gradient: UiUtils.buildLinerGradient([Theme.of(context).scaffoldBackgroundColor, Theme.of(context).canvasColor], Alignment.topCenter, Alignment.bottomCenter),
                          color: DHomeColors.bgColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50.0),
                          )),
                      constraints: BoxConstraints(
                          maxHeight:
                              MediaQuery.of(context).size.height * (0.45)),
                      child: Form(
                        key: _formKeyDialog,
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    end: 20, top: 40),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back_ios,
                                          color: Colors.black,
                                        )),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .2,
                                    ),
                                    const Text(
                                      DHomeString.forgotPwd,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                            Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsetsDirectional.only(
                                    start: 17, end: 20, top: 40),
                                child: const Text(
                                  DHomeString.forgotdes,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  start: 17,
                                  end: 20,
                                ),
                                child: emailEnter()),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                verifyCode();
                              },
                              child: const Text(
                                DHomeString.resetMyPwd,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: DHomeColors.white,
                                    fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(355, 55),
                                shape: const StadiumBorder(),
                                primary: DHomeColors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ))));
      },
      child: Container(
        alignment: Alignment.topRight,
        child: const Text(
          DHomeString.forgotPwd + "?",
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  verifyCode() {
    return showModalBottomSheet(
        elevation: 0,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        )),
        context: context,
        builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  decoration: const BoxDecoration(
                      // gradient: UiUtils.buildLinerGradient([Theme.of(context).scaffoldBackgroundColor, Theme.of(context).canvasColor], Alignment.topCenter, Alignment.bottomCenter),
                      color: DHomeColors.bgColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50.0),
                      )),
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * (0.45)),
                  child: Form(
                    key: _formKeyDialog1,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsetsDirectional.only(
                                end: 20, top: 40),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                    )),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .13,
                                ),
                                const Text(
                                  DHomeString.code,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsetsDirectional.only(
                                start: 17, end: 20, top: 30),
                            child: const Text(
                              DHomeString.codeMail,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 17,
                              end: 20,
                            ),
                            child: otpEnter()),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            resetPwd();
                          },
                          child: const Text(
                            DHomeString.VerifyCode,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: DHomeColors.white,
                                fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(355, 55),
                            shape: const StadiumBorder(),
                            primary: DHomeColors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ))));
  }

  resetPwd() {
    return showModalBottomSheet(
        elevation: 0,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        )),
        context: context,
        builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  decoration: const BoxDecoration(
                      // gradient: UiUtils.buildLinerGradient([Theme.of(context).scaffoldBackgroundColor, Theme.of(context).canvasColor], Alignment.topCenter, Alignment.bottomCenter),
                      color: DHomeColors.bgColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50.0),
                      )),
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * (0.5)),
                  child: Form(
                    key: _formKeyDialog2,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsetsDirectional.only(
                                end: 20, top: 40),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                    )),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .13,
                                ),
                                const Text(
                                  DHomeString.ResetPassword,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsetsDirectional.only(
                                start: 17, end: 20, top: 30),
                            child: const Text(
                              DHomeString.resetPwdDes,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 17,
                              end: 20,
                            ),
                            child: pwdEnter()),
                        Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 17, end: 20, top: 20),
                            child: cnfpwdEnter()),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            passwordUpdate();
                          },
                          child: const Text(
                            DHomeString.resetMyPwd,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: DHomeColors.white,
                                fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(355, 55),
                            shape: const StadiumBorder(),
                            primary: DHomeColors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ))));
  }

  passwordUpdate() {
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController.forward();
      }
    });
    scaleController.forward();
    return showModalBottomSheet(
        elevation: 0,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        )),
        context: context,
        builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  decoration: const BoxDecoration(
                      // gradient: UiUtils.buildLinerGradient([Theme.of(context).scaffoldBackgroundColor, Theme.of(context).canvasColor], Alignment.topCenter, Alignment.bottomCenter),
                      color: DHomeColors.bgColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50.0),
                      )),
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * (0.5)),
                  child: Form(
                    key: _formKeyDialog3,
                    child: Column(
                      children: [
                        const Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 20, end: 20, top: 40),
                            child: Text(
                              DHomeString.PasswordUpdated,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                            )),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsetsDirectional.only(
                              start: 40, end: 40, top: 60),
                          child: Stack(
                            children: [
                              Center(
                                child: ScaleTransition(
                                  scale: scaleAnimation,
                                  child: Container(
                                    height: circleSize,
                                    width: circleSize,
                                    decoration: const BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                              SizeTransition(
                                sizeFactor: checkAnimation,
                                axis: Axis.horizontal,
                                axisAlignment: -1,
                                child: Center(
                                  child: Container(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Icon(Icons.check,
                                          color: Colors.white, size: iconSize)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            DHomeString.passDes,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const DHomeSignIn()),
                                (Route<dynamic> route) => false);
                          },
                          child: const Text(
                            DHomeString.goToLogin,
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
                        )
                      ],
                    ),
                  ),
                ))));
  }

  Widget otpEnter() {
    return Padding(
        padding: EdgeInsetsDirectional.only(
          start: MediaQuery.of(context).size.width * .01,
          end: MediaQuery.of(context).size.width * .01,
        ),
        child: PinCodeTextField(
          length: 4,
          obscureText: false, cursorColor: const Color(0xff707070),
          animationType: AnimationType.fade,
          textStyle: const TextStyle(fontWeight: FontWeight.normal),
          keyboardType: TextInputType.number,
          //You can change here colors
          pinTheme: PinTheme(
            inactiveFillColor: Colors.white,
            errorBorderColor: Colors.white,
            activeColor: Colors.white,
            selectedColor: Colors.white,
            inactiveColor: const Color(0xff707070),
            disabledColor: Colors.white,
            selectedFillColor: Colors.white,
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 60,
            fieldWidth: 70,
            activeFillColor: Colors.white,
          ),
          //  mainAxisAlignment: MainAxisAlignment.center,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          // controller: textEditingController,

          onChanged: (value) {},
          appContext: context,
        ));
  }

  Widget signInBtn() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BottomPage(from: 1, to: 1, body: BottomPage.defaultPages[1]),
          ),
        );
      },
      child: const Text(
        DHomeString.signIn,
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
    );
  }

  Widget socialMediaText() {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        DHomeString.socialMedia,
        style: TextStyle(color: Color(0xffa2a2a2), fontSize: 12),
      ),
    );
  }

  Widget socialMedia() {
    return Row(
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
              //Add google svg file
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
    );
  }

  Widget accountText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(DHomeString.doAcc + " ",
            style: TextStyle(color: DHomeColors.black, fontSize: 14)),
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DHomeSignUp(),
                ),
              );
            },
            child: const Text(DHomeString.signUp + ".",
                style: TextStyle(
                    color: DHomeColors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 14)))
      ],
    );
  }
}
