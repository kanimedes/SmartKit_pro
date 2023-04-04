import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';
import 'package:smartkit_pro/ui/fullApps/music/model/playlistModel.dart';

class Playlist extends StatefulWidget {
  PlaylistModel model;
  Playlist({Key? key, required this.model}) : super(key: key);

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              getHeading(),
              getPlaylistImage(),
            ],
          ),
        ),
      ),
    );
  }

  getHeading() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios_sharp)),
          Spacer(),
          Icon(Icons.more_vert)
        ],
      ),
    );
  }

  getPlaylistImage() {
    return Image.asset(widget.model.imgurl!);
  }
}
