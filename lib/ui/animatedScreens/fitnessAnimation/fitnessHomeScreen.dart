import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/animatedScreens/fitnessAnimation/models/exercise.dart';
import 'package:smartkit_pro/ui/animatedScreens/fitnessAnimation/widgets/exerciseList.dart';

final Exercise dailyExercise = Exercise(
    level: "4",
    imageUrl: "assets/images/animatedScreens/fitnessAnimation/dailyLesson.jpg",
    numberOfExercise: "5",
    subTitle: "Daily Sessions",
    time: "30 Mins",
    title: "Cardio");

//List of exercise to do Ex. Monday,Tuesday etc
List<Exercise> dayExerciseList = [
  Exercise(
      level: "5",
      imageUrl: "assets/images/animatedScreens/fitnessAnimation/gym-2.jpg",
      numberOfExercise: "4",
      subTitle: "Cardio with weight",
      time: "20 Min",
      title: "Monday"),
  Exercise(
      level: "5",
      imageUrl: "assets/images/animatedScreens/fitnessAnimation/gym-3.jpg",
      numberOfExercise: "4",
      subTitle: "Cardio with weight",
      time: "25 Min",
      title: "Tuesday"),
  Exercise(
      level: "5",
      imageUrl: "assets/images/animatedScreens/fitnessAnimation/gym-2.jpg",
      numberOfExercise: "3",
      subTitle: "Legs",
      time: "10 Min",
      title: "Wednesday")
];

class FitnessHomeScreen extends StatefulWidget {
  const FitnessHomeScreen({Key? key}) : super(key: key);

  @override
  State<FitnessHomeScreen> createState() => _FitnessHomeScreenState();
}

