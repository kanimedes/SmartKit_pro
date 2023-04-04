import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';

class FullScreenImage extends StatelessWidget {
  final String? image;
  final String? hash;
  final String? imgurl;
  const FullScreenImage(this.image, this.imgurl, this.hash);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      PhotoView(imageProvider: CachedNetworkImageProvider(imgurl!)),
      Container(
        margin: EdgeInsetsDirectional.only(
            top: MediaQuery.of(context).padding.top, start: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              Icons.keyboard_backspace,
              color: ColorsRes.white,
            ),
          ),
        ),
      ),
    ]);
  }
}
