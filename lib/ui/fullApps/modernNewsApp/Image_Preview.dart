import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:photo_view/photo_view.dart';

import 'Helper/Color.dart';

class ImagePreview extends StatefulWidget {
  final int? index;
  final List<String>? imgList;
  bool? isNetworkAvail;

  ImagePreview({Key? key, this.index, this.imgList, this.isNetworkAvail})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => StatePreview();
}

class StatePreview extends State<ImagePreview> {
  int? curPos;

  @override
  void initState() {
    super.initState();

    curPos = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        PageView.builder(
            itemCount: widget.imgList!.length,
            controller: PageController(initialPage: curPos!),
            onPageChanged: (index) async {
              setState(() {
                curPos = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return PhotoView(
                  backgroundDecoration: BoxDecoration(color: colors.bgColor),
                  initialScale: PhotoViewComputedScale.contained * 0.9,
                  minScale: PhotoViewComputedScale.contained * 0.9,
                  imageProvider: AssetImage(widget.imgList![index]));
            }),
        Padding(
            padding: const EdgeInsetsDirectional.only(top: 30.0, start: 10.0),
            child: Container(
                height: 30,
                width: 30,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.boxColor,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10.0,
                          offset: const Offset(5.0, 5.0),
                          color: Theme.of(context)
                              .colorScheme
                              .fontColor
                              .withOpacity(0.1),
                          spreadRadius: 1.0),
                    ],
                    borderRadius: BorderRadius.circular(6.0)),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(
                    "assets/images/fullApps/modernNews/svg/back_icon.svg",
                    semanticsLabel: 'back icon',
                    color: Theme.of(context).colorScheme.fontColor,
                  ),
                ))),
        widget.imgList!.length <= 1
            ? Container()
            : Positioned(
                bottom: 10.0,
                left: 25.0,
                right: 25.0,
                child: SelectedPhoto(
                  numberOfDots: widget.imgList!.length,
                  photoIndex: curPos!,
                ))
      ],
    ));
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
            color: colors.primary.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4.0)),
      ),
    );
  }

  Widget _activePhoto() {
    return Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(10.0),
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
