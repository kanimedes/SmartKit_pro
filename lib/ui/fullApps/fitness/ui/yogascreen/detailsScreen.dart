import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/Utils/utlis.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';

class Yogamainscreen extends StatefulWidget {
  final int index;
  const Yogamainscreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<Yogamainscreen> createState() => _YogamainscreenState();
  static Route<dynamic> routes(RouteSettings settings) {
    final argument = settings.arguments as Map;
    return CupertinoPageRoute(
        builder: (_) => Yogamainscreen(
              index: argument["index"],
            ));
  }
}

class _YogamainscreenState extends State<Yogamainscreen> {
  late int _duration = 0;
  late VideoPlayerController _controller;
  bool _isplaying = false;
  late Timer _timer;
  late final _countdowncontroller = CountDownController();
  // ignore: prefer_typing_uninitialized_variables
  var time;
  void _onCOntrollerupdate() {
    final controller = _controller;
    if (controller == null) {
      debugPrint("contoller is empty");
      return;
    }

    _isplaying = true;
  }

  void checkvideo() {
    if (_controller.value.position ==
        Duration(seconds: 0, minutes: 0, hours: 0)) {
      print("no");
    } else if (_controller.value.position == _controller.value.duration) {
      print("yes");
    }
  }

  final List<String> _ids = [
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
  ];

