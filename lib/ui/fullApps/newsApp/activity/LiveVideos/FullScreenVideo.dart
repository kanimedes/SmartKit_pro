import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/LiveVideos/LiveVideoDetail.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/VideoView/overlay_handler.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideo extends StatefulWidget {
  @override
  _FullScreenVideoState createState() => _FullScreenVideoState();
}

class _FullScreenVideoState extends State<FullScreenVideo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OverlayHandlerProvider>(
        builder: (context, overlayProvider, _) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: videoPlayerController!.value.size.width,
                height: videoPlayerController!.value.size.height,
                child: VideoPlayer(videoPlayerController!),
              ),
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
        ],
      );
    });
  }
}
