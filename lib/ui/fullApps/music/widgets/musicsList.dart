import 'package:flutter/material.dart';

import 'package:smartkit_pro/ui/fullApps/music/model/music_model.dart';
import 'package:smartkit_pro/ui/fullApps/music/screen/playMusic.dart';

class MusicsList extends StatefulWidget {
  List<MusicModel>? musicsList;

  MusicsList({Key? key, required this.musicsList}) : super(key: key);

  @override
  State<MusicsList> createState() => _MusicsListState();
}

class _MusicsListState extends State<MusicsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: widget.musicsList!.length,
          itemBuilder: (context, index) {
            return musicItem(index);
          }),
    );
  }

  musicItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => PlayMusic(songDetails: musicsList[index])));
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
                    "${widget.musicsList![index].id}${widget.musicsList![index].name}",
                child: SizedBox(
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10)),
                      child: Image.asset(
                        widget.musicsList![index].imgurl!,
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
                        widget.musicsList![index].name!,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                      ),
                      Text(
                        widget.musicsList![index].artistName!,
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
