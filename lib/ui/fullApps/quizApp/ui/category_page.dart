// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/ui/level_page.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/utils/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/animation/showdown.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/app_text.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/custom_box.dart';

class categoryPage extends StatefulWidget {
  const categoryPage({Key? key}) : super(key: key);

  @override
  State<categoryPage> createState() => _categoryPageState();
}

class _categoryPageState extends State<categoryPage>
    with TickerProviderStateMixin {
  late final List<AnimationController> _appCardAnimationControllers = [];

  List categoryName = [
    "Mathematics",
    "Chemistry",
    "Science",
    "Mathematics",
    "Chemistry",
    "Science"
  ];

  List points = ["5", "10", "6", "5", "10", "6"];

  List discription = [
    "The questions are based from different topics. Care has been taken to solve the questions in such a way that students can understand each and every step",
    "The science of chemistry is the study of matter’s characteristics and behaviour answers to your toughest chemistry homework questions with detailed step by step explanations",
    "A good scientific question should be objective and testable. It may be a verification question, theory question, or experimental question",
    "The questions are based from different topics. Care has been taken to solve the questions in such a way that students can understand each and every step",
    "The science of chemistry is the study of matter’s characteristics and behaviour answers to your toughest chemistry homework questions with detailed step by step explanations",
    "A good scientific question should be objective and testable. It may be a verification question, theory question, or experimental question"
  ];

  List categoryImage = [
    "maths.jpg",
    "chemistry.jpg",
    "science.jpg",
    "maths.jpg",
    "chemistry.jpg",
    "science.jpg"
  ];

  void initAnimations() {
    for (var i = 0; i < categoryImage.length; i++) {
      _appCardAnimationControllers.add(AnimationController(
          vsync: this, duration: const Duration(milliseconds: 700)));
    }
  }

  @override
  void initState() {
    super.initState();
    initAnimations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ShowDown(
              delay: 500,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 10),
                child: Row(
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    AppLargeText(text: "Category"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ShowDown(
                delay: 700,
                child: Column(
                  children: List.generate(
                      6,
                      (i) => AppDetailsCard(
                            index: i,
                            animationController:
                                _appCardAnimationControllers[i],
                            categoryName: categoryName[i],
                            points: points[i],
                            discription: discription[i],
                            categoryImage: categoryImage[i],
                          )).toList(),
                )),
          ],
        ),
      ),
    );
  }
}

class AppDetailsCard extends StatefulWidget {
  final int index;
  final categoryImage, categoryName, points, discription;
  final AnimationController animationController;

  const AppDetailsCard({
    Key? key,
    required this.index,
    required this.animationController,
    this.categoryImage,
    this.categoryName,
    this.points,
    this.discription,
  }) : super(key: key);

  @override
  State<AppDetailsCard> createState() => _AppDetailsCardState();
}

class _AppDetailsCardState extends State<AppDetailsCard> {
  late final Animation<Offset> _cardSlideAnimation =
      Tween<Offset>(begin: const Offset(0.0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
              parent: widget.animationController, curve: Curves.easeInOut));

  late final Animation<double> _cardFadeAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController, curve: Curves.easeInOut));

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(
          milliseconds: 550 + widget.index * 250,
        ), () {
      widget.animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _cardFadeAnimation,
      child: SlideTransition(
        position: _cardSlideAnimation,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height *
              0.28, //MediaQuery.of(context).size.height * (0.15),
          child: customBox(
              onTap: () {},
              borderRadius: 12,
              borderWidth: 1,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.24,
              childContainerColor: Theme.of(context).scaffoldBackgroundColor,
              mainContainerColor: Color(0xff9e8bf7),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.11,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                image: AssetImage(
                                  QuizappConstant.getImagePath(
                                      widget.categoryImage),
                                ),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.06,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(
                            text: widget.categoryName,
                            size: 20,
                          ),
                          AppText(
                            text: "4 months ago",
                            size: 14,
                          )
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage(
                                  QuizappConstant.getImagePath("badge.png")),
                              width: MediaQuery.of(context).size.width * 0.06,
                              height: MediaQuery.of(context).size.height * 0.06,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: widget.points + " point",
                              size: 12,
                              color: Colors.black,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      widget.discription,
                      style: TextStyle(
                        fontFamily: "ganiser",
                      ),
                      maxLines: 3,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Divider(
                      height: 0,
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (contex) => levelPage()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        /*     height: MediaQuery.of(context).size.height*0.062,*/
                        decoration: BoxDecoration(
                            color: Color(0xffc6bbfa).withOpacity(0.6),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                  image: AssetImage(
                                    QuizappConstant.getImagePath("start.png"),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.06,
                                  height: MediaQuery.of(context).size.height *
                                      0.06),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
                              ),
                              AppLargeText(
                                text: "Let's start game",
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              topmargin: 20,
              leftmargin: 10,
              rightmargin: 10,
              offsetAnimation: Offset(0, 0),
              bottomPadding: 4,
              rightPadding: 4,
              bottomargin: 0),
        ),
      ),
    );
  }
}