class _FitnessHomeScreenState extends State<FitnessHomeScreen>
    with TickerProviderStateMixin {
  //Duration of exercise container that will be available in selected excercise screen
  int exerciseDetailsContainerAnimationDuration = 400;
  final Color _pageBackgroundColor = Colors.black;
  final Color _appBarIconColor = Colors.white;
  final String _appBarTitle = "MON 07:02";
  final double _appBarHeightPercentage = 0.1125; //Respect to screen height
  final double _bottomNavigationrBarHeightPercentage =
      0.075; //Respect to screen height

  late final AnimationController _hideBottomNavigationAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 500));

  late final Animation<Offset> _hideBottomNavigationAnimation =
      Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 1.0)).animate(
          CurvedAnimation(
              parent: _hideBottomNavigationAnimationController,
              curve: Curves.easeInOut));

  //This animation controller will help to open/close dailySesstion view
  late final AnimationController
      _toggleDailySessionContainerAnimationController = AnimationController(
          vsync: this, duration: const Duration(milliseconds: 800));

  late final Animation<Offset> _hideAppBarContentAnimation =
      Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, -1.5)).animate(
          CurvedAnimation(
              parent: _toggleDailySessionContainerAnimationController,
              curve: const Interval(0.0, 0.5, curve: Curves.easeInOut)));

  late final Animation<double> _dailySessionDetailsAnimation =
      Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
          parent: _toggleDailySessionContainerAnimationController,
          curve: const Interval(0.0, 0.5, curve: Curves.easeInOut)));

  late final Animation<double> _appBarHeightIncreaseAnimation =
      Tween<double>(begin: _appBarHeightPercentage, end: 1.0).animate(
          CurvedAnimation(
              parent: _toggleDailySessionContainerAnimationController,
              curve: const Interval(0.5, 1.0, curve: Curves.easeInOut)));

  //Show daily lesson image after menu open
  late final AnimationController _dailyLessonDetailsAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1500));

  late final Animation<double> _dailyLessonOpacityAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _dailyLessonDetailsAnimationController,
          curve: const Interval(0.0, 0.31, curve: Curves.easeInOut)));

  late final Animation<double> _dailyLessonScaleAnimation =
      Tween<double>(begin: 1.25, end: 1.0).animate(CurvedAnimation(
          parent: _dailyLessonDetailsAnimationController,
          curve: const Interval(0.0, 0.31, curve: Curves.easeInOut)));

  late final Animation<double> _dailyLessonTitleOpacityAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _dailyLessonDetailsAnimationController,
          curve: const Interval(0.31, 0.585, curve: Curves.easeInOut)));

  late final Animation<Offset> _dailyLessonTitleSlideAnimation =
      Tween<Offset>(begin: const Offset(0, 1.0), end: Offset.zero).animate(
          CurvedAnimation(
              parent: _dailyLessonDetailsAnimationController,
              curve: const Interval(0.31, 0.585, curve: Curves.easeInOut)));

  late final Animation<double> _dailyLessonTimeAndLevelOpacityAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _dailyLessonDetailsAnimationController,
          curve: const Interval(0.4, 0.675, curve: Curves.easeInOut)));

  late final Animation<Offset> _dailyLessonTimeAndLevelSlideAnimation =
      Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(
          CurvedAnimation(
              parent: _dailyLessonDetailsAnimationController,
              curve: const Interval(0.4, 0.675, curve: Curves.easeInOut)));

  late final Animation<Offset> _dailyLessonTopMenuAnimation =
      Tween<Offset>(begin: const Offset(0, -1.0), end: Offset.zero).animate(
          CurvedAnimation(
              parent: _dailyLessonDetailsAnimationController,
              curve: const Interval(0.49, 0.7, curve: Curves.easeInOut)));

  late final Animation<Offset> _dailyLessionStartAnimation =
      Tween<Offset>(begin: const Offset(0, 1.0), end: Offset.zero).animate(
          CurvedAnimation(
              parent: _dailyLessonDetailsAnimationController,
              curve: const Interval(0.49, 0.7, curve: Curves.easeInOut)));

  late bool _isExerciseScreenOpen = false;

  late final List<AnimationController>
      _dailyExerciseContainerAnimationControllers = [];

  late Exercise _currentlySelcetedExercise = Exercise(
      level: "level",
      numberOfExercise: "numberOfExercise",
      subTitle: "subTitle",
      imageUrl: "imageUrl",
      time: "time",
      title: "title");

  @override
  void dispose() {
    _toggleDailySessionContainerAnimationController.dispose();
    _hideBottomNavigationAnimationController.dispose();
    _dailyLessonDetailsAnimationController.dispose();
    super.dispose();
  }

  Future<void> _openDailySession(Exercise exercise) async {
    await _toggleDailySessionContainerAnimationController.forward();

    for (var element in _dailyExerciseContainerAnimationControllers) {
      element.dispose();
    }
    _dailyExerciseContainerAnimationControllers.clear();

    for (var i = 0; i < int.parse(exercise.numberOfExercise); i++) {
      _dailyExerciseContainerAnimationControllers.add(AnimationController(
          vsync: this,
          duration: Duration(
              milliseconds: exerciseDetailsContainerAnimationDuration)));
    }
    _isExerciseScreenOpen = true;
    _currentlySelcetedExercise = exercise;

    setState(() {});
    _hideBottomNavigationAnimationController.forward();
    await _dailyLessonDetailsAnimationController.forward();
  }

  //To display number of exercise with exercise title
  Widget _buildDailyLessonDetailsWithTitleContainer(
      String title, String value, double width) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: TextStyle(
                color: _appBarIconColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 16.0),
          ),
        ],
      ),
    );
  }

  Widget _buildAppbar() {
    return AnimatedBuilder(
        animation: _toggleDailySessionContainerAnimationController,
        builder: (context, child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height *
                _appBarHeightIncreaseAnimation.value,
            color: _pageBackgroundColor,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: _toggleDailySessionContainerAnimationController.value >
                          0.5
                      ? const SizedBox()
                      : SlideTransition(
                          position: _hideAppBarContentAnimation,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: _appBarIconColor,
                                  )),
                              const Spacer(),
                              //
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  _appBarTitle,
                                  style: TextStyle(
                                    color: _appBarIconColor,
                                    fontSize: 17.5,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.notifications,
                                    color: _appBarIconColor,
                                  )),
                            ],
                          ),
                        ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height *
                      _appBarHeightPercentage,
                ),
                !_isExerciseScreenOpen
                    ? const SizedBox()
                    : Align(
                        alignment: Alignment.topCenter,
                        child: FadeTransition(
                          opacity: _dailyLessonOpacityAnimation,
                          child: ScaleTransition(
                            scale: _dailyLessonScaleAnimation,
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top),
                              height:
                                  MediaQuery.of(context).size.height * (0.35),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          _currentlySelcetedExercise
                                              .imageUrl))),
                            ),
                          ),
                        ),
                      ),
                !_isExerciseScreenOpen
                    ? const SizedBox()
                    : Align(
                        alignment: Alignment.topCenter,
                        child: ScaleTransition(
                          scale: _dailyLessonScaleAnimation,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).padding.top),
                            height: MediaQuery.of(context).size.height * (0.35),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  _pageBackgroundColor.withOpacity(0.35),
                                  _pageBackgroundColor.withOpacity(0.9)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                !_isExerciseScreenOpen
                    ? const SizedBox()
                    : Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * (0.075),
                            top: MediaQuery.of(context).padding.top +
                                MediaQuery.of(context).size.height * (0.225),
                          ),
                          child: FadeTransition(
                            opacity: _dailyLessonTitleOpacityAnimation,
                            child: SlideTransition(
                              position: _dailyLessonTitleSlideAnimation,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      _currentlySelcetedExercise.title,
                                      style: TextStyle(
                                          color: Colors.grey.withOpacity(0.8),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      _currentlySelcetedExercise.subTitle,
                                      style: TextStyle(
                                          color: _appBarIconColor,
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                !_isExerciseScreenOpen
                    ? const SizedBox()
                    : Align(
                        alignment: Alignment.topCenter,
                        child: FadeTransition(
                          opacity: _dailyLessonTimeAndLevelOpacityAnimation,
                          child: SlideTransition(
                            position: _dailyLessonTimeAndLevelSlideAnimation,
                            child: Container(
                              child: LayoutBuilder(
                                  builder: (context, boxConstraints) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    _buildDailyLessonDetailsWithTitleContainer(
                                        "Exercise",
                                        _currentlySelcetedExercise
                                            .numberOfExercise,
                                        boxConstraints.maxWidth * (0.31)),
                                    _buildDailyLessonDetailsWithTitleContainer(
                                        "Time",
                                        _currentlySelcetedExercise.time,
                                        boxConstraints.maxWidth * (0.31)),
                                    _buildDailyLessonDetailsWithTitleContainer(
                                        "Level",
                                        _currentlySelcetedExercise.level,
                                        boxConstraints.maxWidth * (0.31)),
                                  ],
                                );
                              }),
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).padding.top +
                                      MediaQuery.of(context).size.height *
                                          (0.325)),
                              height:
                                  MediaQuery.of(context).size.height * (0.1),
                              width: MediaQuery.of(context).size.width * (0.85),
                              decoration: BoxDecoration(
                                  color: _appBarIconColor.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                          ),
                        ),
                      ),
                !_isExerciseScreenOpen
                    ? const SizedBox()
                    : SlideTransition(
                        position: _dailyLessonTopMenuAnimation,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * (0.025)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _closeDailySession();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: _appBarIconColor,
                                  )),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.upload,
                                    color: _appBarIconColor,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.bookmark_outline,
                                    color: _appBarIconColor,
                                  )),
                            ],
                          ),
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top +
                                MediaQuery.of(context).size.height * (0.0125),
                          ),
                        ),
                      ),
                !_isExerciseScreenOpen
                    ? const SizedBox()
                    : Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * (0.45) +
                                  MediaQuery.of(context).padding.top),
                          child: ExerciseList(
                            animaitonControllers:
                                _dailyExerciseContainerAnimationControllers,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * (0.5),
                        ),
                      ),
                !_isExerciseScreenOpen
                    ? const SizedBox()
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: SlideTransition(
                          position: _dailyLessionStartAnimation,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "START",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _appBarIconColor,
                                  fontSize: 22.0),
                            ),
                            height:
                                MediaQuery.of(context).size.height * (0.075),
                            width: MediaQuery.of(context).size.width,
                            decoration:
                                BoxDecoration(color: _pageBackgroundColor),
                          ),
                        ),
                      ),
              ],
            ),
          );
        });
  }

  Widget _buildBottomNavigation() {
    return SlideTransition(
      position: _hideBottomNavigationAnimation,
      child: Container(
        color: _pageBackgroundColor,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              CupertinoIcons.home,
              color: _appBarIconColor,
            ),
            Icon(
              CupertinoIcons.add,
              color: _appBarIconColor,
            ),
            Icon(
              CupertinoIcons.headphones,
              color: _appBarIconColor,
            ),
            Icon(
              CupertinoIcons.play,
              color: _appBarIconColor,
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height *
            _bottomNavigationrBarHeightPercentage,
      ),
    );
  }

  Widget _buildDailyLesson() {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          (1.0 -
              _appBarHeightPercentage -
              _bottomNavigationrBarHeightPercentage),
      width: MediaQuery.of(context).size.width,
      child: LayoutBuilder(builder: (context, boxConstraints) {
        return Column(
          children: [
            SizedBox(
              height: boxConstraints.maxHeight * (0.875),
              width: boxConstraints.maxWidth,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      //
                      _openDailySession(dailyExercise);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(dailyExercise.imageUrl))),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedBuilder(
                        animation:
                            _toggleDailySessionContainerAnimationController,
                        builder: (context, child) {
                          return _toggleDailySessionContainerAnimationController
                                      .value >
                                  0.5
                              ? Container()
                              : FadeTransition(
                                  opacity: _dailySessionDetailsAnimation,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            dailyExercise.title,
                                            style: TextStyle(
                                                color: Colors.grey
                                                    .withOpacity(0.8),
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            dailyExercise.subTitle,
                                            style: TextStyle(
                                                color: _appBarIconColor,
                                                fontSize: 25.0,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                        }),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: AnimatedBuilder(
                  animation: _toggleDailySessionContainerAnimationController,
                  builder: (context, _) {
                    return _toggleDailySessionContainerAnimationController
                                .value >
                            0.5
                        ? Container()
                        : FadeTransition(
                            opacity: _dailySessionDetailsAnimation,
                            child: Row(
                              children: [
                                Text(
                                  dailyExercise.time,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: _appBarIconColor,
                                      fontSize: 22.0),
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CupertinoIcons.cloud_upload,
                                      color: _appBarIconColor,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      CupertinoIcons.bookmark,
                                      color: _appBarIconColor,
                                    )),
                              ],
                            ),
                          );
                  }),
            )
          ],
        );
      }),
    );
  }

  Widget _buildExerciseContainer(Exercise exercise) {
    return GestureDetector(
      onTap: () {
        _openDailySession(exercise);
      },
      child: Container(
        child: Column(
          children: [
            //
            Column(
              children: [
                //
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    exercise.time,
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.8),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),

                Transform.translate(
                  offset: const Offset(0, -10.0),
                  child: Row(
                    children: [
                      Text(
                        exercise.subTitle,
                        style: TextStyle(
                            color: _appBarIconColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.cloud_upload,
                            color: _appBarIconColor,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.bookmark,
                            color: _appBarIconColor,
                          )),
                    ],
                  ),
                ),
              ],
            ),

            Transform.translate(
              offset: const Offset(0, -10.0),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(exercise.imageUrl))),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * (0.4),
              ),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 5.0),
      ),
    );
  }

  //
  Widget _buildDayWiseExercises() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children:
            dayExerciseList.map((e) => _buildExerciseContainer(e)).toList(),
      ),
    );
  }

  //Or to display center content except appbar and bottom navigation bar
  Widget _buildGymschedule() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(

          //Need to give top padding so content does not go under bottom navigation bar
          //bottom padding will be bottom nav height
          bottom: MediaQuery.of(context).size.height *
              _bottomNavigationrBarHeightPercentage,
          //Need to give top padding so content does not go under appbar
          //Top padding will be appBar height
          top: MediaQuery.of(context).size.height * _appBarHeightPercentage),
      child: Column(
        children: [
          _buildDailyLesson(),
          _buildDayWiseExercises(),
        ],
      ),
    );
  }

  void _closeDailySession() async {
    for (var controller
        in _dailyExerciseContainerAnimationControllers.reversed) {
      controller.reverse();
      await Future.delayed(Duration(
          milliseconds:
              (exerciseDetailsContainerAnimationDuration * 0.5).toInt()));
    }
    await _dailyLessonDetailsAnimationController.reverse();
    setState(() {
      _isExerciseScreenOpen = false;
    });
    await _hideBottomNavigationAnimationController.reverse();
    await _toggleDailySessionContainerAnimationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_isExerciseScreenOpen) {
          _closeDailySession();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: _pageBackgroundColor,
        body: Stack(
          children: [
            //
            Align(
              alignment: Alignment.topCenter,
              child: _buildGymschedule(),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: _buildAppbar(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildBottomNavigation(),
            ),
          ],
        ),
      ),
    );
  }
}