  @override
  void initState() {
    super.initState();
    print("timerr $time");
    print(" current index ${widget.index}");
    print("********");
    print(fitnessUiUtils.getImagePath("workout.mp4"));

    _controller =
        VideoPlayerController.asset(fitnessUiUtils.beginnerworkout[0].videourl)
          ..initialize().then((_) async {
            _controller.addListener(_onCOntrollerupdate);
            _controller.play();
            _duration = _controller.value.position.inSeconds;
            time = _controller.value.duration.inSeconds;

            const oneSec = Duration(seconds: 1);
            _timer = Timer.periodic(
              oneSec,
              (Timer timer) {
                if (time == 1) {
                  setState(() {
                    timer.cancel();
                  });
                } else {
                  setState(() {
                    time--;
                  });
                }
              },
            );
// Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
    //_duration = _controller.value.duration.inSeconds;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget _buildbutton({required String title, required Function ontap}) {
    return GestureDetector(
      onTap: ontap as void Function()?,
      child: Container(
        width: MediaQuery.of(context).size.width * 00.40,
        height: MediaQuery.of(context).size.width * 0.12,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(_duration);
    print("Rebuild");
    return Scaffold(
      body: time == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        alignment: Alignment.bottomCenter,
                        //color: Colors.blue,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Stack(
                          children: [
                            Center(
                              child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(
                                  _controller,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 0,
                              right: 0,
                              child: time == null
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: CurrentDuraioncontainer(
                                          videoPlayerController: _controller,
                                          duration: _controller.value.duration),
                                    ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 00.05,
                    ),
                    Text(
                      fitnessUiUtils.workoutvideo[widget.index].title,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 00.08),
                    time == null
                        ? Container()
                        : CircularCountDownTimer(
                            duration: time,
                            initialDuration: _duration == 0 ? 0 : _duration,
                            controller: _countdowncontroller,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 7,
                            ringColor: Color.fromARGB(255, 255, 255, 255),
                            ringGradient: null,
                            fillColor: const Color(0xff6841FF),
                            fillGradient: null,
                            //backgroundColor: Colors.purple[500],
                            backgroundGradient: null,
                            strokeWidth: 15.0,
                            strokeCap: StrokeCap.round,
                            textStyle: const TextStyle(
                              fontSize: 40.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textFormat: CountdownTextFormat.S,

                            isReverse: true,
                            isReverseAnimation: false,
                            isTimerTextShown: true,
                            autoStart: true,
                            onStart: () {
                              debugPrint('Countdown Started');
                            },
                            onComplete: () {},
                          ),
                    Spacer(),
                    // GestureDetector(
                    //   onTap: () {
                    //     if (_controller.value.isPlaying) {
                    //       _controller.pause();
                    //     } else {
                    //       _controller.play();
                    //     }
                    //     setState(() {});
                    //   },
                    //   child: Container(
                    //     width: MediaQuery.of(context).size.width * 00.40,
                    //     height: MediaQuery.of(context).size.height * 0.05,
                    //     decoration: BoxDecoration(
                    //       color: Theme.of(context).primaryColor,
                    //       borderRadius: BorderRadius.circular(40),
                    //     ),
                    //     child: Center(
                    //         child: Text(
                    //             _controller.value.isPlaying ? "PAUSE" : "PLAY",
                    //             style: TextStyle(color: Colors.white))),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.05,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildbutton(
                          title: "priveous",
                          ontap: () {
                            // widget.index - 1 == 0
                            //     ? () {}
                            //     : Navigator.of(context).pushNamed(
                            //         Routes.mainyoga,
                            //         arguments: {"index": widget.index - 1});
                          },
                        ),
                        _buildbutton(
                            title: "skip",
                            ontap: () {
                              _controller.pause();
                              fitnessUiUtils.workoutvideo.length - 1 ==
                                      widget.index
                                  ? Navigator.of(context)
                                      .pushNamed(Routes.winner)
                                  : Navigator.of(context).pushNamed(
                                      Routes.yoganext,
                                      arguments: {"index": widget.index});
                            }),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ],
                ),
                Positioned(
                  top: 35,
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ],
            ),
    );
  }
}

class CurrentDuraioncontainer extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final Duration duration;
  const CurrentDuraioncontainer({
    Key? key,
    required this.videoPlayerController,
    required this.duration,
  }) : super(key: key);

  @override
  State<CurrentDuraioncontainer> createState() =>
      _CurrentDuraioncontainerState();
}

class _CurrentDuraioncontainerState extends State<CurrentDuraioncontainer> {
  late StreamSubscription<Duration> subscription;
  double currentvalue = 0.0;

  @override
  void initState() {
    widget.videoPlayerController.addListener(() {
      currentDurationlisterne(widget.duration);
    });
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (widget.duration.inSeconds == currentvalue) {
        timer.cancel();
        setState(() {});
      } else {
        currentvalue++;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void currentDurationlisterne(Duration duration) {
    //currentvalue = duration.inSeconds.toDouble();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SliderTheme(
        data: Theme.of(context).sliderTheme.copyWith(
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
              trackHeight: 8,
              trackShape: CustomTrackShape(),
              thumbShape: const RoundSliderThumbShape(
                disabledThumbRadius: 6.5,
              ),
            ),
        child: SizedBox(
          height: 5.0,
          width: MediaQuery.of(context).size.width,
          child: Slider(
            min: 0.0,
            max: (widget.duration.inSeconds.toDouble()),
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Theme.of(context).backgroundColor,
            thumbColor: Theme.of(context).primaryColor,
            value: currentvalue,
            onChanged: (value) {
              currentvalue = value;

              setState(() {});
            },
            label: currentvalue.toString(),
          ),
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
    double additionalActiveTrackHeight = 0,
  }) {
    return Offset(offset.dx, offset.dy) &
        Size(parentBox.size.width, sliderTheme.trackHeight!);
  }
}


// import 'dart:async';
// import 'dart:developer';

// import 'package:circular_countdown_timer/circular_countdown_timer.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:smartkit_pro/ui/fullApps/fitness/Utils/utlis.dart';
// //import 'package:video_player/video_player.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';

// class Yogamainscreen extends StatefulWidget {
//   final int index;
//   const Yogamainscreen({
//     Key? key,
//     required this.index,
//   }) : super(key: key);

//   @override
//   State<Yogamainscreen> createState() => _YogamainscreenState();
//   static Route<dynamic> routes(RouteSettings settings) {
//     final argument = settings.arguments as Map;
//     return CupertinoPageRoute(
//         builder: (_) => Yogamainscreen(index: argument["index"]));
//   }
// }

// class _YogamainscreenState extends State<Yogamainscreen> {
//   late int _duration = 0;
//   //late VideoPlayerController _controller;
//   late YoutubePlayerController _controller;
//   late TextEditingController _idController;
//   late TextEditingController _seekToController;
//   final _scaffolkey = GlobalKey<ScaffoldState>();
//   var time;

//   late PlayerState _playerState;
//   late YoutubeMetaData _videoMetaData;

//   bool _isPlayerReady = false;
//   bool _isplaying = false;

//   late final _countdowncontroller = CountDownController();

//   void _onCOntrollerupdate() {
//     final controller = _controller;
//     if (controller == null) {
//       debugPrint("contoller is empty");
//       return;
//     }
//     //  final playing = _controller.value.isPlaying;
//     time = _controller.value.metaData.duration;
//     _isplaying = true;
//   }

//   final List<String> _ids = [
//     'nPt8bK2gbaU',
//     'gQDByCdjUXw',
//     'iLnmTe5Q2Qw',
//     '_WoCV4c6XOE',
//     'KmzdUe0RSJo',
//     '6jZDSSZZxjQ',
//     'p2lYr3vM_1w',
//     '7QUtEmBT_-w',
//     '34_PXCzGw1M',
//   ];

//   void listener() {
//     if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
//       setState(() {
//         _playerState = _controller.value.playerState;
//         _videoMetaData = _controller.metadata;
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: _ids[widget.index],
//       flags: const YoutubePlayerFlags(
//         mute: false,
//         autoPlay: true,
//         disableDragSeek: false,
//         loop: false,
//         isLive: false,
//         forceHD: false,
//         enableCaption: true,
//       ),
//     )..addListener(listener);
//     print("duration ${_controller.value.metaData.duration.inSeconds}");
//     _duration = _controller.metadata.duration.inSeconds;
//     _idController = TextEditingController();
//     _seekToController = TextEditingController();
//     _videoMetaData = const YoutubeMetaData();
//     _playerState = PlayerState.unknown;
//     setState(() {});
//   }

//   @override
//   void deactivate() {
//     // Pauses video while navigating to next page.
//     _controller.pause();
//     super.deactivate();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _idController.dispose();
//     _seekToController.dispose();
//     super.dispose();
//   }

//   Widget _buildbutton(String title, Function? ontap) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 00.40,
//       height: MediaQuery.of(context).size.width * 0.12,
//       decoration: BoxDecoration(
//         color: Theme.of(context).primaryColor.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(40),
//       ),
//       child: Center(
//           child: TextButton(
//         child: Text(
//           title,
//           style: TextStyle(
//             color: Theme.of(context).primaryColor,
//           ),
//         ),
//         onPressed: ontap as void Function()?,
//       )),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayerBuilder(
//       onExitFullScreen: () {
//         // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
//         SystemChrome.setPreferredOrientations(DeviceOrientation.values);
//       },
//       player: YoutubePlayer(
//         controller: _controller,
//         showVideoProgressIndicator: true,
//         progressIndicatorColor: Colors.blueAccent,
//         topActions: <Widget>[
//           const SizedBox(width: 8.0),
//           Expanded(
//             child: Text(
//               _controller.metadata.title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.0,
//               ),
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//             ),
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.settings,
//               color: Colors.white,
//               size: 25.0,
//             ),
//             onPressed: () {
//               log('Settings Tapped!');
//             },
//           ),
//         ],
//         onReady: () {
//           _isPlayerReady = true;
//         },
//         onEnded: (data) {
//           _controller
//               .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
//           // _showSnackBar('Next Video Started!');
//         },
//       ),
//       builder: (context, player) => SafeArea(
//         child: Scaffold(
//           key: _scaffolkey,
//           body: Stack(
//             children: [
//               Column(children: [
//                 Container(
//                     margin: EdgeInsets.symmetric(horizontal: 0),
//                     height: MediaQuery.of(context).size.height * 0.40,
//                     child: player), // SizedBox(
//                 //   //color: Colors.blue,
//                 //   height: MediaQuery.of(context).size.height * 0.28,
//                 //   child: _controller.value.isInitialized
//                 //       ? Stack(
//                 //           children: [
//                 //             AspectRatio(
//                 //               aspectRatio: _controller.value.aspectRatio,
//                 //               child: VideoPlayer(
//                 //                 _controller,
//                 //               ),
//                 //             ),
//                 //           ],
//                 //         )
//                 //       : Center(child: Text("waiting.....")),
//                 // ),
//                 Text(
//                   _controller.metadata.duration.inSeconds.toString(),
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: MediaQuery.of(context).size.height * 00.07),
//                 CircularCountDownTimer(
//                   duration: time,

//                   initialDuration: _controller.metadata.duration.inSeconds,
//                   controller: _countdowncontroller,
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height / 5,
//                   ringColor: const Color.fromARGB(255, 144, 156, 212),
//                   ringGradient: null,
//                   fillColor: const Color(0xff6841FF),
//                   fillGradient: null,
//                   //backgroundColor: Colors.purple[500],
//                   backgroundGradient: null,
//                   strokeWidth: 15.0,
//                   strokeCap: StrokeCap.round,
//                   textStyle: const TextStyle(
//                     fontSize: 60.0,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textFormat: CountdownTextFormat.S,
//                   isReverse: true,
//                   isReverseAnimation: false,
//                   isTimerTextShown: true,
//                   autoStart: true,
//                   onStart: () {
//                     debugPrint('Countdown Started');
//                   },
//                   onComplete: () {
//                     // Navigator.of(context)
//                     //     .push(MaterialPageRoute(builder: (_) => Yogamainscreen()));
//                   },
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.05,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     _controller.value.isPlaying
//                         ? _controller.pause()
//                         : _controller.play();

//                     setState(() {});
//                   },
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 00.40,
//                     height: MediaQuery.of(context).size.height * 0.05,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).primaryColor,
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     child: Center(
//                         child: Text(
//                             _controller.value.isPlaying ? "PAUSE" : "PLAY",
//                             style: TextStyle(color: Colors.white))),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.05,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     _buildbutton("priveous", () {}),
//                     _buildbutton("skip", () {
//                       _controller.pause();
//                       (fitnessUiUtils.workoutvideo.length) - 1 != widget.index
//                           ? Navigator.of(context).pushNamed(Routes.yoganext,
//                               arguments: {"index": widget.index})
//                           : Navigator.of(context).pushNamed(Routes.winner);
//                     })
//                   ],
//                 )
//               ]),
//               Positioned(
//                 top: 35,
//                 left: 10,
//                 child: IconButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   icon: Icon(Icons.arrow_back_ios),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class CurrentDuraioncontainer extends StatefulWidget {
// //   final VideoPlayerController videoPlayerController;
// //   final Duration duration;
// //   const CurrentDuraioncontainer({
// //     Key? key,
// //     required this.videoPlayerController,
// //     required this.duration,
// //   }) : super(key: key);

// //   @override
// //   State<CurrentDuraioncontainer> createState() =>
// //       _CurrentDuraioncontainerState();
// // }

// // class _CurrentDuraioncontainerState extends State<CurrentDuraioncontainer> {
// //   late StreamSubscription<Duration> subscription;
// //   double currentvalue = 0.0;

// //   @override
// //   void initState() {
// //     widget.videoPlayerController.addListener(() {
// //       currentDurationlisterne(widget.duration);
// //     });
// //     super.initState();
// //   }

// //   @override
// //   void dispose() {
// //     super.dispose();
// //   }

// //   void currentDurationlisterne(Duration duration) {
// //     currentvalue = duration.inSeconds.toDouble();
// //     setState(() {});
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(25.0),
// //       child: SliderTheme(
// //         data: Theme.of(context).sliderTheme.copyWith(
// //             overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
// //             trackHeight: 5,
// //             trackShape: CustomTrackShape(),
// //             thumbShape: const RoundSliderThumbShape(disabledThumbRadius: 6.5)),
// //         child: SizedBox(
// //           height: 5.0,
// //           width: MediaQuery.of(context).size.width,
// //           child: Slider(
// //               min: 0.0,
// //               max: widget.duration.inSeconds.toDouble(),
// //               activeColor: Theme.of(context).primaryColor.withOpacity(0.6),
// //               inactiveColor: Theme.of(context).primaryColor.withOpacity(0.3),
// //               thumbColor: Theme.of(context).colorScheme.secondary,
// //               value: currentvalue,
// //               onChanged: (value) {
// //                 currentvalue = value;

// //                 setState(() {});
// //               }),
// //         ),
// //       ),
// //     );
// //   }
// // }

// class CustomTrackShape extends RoundedRectSliderTrackShape {
//   @override
//   Rect getPreferredRect({
//     required RenderBox parentBox,
//     Offset offset = Offset.zero,
//     required SliderThemeData sliderTheme,
//     bool isEnabled = false,
//     bool isDiscrete = false,
//     double additionalActiveTrackHeight = 0,
//   }) {
//     return Offset(offset.dx, offset.dy) &
//         Size(parentBox.size.width, sliderTheme.trackHeight!);
//   } //
// }