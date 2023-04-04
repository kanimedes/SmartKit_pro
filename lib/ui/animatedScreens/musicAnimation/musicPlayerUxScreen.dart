import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/animatedScreens/musicAnimation/models/track.dart';
import 'package:smartkit_pro/ui/animatedScreens/musicAnimation/widgets/circularButtonContainer.dart';
import 'package:smartkit_pro/utils/convertNumber.dart';
import 'package:smartkit_pro/utils/uiUtils.dart';

//colors
const Color scaffoldBackgroundColor = Color(0xff1c1f3e);
const Color musicCardBackgroundColor = Color(0xff232450);
const Color musicPlayerBackgroundColor = Color(0xff111436);
const Color backButtonBackgroundColor = Color(0xff8085e3);

//most title will be this color
const Color primaryTextColor = Colors.white;
const Color secondaryTextColor = Color(0xff7d8698);

//track duration gradient color
const Color trackDurationFirstGradientColor = Color(0xff5d15b9);
const Color trackDurationSecondGradientColor = Color(0xffe058f7);

//Left to right scroll means scroll direction is forward

//Right to left scroll means scroll direction is reverse

final List<Track> tracks = [
  Track(
      albumName: "Aatma",
      duration: "00:05",
      imageUrl: "assets/images/animatedScreens/musicAnimation/music_a.jpg",
      name: "Indian Rain",
      ratings: 5),
  Track(
      albumName: "Aatma",
      duration: "00:03",
      imageUrl: "assets/images/animatedScreens/musicAnimation/music_b.jpg",
      name: "Kai Zala",
      ratings: 5),
  Track(
      albumName: "Once Again",
      duration: "00:4",
      imageUrl: "assets/images/animatedScreens/musicAnimation/music_c.jpg",
      name: "Sajnave",
      ratings: 5),
];
const String dummyText = """ 

It is a long established fact that a reader will be distracted by the
readable content of a page when looking at its layout. The point of using
Lorem Ipsum is that it has a more-or-less normal distribution of letters, 
as opposed to using 'Content here, content here', making it look like readable English.
Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model
text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over
the years, sometimes by accident, sometimes on purpose (injected humour and the like).
""";

class MusicPlayerUxScreen extends StatefulWidget {
  const MusicPlayerUxScreen({Key? key}) : super(key: key);

  @override
  State<MusicPlayerUxScreen> createState() => _MusicPlayerUxScreenState();
}

