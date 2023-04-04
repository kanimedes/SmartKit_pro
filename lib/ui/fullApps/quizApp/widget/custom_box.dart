import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class customBox extends StatefulWidget {
  final Function onTap;
  final bool? btnpress;
  final double borderRadius, borderWidth, width, height;
  final Color childContainerColor, mainContainerColor;
  final Widget child;
  final double topmargin, leftmargin, rightmargin, bottomargin, bottomPadding,
      rightPadding;
  final Offset offsetAnimation;


  const customBox({Key? key,
    required this.borderRadius,
    required this.borderWidth,
    required this.width,
    required this.height,
    required this.childContainerColor,
    required this.mainContainerColor,
    required this.child,
    required this.topmargin,
    required this.leftmargin,
    required this.rightmargin, this.btnpress, required this.offsetAnimation, required this.bottomPadding, required this.rightPadding, required this.bottomargin,  required this.onTap})
      : super(key: key);

  @override
  State<customBox> createState() => _customBoxState();
}

class _customBoxState extends State<customBox> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;


  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 120),
    );
    _animation = Tween<Offset>(
        begin: Offset(0, 0),
        end: widget.offsetAnimation
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInQuad));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.topmargin,
          left: widget.leftmargin,
          right: widget.rightmargin, bottom: widget.bottomargin),
      padding: EdgeInsets.only(
          bottom: widget.bottomPadding, right: widget.rightPadding),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: widget.mainContainerColor,
          border: Border.all(color: Colors.black, width: widget.borderWidth),
          borderRadius: BorderRadius.circular(widget.borderRadius)),
      child: (widget.btnpress ?? false) ? GestureDetector(
        onTapDown: (ontapdetails) {
          _controller.forward();
          vibrate();
          // _controller.reverse();
        },
        onTap: () {
          _controller.reverse().then((value) => widget.onTap.call());
        },
        onTapCancel: () {
          _controller.reverse();
        },
        child: SlideTransition(
          position: _animation,
          child: Container(
              decoration: BoxDecoration(
                  color: widget.childContainerColor,
                  border: Border.all(
                      color: Colors.black, width: widget.borderWidth),
                  borderRadius: BorderRadius.circular(widget.borderRadius)),
              child: widget.child),
        ),
      ) : Container(
          decoration: BoxDecoration(
              color: widget.childContainerColor,
              border: Border.all(
                  color: Colors.black, width: widget.borderWidth),
              borderRadius: BorderRadius.circular(widget.borderRadius)),
          child: widget.child),
    );
  }

  void vibrate() {
    HapticFeedback.heavyImpact();
    HapticFeedback.vibrate();
  }
}


