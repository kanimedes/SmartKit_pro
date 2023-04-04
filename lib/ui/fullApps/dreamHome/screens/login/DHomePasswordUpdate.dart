import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helper/DHomeColors.dart';
import '../../helper/DHomeString.dart';
import '../../helper/DHomeconstant.dart';
import 'DHomeSignIn.dart';

class DHomePasswordUpdate extends StatefulWidget {
  const DHomePasswordUpdate({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DHomePasswordUpdateState();
  }
}

class DHomePasswordUpdateState extends State<DHomePasswordUpdate>
    with TickerProviderStateMixin {
  final _formKeyDialog = GlobalKey<FormState>();
  late AnimationController scaleController = AnimationController(
      duration: const Duration(milliseconds: 800), vsync: this);
  late Animation<double> scaleAnimation =
      CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
  late AnimationController checkController =
      AnimationController(duration: const Duration(seconds: 2), vsync: this);
  late Animation<double> checkAnimation =
      CurvedAnimation(parent: checkController, curve: Curves.linear);
  double circleSize = 90;
  double iconSize = 60;
  @override
  void dispose() {
    scaleController.dispose();
    checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      AppBar(
        toolbarHeight: 133,
        backgroundColor: DHomeColors.bgColor,
        centerTitle: true,
        leadingWidth: 70,
        title: Text(
          DHomeString.PasswordUpdate,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              DHomeConstant.getSvgImagePath("back_arrow.svg"),
              fit: BoxFit.scaleDown,
            )),
      ),
      passwordData()
    ]));
  }

  Widget passwordData() {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .2),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
        child: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .09,
          ),
          oldPwdEnter(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .04,
          ),
          newPwdEnter(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .04,
          ),
          cngPwdEnter(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .25,
          ),
          updateBtn()
        ])));
  }

  Widget oldPwdEnter() {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .07,
            ),
            child: const Text(
              DHomeString.OldPassword,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .07,
            right: MediaQuery.of(context).size.width * .07,
          ),
          child: TextFormField(
              cursorColor: const Color(0xffacacac),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: "**************",
                hintStyle: TextStyle(
                    color: Color(0xff565656),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffacacac)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffacacac)),
                ),
              )),
        ),
      ],
    );
  }

  Widget newPwdEnter() {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .07,
            ),
            child: const Text(
              DHomeString.NewPassword,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .07,
            right: MediaQuery.of(context).size.width * .07,
          ),
          child: TextFormField(
              cursorColor: const Color(0xffacacac),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: "**************",
                hintStyle: TextStyle(
                    color: Color(0xff565656),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffacacac)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffacacac)),
                ),
              )),
        ),
      ],
    );
  }

  Widget cngPwdEnter() {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .07,
            ),
            child: const Text(
              DHomeString.ConfirmPassword,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .07,
            right: MediaQuery.of(context).size.width * .07,
          ),
          child: TextFormField(
              cursorColor: const Color(0xffacacac),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: "**************",
                hintStyle: TextStyle(
                    color: Color(0xff565656),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffacacac)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffacacac)),
                ),
              )),
        ),
      ],
    );
  }

  Widget updateBtn() {
    return ElevatedButton(
      onPressed: () {
        passwordUpdate();
      },
      child: const Text(
        DHomeString.Update,
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
                    key: _formKeyDialog,
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
}
