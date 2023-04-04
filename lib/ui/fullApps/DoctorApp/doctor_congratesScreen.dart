import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'helper/ColorRes.dart';
import 'helper/SlideAnimation.dart';
import 'helper/StringRes.dart';
import 'helper/doctore_DesignConfig.dart';
import 'home/doctor_HomePageScreen.dart';

class DoctorCongratsScreen extends StatefulWidget {
  const DoctorCongratsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DoctorCongratsScreenState();
  }
}

class _DoctorCongratsScreenState extends State<DoctorCongratsScreen>
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorRes.white,
        bottomNavigationBar: SlideAnimation(
            position: 10,
            itemCount: 20,
            slideDirection: SlideDirection.fromTop,
            animationController: _animationController,
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * .06,
                  right: size.width * .06,
                  bottom: size.width * .06),
              child: DoctorDesignConfig.Button(
                  onpress: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => DoctorHomeScreen(),
                      ),
                    );
                  },
                  name: DoctorStringRes.goHomePage,
                  foreground: ColorRes.blue,
                  TextColor: ColorRes.white),
            )),
        body: Container(
            alignment: Alignment.topCenter,
            child: Column(children: [
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
                height: MediaQuery.of(context).size.height * .1,
              ),
              SlideAnimation(
                  position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromTop,
                  animationController: _animationController,
                  child: Text(
                    DoctorStringRes.congrats,
                    style: TextStyle(
                        color: ColorRes.blue,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              SlideAnimation(
                  position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromTop,
                  animationController: _animationController,
                  child: Text(
                    DoctorStringRes.AccText,
                    style: TextStyle(
                        color: ColorRes.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )),
            ])));
  }
}
