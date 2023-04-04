import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:smartkit_pro/ui/fullApps/music/model/music_model.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';

import '../widgets/options.dart';
import '../widgets/seekbar.dart';
import 'package:audio_session/audio_session.dart';
import 'package:rxdart/rxdart.dart';

class PlayMusic extends StatefulWidget {
  MusicModel songDetails;

  PlayMusic({Key? key, required this.songDetails}) : super(key: key);

  @override
  State<PlayMusic> createState() => _PlayMusicState();
}

class _PlayMusicState extends State<PlayMusic> with TickerProviderStateMixin {
  late AnimationController playAndPauseAnimationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  bool animationHandler = false;

  int valueHolder = 20;

  double? valProgress = 2.01;
  String? status = "1", musicStatus = "0";
  final _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      await _player.setAudioSource(
          AudioSource.uri(Uri.parse(widget.songDetails.songURL.toString())));
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.songDetails.imgurl!),
                    fit: BoxFit.fitHeight)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
              child: Container(
                decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 125),
            child: Column(
              children: [
                Hero(
                  tag: "${widget.songDetails.id!}${widget.songDetails.name}",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      widget.songDetails.imgurl!,
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.35,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(widget.songDetails.name!,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(widget.songDetails.artistName!,
                      style: TextStyle(
                        fontSize: 14,
                      )),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Options(whichInfoToBeShown: "Song"),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: StreamBuilder<PositionData>(
                            stream: _positionDataStream,
                            builder: (context, snapshot) {
                              final positionData = snapshot.data;
                              return SeekBar(
                                duration:
                                    positionData?.duration ?? Duration.zero,
                                position:
                                    positionData?.position ?? Duration.zero,
                                bufferedPosition:
                                    positionData?.bufferedPosition ??
                                        Duration.zero,
                                onChangeEnd: _player.seek,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.shuffle),
                        Icon(Icons.skip_previous),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 50,
                          width: 50,
                          child: Center(
                            child: GestureDetector(
                              child: AnimatedIcon(
                                icon: AnimatedIcons.play_pause,
                                progress: playAndPauseAnimationController,
                                size: 40,
                                color: primary,
                              ),
                              onTap: () {
                                if (musicStatus == "0") {
                                  _player.play();
                                  musicStatus = "1";
                                  playAndPauseAnimationController.forward();
                                } else {
                                  _player.pause();
                                  musicStatus = "0";
                                  playAndPauseAnimationController.reverse();
                                }
                                if (animationHandler) {
                                } else {}
                                animationHandler = !animationHandler;
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        Icon(Icons.skip_next),
                        Icon(Icons.repeat),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            top: 40,
            start: 15,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white.withOpacity(0.5),
              ),
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_sharp),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _player.dispose();
    super.dispose();
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }
}
