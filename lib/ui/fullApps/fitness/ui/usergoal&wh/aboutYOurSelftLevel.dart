import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/Utils/utlis.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/yourselfappbartitle.dart';

class AboutYourselfLevel extends StatefulWidget {
  const AboutYourselfLevel({Key? key}) : super(key: key);

  @override
  State<AboutYourselfLevel> createState() => _AboutYourselfLevelState();
}

class _AboutYourselfLevelState extends State<AboutYourselfLevel>
    with TickerProviderStateMixin {
  int selectedlevel = -1;

  late AnimationController _titlecontroller;

  late AnimationController _levelcontroller;
  late AnimationController _buttoncontroller;
  late Animation<Offset> _titleanimation;
  late Animation<Offset> _levelanimation;
  late Animation<Offset> _buttonanimation;

  @override
  void initState() {
    super.initState();

    _titlecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _levelcontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _buttoncontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    _titleanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _titlecontroller, curve: Curves.decelerate));
    _levelanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _levelcontroller, curve: Curves.decelerate));
    _buttonanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _buttoncontroller, curve: Curves.decelerate));
    _levelcontroller.forward();
    _buttoncontroller.forward();
    _titlecontroller.forward();
  }

  @override
  void dispose() {
    super.dispose();

    _buttoncontroller.dispose();
    _levelcontroller.dispose();
  }

  Widget _buildappbar() {
    return Align(
      alignment: Alignment.topCenter,
      child: SlideTransition(
        position: _titleanimation,
        child: CustomeYourselfappbar(
          title: "Physical Activity Level?",
          substring:
              "Choose your regular activity level.This will\n Help  us To Personal plans for you.",
        ),
      ),
    );
  }

  Widget _buildbutton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
        position: _buttonanimation,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomeRoundedButton(
              title: "Back",
              width: MediaQuery.of(context).size.width * 0.40,
              hight: MediaQuery.of(context).size.width * 0.13,
              containercolors: Theme.of(context).primaryColor.withOpacity(0.1),
              textcolor: Theme.of(context).primaryColor,
              ontap: () {
                Navigator.of(context).pop(false);
              },
              buttonmargin: true,
            ),
            CustomeRoundedButton(
              title: "Next",
              width: MediaQuery.of(context).size.width * 0.40,
              hight: MediaQuery.of(context).size.width * 0.13,
              ontap: () {
                Navigator.of(context).pushNamed(Routes.profilescreen);
              },
              buttonmargin: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildlevel() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        // color: Colors.pink,
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * 0.025,
          // vertical: MediaQuery.of(context).size.width * 0.2,
        ),
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width,
        child: SlideTransition(
          position: _levelanimation,
          child: ListView.builder(
            itemCount: fitnessUiUtils.levelList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      selectedlevel = index;
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 15),
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: selectedlevel == index
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).backgroundColor,
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.07),
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        fitnessUiUtils.levelList[index],
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: selectedlevel == index
                              ? Theme.of(context).backgroundColor
                              : Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildlevel(),
          _buildbutton(),
          _buildappbar(),
        ],
      ),
    );
  }
}
