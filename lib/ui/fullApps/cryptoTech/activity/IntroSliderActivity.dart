// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ease_in_widget.dart';

class IntroSliderActivity extends StatefulWidget {
  const IntroSliderActivity({Key? key}) : super(key: key);

  @override
  IntroSliderState createState() => IntroSliderState();
}

class IntroSliderState extends State<IntroSliderActivity> {
  final _controller = PageController();
  late double toppading;
  int currentpage = 0;

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    toppading = 2 * kToolbarHeight;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: ColorsRes.bgcolor,
        bottomNavigationBar: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0, left: 30, right: 30),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          4,
                          (index) => Material(
                                color: currentpage == index
                                    ? ColorsRes.appcolor
                                    : ColorsRes.appcolor.withOpacity(0.3),
                                type: MaterialType.circle,
                                child: Container(
                                  width: 10,
                                  height: 10,
                                  margin: EdgeInsets.only(left: 3, right: 3),
                                ),
                              ))),
                ),
                EaseInWidget(
                  onTap: () {
                    if (currentpage == 3) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginActivity()),
                      );
                    } else {
                      _controller.jumpToPage(currentpage + 1);
                    }
                  },
                  child: DesignConfig.ButtonWithShadowNew(
                      currentpage == 3
                          ? StringsRes.getstarted
                          : StringsRes.next,
                      context),
                ),
              ],
            ),
          ),
        ),
        body: PageView(
          controller: _controller,
          children: <Widget>[
            PageData("assets/images/fullApps/cryptotech/image_a.png",
                StringsRes.introtitle1, StringsRes.intro1, 0),
            PageData("assets/images/fullApps/cryptotech/image_b.png",
                StringsRes.introtitle2, StringsRes.intro2, 1),
            PageData("assets/images/fullApps/cryptotech/image_c.png",
                StringsRes.introtitle3, StringsRes.intro3, 2),
            PageData("assets/images/fullApps/cryptotech/image_d.png", '',
                StringsRes.intro4, 3),
          ],
          onPageChanged: (int pageno) {
            setState(() {
              currentpage = pageno;
            });
          },
        ),
      ),
    );
  }

  Widget PageData(String image, String title, String desc, int pageindex) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        bottom: toppading - 80,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image.asset(
            image,
            height: width - 60,
          ),
          SizedBox(
            height: title.trim().isEmpty ? 0 : 10,
          ),
          title.trim().isEmpty
              ? Container()
              : Text(title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4!.merge(TextStyle(
                        color: ColorsRes.appcolor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MyFont',
                      ))),
          SizedBox(
            height: width / 10,
          ),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Text(
              desc,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.button!.merge(TextStyle(
                  color: ColorsRes.txtlightcolor,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'MyFont')),
            ),
          ),
          SizedBox(
            height: width / 10,
          ),
        ],
      ),
    );
  }
}
