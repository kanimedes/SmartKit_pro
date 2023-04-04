import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/yourselfappbartitle.dart';

class AboutYourself extends StatefulWidget {
  const AboutYourself({Key? key}) : super(key: key);

  @override
  State<AboutYourself> createState() => _AboutYourselfState();
}

class _AboutYourselfState extends State<AboutYourself>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Offset> _buttonanimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _buttonanimation = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.decelerate));

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  int currentindex = -1;
  Widget _buildtitle() {
    return SlideTransition(
      position: _buttonanimation,
      child: CustomeYourselfappbar(
          title: "Tell about your self",
          substring:
              "to give you a better expreince and results \n we  need  to know  your gender "),
    );
  }

  Widget selectgender({
    required String gendertype,
    required IconData gendericontype,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentindex = index;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == currentindex
              ? Theme.of(context).primaryColor
              : Theme.of(context).canvasColor.withOpacity(0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              gendericontype,
              color: Colors.white,
              size: 80,
            ),
            Text(
              gendertype,
              style: TextStyle(color: Colors.white, fontSize: 25),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildbutton() {
    return SlideTransition(
      position: _buttonanimation,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: CustomeRoundedButton(
          title: "Continue",
          width: MediaQuery.of(context).size.width * 0.85,
          hight: MediaQuery.of(context).size.height * 0.07,
          ontap: () {
            Navigator.of(context).pushNamed(Routes.yourselfage);
          },
          buttonmargin: true,
        ),
      ),
    );
  }

  Widget _buildgenderbutton() {
    return SlideTransition(
      position: _buttonanimation,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            selectgender(
              gendertype: "male",
              gendericontype: Icons.male,
              index: 0,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            selectgender(
              gendertype: "female",
              gendericontype: Icons.female,
              index: 1,
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
          _buildtitle(),
          _buildgenderbutton(),
          _buildbutton(),
        ],
      ),
    );
  }
}
