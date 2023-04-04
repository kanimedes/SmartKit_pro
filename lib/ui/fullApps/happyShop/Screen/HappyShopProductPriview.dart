import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';

class HappyShopProductPreview extends StatefulWidget {
  List? imagelisturl;
  HappyShopProductPreview({
    Key? key,
    this.imagelisturl,
  }) : super(key: key);

  @override
  _HappyShopProductPreviewState createState() =>
      _HappyShopProductPreviewState();
}

class _HappyShopProductPreviewState extends State<HappyShopProductPreview> {
  int? curPos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: /*Hero(
      tag: "",
      child: */
          Stack(
        children: <Widget>[
          PageView.builder(
              itemCount: widget.imagelisturl!.length,
              controller: PageController(initialPage: 0),
              onPageChanged: (index) {
                setState(() {
                  curPos = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return OctoImage(
                  image: CachedNetworkImageProvider(
                      widget.imagelisturl![index]['img']),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    widget.imagelisturl![index]['blurUrl'],
                  ),
                  height: double.infinity,
                  errorBuilder: OctoError.icon(color: textcolor),
                  fit: BoxFit.fitHeight,
                );
              }),
          Padding(
            padding: const EdgeInsets.only(top: 34.0),
            child: Material(
              color: Colors.transparent,
              child: new IconButton(
                icon: new Icon(
                  Icons.arrow_back_ios,
                  color: primary,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          Positioned(
              bottom: 10.0,
              left: 25.0,
              right: 25.0,
              child: SelectedPhoto(
                numberOfDots: widget.imagelisturl!.length,
                photoIndex: curPos,
              )),
        ],
      ), /*)*/
    );
  }
}

class SelectedPhoto extends StatelessWidget {
  final int? numberOfDots;
  final int? photoIndex;

  const SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return Padding(
      padding: EdgeInsets.only(left: 3.0, right: 3.0),
      child: Container(
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
            color: primary.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4.0)),
      ),
    );
  }

  Widget _activePhoto() {
    return Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: Container(
        height: 10.0,
        width: 30.0,
        decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: const [
              BoxShadow(color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0)
            ]),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots!; i++) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
