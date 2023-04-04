import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/ui/category_page.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/utils/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/animation/showdown.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/app_text.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/custom_box.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with TickerProviderStateMixin {
  int currentIndex = 0;
  int bottomIndex = 0;

  List boxColors = [Color(0xffB6DADF), Color(0xff9fd6b6), Color(0xffefbdc1)];

  List boxdarkColors = [
    Color(0xff0fa3b8),
    Color(0xff24ad5f),
    Color(0xffdb606a)
  ];

  List categoryImage = ["chemistry.jpg", "maths.jpg", "science.jpg"];

  List categoryName = ["Chemistry", "Maths", "Science"];

  List totalQuestion = [
    "Question :- 250",
    "Question :- 180",
    "Question :- 100"
  ];

  List bottomIcons = [
    Icons.home_filled,
    Icons.chat_bubble_outline,
    Icons.add_box_outlined,
    Icons.file_present
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 20,
                bottom: MediaQuery.of(context).size.height * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShowDown(
                    delay: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          AppLargeText(
                            text: "QuizApp",
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          Spacer(),
                          Icon(
                            Icons.language,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.store,
                            color: Theme.of(context).colorScheme.outline,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  ShowDown(
                    delay: 400,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.15,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                    width: 2),
                                image: DecorationImage(
                                    image: AssetImage(
                                      QuizappConstant.getImagePath("smoke.jpg"),
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppLargeText(
                                text: "Hello James",
                                size: 16,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              AppText(
                                  text: "Let's play different types of Quizs")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  ShowDown(
                    delay: 500,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: AppLargeText(
                        text: "Most Played Quiz",
                        size: 20,
                      ),
                    ),
                  ),
                  ShowDown(
                    delay: 600,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.14,
                            height: MediaQuery.of(context).size.height * 0.14,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.outline),
                              color: boxColors[0],
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                    QuizappConstant.getImagePath("tv.svg"))),
                          ),
                          Container(
                            width: 1,
                            height: MediaQuery.of(context).size.height * 0.05,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.14,
                            height: MediaQuery.of(context).size.height * 0.14,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.outline),
                              color: boxColors[1],
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                    QuizappConstant.getImagePath(
                                        "camera.svg"))),
                          ),
                          Container(
                            width: 1,
                            height: MediaQuery.of(context).size.height * 0.05,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.14,
                            height: MediaQuery.of(context).size.height * 0.14,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Theme.of(context).colorScheme.outline),
                              color: boxColors[2],
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                    QuizappConstant.getImagePath("phone.svg"))),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ShowDown(
                    delay: 700,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: AppLargeText(
                        text: "Continue Play",
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ShowDown(
                    delay: 800,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(3, (index) => index)
                            .map(
                              (e) => continuePlay(
                                  boxColors: boxColors[e],
                                  boxdarkColors: boxdarkColors[e],
                                  categoryImage: categoryImage[e],
                                  categoryName: categoryName[e]),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  ShowDown(
                    delay: 900,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: AppLargeText(
                        text: "You might love this category",
                        size: 20,
                      ),
                    ),
                  ),
                  ShowDown(
                    delay: 1000,
                    child: SingleChildScrollView(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: List.generate(3, (index) => index)
                            .map(
                              (e) => categoryPlay(
                                  boxdarkColors: boxdarkColors[0],
                                  categoryImage: categoryImage[e],
                                  categoryName: categoryName[e],
                                  totalQuestion: totalQuestion[e]),
                            )
                            .toList(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class continuePlay extends StatefulWidget {
  final Color boxColors, boxdarkColors;
  final String categoryImage, categoryName;

  const continuePlay(
      {Key? key,
      required this.boxColors,
      required this.boxdarkColors,
      required this.categoryImage,
      required this.categoryName})
      : super(key: key);

  @override
  State<continuePlay> createState() => _continuePlayState();
}

class _continuePlayState extends State<continuePlay>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late final AnimationController lineAnimationController =
      AnimationController(vsync: this, duration: Duration(seconds: 3));

  late final Animation<double> lineanimation = Tween<double>(begin: 0, end: 70)
      .animate(CurvedAnimation(
          parent: lineAnimationController,
          curve: Interval(0, 0.8, curve: Curves.easeInOut)));

  @override
  void initState() {
    lineAnimationController.forward();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 120),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInQuad);
    super.initState();
  }

  @override
  void dispose() {
    lineAnimationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return customBox(
      borderRadius: 20,
      borderWidth: 1,
      width: MediaQuery.of(context).size.width * 0.76,
      height: MediaQuery.of(context).size.height * 0.14,
      childContainerColor: widget.boxColors,
      mainContainerColor: widget.boxdarkColors,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            width: MediaQuery.of(context).size.width * 0.14,
            height: MediaQuery.of(context).size.height * 0.14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: Theme.of(context).colorScheme.outline, width: 1.5),
              image: DecorationImage(
                  image: AssetImage(
                      QuizappConstant.getImagePath(widget.categoryImage)),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppLargeText(
                text: widget.categoryName,
                size: 18,
              ),
              AppText(
                text: "General knowladge",
                size: 14,
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 5,
                    ),
                    width: 150,
                    height: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.outline)),
                  ),
                  AnimatedBuilder(
                      animation: lineAnimationController,
                      builder: (context, child) {
                        return Container(
                          margin: const EdgeInsets.only(top: 6, left: 1),
                          width: lineanimation.value,
                          height: 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xfff6a16f)),
                        );
                      }),
                ],
              ),
            ],
          )
        ],
      ),
      topmargin: 0,
      leftmargin: 0,
      rightmargin: 10,
      btnpress: true,
      offsetAnimation: Offset(0, 0.045),
      bottomPadding: 6,
      rightPadding: 0,
      bottomargin: 0,
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (contex) => categoryPage()));
      },
    );
  }
}

class categoryPlay extends StatefulWidget {
  final Color boxdarkColors;
  final String categoryImage, categoryName, totalQuestion;

  const categoryPlay(
      {Key? key,
      required this.boxdarkColors,
      required this.categoryImage,
      required this.categoryName,
      required this.totalQuestion})
      : super(key: key);

  @override
  State<categoryPlay> createState() => _categoryPlayState();
}

class _categoryPlayState extends State<categoryPlay>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 120),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInQuad);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 3),
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.14,
      decoration: BoxDecoration(
          color: widget.boxdarkColors,
          border: Border.all(
              color: Theme.of(context).colorScheme.outline, width: 1),
          borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.69,
        height: MediaQuery.of(context).size.height * 0.13,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(
                color: Theme.of(context).colorScheme.outline, width: 1),
            borderRadius: BorderRadius.circular(18)),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  image: DecorationImage(
                      image: AssetImage(
                          QuizappConstant.getImagePath(widget.categoryImage)),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLargeText(
                  text: widget.categoryName,
                  size: 18,
                ),
                SizedBox(
                  height: 5,
                ),
                AppText(
                  text: widget.totalQuestion,
                  size: 12,
                )
              ],
            ),
            Spacer(),
            customBox(
              borderRadius: 10,
              borderWidth: 1,
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.05,
              childContainerColor: Color(0xffB6DADF),
              mainContainerColor: Color(0xff0fa3b8),
              child: Center(
                child: AppLargeText(
                  text: "start",
                  color: Theme.of(context).colorScheme.outline,
                  size: 16,
                ),
              ),
              topmargin: 0,
              leftmargin: 0,
              rightmargin: 10,
              btnpress: true,
              offsetAnimation: Offset(0, 0.11),
              bottomPadding: 5,
              rightPadding: 0,
              bottomargin: 0,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => categoryPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
