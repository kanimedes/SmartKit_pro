import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/colors.dart';
import 'package:smartkit_pro/ui/fullApps/music/helper/string.dart';

class Options extends StatefulWidget {
  ///This parameter will get 2 values [ Song , Playlist ],
  ///at info option, if you have assign Song then it will assign [songInfo] value
  ///and if you have assign Playlist then it will assign [playListInfo] value
  String whichInfoToBeShown;

  Options({Key? key, required this.whichInfoToBeShown}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
          color: white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          getElement(Icon(Icons.favorite_border), favorite),
          getElement(Icon(Icons.info_outline),
              widget.whichInfoToBeShown == "Song" ? songInfo : playListInfo),
          getElement(Icon(Icons.download_outlined), download),
          getElement(Icon(Icons.share_outlined), share),
        ],
      ),
    );
  }

  Widget getElement(Icon icons, String title) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [Expanded(child: icons), Text(title)],
      ),
    );
  }
}
