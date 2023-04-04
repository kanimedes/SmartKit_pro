import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/Utils/utlis.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/yourselfappbartitle.dart';

class AboutYourselfGoal extends StatefulWidget {
  const AboutYourselfGoal({Key? key}) : super(key: key);

  @override
  State<AboutYourselfGoal> createState() => _AboutYourselfGoalState();
}

class _AboutYourselfGoalState extends State<AboutYourselfGoal>
    with TickerProviderStateMixin {
  late AnimationController _titlecontroller;

  late AnimationController _goalcontroller;
  late AnimationController _buttoncontroller;
  late Animation<Offset> _titleanimation;
  late Animation<Offset> _goalanimation;
  late Animation<Offset> _buttonanimation;

  @override
  void initState() {
    super.initState();

    _titlecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _goalcontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _buttoncontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    _titleanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _titlecontroller, curve: Curves.decelerate));
    _goalanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _goalcontroller, curve: Curves.decelerate));
    _buttonanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _buttoncontroller, curve: Curves.decelerate));
    _goalcontroller.forward();
    _buttoncontroller.forward();
    _titlecontroller.forward();
  }

  @override
  void dispose() {
    super.dispose();

    _buttoncontroller.dispose();
    _goalcontroller.dispose();
  }

  List goalid = [
    "1",
  ];
  Widget _buildappbar() {
    return Align(
      alignment: Alignment.topCenter,
      child: SlideTransition(
        position: _titleanimation,
        child: CustomeYourselfappbar(
            title: "What is your Goal?",
            substring:
                "you can choose more than one. Don't\n worry, you can alawys change it late."),
      ),
    );
  }

  Widget _buildgoal() {
    return Align(
      alignment: Alignment.topRight,
      child: SlideTransition(
        position: _goalanimation,
        child: Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.08,
            right: MediaQuery.of(context).size.width * 0.08,
          ),
          height: MediaQuery.of(context).size.height * 0.70,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: 50),
            itemCount: fitnessUiUtils.goalList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  if (goalid.contains(fitnessUiUtils.goalList[index].id)) {
                    goalid.removeWhere((element) =>
                        element == fitnessUiUtils.goalList[index].id);
                    print("value cointain");
                    setState(() {});
                  } else {
                    goalid.add(fitnessUiUtils.goalList[index].id);
                    setState(() {});
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: goalid.contains(fitnessUiUtils.goalList[index].id)
                        ? Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          )
                        : Border.all(width: 0, color: Colors.transparent),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.04),
                    child: Row(
                      children: [
                        Text(
                          fitnessUiUtils.goalList[index].goalname,
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                        !goalid.contains(fitnessUiUtils.goalList[index].id)
                            ? Icon(
                                Icons.circle_outlined,
                                color: Theme.of(context).primaryColor,
                              )
                            : Icon(
                                Icons.check_circle,
                                color: Theme.of(context).primaryColor,
                              ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
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
              hight: MediaQuery.of(context).size.height * 0.08,
              containercolors: Theme.of(context).primaryColor.withOpacity(0.1),
              textcolor: Theme.of(context).primaryColor,
              ontap: () {
                Navigator.of(context).pop();
              },
              buttonmargin: true,
            ),
            CustomeRoundedButton(
              title: "Next",
              width: MediaQuery.of(context).size.width * 0.40,
              hight: MediaQuery.of(context).size.height * 0.08,
              ontap: () {
                Navigator.of(context).pushNamed(Routes.yourselflevel);
              },
              buttonmargin: true,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildgoal(),
          _buildappbar(),
          _buildbutton(),
        ],
      ),
    );
  }
}
