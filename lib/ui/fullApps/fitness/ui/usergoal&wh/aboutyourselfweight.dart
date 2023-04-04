import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/yourselfappbartitle.dart';

class AboutYourselfWeight extends StatefulWidget {
  const AboutYourselfWeight({Key? key}) : super(key: key);

  @override
  State<AboutYourselfWeight> createState() => _AboutYourselfWeightState();
}

class _AboutYourselfWeightState extends State<AboutYourselfWeight>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _buttonanimation;
  late Animation<Offset> _titleanimation;
  int selectweightmethod = 0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _buttonanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInExpo));
    _titleanimation = Tween<Offset>(begin: Offset(0, -1), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInExpo));
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int selectweight = 0;
  Widget _buildappbar() {
    return Align(
      alignment: Alignment.topCenter,
      child: SlideTransition(
        position: _titleanimation,
        child: CustomeYourselfappbar(
            title: "What is Your Weight?",
            substring:
                "weight in kg. Don't Worry\n you can always change it later."),
      ),
    );
  }

  Widget _buildweighttext() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Align(
        alignment: Alignment.center,
        child: SizeTransition(
            sizeFactor: _controller,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0 * 16),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectweightmethod = 0;
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                              color: selectweightmethod == 0
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                                child: Text(
                              "lbs",
                              style: TextStyle(
                                  color: selectweightmethod == 0
                                      ? Colors.white
                                      : Theme.of(context).primaryColor),
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectweightmethod = 1;
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                              color: selectweightmethod == 1
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                                child: Text(
                              "kg",
                              style: TextStyle(
                                  color: selectweightmethod == 1
                                      ? Colors.white
                                      : Theme.of(context).primaryColor),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: CupertinoPicker(
                      scrollController:
                          FixedExtentScrollController(initialItem: 20),
                      itemExtent: 50,
                      useMagnifier: true,
                      magnification: 2,
                      diameterRatio: 3,
                      children: List<Widget>.generate(
                          98,
                          (index) => Center(
                                child: Text(
                                  '${index + 2}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 26),
                                ),
                              )),
                      onSelectedItemChanged: (item) {
                        print((item + 1).toString());
                      },
                    ),
                  ),
                ],
              ),
            )),
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
              hight: MediaQuery.of(context).size.width * 0.15,
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
              hight: MediaQuery.of(context).size.width * 0.15,
              ontap: () {
                Navigator.of(context).pushNamed(Routes.yourselfheight);
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
          _buildappbar(),
          _buildweighttext(),
          _buildbutton(),
        ],
      ),
    );
  }
}