class _MusicPlayerUxScreenState extends State<MusicPlayerUxScreen>
    with TickerProviderStateMixin {
  final _pageViewHeightPercentage = 0.58;

  double _currentPage = 0.0;

  //in order to hide the currently selected music card
  int _openedTrackIndex = -1;

  //to check if music card is opened or not
  bool currentTrackOpended = false;

  //To animate the music pageview
  late AnimationController selectedDragCardAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 500));

  //top padding of pageview and currently selected card
  late Animation<double> topPageViewPaddingAnimation =
      Tween<double>(begin: 0.2, end: 0.25).animate(CurvedAnimation(
          parent: selectedDragCardAnimationController,
          curve: Curves.easeInOutExpo));

  //To animate the currently selected track
  //to animate the height, width and padding of selected music card
  late AnimationController currentSelectedTrackAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 800));

  //selected track image height down
  late Animation<double> songImageHeightDownAnimation =
      Tween<double>(begin: 0.4, end: 0.25).animate(CurvedAnimation(
          parent: currentSelectedTrackAnimationController,
          curve: const Interval(0.0, 0.65, curve: Curves.easeInOut)));

  //selected track image height up
  late Animation<double> songImageHeightUpAnimation =
      Tween<double>(begin: 0.0, end: 0.15).animate(CurvedAnimation(
          parent: currentSelectedTrackAnimationController,
          curve: const Interval(0.65, 1.0, curve: Curves.easeInOut)));

  //To animated the selected track content such as music player, album,track name etc
  late AnimationController currentTrackContentAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 800));

  //to rotate the album details and currently selected track image
  late AnimationController albumDetailsAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 600));

  //to animate the currently selected track album detials and it's buttons
  late AnimationController albumDetailsContentAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 600));

  //controller for music pageview
  late final PageController _pageController = PageController(
    viewportFraction: 0.75,
  )..addListener(pageControllerListener);

  //to animate the back button of opended track
  late final AnimationController curentTrackBackButtonAnimationController =
      AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 100));

  void pageControllerListener() {
    //
    setState(() {
      _currentPage = _pageController.page!;
    });
  }

  @override
  void initState() {
    UiUtils.changeStatusBarBrightness(Brightness.light);
    super.initState();
  }

  @override
  void dispose() {
    currentTrackContentAnimationController.dispose();
    currentSelectedTrackAnimationController.dispose();
    selectedDragCardAnimationController.dispose();
    albumDetailsAnimationController.dispose();
    albumDetailsContentAnimationController.dispose();
    curentTrackBackButtonAnimationController.dispose();
    _pageController.removeListener(pageControllerListener);
    _pageController.dispose();
    super.dispose();
  }

  //to handle back button event of opened track container
  void onBackButtonPress() async {
    //
    if (currentTrackOpended) {
      if (albumDetailsAnimationController.isCompleted) {
        albumDetailsContentAnimationController.reverse();
        await Future.delayed(const Duration(milliseconds: 300));
        albumDetailsAnimationController.reverse();
        return;
      }
      //start reverse animation
      currentTrackContentAnimationController.reverse();

      curentTrackBackButtonAnimationController.reverse();
      await Future.delayed(const Duration(milliseconds: 500));
      await currentSelectedTrackAnimationController.reverse();
      setState(() {
        currentTrackOpended = false;
        _openedTrackIndex = -1;
      });
      await selectedDragCardAnimationController.reverse();
    } else {
      Navigator.of(context).pop();
    }
  }

  void openCurrentTrack(int index) async {
    await selectedDragCardAnimationController.forward();
    setState(() {
      _openedTrackIndex = index;
      currentTrackOpended = true;
    });
    currentSelectedTrackAnimationController.forward();
    await Future.delayed(const Duration(milliseconds: 375));
    curentTrackBackButtonAnimationController.forward();
    currentTrackContentAnimationController.forward();
  }

  Widget _buildTracksPageView() {
    return Align(
      alignment: Alignment.topCenter,
      child: AnimatedBuilder(
        animation: selectedDragCardAnimationController,
        builder: (context, child) {
          return Padding(
            child: child,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height *
                  (topPageViewPaddingAnimation.value),
            ),
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height:
              MediaQuery.of(context).size.height * _pageViewHeightPercentage,
          child: PageView.builder(
              clipBehavior: Clip.none,
              controller: _pageController,
              itemCount: tracks.length,
              itemBuilder: (context, index) {
                double pageOffset = 1.0 * (index) - _currentPage;
                //to measure the scale of image
                double scale = 1.0;

                //bottom margin percentage for main contaienr so
                //we can have different height for selected and non-selected container
                double bottomMarginPercentage = 0.0;

                //top margin percentage for dargToListen widget
                double dragToListenTopMarginPercentage = 0.0;
                //opacity for dargToListen widget
                double dragToListenOpacity = 1.0;

                if (pageOffset >= 0) {
                  scale = ConvertNumber.inRange(
                      currentValue: pageOffset,
                      minValue: 0.0,
                      maxValue: 1.0,
                      newMaxValue: 1.5,
                      newMinValue: 1.0);

                  bottomMarginPercentage = ConvertNumber.inRange(
                      currentValue: pageOffset,
                      minValue: 0.0,
                      maxValue: 1.0,
                      newMaxValue: 0.15,
                      newMinValue: 0.0);
                } else {
                  scale = ConvertNumber.inRange(
                      currentValue: pageOffset,
                      minValue: 0.0,
                      maxValue: -1.0,
                      newMaxValue: 1.5,
                      newMinValue: 1.0);

                  bottomMarginPercentage = ConvertNumber.inRange(
                      currentValue: pageOffset,
                      minValue: 0.0,
                      maxValue: -1.0,
                      newMaxValue: 0.15,
                      newMinValue: 0.0);
                }

                //only show drag to listen widget if bottom margin is less than 0.055
                if (bottomMarginPercentage <= 0.055) {
                  dragToListenTopMarginPercentage = ConvertNumber.inRange(
                      currentValue: bottomMarginPercentage,
                      minValue: 0.0,
                      maxValue: 0.055,
                      newMaxValue: 0.0,
                      newMinValue: 0.05);

                  dragToListenOpacity = ConvertNumber.inRange(
                      currentValue: bottomMarginPercentage,
                      minValue: 0.0,
                      maxValue: 0.055,
                      newMaxValue: 0.0,
                      newMinValue: 1.0);
                }

                return LayoutBuilder(builder: (context, boxConstraints) {
                  return GestureDetector(
                    onVerticalDragEnd: (_) async {
                      //to animate the pageview and open next screen
                      if (pageOffset == 0) {
                        openCurrentTrack(index);
                      }
                    },
                    onVerticalDragUpdate: (dragUpdateDetails) {
                      //changes the pagview top padding based on scroll percentage
                      if (pageOffset == 0) {
                        double dragged = dragUpdateDetails.primaryDelta! /
                            MediaQuery.of(context).size.height;

                        selectedDragCardAnimationController.value =
                            selectedDragCardAnimationController.value +
                                3.0 * dragged;
                      }
                    },
                    child: Opacity(
                      opacity: index == _openedTrackIndex ? 0.0 : 1.0,
                      child: Container(
                        padding: const EdgeInsetsDirectional.all(20.0),
                        margin: EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            bottom: boxConstraints.maxHeight *
                                (bottomMarginPercentage)),
                        decoration: BoxDecoration(
                            color: musicCardBackgroundColor,
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 40.0),
                                blurRadius: 45.0,
                                spreadRadius: 20.0,
                                color: Colors.black12,
                              )
                            ],
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [
                            //Album image
                            SizedBox(
                              height: boxConstraints.maxHeight * (0.5),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Transform.scale(
                                    scale: scale,
                                    child: Image.asset(
                                      tracks[index].imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ),

                            SizedBox(
                              height: boxConstraints.maxHeight * (0.035),
                            ),
                            //track name
                            Text(
                              tracks[index].name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: primaryTextColor,
                              ),
                            ),
                            SizedBox(
                              height: boxConstraints.maxHeight * (0.0175),
                            ),
                            //track album namne
                            Text(
                              tracks[index].albumName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: primaryTextColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),

                            SizedBox(
                              height: boxConstraints.maxHeight * (0.0125),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                      tracks[index].ratings, (index) => index)
                                  .map((e) => const Icon(
                                        Icons.star,
                                        color: secondaryTextColor,
                                      ))
                                  .toList(),
                            ),

                            SizedBox(
                              height: boxConstraints.maxHeight *
                                  (dragToListenTopMarginPercentage),
                            ),

                            bottomMarginPercentage >= 0.055
                                ? const SizedBox()
                                : Flexible(
                                    child: Opacity(
                                      opacity: dragToListenOpacity,
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Drag to listen",
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: primaryTextColor,
                                            ),
                                          ),
                                          SizedBox(
                                            height: boxConstraints.maxHeight *
                                                (0.0125),
                                          ),
                                          Transform.rotate(
                                            angle: (pi / 180) * 270,
                                            child: const Icon(
                                              Icons.arrow_back_ios,
                                              size: 18.0,
                                              color: primaryTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
              }),
        ),
      ),
    );
  }

  Widget _buildCurrentTrackImageAndArtistDetailsContainer(
      {required BoxConstraints boxConstraints,
      required double containerHeight}) {
    //
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: albumDetailsAnimationController,
          builder: (context, child) {
            double angle = Tween<double>(begin: 0, end: 180)
                .animate(CurvedAnimation(
                    parent: albumDetailsAnimationController,
                    curve: Curves.easeInOutQuad))
                .value;

            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateY((pi / 180) * (180 - angle)),
              child: IgnorePointer(
                ignoring: angle < 90,
                child: Opacity(
                  opacity: angle < 90 ? 0.0 : 1.0,
                  child: GestureDetector(
                    onTap: () async {
                      albumDetailsContentAnimationController.reverse();

                      await Future.delayed(const Duration(milliseconds: 300));
                      albumDetailsAnimationController.reverse();
                    },
                    child: Container(
                      clipBehavior: Clip.none,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FadeTransition(
                            opacity:
                                Tween<double>(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                parent: albumDetailsContentAnimationController,
                                curve: Curves.easeInOutQuad,
                              ),
                            ),
                            child: SlideTransition(
                              position: Tween<Offset>(
                                      begin: const Offset(0.0, 1.0),
                                      end: Offset.zero)
                                  .animate(
                                CurvedAnimation(
                                  parent:
                                      albumDetailsContentAnimationController,
                                  curve: Curves.easeInOutQuad,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  bottom: boxConstraints.maxHeight *
                                      containerHeight *
                                      (0.025),
                                ),
                                child: Text(
                                  _openedTrackIndex == -1
                                      ? ""
                                      : tracks[_openedTrackIndex].albumName,
                                  style: const TextStyle(
                                      color: primaryTextColor,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          FadeTransition(
                            opacity:
                                Tween<double>(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                parent: albumDetailsContentAnimationController,
                                curve: const Interval(0.25, 1.0,
                                    curve: Curves.easeInOutQuad),
                              ),
                            ),
                            child: SlideTransition(
                              position: Tween<Offset>(
                                      begin: const Offset(0.0, 1.0),
                                      end: Offset.zero)
                                  .animate(
                                CurvedAnimation(
                                  parent:
                                      albumDetailsContentAnimationController,
                                  curve: const Interval(0.25, 1.0,
                                      curve: Curves.easeInOutQuad),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0,
                                    right: 10,
                                    bottom: boxConstraints.maxHeight *
                                        containerHeight *
                                        (0.025)),
                                child: const Text(
                                  dummyText,
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: primaryTextColor,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          FadeTransition(
                            opacity:
                                Tween<double>(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                parent: albumDetailsContentAnimationController,
                                curve: const Interval(0.5, 1.0,
                                    curve: Curves.easeInOutQuad),
                              ),
                            ),
                            child: SlideTransition(
                              position: Tween<Offset>(
                                      begin: const Offset(0.0, 1.0),
                                      end: Offset.zero)
                                  .animate(
                                CurvedAnimation(
                                  parent:
                                      albumDetailsContentAnimationController,
                                  curve: const Interval(0.5, 1.0,
                                      curve: Curves.easeInOutQuad),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                    top: boxConstraints.maxHeight *
                                        containerHeight *
                                        (0.05)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularButtonContainer(
                                        backgroundColor:
                                            musicPlayerBackgroundColor,
                                        iconColor: secondaryTextColor,
                                        iconSize: 20.0,
                                        buttonRadius: 20.0,
                                        iconData: Icons.settings,
                                        onTap: () {}),
                                    CircularButtonContainer(
                                        backgroundColor:
                                            musicPlayerBackgroundColor,
                                        iconColor: secondaryTextColor,
                                        iconSize: 20.0,
                                        buttonRadius: 20.0,
                                        iconData: Icons.bookmark,
                                        onTap: () {}),
                                    CircularButtonContainer(
                                        backgroundColor:
                                            musicPlayerBackgroundColor,
                                        iconColor: secondaryTextColor,
                                        iconSize: 20.0,
                                        buttonRadius: 20.0,
                                        iconData: Icons.upcoming,
                                        onTap: () {}),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                trackDurationFirstGradientColor,
                                trackDurationSecondGradientColor
                              ])),
                      width: boxConstraints.maxWidth * (0.8),
                      height: boxConstraints.maxHeight * (containerHeight),
                    ),
                  ),
                ),
              ),
            );
          },
        ),

        //current track image
        AnimatedBuilder(
          animation: albumDetailsAnimationController,
          builder: (context, child) {
            double angle = 0 +
                Tween<double>(begin: 0, end: 180)
                    .animate(CurvedAnimation(
                        parent: albumDetailsAnimationController,
                        curve: Curves.easeInOutQuad))
                    .value;

            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY((pi / 180) * angle),
              child: IgnorePointer(
                ignoring: angle > 90,
                child: Opacity(
                  opacity: angle > 90 ? 0.0 : 1.0,
                  child: SizedBox(
                    width: boxConstraints.maxWidth * (0.8),
                    height: boxConstraints.maxHeight * (containerHeight),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: _openedTrackIndex == -1
                            ? const SizedBox()
                            : GestureDetector(
                                onTap: () async {
                                  albumDetailsAnimationController.forward();
                                  await Future.delayed(
                                      const Duration(milliseconds: 300));
                                  albumDetailsContentAnimationController
                                      .forward();
                                },
                                child: Image.asset(
                                  tracks[_openedTrackIndex].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              )),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCurrentTrackNameAndAlbumDetailsContainer() {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: currentTrackContentAnimationController,
          curve: const Interval(0.0, 1.0, curve: Curves.easeInOutQuad),
        ),
      ),
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.0, 8.0), end: Offset.zero)
            .animate(
          CurvedAnimation(
            parent: currentTrackContentAnimationController,
            curve: const Interval(0.0, 1.0, curve: Curves.easeInOutQuad),
          ),
        ),
        child: _openedTrackIndex == -1
            ? const SizedBox()
            : Container(
                margin: const EdgeInsets.only(top: 20.0),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * (0.1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tracks[_openedTrackIndex].name,
                      style: const TextStyle(
                          color: primaryTextColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      tracks[_openedTrackIndex].albumName,
                      style: const TextStyle(
                          color: secondaryTextColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildCuttentTrackDurationAndFavoriteButtonContainer() {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: currentTrackContentAnimationController,
          curve: const Interval(0.2, 1.0, curve: Curves.easeInOutQuad),
        ),
      ),
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.0, 8.0), end: Offset.zero)
            .animate(
          CurvedAnimation(
            parent: currentTrackContentAnimationController,
            curve: const Interval(0.2, 1.0, curve: Curves.easeInOutQuad),
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(
            top: 10.0,
            left: MediaQuery.of(context).size.width * (0.1),
            right: MediaQuery.of(context).size.width * (0.1),
          ),
          alignment: Alignment.centerLeft,
          child: Column(
            //crossAxisAlignment: Cros,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: scaffoldBackgroundColor),
                    height: 5.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * (0.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        gradient: const LinearGradient(colors: [
                          trackDurationFirstGradientColor,
                          trackDurationSecondGradientColor
                        ])),
                    height: 5.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              _openedTrackIndex == -1
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "00:00",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: secondaryTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          tracks[_openedTrackIndex].duration,
                          style: const TextStyle(
                              fontSize: 16.0,
                              color: secondaryTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildControlButtons() {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: currentTrackContentAnimationController,
          curve: const Interval(0.4, 1.0, curve: Curves.easeInOutQuad),
        ),
      ),
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.0, 8.0), end: Offset.zero)
            .animate(
          CurvedAnimation(
            parent: currentTrackContentAnimationController,
            curve: const Interval(0.4, 1.0, curve: Curves.easeInOutQuad),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: SvgPicture.asset(
                  "assets/images/animatedScreens/musicAnimation/previous.svg"),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: SvgPicture.asset(
                  "assets/images/animatedScreens/musicAnimation/backword.svg"),
            ),
            Container(
              margin: const EdgeInsets.only(right: 25),
              width: 60,
              height: 60,
              child: Center(
                child: SvgPicture.asset(
                    "assets/images/animatedScreens/musicAnimation/playbutton.svg"),
              ),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 12.5,
                      color: trackDurationFirstGradientColor,
                      offset: Offset(0, 2.5))
                ],
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [
                    trackDurationFirstGradientColor,
                    trackDurationSecondGradientColor
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: SvgPicture.asset(
                  "assets/images/animatedScreens/musicAnimation/forward.svg"),
            ),
            SvgPicture.asset(
                "assets/images/animatedScreens/musicAnimation/next.svg"),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackList() {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: currentTrackContentAnimationController,
          curve: const Interval(0.6, 1.0, curve: Curves.easeInOutQuad),
        ),
      ),
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.0, 8.0), end: Offset.zero)
            .animate(
          CurvedAnimation(
            parent: currentTrackContentAnimationController,
            curve: const Interval(0.6, 1.0, curve: Curves.easeInOutQuad),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              const Text(
                "Tracks",
                style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
              Transform.rotate(
                  alignment: Alignment.center,
                  angle: (pi / 180) * 270,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 17.5,
                    color: primaryTextColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  //Currently selected container will be on top of pageview
  //and will be responsible for next screen animation
  Widget _buildCurrentlySelectedTrackDetailsContainer() {
    return Align(
      alignment: Alignment.topCenter,
      //Music animation controller increase height and width of this container
      child: AnimatedBuilder(
        animation: currentSelectedTrackAnimationController,
        builder: (context, child) {
          return AnimatedBuilder(
            animation: selectedDragCardAnimationController,
            builder: (context, child) {
              final currentTrackOpendedPadding =
                  Tween<double>(begin: 0.0, end: 0.25)
                      .animate(CurvedAnimation(
                          parent: currentSelectedTrackAnimationController,
                          curve: Curves.easeInOutExpo))
                      .value;

              //to animate the top padding of this container
              final topPaddingPercentage = topPageViewPaddingAnimation.value -
                  currentTrackOpendedPadding;

              //to animate the horizontal padding of this container
              final horizontalPaddingPercentage =
                  Tween<double>(begin: 1.0, end: 0.0)
                      .animate(CurvedAnimation(
                          parent: currentSelectedTrackAnimationController,
                          curve: Curves.easeInOutExpo))
                      .value;
              return Padding(
                padding: EdgeInsets.only(
                  //10 pixels is margin of music container which is in pageview
                  left: (MediaQuery.of(context).size.width * (0.125) + 10) *
                      horizontalPaddingPercentage,
                  right: (MediaQuery.of(context).size.width * (0.125) + 10) *
                      horizontalPaddingPercentage,
                  top:
                      MediaQuery.of(context).size.height * topPaddingPercentage,
                ),
                child: IgnorePointer(
                  //we need to ignore this top container in order to handles drag and scroll event in pageview
                  ignoring: !currentTrackOpended,
                  child: Opacity(
                    //if current track is opended then this will be visiable
                    opacity: currentTrackOpended ? 1.0 : 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: musicCardBackgroundColor,

                          //animating the border radius
                          borderRadius: BorderRadius.circular(20.0 -
                              20.0 *
                                  currentSelectedTrackAnimationController
                                      .value)),
                      width: MediaQuery.of(context).size.width,

                      //animating height to full screen height
                      height: MediaQuery.of(context).size.height *
                          (_pageViewHeightPercentage +
                              ((1.0 - _pageViewHeightPercentage) *
                                  currentSelectedTrackAnimationController
                                      .value)),
                      child: LayoutBuilder(builder: (context, boxConstraints) {
                        final currentSongImageHeight =
                            songImageHeightDownAnimation.value +
                                songImageHeightUpAnimation.value;

                        return SingleChildScrollView(
                          child: Column(children: [
                            SizedBox(
                              height: boxConstraints.maxHeight * (0.075),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        (0.05)),
                                child: FadeTransition(
                                  opacity:
                                      curentTrackBackButtonAnimationController,
                                  child: _buildBackButton(
                                      onTap: onBackButtonPress),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: boxConstraints.maxHeight * (0.025),
                            ),
                            _buildCurrentTrackImageAndArtistDetailsContainer(
                                boxConstraints: boxConstraints,
                                containerHeight: currentSongImageHeight),
                            SizedBox(
                              height: boxConstraints.maxHeight * (0.025),
                            ),
                            _buildCurrentTrackNameAndAlbumDetailsContainer(),
                            SizedBox(
                              height: boxConstraints.maxHeight * (0.025),
                            ),
                            _buildCuttentTrackDurationAndFavoriteButtonContainer(),
                            SizedBox(
                              height: boxConstraints.maxHeight * (0.025),
                            ),
                            _buildControlButtons(),
                            SizedBox(
                              height: boxConstraints.maxHeight * (0.025),
                            ),
                            _buildTrackList(),
                          ]),
                        );
                      }),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildBackButton({required Function onTap}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: CircleAvatar(
        radius: 20,
        child: const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Icon(
            Icons.arrow_back_ios,
            size: 17.5,
          ),
        ),
        backgroundColor: backButtonBackgroundColor.withOpacity(0.15),
      ),
    );
  }

  Widget _buildMusicLogoAndBackButton() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * (0.075)),
        child: FadeTransition(
          opacity: Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
              parent: currentSelectedTrackAnimationController,
              curve: const Interval(0.0, 0.5, curve: Curves.easeInOut))),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    child: _buildBackButton(onTap: () {
                      Navigator.of(context).pop();
                    }),
                    padding: EdgeInsets.only(
                        top: 10,
                        left: MediaQuery.of(context).size.width * (0.05)),
                  )),
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                    "assets/images/animatedScreens/musicAnimation/music_logo.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMusicPlayerContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FadeTransition(
        opacity: Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
            parent: currentSelectedTrackAnimationController,
            curve: const Interval(0.0, 0.5, curve: Curves.easeInOut))),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: LayoutBuilder(builder: (context, boxConstraints) {
            return Row(
              children: [
                SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                        "assets/images/animatedScreens/musicAnimation/music_d.jpg"),
                  ),
                  width: boxConstraints.maxWidth * (0.2),
                  height: boxConstraints.maxHeight * (0.75),
                ),
                SizedBox(
                  width: boxConstraints.maxWidth * (0.075),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Aahista Aahista",
                        style: TextStyle(
                            color: primaryTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 7.5,
                    ),
                    Text("Best Of Jagjit Singh",
                        style: TextStyle(
                            color: secondaryTextColor, fontSize: 12.0),
                        textAlign: TextAlign.left),
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 25,
                  child: SvgPicture.asset(
                      "assets/images/animatedScreens/musicAnimation/pause.svg"),
                  backgroundColor: musicCardBackgroundColor,
                ),
              ],
            );
          }),
          margin: EdgeInsets.symmetric(
              vertical: 25.0,
              horizontal: MediaQuery.of(context).size.width * (0.05)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * (0.1125),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: musicPlayerBackgroundColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentTrackOpended) {
          if (albumDetailsAnimationController.isCompleted) {
            albumDetailsContentAnimationController.reverse();
            await Future.delayed(const Duration(milliseconds: 300));
            albumDetailsAnimationController.reverse();
            return Future.value(false);
          }
          //start reverse animation
          curentTrackBackButtonAnimationController.reverse();
          currentTrackContentAnimationController.reverse();
          await Future.delayed(const Duration(milliseconds: 500));
          await currentSelectedTrackAnimationController.reverse();
          setState(() {
            currentTrackOpended = false;
            _openedTrackIndex = -1;
          });
          await selectedDragCardAnimationController.reverse();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: Stack(
          children: [
            _buildMusicLogoAndBackButton(),
            _buildTracksPageView(),
            _buildMusicPlayerContainer(),
            _buildCurrentlySelectedTrackDetailsContainer(),
          ],
        ),
      ),
    );
  }
}
