import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:octo_image/octo_image.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_session/audio_session.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/model/HomeModel.dart';

import 'common.dart';

class PlayMeditationActivity extends StatefulWidget {
  int? index;
  PlayMeditationActivity({Key? key, this.index}) : super(key: key);

  @override
  State<PlayMeditationActivity> createState() => _PlayMeditationActivityState();
}

class _PlayMeditationActivityState extends State<PlayMeditationActivity> {
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
      await _player.setAudioSource(AudioSource.uri(Uri.parse(
          "https://www.mediacollege.com/downloads/sound-effects/nature/forest/rainforest-ambient.mp3")));
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    _player.dispose();
    super.dispose();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      _player.stop();
    }
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            setState(() {
              if (status == "1") {
                status = "0";
              } else {
                status = "1";
              }
            });
          },
          child: Stack(children: [
            OctoImage(
              image: CachedNetworkImageProvider(
                homeList[widget.index!].imgurl!,
              ),
              placeholderBuilder: OctoPlaceholder.blurHash(
                homeList[widget.index!].hash!,
              ),
              errorBuilder: OctoError.icon(color: ColorsRes.black),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            status == "1"
                ? Container(
                    color: ColorsRes.black.withOpacity(0.55),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  )
                : Container(
                    decoration: DesignConfig.buttonShadowColor(
                        ColorsRes.gradientColor1.withOpacity(0.75),
                        0.0,
                        ColorsRes.gradientColor2.withOpacity(0.75),
                        ColorsRes.gradientColor3.withOpacity(0.75)),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
            status == "1"
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 15,
                          ),
                          child: Text(
                            homeList[widget.index!].name!,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                              color: ColorsRes.white,
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              fontFamily: "TrebuchetMS",
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: Text(
                            "Stretching",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorsRes.white,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Lato",
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 3.9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: ColorsRes.backgroundColor
                                      .withOpacity(0.55),
                                  child: SvgPicture.asset(
                                      "assets/images/fullApps/meditationApp/backward.svg")),
                              SizedBox(width: 10.0),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (musicStatus == "0") {
                                        _player.play();
                                        musicStatus = "1";
                                      } else {
                                        _player.pause();
                                        musicStatus = "0";
                                      }
                                    });
                                  },
                                  child: CircleAvatar(
                                      radius: 50.0,
                                      backgroundColor: ColorsRes.backgroundColor
                                          .withOpacity(0.55),
                                      child: musicStatus == "0"
                                          ? SvgPicture.asset(
                                              "assets/images/fullApps/meditationApp/play.big.svg")
                                          : SvgPicture.asset(
                                              "assets/images/fullApps/meditationApp/pause.big.svg"))),
                              SizedBox(width: 10.0),
                              CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: ColorsRes.backgroundColor
                                      .withOpacity(0.55),
                                  child: SvgPicture.asset(
                                      "assets/images/fullApps/meditationApp/forward.svg")),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 5),
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
                        /*Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("01:01",textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: ColorsRes.white,
                            fontWeight: FontWeight.normal,fontFamily: "Lato",),),
                        Text("05:45",textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: ColorsRes.white,
                            fontWeight: FontWeight.normal,fontFamily: "Lato",),),
                      ],
                    ),
                  ),*/
                        Padding(
                          padding: EdgeInsets.only(
                              right: 20.0,
                              top: MediaQuery.of(context).size.height / 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                  radius: 19.0,
                                  backgroundColor: ColorsRes.backgroundColor
                                      .withOpacity(0.55),
                                  child: SvgPicture.asset(
                                      "assets/images/fullApps/meditationApp/fav.svg")),
                              SizedBox(width: 10.0),
                              CircleAvatar(
                                  radius: 19.0,
                                  backgroundColor: ColorsRes.backgroundColor
                                      .withOpacity(0.55),
                                  child: SvgPicture.asset(
                                      "assets/images/fullApps/meditationApp/share.svg")),
                            ],
                          ),
                        ),
                        /*GestureDetector(
                    onTap:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              LoginActivity(),
                        ),
                      );
                    },
                    child: Align(alignment: Alignment.center,
                      child: Container(alignment: Alignment.center, margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.7),height: MediaQuery.of(context).size.height/14,
                        width: MediaQuery.of(context).size.width/1.35,
                        decoration: DesignConfig.buttonShadowColor(ColorsRes.gradientColor1, 30.0, ColorsRes.gradientColor2, ColorsRes.gradientColor3),child: Text(StringsRes.startDailyMeditation.toUpperCase(),textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.normal),),),
                    ),
                  ),*/
                      ])
                : Container(
                    alignment: Alignment.center,
                    child: Text(
                      homeList[widget.index!].duration!,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        color: ColorsRes.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        fontFamily: "TrebuchetMS",
                      ),
                    ),
                  ),
            status == "1"
                ? GestureDetector(
                    onTap: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 15.9,
                            left: MediaQuery.of(context).size.width / 16),
                        child: Icon(Icons.clear, color: ColorsRes.white)))
                : Container(),
          ]),
        ),
      ),
    );
  }
}
