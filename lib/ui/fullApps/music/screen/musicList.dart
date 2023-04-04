import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/utils.dart';import
'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';
import 'package:smartkit_pro/ui/fullApps/music/model/music_model.dart';
import 'package:smartkit_pro/ui/fullApps/music/widgets/musicsList.dart';

class MusicList extends StatefulWidget {
  String title;
  List<MusicModel>? musicsList;
  bool showAppBar;

  MusicList(
      {Key? key,
      required this.musicsList,
      required this.title,
      required this.showAppBar})
      : super(key: key);

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar ? Utils.getAppBar(context, widget.title) : null,
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
          child: MusicsList(
        musicsList: widget.musicsList,
      )),
    );
  }
}
