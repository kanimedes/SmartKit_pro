import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/Pages/home/play_ground.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/imageConstant.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_text.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({Key? key}) : super(key: key);

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page>
    with TickerProviderStateMixin {
  late final AnimationController animationController =
      AnimationController(vsync: this);

  late final Animation<double> _animation = Tween<double>(begin: 0.6, end: 0.2)
      .animate(CurvedAnimation(
          parent: animationController, curve: Curves.easeInOut));

  late final ScrollController _scrollController = ScrollController()
    ..addListener((scrollListener));

  late final Animation<Offset> _transfromAnimation =
      Tween<Offset>(begin: Offset(3, 0), end: Offset(-140, 0)).animate(
          CurvedAnimation(
              parent: animationController, curve: Curves.easeInOut));

  late final Animation<Offset> _transfromtextAnimation =
      Tween<Offset>(begin: Offset(0, 0), end: Offset(0, -65)).animate(
          CurvedAnimation(
              parent: animationController, curve: Curves.easeInOut));

  late final Animation<double> _transfromheighAnimation =
      Tween<double>(begin: 150, end: 110).animate(CurvedAnimation(
          parent: animationController, curve: Curves.easeInOut));
  void scrollListener() {
    animationController.value = ConvertNumber.inRange(
        currentValue: _scrollController.offset,
        minValue: _scrollController.position.minScrollExtent,
        maxValue: _scrollController.position.maxScrollExtent,
        newMaxValue: 0,
        newMinValue: -140);

    animationController.value = ConvertNumber.inRange(
        currentValue: _scrollController.offset,
        minValue: _scrollController.position.minScrollExtent,
        maxValue: _scrollController.position.maxScrollExtent,
        newMaxValue: 150,
        newMinValue: 110);

    animationController.value = ConvertNumber.inRange(
        currentValue: _scrollController.offset,
        minValue: _scrollController.position.minScrollExtent,
        maxValue: _scrollController.position.maxScrollExtent,
        newMaxValue: 0,
        newMinValue: -65);

    animationController.value = ConvertNumber.inRange(
      currentValue: _scrollController.offset,
      minValue: _scrollController.position.minScrollExtent,
      maxValue: _scrollController.position.maxScrollExtent,
      newMaxValue: 0.6,
      newMinValue: 0.2,
    );

    // }
  }

  @override
  void dispose() {
    _scrollController.removeListener(scrollListener);
    animationController.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(right: 20, left: 20),
              sliver: AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverAppBarDelegate(
                        minHeight: _transfromheighAnimation.value,
                        maxHeight: _transfromheighAnimation.value,
                        child: LayoutBuilder(builder: (context, Boxconstriant) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    AnimatedBuilder(
                                        animation: animationController,
                                        builder: (context, child) {
                                          return Transform.translate(
                                            offset: _transfromAnimation.value,
                                            child: Container(
                                              width: Boxconstriant.maxHeight *
                                                  _animation.value,
                                              height: Boxconstriant.maxHeight *
                                                  _animation.value,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          JobappConstant
                                                              .getImagePath(
                                                                  "smoke.jpg")),
                                                      fit: BoxFit.cover)),
                                            ),
                                          );
                                        }),
                                    SizedBox(
                                      height: Boxconstriant.maxHeight * 0.05,
                                    ),
                                    AnimatedBuilder(
                                        animation: animationController,
                                        builder: (context, child) {
                                          return Transform.translate(
                                            offset:
                                                _transfromtextAnimation.value,
                                            child: AppLargeText(
                                              text: "James Cotter",
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              size: 20,
                                              maxlines: 1,
                                            ),
                                          );
                                        }),
                                    AnimatedBuilder(
                                        animation: animationController,
                                        builder: (context, child) {
                                          return Transform.translate(
                                            offset:
                                                _transfromtextAnimation.value,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                AppText(
                                                  text: "UX Designer",
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary
                                                      .withOpacity(0.6),
                                                  size: 14,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  width: 12,
                                                  height: 12,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.blue),
                                                  child: Icon(
                                                    Icons.check,
                                                    size: 8,
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: AppText(
                                    text: "Edit",
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.6),
                                    size: 14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    );
                  }),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    margin: const EdgeInsets.only(),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.10,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        AppLargeText(
                                          text: "27",
                                          size: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        AppText(
                                          text: "Appllied",
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary
                                              .withOpacity(0.6),
                                          size: 14,
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppLargeText(
                                          text: "19",
                                          size: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        AppText(
                                          text: "Reviewed",
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary
                                              .withOpacity(0.6),
                                          size: 14,
                                        )
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppLargeText(
                                          text: "14",
                                          size: 14,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        AppText(
                                          text: "Interview",
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary
                                              .withOpacity(0.6),
                                          size: 14,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Experience",
                          color: Theme.of(context).colorScheme.secondary,
                          size: 14,
                        ),
                        AppText(
                          text: "See all",
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.6),
                          size: 14,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Container(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.onPrimary),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        JobappConstant.getImagePath(
                                            "fiver.png")))),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppLargeText(
                                text: "UX intern",
                                color: Theme.of(context).colorScheme.secondary,
                                size: 12,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              AppText(
                                  text: "Fiverr",
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.6),
                                  size: 10)
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                text: "San jose, US",
                                color: Theme.of(context).colorScheme.secondary,
                                size: 10,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              AppText(
                                  text: "Dec 20-Feb 21",
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.6),
                                  size: 10)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Education",
                          color: Theme.of(context).colorScheme.secondary,
                          size: 14,
                        ),
                        AppText(
                          text: "See all",
                          color: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.6),
                          size: 14,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Container(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.onPrimary),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(JobappConstant.getImagePath(
                                      "pcscience.png")),
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
                                text: "Computer Science",
                                color: Theme.of(context).colorScheme.secondary,
                                size: 12,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              AppText(
                                  text: "Bachelor | Caltech",
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.6),
                                  size: 10)
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                text: "Pasadena",
                                color: Theme.of(context).colorScheme.secondary,
                                size: 10,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              AppText(
                                  text: "Dec 20-Feb 21",
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.6),
                                  size: 10)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Resume",
                          color: Theme.of(context).colorScheme.secondary,
                          size: 14,
                        ),
                        AppText(
                          text: "Make a resume",
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.6),
                          size: 14,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.onPrimary),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10, left: 20),
                              width: 40,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blue),
                              child: Center(
                                  child: AppText(
                                text: "CV",
                                size: 14,
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Column(
                                children: <Widget>[
                                  AppLargeText(
                                    text: "James Cotter",
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    size: 12,
                                  ),
                                  AppText(
                                    text: "UX Designer",
                                    size: 10,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.6),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10, right: 20),
                              width: 40,
                              height: 20,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blue),
                              child: Center(
                                  child: AppText(
                                text: "PDF",
                                size: 14,
                              )),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, top: 10),
                          child: Text(
                            "A resume summary is a 1-5 sentence introduction at the top of your resume that highlights your most relevant career experience, skills, and achievements. If you have many career highlights, the professional summary for your resume will be longer.A resume summary is a 1-5 sentence introduction at the top of your resume that highlights your most relevant career experience, skills, and achievements. If you have many career highlights, the professional summary for your resume will be longer. ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary
                                    .withOpacity(0.6),
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
/*      Padding(
        padding: EdgeInsets.only(top: MediaQuery
            .of(context)
            .padding
            .top, left: 20),
        child: Icon(
          Icons.arrow_back_ios,
          color: Theme
              .of(context)
              .colorScheme
              .secondary,
        ),
      ),*/
/*      Padding(
        padding: EdgeInsets.only(top: MediaQuery
            .of(context)
            .padding
            .top, right: 20),
        child: AppText(
          text: "Edit",
          color: Theme
              .of(context)
              .colorScheme
              .secondary
              .withOpacity(0.6),
          size: 14,
        ),
      ),*/
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
