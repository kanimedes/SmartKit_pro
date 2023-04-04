import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Login/LoginActivityMobile.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Model/Content_Model.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/StringsRes.dart';

class IntroductionMobile extends StatefulWidget {
  @override
  _IntroductionMobileState createState() => _IntroductionMobileState();
}

class _IntroductionMobileState extends State<IntroductionMobile> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(height: 78),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            alignment: AlignmentDirectional.topStart,
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              contents[i].title!,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: ColorsRes.introTitlecolor,
                                fontSize: 28,
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                        SizedBox(height: 20),
                        Container(
                            alignment: AlignmentDirectional.topStart,
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              contents[i].discription!,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorsRes.introMessagecolor,
                              ),
                            )),
                        SizedBox(height: 30),
                        Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Container(
                              alignment: AlignmentDirectional.topCenter,
                              height: 48,
                              margin: EdgeInsets.only(left: 20),
                              width: 176,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: const [
                                      ColorsRes.secondgradientcolor,
                                      ColorsRes.firstgradientcolor,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    if (currentIndex == contents.length - 1) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => LoginActivityMobile(),
                                        ),
                                      );
                                    }
                                    _controller!.nextPage(
                                      duration: Duration(milliseconds: 100),
                                      curve: Curves.bounceIn,
                                    );
                                  },
                                  child: Text(
                                    currentIndex == contents.length - 1
                                        ? StringsRes.Get_Started_lb
                                        : StringsRes.Next_Button_lb,
                                    style: TextStyle(
                                        fontSize: 18, color: ColorsRes.white),
                                  )),
                            )),
                        SizedBox(height: 30),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              contents.length,
                              (index) => buildDot(index, context),
                            ),
                          ),
                        ),
                        Expanded(
                            child: SvgPicture.asset(
                          contents[i].image!,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.contain,
                        )),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: const [
          ColorsRes.secondgradientcolor,
          ColorsRes.firstgradientcolor,
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      ),
    );
  }
}
