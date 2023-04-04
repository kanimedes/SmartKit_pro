// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/LiveVideos/LiveVideoList.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/VideoView/overlay_handler.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController? videoPlayerController;

class LiveVideoDetail extends StatefulWidget {
  @override
  _LiveVideoDetailState createState() => _LiveVideoDetailState();
}

class _LiveVideoDetailState extends State<LiveVideoDetail> {
  double aspectRatio = 16 / 9;
  bool isshowappbar = true;
  bool showplaypausebtn = false;
  bool isfullscreen = false;

  _initVideo() {
    videoPlayerController = VideoPlayerController.network(
      selectedlivevideo.link!,
    );
    videoPlayerController!.setLooping(true);

    videoPlayerController!
      ..initialize().then((value) {
        showplaypausebtn = true;
        setState(() {
          aspectRatio = videoPlayerController!.value.aspectRatio;
        });
        videoPlayerController!.play();
      });
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    Provider.of<OverlayHandlerProvider>(context, listen: false)
        .removeOverlay(context);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Provider.of<OverlayHandlerProvider>(context, listen: false)
            .removeOverlay(context);
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(children: [
            _buildVideoPlayer(),
            Expanded(child: videoInfoWidget()),
            //if (!isfullscreen) Expanded(child: videoInfoWidget()),
          ]),
        ),
      ),
    );
  }

  Widget videoInfoWidget() {
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          Text(
            selectedlivevideo.title!,
            style: Theme.of(context).textTheme.subtitle1!.merge(
                TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
          ),
          Text(
            selectedlivevideo.description!,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .merge(TextStyle(color: ColorsRes.grey)),
          ),
        ]);
  }

  Widget _buildVideoPlayer() {
    return Consumer<OverlayHandlerProvider>(
        builder: (context, overlayProvider, _) {
      return Stack(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            color: Colors.black,
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: VideoPlayer(
                videoPlayerController!,
              ),
            ),
          ),
          if (!overlayProvider.inPipMode)
            Positioned(
              top: 8.0,
              left: 8.0,
              child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down),
                  color: Colors.white,
                  onPressed: () {
                    Provider.of<OverlayHandlerProvider>(context, listen: false)
                        .enablePip(aspectRatio);
                  }),
            ),
          if (overlayProvider.inPipMode)
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Provider.of<OverlayHandlerProvider>(context, listen: false)
                      .disablePip();
                },
                child: Container(),
              ),
            ),
          VideoProgressIndicator(
            videoPlayerController!,
            allowScrubbing: true,
            colors: VideoProgressColors(
                backgroundColor: ColorsRes.grey.withOpacity(0.5),
                bufferedColor: ColorsRes.grey,
                playedColor: ColorsRes.appcolor),
          ),
          if (showplaypausebtn)
            ButtonClickAnimation(
              onTap: () {
                setState(() {
                  videoPlayerController!.value.isPlaying
                      ? videoPlayerController!.pause()
                      : videoPlayerController!.play();
                });
              },
              child: CircleAvatar(
                backgroundColor: ColorsRes.white.withOpacity(0.5),
                child: Icon(
                  videoPlayerController!.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                ),
              ),
            ),
          if (overlayProvider.inPipMode)
            Positioned.fill(
              child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Provider.of<OverlayHandlerProvider>(context,
                              listen: false)
                          .removeOverlay(context);
                    },
                    child: Icon(
                      Icons.clear,
                      color: ColorsRes.grey,
                    ),
                  )),
            ),
        ],
      );
    });
  }
}
