import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/activity/LiveVideos/LiveVideoDetail.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/Constant.dart';

import 'drag/drag_custom.dart' as dc;
import 'overlay_handler.dart';

class VideoOverlayWidget extends StatefulWidget {
  final Function? onClear;
  final Widget widget;

  const VideoOverlayWidget({this.onClear, required this.widget})
      : assert(widget != null);

  @override
  _VideoOverlayWidgetState createState() => _VideoOverlayWidgetState();
}

class _VideoOverlayWidgetState extends State<VideoOverlayWidget> {
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
    double aspectRatio =
        Provider.of<OverlayHandlerProvider>(context, listen: false).aspectRatio;

    Future.delayed(Duration(milliseconds: 100), () {
      bool isfullscreen =
          Provider.of<OverlayHandlerProvider>(context, listen: false)
              .isfullscreen;

      setState(() {
        isInPipMode = true;
        width = isfullscreen
            ? videoPlayerController!.value.size.width
            : Constant.VIDEO_HEIGHT_PIP;
        height = isfullscreen
            ? videoPlayerController!.value.size.height
            : (Constant.VIDEO_HEIGHT_PIP / aspectRatio) + 33;
        offset = Offset(oldWidth! - width!,
            oldHeight! - height! - Constant.BOTTOM_PADDING_PIP);
      });

      /*  setState(() {
        isInPipMode = true;
        width = Constant.VIDEO_HEIGHT_PIP;
        height = (Constant.VIDEO_HEIGHT_PIP / aspectRatio) + 33;
        offset = Offset(
            oldWidth - width, oldHeight - height - Constant.BOTTOM_PADDING_PIP);
      }); */
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
        child: dc.Draggable(
          feedback: Container(),
          onDragStarted: () {},
          onDragUpdate: (off) {
            if (!isInPipMode) return;
            if (off.dx >= 0 &&
                off.dx < (oldWidth! - Constant.VIDEO_HEIGHT_PIP) &&
                off.dy >= 48.0 &&
                off.dy <
                    (oldHeight! -
                        Constant.VIDEO_HEIGHT_PIP -
                        Constant.BOTTOM_PADDING_PIP)) {
              setState(() {
                offset = off;
              });
            }
          },
          onDragEnd: (dc.DraggableDetails details) {
            if (details.velocity.pixelsPerSecond.dx < -1000) {
              if (widget.onClear != null) widget.onClear!();
            }
          },
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
