import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/utils.dart';
import 'package:smartkit_pro/ui/fullApps/music/model/playlistModel.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/viewPlaylist.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';

class PlaylistList extends StatefulWidget {
  String title;
  List<PlaylistModel>? playList;

  PlaylistList({
    Key? key,
    required this.playList,
    required this.title,
  }) : super(key: key);

  @override
  State<PlaylistList> createState() => _PlaylistListState();
}

class _PlaylistListState extends State<PlaylistList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getAppBar(context, widget.title),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: widget.playList!.length,
            itemBuilder: (context, index) {
              return playListItem(index);
            }),
      )),
    );
  }

  playListItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ViewPlayList(
                    playlistDetails: widget.playList![index],
                    dataOf: "PlayList",
                  )));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag:
                    "${widget.playList![index].id!}${widget.playList![index].name}",
                child: SizedBox(
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10)),
                      child: Image.asset(
                        widget.playList![index].imgurl!,
                        fit: BoxFit.fill,
                      ),
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.playList![index].name!,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                      ),
                      Text(
                        widget.playList![index].artistName!,
                        style: TextStyle(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 5.0),
                child: Center(child: Icon(Icons.more_vert)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
