import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/ui/reward_page.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/utils/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/animation/showdown.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/app_text.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/custom_box.dart';

class playPage extends StatefulWidget {
  const playPage({Key? key}) : super(key: key);

  @override
  State<playPage> createState() => _playPageState();
}

class _playPageState extends State<playPage> with TickerProviderStateMixin {
  int bottomIndex = 0;

  List bottomIcons = [
    "audiencepool.png",
    "fiftyfifty.png",
    "resettime.png",
    "skip.png"
  ];

  List opationText = ["Australia", "england", "India", "west Indies"];

  late final AnimationController lineAnimationController =
      AnimationController(vsync: this, duration: Duration(seconds: 20));

  late final Animation<double> lineanimation = Tween<double>(begin: 1, end: 0)
      .animate(CurvedAnimation(
          parent: lineAnimationController, curve: Curves.easeInOut));

  @override
  void initState() {
    lineAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    lineAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShowDown(
                    delay: 500,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          bottom: MediaQuery.of(context).size.height * 0.05),
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
                            mainContainerColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: Icon(
                              Icons.arrow_back,
                            ),
                            topmargin: 0,
                            leftmargin: 10,
                            rightmargin: 0,
                            offsetAnimation: Offset(0, 0.070),
                            bottomPadding: 5,
                            rightPadding: 0,
                            bottomargin: 0,
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 3),
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.06,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                    width: 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                  color: Color(0xffB6DADF),
                                  border: Border.all(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(18)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: AppLargeText(
                                      text: "1/10",
                                      size: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          customBox(
                            borderRadius: 20,
                            borderWidth: 1,
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.height * 0.06,
                            childContainerColor: Color(0xffefbdc1),
                            mainContainerColor: Color(0xffdb606a),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: AppLargeText(
                                    text: "submit",
                                    size: 18,
                                  ),
                                )
                              ],
                            ),
                            topmargin: 0,
                            leftmargin: 0,
                            rightmargin: 10,
                            btnpress: true,
                            offsetAnimation: Offset(0.02, 0.08),
                            rightPadding: 0,
                            bottomPadding: 3,
                            bottomargin: 0,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contex) => rewardPage()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  ShowDown(
                    delay: 600,
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          height: MediaQuery.of(context).size.height * 0.02,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Color(0xfff1f1f1),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        AnimatedBuilder(
                            animation: lineAnimationController,
                            builder: (context, child) {
                              return Container(
                                width: lineanimation.value *
                                    MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Color(0xff0fa3b8),
                                    borderRadius: BorderRadius.circular(20)),
                              );
                            }),
                      ],
                    ),
                  ),
                  ShowDown(
                    delay: 700,
                    child: customBox(
                      borderRadius: 10,
                      borderWidth: 0.5,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      childContainerColor: Color(0xffB6DADF),
                      mainContainerColor: Color(0xff0fa3b8),
                      leftmargin: 30,
                      rightmargin: 30,
                      topmargin: MediaQuery.of(context).size.height * 0.06,
                      offsetAnimation: Offset(0, 0),
                      bottomPadding: 5,
                      rightPadding: 5,
                      bottomargin: 0,
                      onTap: () {},
                      child: Row(
                        children: const [
                          Flexible(
                              child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              "who won the first ever Cricket world Cup in 1975?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: "ganiser",
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  ShowDown(
                    delay: 800,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: GridView.count(
                        padding: const EdgeInsets.only(top: 20),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                        mainAxisSpacing: 25,
                        crossAxisSpacing: 10,
                        children: List.generate(4, (index) => index)
                            .map(
                              (e) => customBox(
                                  btnpress: true,
                                  borderRadius: 10,
                                  borderWidth: 0.5,
                                  width:
                                      MediaQuery.of(context).size.width * 0.04,
                                  height:
                                      MediaQuery.of(context).size.width * 0.04,
                                  childContainerColor: Color(0xff9fd6b6),
                                  mainContainerColor: Color(0xff24ad5f),
                                  topmargin: 0,
                                  rightmargin: 10,
                                  leftmargin: 10,
                                  offsetAnimation: Offset(0.025, 0.050),
                                  rightPadding: 5,
                                  bottomPadding: 5,
                                  bottomargin: 0,
                                  onTap: () {},
                                  child: Center(
                                    child: AppText(
                                      text: opationText[e],
                                      size: 18,
                                    ),
                                  )),
                            )
                            .toList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ShowDown(
            delay: 900,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) => index)
                        .map(
                          (e) => customBox(
                            borderRadius: 20,
                            borderWidth: 1,
                            width: MediaQuery.of(context).size.width * 0.17,
                            height: MediaQuery.of(context).size.height * 0.06,
                            childContainerColor: Color(0xffB6DADF),
                            mainContainerColor: Color(0xff0fa3b8),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image(
                                image: AssetImage(QuizappConstant.getImagePath(
                                    bottomIcons[e])),
                              ),
                            ),
                            topmargin: 0,
                            leftmargin: 10,
                            rightmargin: 10,
                            btnpress: true,
                            offsetAnimation: Offset(0.00, 0.07),
                            bottomPadding: 5,
                            rightPadding: 0,
                            bottomargin: 0,
                            onTap: () {},
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
