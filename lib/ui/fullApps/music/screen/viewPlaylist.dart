import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/music/widgets/customButtons.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/string.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';
import '../widgets/musicsList.dart';
import '../widgets/options.dart';

class ViewPlayList extends StatefulWidget {
  dynamic playlistDetails;
  String dataOf;

  ViewPlayList({Key? key, required this.playlistDetails, required this.dataOf})
      : super(key: key);

  @override
  State<ViewPlayList> createState() => _ViewPlayListState();
}

class _ViewPlayListState extends State<ViewPlayList>
    with TickerProviderStateMixin {
  late AnimationController playAndPauseAnimationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  bool animationHandler = false;

  int valueHolder = 20;

  @override
  void initState() {
    super.initState();
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
                    image: AssetImage(widget.playlistDetails.imgurl!),
                    fit: BoxFit.fitHeight)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 125,
                ),
                Hero(
                  tag:
                      "${widget.playlistDetails.id!}${widget.playlistDetails.name!}",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(
                      widget.playlistDetails.imgurl!,
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.35,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(widget.playlistDetails.name!,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                widget.dataOf == "PlayList"
                    ? Text(widget.playlistDetails.artistName!,
                        style: TextStyle(
                          fontSize: 14,
                        ))
                    : Container(),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: getPlayAndShuffleButton(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Options(whichInfoToBeShown: "Playlist"),
                ),
                MusicsList(
                  musicsList: widget.playlistDetails.artistsMusicList,
                ),
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

  getPlayAndShuffleButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SimpleButton(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.4,
            backgroundColor: primary,
            borderRadius: 10,
            buttonText: play,
            textColor: white,
            textFontSize: 16),
        SimpleButton(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.4,
            backgroundColor: white,
            borderRadius: 10,
            buttonText: shuffle,
            textColor: black,
            textFontSize: 16),
      ],
    );
  }
}
