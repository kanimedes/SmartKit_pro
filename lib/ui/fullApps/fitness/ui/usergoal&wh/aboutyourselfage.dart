import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/yourselfappbartitle.dart';

class AboutyourSelfage extends StatefulWidget {
  const AboutyourSelfage({Key? key}) : super(key: key);

  @override
  State<AboutyourSelfage> createState() => _AboutyourSelfageState();
}

class _AboutyourSelfageState extends State<AboutyourSelfage>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<Offset> _buttonanimation;
  late Animation<Offset> _titleanimation;

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

  int selectage = 0;
  Widget _buildappbar() {
    return Align(
      alignment: Alignment.topCenter,
      child: SlideTransition(
        position: _titleanimation,
        child: CustomeYourselfappbar(
            title: "How Old Are You?",
            substring:
                "Age in Years. This Will help  us to presonalize \n on exercise program plan that suits you."),
      ),
    );
  }

  Widget _buildagetext() {
    return Align(
      alignment: Alignment.center,
      child: SizeTransition(
          sizeFactor: _controller,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(initialItem: 20),
              itemExtent: 50,
              useMagnifier: true,
              magnification: 2,
              diameterRatio: 2,
              children: List<Widget>.generate(
                  98,
                  (index) => Center(
                        child: Text(
                          '${index + 2}',
                          style: TextStyle(color: Colors.black, fontSize: 26),
                        ),
                      )),
              onSelectedItemChanged: (item) {
                print((item + 2).toString());
              },
            ),
          )),
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
                Navigator.of(context).pushNamed(Routes.yourselfweight);
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
          _buildagetext(),
          _buildbutton(),
        ],
      ),
    );
  }
}
