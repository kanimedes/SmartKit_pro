import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constant.dart';
import 'overlay_handler.dart';

class VideoTitleOverlayWidget extends StatefulWidget {
  final Function? onClear;
  final Widget widget;

  const VideoTitleOverlayWidget({this.onClear, required this.widget})
      : assert(widget != null);

  @override
  _VideoTitleOverlayWidgetState createState() =>
      _VideoTitleOverlayWidgetState();
}

class _VideoTitleOverlayWidgetState extends State<VideoTitleOverlayWidget> {
  double? width;
  double? oldWidth;
  double? oldHeight;
  double? height;

  bool isInPipMode = false;

  Offset offset = Offset(0, 0);

  Widget? player;

  _onExitPipMode() {
    Future.microtask(() {
      setState(() {
        isInPipMode = false;
        width = oldWidth;
        height = oldHeight;
        offset = Offset(0, 0);
      });
    });
    Future.delayed(Duration(milliseconds: 250), () {
      Provider.of<OverlayHandlerProvider>(context, listen: false).disablePip();
    });
  }

  _onPipMode() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        isInPipMode = true;
        width = oldWidth! - 32.0;
        height = Constant.VIDEO_TITLE_HEIGHT_PIP;

        offset = Offset(16, oldHeight! - height! - Constant.BOTTOM_PADDING_PIP);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (width == null || height == null) {
      oldWidth = width = MediaQuery.of(context).size.width;
      oldHeight = height = MediaQuery.of(context).size.height;
    }
    return Consumer<OverlayHandlerProvider>(
        builder: (context, overlayProvider, _) {
      if (overlayProvider.inPipMode != isInPipMode) {
        isInPipMode = overlayProvider.inPipMode;
        if (isInPipMode) {
          _onPipMode();
        } else {
          _onExitPipMode();
        }
      }

      return AnimatedPositioned(
        duration: Duration(milliseconds: 150),
        left: offset.dx,
        top: offset.dy,
        child: Material(
          elevation: isInPipMode ? 5.0 : 0.0,
          child: AnimatedContainer(
            height: height,
            width: width,
            child: widget.widget,
            duration: Duration(milliseconds: 250),
          ),
        ),
      );
    });
  }
}
