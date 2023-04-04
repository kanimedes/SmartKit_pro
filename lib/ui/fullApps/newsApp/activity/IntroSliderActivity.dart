import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/Login/LoginPage.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/new_dialog.dart';

class IntroSliderActivity extends StatefulWidget {
  @override
  IntroSliderState createState() => new IntroSliderState();
}

class IntroSliderState extends State<IntroSliderActivity> {
  final _controller = PageController();
  double? bottompadding;
  int currentpage = 0;
  bool isdialogshown = false;

  final _images = [
    "assets/images/fullApps/newsapp/svg/intro_a.svg",
    "assets/images/fullApps/newsapp/svg/intro_b.svg",
    "assets/images/fullApps/newsapp/svg/intro_c.svg",
  ];
  final _introsubtext = [
    StringsRes.intro1,
    StringsRes.intro2,
    StringsRes.intro3,
  ];
  final _introtitle = [
    StringsRes.introtitle1,
    StringsRes.introtitle2,
    StringsRes.introtitle3,
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      bottompadding = (MediaQuery.of(context).size.height / 2) - 50;
    });

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        //constraints: BoxConstraints.expand(),
        backgroundColor: ColorsRes.introbackcolor,
        /*decoration: BoxDecoration(
          gradient: new RadialGradient(
            colors: [
              ColorsRes.secondgradientcolor,
              ColorsRes.firstgradientcolor,
              ColorsRes.thirdgradientcolor,
            ],
          ),
        ),*/
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < 3; i++)
                      if (i == currentpage) ...[circleBar(true)] else
                        circleBar(false),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            AnimatedOpacity(
              opacity: currentpage == 2 ? 1 : 0,
              duration: Duration(milliseconds: 300),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      CupertinoPageRoute(builder: (context) => LoginPage()));
                },
                child: Container(
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorsRes.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 13),
                    margin: EdgeInsets.only(left: 12, right: 12, bottom: 20),
                    child: Text(
                      "Get Started",
                      style: Theme.of(context).textTheme.subtitle1!.merge(
                          TextStyle(
                              color: ColorsRes.white,
                              fontWeight: FontWeight.bold)),
                    )),
              ),
            )
          ],
        ),
        body: PageView(
          physics: ClampingScrollPhysics(),
          controller: _controller,
          onPageChanged: (int pageno) {
            setState(() {
              currentpage = pageno;
            });

            if (currentpage == 2 && !isdialogshown) {
              openNotificationDialog();
              setState(() {
                isdialogshown = true;
              });
            }
          },
          children: List.generate(3, (index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _introtitle[currentpage],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5!.merge(TextStyle(
                      color: ColorsRes.white,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MyFont')),
                ),
                SizedBox(
                  height: 50,
                ),
                SvgPicture.asset(
                  _images[currentpage],
                  // fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    _introsubtext[currentpage],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1!.merge(
                        TextStyle(
                            color: ColorsRes.white,
                            decoration: TextDecoration.none,
                            height: 1.3,
                            letterSpacing: 0.5,
                            fontFamily: 'MyFont')),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      height: isActive ? 12 : 10,
      width: isActive ? 12 : 10,
      decoration: BoxDecoration(
          color: isActive ? ColorsRes.white : ColorsRes.white.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  openNotificationDialog() {
    showNewDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Notification"),
          content: Text(StringsRes.introdialogmsg),
          actions: [
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
