import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/ui/play_page.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/animation/showdown.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/app_text.dart';
import 'package:smartkit_pro/ui/fullApps/quizApp/widget/custom_box.dart';

class levelPage extends StatefulWidget {
  const levelPage({Key? key}) : super(key: key);

  @override
  State<levelPage> createState() => _levelPageState();
}

class _levelPageState extends State<levelPage> with TickerProviderStateMixin {
  late final List<AnimationController> _appCardAnimationControllers = [];
  @override
  void initState() {
    super.initState();
    initAnimations();
  }

  void initAnimations() {
    for (var i = 0; i < 11; i++) {
      _appCardAnimationControllers.add(AnimationController(
          vsync: this, duration: const Duration(milliseconds: 250)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      width: MediaQuery.of(context).size.width * 0.29,
                    ),
                    AppLargeText(
                      text: "Level",
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GridView.count(
                padding: const EdgeInsets.only(top: 20),
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                childAspectRatio: 1,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: List.generate(10, (index) => index)
                    .map((e) => AppDetailsCard(
                          index: e,
                          animationController: _appCardAnimationControllers[e],
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppDetailsCard extends StatefulWidget {
  final int index;

  final AnimationController animationController;

  const AppDetailsCard({
    Key? key,
    required this.index,
    required this.animationController,
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
          milliseconds: 400 + widget.index * 250,
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
            borderRadius: 20,
            borderWidth: 1,
            width: MediaQuery.of(context).size.width * 0.02,
            height: MediaQuery.of(context).size.height * 0.1,
            childContainerColor: Theme.of(context).scaffoldBackgroundColor,
            mainContainerColor: Color(0xffefbdc1),
            btnpress: true,
            child: Center(
              child: AppText(
                text: "${widget.index + 1}",
                size: 26,
                color: Colors.black,
              ),
            ),
            topmargin: 20,
            leftmargin: 0,
            rightmargin: 0,
            offsetAnimation: Offset(0.025, 0.050),
            bottomPadding: 5,
            rightPadding: 5,
            bottomargin: 0,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (contex) => playPage()));
            },
          ),
        ),
      ),
    );
  }
}
