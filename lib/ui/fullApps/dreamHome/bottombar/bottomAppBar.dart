import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// HeartBeat Painter

import '../helper/DHomeColors.dart';
import '../helper/DHomeconstant.dart';
import 'bottomPage.dart';
import 'bottomPainter.dart';

class HeartBeatAppBar extends StatelessWidget {
  final int from, to;

  const HeartBeatAppBar({required this.from, required this.to, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: DHomeColors.black,
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.1, 0,
          MediaQuery.of(context).size.width * 0.1, 15),
      height: 70.0,
      child: HeartBeatAppBarContent(
        MediaQuery.of(context).size,
        from: from,
        to: to,
      ),
    );
  }
}

class HeartBeatAppBarContent extends StatefulWidget {
  final Size device;
  // Starting Activated Icon
  final int from;
  // Icon that the Strating Activated Icon will be animated to
  final int to;

  const HeartBeatAppBarContent(this.device,
      {required this.from, required this.to, Key? key})
      : super(key: key);

  @override
  _HeartBeatAppBarContentState createState() => _HeartBeatAppBarContentState();
}

class _HeartBeatAppBarContentState extends State<HeartBeatAppBarContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _activatingOpacity;
  late Animation<double> _deactivatingOpacity;
  late Animation<double> _heartBeatAnimation;

  late int _activated;
  late int _nextActivated;

  List<double> _positions = [0, 0, 0, 0, 0];

  Opacity fadableIcon(final String icon, final int index) {
    // Will animate the opacity from 1.0 to 0.5
    if (index == _activated) {
      return Opacity(
          opacity: _deactivatingOpacity.value,
          child: SvgPicture.asset(DHomeConstant.getSvgImagePath(icon)));
    }

    // Will animate the opacity from 0.5 to 1.0
    if (index == _nextActivated) {
      return Opacity(
          opacity: _activatingOpacity.value,
          child: SvgPicture.asset(DHomeConstant.getSvgImagePath(icon)));
    }

    // Default returns the icon with opacity 0.5
    return Opacity(
        opacity: 0.5,
        child: SvgPicture.asset(DHomeConstant.getSvgImagePath(icon)));
  }

  void _startAnimation(int newActivated) {
    if (!_animationController.isAnimating && newActivated != _activated) {
      // Calculates new animation duration depending on how distant the 2 icons are
      // from each other
      int animationDuration = 700 + ((newActivated - _activated).abs()) * 100;

      _animationController.duration = Duration(milliseconds: animationDuration);

      setState(() => _nextActivated = newActivated);

      _animationController.forward();

      _animationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _activated = newActivated;
            _nextActivated = 0;
          });
          _animationController.reset();
        }
      });
    }
  }

  navigateToScreen(
    BuildContext context, {
    required int from,
    required int to,
    required Widget nextPageBody,
  }) async {
    await Navigator.push(
      context,
      PageRouteBuilder(
          pageBuilder: (context, _, __) =>
              BottomPage(body: nextPageBody, from: from, to: to)),
    );

    // In case the page gets popped, this will allow the animation to happen backwards.
    setState(() {
      _activated = to;
    });
    _startAnimation(widget.to);
  }

  @override
  void initState() {
    super.initState();
    _positions = [
      0,
      widget.device.width * 0.094,
      widget.device.width * 0.284,
      widget.device.width * 0.466,
      widget.device.width * 0.662,
    ];

    _activated = widget.from;
    _nextActivated = 0;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: (1000 ~/ 2)),
    );

    _deactivatingOpacity = Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    );

    _activatingOpacity = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.5,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );

    _heartBeatAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _startAnimation(widget.to);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size device = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext? context, Widget? child) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTapUp: (details) {
                    navigateToScreen(context!,
                        from: _activated,
                        to: 1,
                        nextPageBody: BottomPage.defaultPages[1]);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: fadableIcon(
                      "navi.home.svg",
                      1,
                    ),
                  ),
                ),
                GestureDetector(
                  onTapUp: (details) {
                    navigateToScreen(context!,
                        from: _activated,
                        to: 2,
                        nextPageBody: BottomPage.defaultPages[2]);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: fadableIcon(
                      "navi.fav.svg",
                      2,
                    ),
                  ),
                ),
                GestureDetector(
                  onTapUp: (details) {
                    navigateToScreen(context!,
                        from: _activated,
                        to: 3,
                        nextPageBody: BottomPage.defaultPages[3]);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: fadableIcon(
                      "navi.chat.svg",
                      3,
                    ),
                  ),
                ),
                GestureDetector(
                  onTapUp: (details) {
                    navigateToScreen(context!,
                        from: _activated,
                        to: 4,
                        nextPageBody: BottomPage.defaultPages[4]);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: fadableIcon(
                      "navi.setting.svg",
                      4,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        CustomPaint(
          size: Size(device.width, 6),
          painter: BottomPainter(
            animation: _heartBeatAnimation,
            beginning: _positions[_activated],
            ending: _positions[_nextActivated],
          ),
        ),
      ],
    );
  }
}
