import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/constanat.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/utils.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/string.dart';

import '../widgets/slideAnimation.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {
  late AnimationController counterAnimationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 700));

  late Animation tracksCounterAnimation,
      downloadsCounterAnimation,
      playlistsCounterAnimation,
      artistsCounterAnimation;

  @override
  void initState() {
    tracksCounterAnimation = IntTween(begin: 0, end: totalTracks).animate(
        CurvedAnimation(
            parent: counterAnimationController, curve: Curves.easeIn));
    downloadsCounterAnimation = IntTween(begin: 0, end: totalDownload).animate(
        CurvedAnimation(
            parent: counterAnimationController, curve: Curves.easeIn));
    playlistsCounterAnimation = IntTween(begin: 0, end: totalPlaylist).animate(
        CurvedAnimation(
            parent: counterAnimationController, curve: Curves.easeIn));
    artistsCounterAnimation = IntTween(begin: 0, end: totalArtists).animate(
        CurvedAnimation(
            parent: counterAnimationController, curve: Curves.easeIn));
    counterAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    counterAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: Utils.getAppBar(context, profile),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                foregroundColor: primary,
                backgroundImage: AssetImage("${imagePath}singer7.jpg"),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0),
              child: SizedBox(
                  height: 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      getFields(tracksCounterAnimation, tracks),
                      getFields(artistsCounterAnimation, artists),
                      getFields(playlistsCounterAnimation, playlist),
                      getFields(downloadsCounterAnimation, download),
                    ],
                  )),
            ),
            AnimationFromBottomSide(
              delay: 250,
              child: getHeading(setting),
            ),
            AnimationFromBottomSide(child: getItems(musicSetting), delay: 300),
            AnimationFromBottomSide(child: getItems(equalizer), delay: 300),
            AnimationFromBottomSide(
                child: getItems(downloadQuality), delay: 300),
            AnimationFromBottomSide(
              delay: 350,
              child: getHeading(podcastSetting),
            ),
            AnimationFromBottomSide(child: getItems(addCategories), delay: 400),
            AnimationFromBottomSide(
              delay: 450,
              child: getHeading(profile),
            ),
            AnimationFromBottomSide(child: getItems(editProfile), delay: 500),
            AnimationFromBottomSide(
                child: getItems(helpAndSupport), delay: 500),
            AnimationFromBottomSide(child: getItems(logout), delay: 500),
          ],
        ),
      ),
    );
  }

  getFields(Animation animation, String title) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                animation.value.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Text(
                title,
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          );
        });
  }

  getHeading(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  getItems(String title) {
    return SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          children: [
            Text(title, style: TextStyle(color: Colors.grey[700])),
            Spacer(),
            Icon(
              Icons.navigate_next_sharp,
              color: primary,
            )
          ],
        ),
      ),
    );
  }
}
