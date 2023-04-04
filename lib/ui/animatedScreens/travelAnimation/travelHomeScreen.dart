import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/animatedScreens/travelAnimation/models/country.dart';
import 'package:smartkit_pro/ui/animatedScreens/travelAnimation/models/placeDetails.dart';
import 'package:smartkit_pro/utils/convertNumber.dart';
import 'package:video_player/video_player.dart';

const String placeDummyDetails =
    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.";

final List<Country> countries = [
  Country(
    name: "India",
    places: [
      PlaceDetails(
        country: "India",
        name: "Mumbai Park",
        videoPath: "assets/images/animatedScreens/travelAnimation/01.mp4",
        imagePath: "assets/images/animatedScreens/travelAnimation/01.jpg",
        details: placeDummyDetails,
        address: "Borivali, Mumbai",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
      PlaceDetails(
        country: "India",
        name: "Delhi Park",
        videoPath: "assets/images/animatedScreens/travelAnimation/04.mp4",
        imagePath: "assets/images/animatedScreens/travelAnimation/04.jpg",
        details: placeDummyDetails,
        address: "Borivali, Mumbai",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
      PlaceDetails(
        country: "India",
        name: "Bhuj Park",
        videoPath: "assets/images/animatedScreens/travelAnimation/01.mp4",
        imagePath: "assets/images/animatedScreens/travelAnimation/01.jpg",
        details: placeDummyDetails,
        address: "Borivali, Mumbai",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
    ],
  ),
  Country(
    name: "New Zealand",
    places: [
      PlaceDetails(
        country: "New Zealand",
        name: "Auckland Zoo",
        videoPath: "assets/images/animatedScreens/travelAnimation/04.mp4",
        imagePath: "assets/images/animatedScreens/travelAnimation/04.jpg",
        details: placeDummyDetails,
        address: "Borivali, Mumbai",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
      PlaceDetails(
        country: "New Zealand",
        name: "Wellington Zoo",
        videoPath: "assets/images/animatedScreens/travelAnimation/01.mp4",
        imagePath: "assets/images/animatedScreens/travelAnimation/01.jpg",
        details: placeDummyDetails,
        address: "Borivali, Mumbai",
        cost: "\$250",
        distance: "250 KM",
        duration: "5 hrs",
        review: "4.9",
        temperature: "21 C",
      ),
    ],
  ),
];

//height of video container widget, whiteLayerContainer and topVideoLayerContainer
const videoContainerHeightPercentage = 0.625;
//
const videoContainerDetailsHeightPercentage = 0.9;
//
const double videoContainerTextBottomPadding = 20.0;

//
const double placeNameLeftPadding = 30.0;

class TravelHomeScreen extends StatefulWidget {
  const TravelHomeScreen({Key? key}) : super(key: key);

  @override
  _TravelHomeScreenState createState() => _TravelHomeScreenState();
}

class _TravelHomeScreenState extends State<TravelHomeScreen>
    with TickerProviderStateMixin {
  //it will
  final List<GlobalKey<_VideoContainerState>> _videoPlayerKeys = [];

  //to display video in pageView
  final List<VideoPlayerController?> _videoControllers = [];

  //to display video in pageView
  final List<GlobalKey> _coutnryNameKeys = [];

  //to track which place user visited of given country
  //storing placeDetails index
  List<int> currentCountryPlaceIndexs = [];

  late final PageController _pageController = PageController(
    viewportFraction: 0.825,
  );

  //index of current country(place) in pageview
  int currentCountryIndex = 0;

  //currently index of place to show in details
  int detailsCountryPlaceIndex = -1;

  //controller for top layer video contianer
  VideoPlayerController? _videoPlayerController;

  //enable touch on top white and video layer
  bool enableTouchOnTopLayer = false;

  //to show whiteBottom layer
  bool showWhiteLayer = true;

  //to animate country name list
  late AnimationController countriesNameAnimationController =
      AnimationController(
          vsync: this, duration: const Duration(milliseconds: 500));
  late Tween<double> countriesNamePositionTween = Tween(begin: 0.0, end: 0.0);
  late Animation<double> countriesNamePositionAnimation =
      countriesNamePositionTween.animate(CurvedAnimation(
          parent: countriesNameAnimationController, curve: Curves.easeInOut));

  //to animate topVideoLayerContainer
  late final AnimationController _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ))
    ..addListener(addAnimationListener)
    ..addStatusListener(addAnimationStatusListener);

  //to animate topWhiteLayer
  late final AnimationController _whiteLayerAnimationController =
      AnimationController(
          vsync: this,
          duration: const Duration(
            milliseconds: 1150,
          ))
        ..addListener(addWhiteLayerAnimationControllerListener);

  late final AnimationController _placeDetailsOpacityAnimationController =
      AnimationController(
          vsync: this,
          duration: const Duration(
            milliseconds: 500,
          ));

  //late Animation<double> _placeDetailsOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _placeDetailsOpacityAnimationController, curve: Curves.easeInOut));

  //to animate topWhiteLayer
  late final AnimationController _placeStoryViewAnimationController =
      AnimationController(
          vsync: this,
          duration: const Duration(
            milliseconds: 500,
          ));

  late final Animation<double> _placeStoryViewAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _placeStoryViewAnimationController, curve: Curves.easeInOut));

  late final Animation<double> _whiteLayerOpacityUpAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _whiteLayerAnimationController,
          curve: const Interval(0.0, 0.15, curve: Curves.easeInOutExpo)));
  late final Animation<double> _translateWhiteLayerAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _whiteLayerAnimationController,
          curve: const Interval(0.15, 0.85, curve: Curves.easeInOutExpo)));
  late final Animation<double> _whiteLayerOpacityDownAnimation =
      Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
          parent: _whiteLayerAnimationController,
          curve: const Interval(0.85, 1.0, curve: Curves.easeInOut)));

  //topVideoLayer animation
  late final Animation<double> _translateTopVideoLayerAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.15, 1.0, curve: Curves.easeInOutExpo)));
  late final Animation<double> _topVideoLayerPlaceDetailsOpacityAnimation =
      Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.0, 0.3,
              curve: Curves.easeInOutQuart))); //0.0,0.3
  late final Animation<double> _topVideoLayerCountryOpacityAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.6, 1.0, curve: Curves.easeInOutQuart)));

  late final Animation<double> _topVideoLayerTextAlignmentX =
      Tween<double>(begin: 1.0, end: 0.1).animate(CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.5, 1.0, curve: Curves.easeInOut)));
  late final Animation<double> _topVideoLayerTextAlignmentY =
      Tween<double>(begin: 1.0, end: -0.1).animate(CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.5, 1.0, curve: Curves.easeInOut)));

  //button background animations
  late final Animation<double> _buttonBackgroundContainerAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.0, 0.25, curve: Curves.easeInOut)));

  @override
  void initState() {
    initVideoControllers();
    initKeys();
    super.initState();
  }

  void initKeys() {
    for (var i = 0; i < countries.length; i++) {
      _videoPlayerKeys.add(GlobalKey<_VideoContainerState>());
      _coutnryNameKeys.add(GlobalKey());
    }
  }

  //init controllers

  //_videoPlayerController is for topVideoLayerContainer
  void initVideoControllers() {
    try {
      //assgin controller (video)
      _videoPlayerController =
          VideoPlayerController.asset(countries.first.places.first.videoPath)
            ..addListener(addTopLayerVideoListener)
            ..initialize().then((value) {
              setState(() {});
            });

      //add video controller for pageview
      for (var i = 0; i < countries.length; i++) {
        //
        currentCountryPlaceIndexs.add(0);
        _videoControllers.add(
            VideoPlayerController.asset(countries[i].places.first.videoPath)
              ..initialize().then((value) {
                setState(() {
                  //

                  if (_videoControllers.first?.value.isPlaying == false) {
                    Future.delayed(const Duration(milliseconds: 100))
                        .then((value) {
                      _videoControllers.first?.play();
                    });
                  }
                });
              }));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    for (var element in _videoControllers) {
      element?.dispose();
    }
    _videoPlayerController?.dispose();
    _animationController.removeListener(addAnimationListener);
    _animationController.removeStatusListener(addAnimationStatusListener);
    _whiteLayerAnimationController
        .removeListener(addWhiteLayerAnimationControllerListener);
    _whiteLayerAnimationController.dispose();
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void addAnimationListener() {
    if (_animationController.value > 0.15) {
      if (!enableTouchOnTopLayer) {
        setState(() {
          enableTouchOnTopLayer = !enableTouchOnTopLayer;
        });
      }
    }
  }

  //for _animationController
  void addAnimationStatusListener(AnimationStatus animationStatus) {
    if (animationStatus == AnimationStatus.completed) {
      //as soon as animation completed for topVideoLayerContainer
      //video will play for topVideoLayerContainer
      _videoPlayerController?.play();
    }
  }

  //
  void addWhiteLayerAnimationControllerListener() {
    if (_whiteLayerAnimationController.value >= 0.85) {
      //to show white layer animation
      if (showWhiteLayer) {
        //stop at 0.85
        _whiteLayerAnimationController.stop();

        _placeDetailsOpacityAnimationController.forward();

        //showWhiteLayer to false (means we need to hide the white layer)
        showWhiteLayer = !showWhiteLayer;
      }
    }
  }

  //to change video for topVideoLayerContainer
  //this will be call when pageView changes to new index
  void changeTopLayerVideoContainer(String videoPath, bool playVideo) {
    //disposing the controller that contains lod videos
    final oldController = _videoPlayerController;
    //add post framework callback
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      //dispose old video controller
      oldController?.removeListener(addTopLayerVideoListener);
      await oldController?.dispose();
      //assign new video controller
      _videoPlayerController = VideoPlayerController.asset(videoPath)
        ..addListener(addTopLayerVideoListener)
        ..initialize().then((value) {
          setState(() {});
          if (playVideo) {
            _videoPlayerController?.play();
          }
        });
    });
    //set video controller to null
    setState(() {
      _videoPlayerController = null;
    });
  }

  //to change video for pageview container
  void changeCurrentCountryVideo(String videoPath) {
    //remove listener
    _videoPlayerKeys[currentCountryIndex].currentState?.removeListener();

    //disposing the controller that contains old videos
    final oldController = _videoControllers[currentCountryIndex];
    //add post framework callback
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      //dispose old video controller

      await oldController?.dispose();
      //assign new video controller
      _videoControllers[currentCountryIndex] =
          VideoPlayerController.asset(videoPath)
            ..initialize().then((value) {
              _videoPlayerKeys[currentCountryIndex].currentState?.addListener();
              setState(() {});
            });
    });
    //set video controller to null
    setState(() {
      _videoControllers[currentCountryIndex] = null;
    });
  }

  //to display details of place for given country
  void moveToDetailsContainer() {
    //duration from video controller will be start
    Duration? duration = _videoControllers[currentCountryIndex]?.value.duration;

    //change duration of top video layer to duration of in pageview
    _videoPlayerController?.seekTo(duration!);
    //change detailsPlace index to currentCountryIndex
    setState(() {
      detailsCountryPlaceIndex = currentCountryIndex;
    });
    //start animations
    _whiteLayerAnimationController.forward(from: 0.0);
    _animationController.forward();
  }

  //back press event
  void backToHomeContainer() {
    if (_placeStoryViewAnimationController.isCompleted) {
      //move topLayerVideoContainer to zero duration
      _videoPlayerController?.seekTo(Duration.zero);
      _placeStoryViewAnimationController.reverse();
      return;
    }
    if (_animationController.isCompleted) {
      //video player settings
      _videoPlayerController?.seekTo(Duration.zero);
      _videoPlayerController?.pause();

      //hide white container
      _whiteLayerAnimationController.forward(from: 0.85).then((value) {
        showWhiteLayer = !showWhiteLayer;
        _placeDetailsOpacityAnimationController.reverse();
      });

      _animationController.reverse().then((value) {
        //after tapping back button
        setState(() {
          enableTouchOnTopLayer = !enableTouchOnTopLayer;
          detailsCountryPlaceIndex = -1;
        });
        _videoControllers[currentCountryIndex]?.play();
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  //to see video in full view
  void moveToStoryView() {
    _placeStoryViewAnimationController.forward();
  }

  // topLayerVideoContainer listener
  void addTopLayerVideoListener() {
    //means user is in story view
    if (_placeStoryViewAnimationController.isCompleted) {
      //play next place video of this country

      if (_videoPlayerController?.value.position ==
          _videoPlayerController?.value.duration) {
        playNextCountryPlaceVideo();
      }
    } else {
      if (_videoPlayerController?.value.position ==
          _videoPlayerController?.value.duration) {
        _videoPlayerController?.play();
      }
    }
  }

  //In story view
  void playNextCountryPlaceVideo() {
    _videoPlayerController?.removeListener(addTopLayerVideoListener);
    //it will change details of background image and current country index's video container

    if (currentCountryPlaceIndexs[currentCountryIndex] ==
        (countries[currentCountryIndex].places.length - 1)) {
      setState(() {
        currentCountryPlaceIndexs[currentCountryIndex] = 0;
      });
    } else {
      setState(() {
        currentCountryPlaceIndexs[currentCountryIndex] =
            currentCountryPlaceIndexs[currentCountryIndex] + 1;
      });
    }

    changeTopLayerVideoContainer(
        countries[currentCountryIndex]
            .places[currentCountryPlaceIndexs[currentCountryIndex]]
            .videoPath,
        true);
    changeCurrentCountryVideo(countries[currentCountryIndex]
        .places[currentCountryPlaceIndexs[currentCountryIndex]]
        .videoPath);
  }

  //

  Widget _buildHorizontalCountryList() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).size.height * (0.115),
        ),
        height: 30,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          padding: EdgeInsetsDirectional.only(
              start: MediaQuery.of(context).size.width * (0.075)),
          scrollDirection: Axis.horizontal,
          children: countries.map((e) {
            int index = countries.indexOf(e);
            return Container(
                key: _coutnryNameKeys[index],
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Text(
                  e.name,
                  style: TextStyle(
                    color: index == currentCountryIndex
                        ? Colors.white
                        : Colors.white60,
                    fontSize: 16.0,
                  ),
                ));
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        countries[currentCountryIndex]
            .places[currentCountryPlaceIndexs[currentCountryIndex]]
            .imagePath,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _buildTopBlackLayer() {
    return Opacity(
      opacity: 0.5,
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black45,
      ),
    );
  }

  Widget _buildVideoListContainer() {
    return Align(
        alignment: Alignment.topCenter,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height *
                videoContainerHeightPercentage,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * (0.25),
            ),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                //to play only currentCountryIndex video
                _videoControllers[index]?.play();
                _videoControllers[currentCountryIndex]?.pause();

                setState(() {
                  currentCountryIndex = index;
                });
                //
                changeTopLayerVideoContainer(
                    countries[currentCountryIndex]
                        .places[currentCountryPlaceIndexs[currentCountryIndex]]
                        .videoPath,
                    false);
              },
              itemCount: countries.length,
              itemBuilder: (context, index) {
                return Opacity(
                  opacity: index == detailsCountryPlaceIndex ? 0.0 : 1.0,
                  child: VideoContainer(
                    key: _videoPlayerKeys[index],
                    placeDetails: countries[index]
                        .places[currentCountryPlaceIndexs[index]],
                    moveToDetailsContainer: moveToDetailsContainer,
                    videoPlayerController: _videoControllers[index],
                    index: index,
                    currentCountryIndex: currentCountryIndex,
                  ),
                );
              },
            ),
          ),
        ));
  }

  Widget _buildTopLayerVideoContainer() {
    return Align(
      alignment: Alignment.topCenter,
      child: IgnorePointer(
        ignoring: !enableTouchOnTopLayer,
        child: AnimatedBuilder(
          animation: _placeStoryViewAnimationController,
          builder: (context, child) {
            return AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                double topMargin = _translateTopVideoLayerAnimation
                    .drive(Tween<double>(begin: 0.25, end: 0.0))
                    .value;
                double horizontalMargin = _translateTopVideoLayerAnimation
                    .drive(Tween<double>(begin: 0.0875, end: 0.0))
                    .value;
                double height = _translateTopVideoLayerAnimation
                        .drive(Tween<double>(
                            begin: videoContainerHeightPercentage,
                            end: videoContainerDetailsHeightPercentage))
                        .value +
                    0.4 * _placeStoryViewAnimation.value;

                return Opacity(
                  opacity: detailsCountryPlaceIndex == -1 ? 0.0 : 1.0,
                  child: GestureDetector(
                    onTap: () {
                      if (_placeStoryViewAnimationController.isCompleted) {
                        playNextCountryPlaceVideo();
                      } else {
                        moveToStoryView();
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * topMargin,
                        left: MediaQuery.of(context).size.width *
                            horizontalMargin,
                        right: MediaQuery.of(context).size.width *
                            horizontalMargin,
                      ),
                      height: MediaQuery.of(context).size.height * height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0 *
                            (1.0 - _translateTopVideoLayerAnimation.value)),
                      ),
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: _placeStoryViewAnimation.value,
                            child: Container(
                              color: Colors.white60,
                            ),
                          ),
                          _videoPlayerController == null
                              ? Container()
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(25.0 *
                                      (1.0 -
                                          _translateTopVideoLayerAnimation
                                              .value)),
                                  child: VideoPlayer(_videoPlayerController!)),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0 *
                                  (1.0 -
                                      _translateTopVideoLayerAnimation.value)),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.0),
                                  Colors.grey.withOpacity(0.1),
                                  Colors.black.withOpacity(0.7 *
                                      (1.0 -
                                          _translateTopVideoLayerAnimation
                                              .value)),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          _videoPlayerController == null
                              ? Container()
                              : Align(
                                  alignment: Alignment(
                                      -_topVideoLayerTextAlignmentX.value +
                                          (-1.0 *
                                              _placeStoryViewAnimation.value),
                                      _topVideoLayerTextAlignmentY.value +
                                          (1.2 *
                                              _placeStoryViewAnimation.value)),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: placeNameLeftPadding,
                                        bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                videoContainerHeightPercentage *
                                                (0.15) +
                                            videoContainerTextBottomPadding +
                                            10),
                                    child: Text(
                                      countries[currentCountryIndex]
                                          .places[currentCountryPlaceIndexs[
                                              currentCountryIndex]]
                                          .name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                          _videoPlayerController == null
                              ? Container()
                              : Opacity(
                                  opacity: _topVideoLayerCountryOpacityAnimation
                                      .value,
                                  child: Align(
                                    alignment: Alignment(
                                        -_topVideoLayerTextAlignmentX.value +
                                            (-1.0 *
                                                _placeStoryViewAnimation.value),
                                        _topVideoLayerTextAlignmentY.value +
                                            (1.2 *
                                                _placeStoryViewAnimation
                                                    .value)),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 10.0,
                                        left: placeNameLeftPadding + 5,
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                videoContainerHeightPercentage *
                                                (0.075 +
                                                    (0.075 *
                                                        _placeStoryViewAnimation
                                                            .value)),
                                      ),
                                      child: Text(
                                        countries[currentCountryIndex].name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          _videoPlayerController == null
                              ? Container()
                              : Opacity(
                                  opacity:
                                      _topVideoLayerPlaceDetailsOpacityAnimation
                                          .value,
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: placeNameLeftPadding,
                                          bottom:
                                              videoContainerTextBottomPadding),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                videoContainerHeightPercentage *
                                                (0.15),
                                        child: Text(
                                          countries[currentCountryIndex]
                                              .places[currentCountryPlaceIndexs[
                                                  currentCountryIndex]]
                                              .details,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          _videoPlayerController == null
                              ? Container()
                              : Opacity(
                                  opacity: _placeStoryViewAnimation.value,
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        return Container(
                                          padding: EdgeInsets.only(
                                            left: constraints.maxWidth * 0.05,
                                            right: constraints.maxWidth * 0.05,
                                            bottom: 25.0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children:
                                                countries[currentCountryIndex]
                                                    .places
                                                    .map((e) {
                                              return VideoDurationContainer(
                                                videoPlayerController:
                                                    _videoPlayerController,
                                                maxWidth: constraints.maxWidth /
                                                    (countries[currentCountryIndex]
                                                            .places
                                                            .length
                                                            .toDouble() +
                                                        0.5),
                                                currentCountryPlaceIndex:
                                                    currentCountryPlaceIndexs[
                                                        currentCountryIndex],
                                                index: countries[
                                                        currentCountryIndex]
                                                    .places
                                                    .indexOf(e),
                                              );
                                            }).toList(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildTopLayerWhiteContaienr() {
    return Align(
      alignment: Alignment.topCenter,
      child: IgnorePointer(
        ignoring: !enableTouchOnTopLayer,
        child: AnimatedBuilder(
          animation: _placeStoryViewAnimationController,
          builder: (context, child) {
            return AnimatedBuilder(
              animation: _whiteLayerAnimationController,
              builder: (context, child) {
                double topMargin = _translateWhiteLayerAnimation
                        .drive(Tween<double>(begin: 0.25, end: 0.45))
                        .value +
                    videoContainerHeightPercentage *
                        _placeStoryViewAnimation.value;
                double horizontalMargin = _translateWhiteLayerAnimation
                    .drive(Tween<double>(begin: 0.0875, end: 0.0))
                    .value;
                double opacityDown = _whiteLayerOpacityDownAnimation.value;
                if (opacityDown > 0.75 && opacityDown <= 1.0) {
                  opacityDown = 1.0;
                }

                return Opacity(
                  opacity: opacityDown,
                  child: Opacity(
                    opacity: _whiteLayerOpacityUpAnimation.value,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * topMargin,
                        left: MediaQuery.of(context).size.width *
                            horizontalMargin,
                        right: MediaQuery.of(context).size.width *
                            horizontalMargin,
                      ),
                      height: MediaQuery.of(context).size.height *
                          videoContainerHeightPercentage,
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * (0.075),
                      ),
                      child: FadeTransition(
                        opacity: _placeDetailsOpacityAnimationController,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 25.0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      countries[currentCountryIndex]
                                          .places[currentCountryPlaceIndexs[
                                              currentCountryIndex]]
                                          .address,
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: const Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    countries[currentCountryIndex]
                                        .places[currentCountryPlaceIndexs[
                                            currentCountryIndex]]
                                        .review,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              const PlaceDetailsMenu(),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 15.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  countries[currentCountryIndex]
                                      .places[currentCountryPlaceIndexs[
                                          currentCountryIndex]]
                                      .details,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * (0.1),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          countries[currentCountryIndex]
                                              .places[currentCountryPlaceIndexs[
                                                  currentCountryIndex]]
                                              .duration,
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          "Duration",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          countries[currentCountryIndex]
                                              .places[currentCountryPlaceIndexs[
                                                  currentCountryIndex]]
                                              .distance,
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          "Distance",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          countries[currentCountryIndex]
                                              .places[currentCountryPlaceIndexs[
                                                  currentCountryIndex]]
                                              .temperature,
                                          style: const TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text(
                                          "Temperature",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width *
                                        (0.3),
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: Theme.of(context).primaryColor,
                                          width: 1.5,
                                        )),
                                    child: Text(
                                      countries[currentCountryIndex]
                                          .places[currentCountryPlaceIndexs[
                                              currentCountryIndex]]
                                          .cost,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        (0.075),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width *
                                        (0.45),
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    child: const Text(
                                      "Book now",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25.0 *
                                (1.0 - _translateWhiteLayerAnimation.value)),
                            bottomRight: Radius.circular(25.0 *
                                (1.0 - _translateWhiteLayerAnimation.value)),
                            topLeft: const Radius.circular(25.0),
                            topRight: const Radius.circular(25.0)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * (0.035),
          left: 15.0,
        ),
        child: IconButton(
            onPressed: () {
              backToHomeContainer();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
    );
  }

  Widget _buildBackButtonBackground() {
    return Align(
      alignment: Alignment.topLeft,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Opacity(
            opacity: _buttonBackgroundContainerAnimation.value,
            child: GestureDetector(
              onTap: () {
                backToHomeContainer();
              },
              child: Container(
                transformAlignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * (0.035) + 8.0,
                  left: 23.0,
                ),
                height: 32.0,
                width: 32.0,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(7.5),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchButtonBackground() {
    return Align(
      alignment: Alignment.topRight,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Opacity(
            opacity: _buttonBackgroundContainerAnimation.value,
            child: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * (0.035) + 8.0,
                right: 23.0,
              ),
              height: 32.0,
              width: 32.0,
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(7.5),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * (0.035),
          right: 15.0,
        ),
        child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_animationController.isCompleted) {
          backToHomeContainer();
          return Future.value(false);
        }

        return Future.value(true);
      },
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            _buildBackgroundImage(),
            _buildTopBlackLayer(),
            _buildVideoListContainer(),
            _buildHorizontalCountryList(),
            _buildTopLayerVideoContainer(),
            _buildTopLayerWhiteContaienr(),
            _buildBackButtonBackground(),
            _buildBackButton(),
            _buildSearchButtonBackground(),
            _buildSearchButton(),
          ],
        ),
      ),
    );
  }
}

//
class VideoContainer extends StatefulWidget {
  final Function moveToDetailsContainer;
  final VideoPlayerController? videoPlayerController;
  final int currentCountryIndex;
  final PlaceDetails placeDetails;
  final int index;
  const VideoContainer(
      {Key? key,
      required this.placeDetails,
      required this.moveToDetailsContainer,
      required this.videoPlayerController,
      required this.currentCountryIndex,
      required this.index})
      : super(key: key);

  @override
  _VideoContainerState createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  @override
  void initState() {
    super.initState();
    addListener();
  }

  @override
  void dispose() {
    removeListener();
    super.dispose();
  }

  void addListener() {
    widget.videoPlayerController?.addListener(addVideoListener);
  }

  void removeListener() {
    widget.videoPlayerController?.removeListener(addVideoListener);
  }

  void addVideoListener() {
    if (widget.videoPlayerController?.value.position ==
        widget.videoPlayerController?.value.duration) {
      widget.videoPlayerController?.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.moveToDetailsContainer();
        widget.videoPlayerController?.seekTo(Duration.zero);
        widget.videoPlayerController?.pause();
      },
      child: Transform.scale(
        scale: widget.index == widget.currentCountryIndex ? 1.0 : 0.9,
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
          child: Stack(
            children: [
              widget.videoPlayerController == null
                  ? Container()
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: VideoPlayer(widget.videoPlayerController!)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.0),
                      Colors.grey.withOpacity(0.1),
                      Colors.black.withOpacity(0.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: placeNameLeftPadding,
                      bottom: MediaQuery.of(context).size.height *
                              videoContainerHeightPercentage *
                              (0.15) +
                          videoContainerTextBottomPadding +
                          10),
                  child: Text(
                    widget.placeDetails.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: placeNameLeftPadding,
                      bottom: videoContainerTextBottomPadding),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height *
                        videoContainerHeightPercentage *
                        (0.15),
                    child: Text(
                      widget.placeDetails.details,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//to display timeline in storyview
class VideoDurationContainer extends StatefulWidget {
  final double maxWidth; //highest width for container to display time
  final int currentCountryPlaceIndex;
  final int index; //idnex of this videoDurationContainer
  final VideoPlayerController? videoPlayerController;
  const VideoDurationContainer(
      {Key? key,
      required this.videoPlayerController,
      required this.maxWidth,
      required this.currentCountryPlaceIndex,
      required this.index})
      : super(key: key);

  @override
  _VideoDurationContainerState createState() => _VideoDurationContainerState();
}

class _VideoDurationContainerState extends State<VideoDurationContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this);
  late final Animation<double> _animation = Tween<double>(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(
          parent: _animationController, curve: Curves.easeInOut));

  //listener will trigger animation
  void _addVideoListener() {
    if (widget.index == widget.currentCountryPlaceIndex) {
      int? currentDuration =
          widget.videoPlayerController?.value.position.inSeconds;
      int? totalDuration =
          widget.videoPlayerController?.value.duration.inSeconds;

      //convert video duration into 0 to 1 range so can change animationController value
      _animationController.value = ConvertNumber.inRange(
          currentValue: currentDuration!.toDouble(),
          minValue: 0.0,
          maxValue: totalDuration!.toDouble(),
          newMaxValue: 1.0,
          newMinValue: 0.0);
    }
  }

  void addListener() {
    widget.videoPlayerController?.addListener(_addVideoListener);
  }

  void removeListener() {
    widget.videoPlayerController?.removeListener(_addVideoListener);
  }

  @override
  void initState() {
    addListener();
    super.initState();
  }

  @override
  void dispose() {
    removeListener();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.5),
            color: Colors.white60,
          ),
          height: 2.5,
          width: widget.maxWidth,
        ),
        widget.index < widget.currentCountryPlaceIndex
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.5),
                  color: Colors.white,
                ),
                height: 2.5,
                width: widget.maxWidth,
              )
            : Opacity(
                opacity:
                    widget.index == widget.currentCountryPlaceIndex ? 1.0 : 0.0,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.5),
                        color: Colors.white,
                      ),
                      height: 2.5,
                      width: widget.maxWidth * _animation.value,
                    );
                  },
                ),
              ),
      ],
    );
  }
}

class PlaceDetailsMenu extends StatefulWidget {
  const PlaceDetailsMenu({Key? key}) : super(key: key);

  @override
  _PlaceDetailsMenuState createState() => _PlaceDetailsMenuState();
}

class _PlaceDetailsMenuState extends State<PlaceDetailsMenu> {
  int currentSelectedIndex = 0;

  TextStyle _buildTextStyle(int index) {
    return TextStyle(
      color: index == currentSelectedIndex ? Colors.black : Colors.grey,
      fontSize: 16,
      fontWeight:
          index == currentSelectedIndex ? FontWeight.w500 : FontWeight.normal,
    );
  }

  late double inBetweenWdithPercentage = 0.075;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              currentSelectedIndex = 0;
            });
          },
          child: Text(
            "Overview",
            style: _buildTextStyle(0),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * inBetweenWdithPercentage,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              currentSelectedIndex = 1;
            });
          },
          child: Text(
            "Details",
            style: _buildTextStyle(1),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * inBetweenWdithPercentage,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              currentSelectedIndex = 2;
            });
          },
          child: Text(
            "Reviews",
            style: _buildTextStyle(2),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * inBetweenWdithPercentage,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              currentSelectedIndex = 3;
            });
          },
          child: Text(
            "Costs",
            style: _buildTextStyle(3),
          ),
        ),
      ],
    );
  }
}
