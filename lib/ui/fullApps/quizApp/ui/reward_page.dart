import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/ui/home_page.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/ui/level_page.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/utils/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/animation/showdown.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/app_text.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/custom_box.dart';

class rewardPage extends StatefulWidget {
  const rewardPage({Key? key}) : super(key: key);

  @override
  State<rewardPage> createState() => _rewardPageState();
}

class _rewardPageState extends State<rewardPage> with TickerProviderStateMixin {
  late final AnimationController lineAnimationController =
      AnimationController(vsync: this, duration: Duration(seconds: 20));

  late final Animation<double> lineanimation = Tween<double>(begin: 1, end: 30)
      .animate(CurvedAnimation(
          parent: lineAnimationController, curve: Curves.easeInOut));

  List scoreImage = ["score.png", "check.png", "close.png"];

  List scoreCorrect = ["56", "6", "4"];

  List title = ["score", "correct", "incorrect"];

  List indexCorrect = ["1", "0", "1", "1", "1", "0", "0", "1", "1", "0"];

  @override
  void initState() {
    lineAnimationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+10),
              child: ShowDown(
                delay: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customBox(
                        borderRadius: 20,
                        borderWidth: 1,
                        width: MediaQuery.of(context).size.width * 0.12,
                        height: MediaQuery.of(context).size.height * 0.06,
                        btnpress: true,
                        childContainerColor: Color(0xff9fd6b6),
                        mainContainerColor: Theme.of(context).scaffoldBackgroundColor,
                        child: Icon(
                          Icons.arrow_back,
                        ),
                        topmargin: 0,
                        leftmargin: 10,
                        rightmargin: 0,
                        offsetAnimation: Offset(0,0.070),
                        bottomPadding: 5,
                        rightPadding: 0,
                        bottomargin: 0, onTap: (){Navigator.push(context,
                        MaterialPageRoute(builder: (contex) => homePage()));},),

                    AppLargeText(text: "result"),
                    Container(
                      padding: const EdgeInsets.only(bottom: 3),
                      margin: const EdgeInsets.only(right: 10),
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            color: Color(0xff9fd6b6),
                            border: Border.all(
                                color: Theme.of(context).colorScheme.outline,
                                width: 1),
                            borderRadius: BorderRadius.circular(18)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: AppLargeText(
                                text: "6/10",
                                size: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ShowDown(
              delay: 600,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.22,
                height: MediaQuery.of(context).size.height * 0.10,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black),
                    image: DecorationImage(
                        image:
                            AssetImage(QuizappConstant.getImagePath("smoke.jpg")),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            ShowDown(
              delay: 700,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(3, (index) => index)
                    .map((e) => Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(left: 30, right: 30),
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffefbdc1),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Image(
                                image: AssetImage(
                                    QuizappConstant.getImagePath(scoreImage[e])),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(text: scoreCorrect[e]),
                            SizedBox(
                              height: 5,
                            ),
                            AppText(text: title[e])
                          ],
                        ))
                    .toList(),
              ),
            ),
            ShowDown(
              delay: 800,
              child: customBox(
                borderRadius: 10,
                borderWidth: 1,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
                childContainerColor: Color(0xffB6DADF),
                mainContainerColor: Color(0xff0fa3b8),
                topmargin: MediaQuery.of(context).size.height * 0.04,
                leftmargin: 20,
                rightmargin: 20,
                offsetAnimation: Offset(0, 0),
                bottomPadding: 5,
                rightPadding: 5,
                bottomargin: 0,
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      AppLargeText(
                        text: "Result of Maths Question",
                        size: 16,
                      ),
                      Wrap(
                        children: List.generate(10, (index) => index)
                            .map((e) => Container(
                                  padding: const EdgeInsets.all(7),
                                  margin:
                                      const EdgeInsets.only(left: 10, right: 10),
                                  width: MediaQuery.of(context).size.width * 0.09,
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: indexCorrect[e] == "1"
                                          ? Color(0xff9fd6b6)
                                          : Color(0xffefbdc1),
                                      border: Border.all(color: Colors.black)),
                                  child: Image(
                                    image: AssetImage(indexCorrect[e] == "1"
                                        ? QuizappConstant.getImagePath(
                                            "check.png")
                                        : QuizappConstant.getImagePath(
                                            "close.png")),
                                  ),
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            ShowDown(
              delay: 900,
              child: customBox(
                  borderRadius: 10,
                  borderWidth: 1,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  childContainerColor: Color(0xffCCF3EE),
                  mainContainerColor: Color(0xff97C4B8),
                  child: Center(
                    child: AppLargeText(
                      text: "next level",
                    ),
                  ),
                  topmargin: MediaQuery.of(context).size.height * 0.04,
                  leftmargin: MediaQuery.of(context).size.width * 0.16,
                  rightmargin: MediaQuery.of(context).size.width * 0.16,
                  btnpress: true,
                  offsetAnimation: Offset(0.015, 0.050),
                  bottomPadding: 5,
                  rightPadding: 5,
                  bottomargin: 0, onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => levelPage()));
              },),
            ),
            ShowDown(
              delay: 1000,
              child: customBox(
                  borderRadius: 10,
                  borderWidth: 1,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  childContainerColor: Color(0xffefbdc1),
                  mainContainerColor: Color(0xffdb606a),
                  child: Center(
                    child: AppLargeText(
                      text: "home",
                    ),
                  ),
                  topmargin: 20,
                  leftmargin: MediaQuery.of(context).size.width * 0.16,
                  rightmargin: MediaQuery.of(context).size.width * 0.16,
                  btnpress: true,
                  offsetAnimation: Offset(0.015, 0.050),
                  bottomPadding: 5,
                  rightPadding: 5,
                  bottomargin: 0, onTap: (){Navigator.push(context,
                  MaterialPageRoute(builder: (contex) => homePage()));},),
            ),
          ],
        ),
      ),
    );
  }
}
