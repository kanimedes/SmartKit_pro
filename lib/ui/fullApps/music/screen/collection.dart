import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/constanat.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/utils.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/string.dart';

class Collection extends StatefulWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Utils.getAppBar(context, collection),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 10, 10, 15),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image:
                            AssetImage("${imagePath}music_banner_girl.jpg"))),
              ),
            ),
            getItemTile(Icons.music_note_rounded, Icons.arrow_forward_ios_sharp,
                tracks),
            getItemTile(Icons.person, Icons.arrow_forward_ios_sharp, artists),
            getItemTile(Icons.playlist_play_outlined,
                Icons.arrow_forward_ios_sharp, playlist),
            getItemTile(Icons.download_rounded, Icons.arrow_forward_ios_sharp,
                download),
          ],
        ),
      ),
    );
  }

  getItemTile(IconData leadingIcon, IconData trailingIcon, String title) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          title: Text(title),
          leading: Icon(leadingIcon, color: primary),
          trailing: Icon(trailingIcon, color: primary),
        ));
  }
}
