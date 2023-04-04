import 'package:flutter/material.dart';

class CustomeRoundedButton extends StatefulWidget {
  final String title;
  final double? borderradius;
  final double? fontsize;
  final double width;
  final double hight;
  final VoidCallback? ontap;
  final Color? containercolors;
  final Color? textcolor;
  final bool? buttonmargin;

  const CustomeRoundedButton({
    Key? key,
    required this.title,
    this.buttonmargin,
    this.borderradius,
    this.fontsize,
    required this.width,
    required this.hight,
    this.ontap,
    this.containercolors,
    this.textcolor,
  }) : super(key: key);

  @override
  State<CustomeRoundedButton> createState() => _CustomeRoundedButtonState();
}

class _CustomeRoundedButtonState extends State<CustomeRoundedButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 10),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (ontapdetails) {
        _controller.forward();
        // _controller.reverse();
      },
      // onTapUp: (TapUpDetails tapUpDetails) {
      //   _controller.reverse();
      //   //widget.ontap;
      // },
      onTap:
          //_controller.reverse();
          widget.ontap,
      child: Transform.scale(
        scale: 1 - _controller.value,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: widget.buttonmargin == true ? 25 : 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderradius ?? 20),
            color: widget.containercolors ?? Theme.of(context).primaryColor,
          ),
          height: widget.hight,
          width: widget.width,
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.textcolor ?? Theme.of(context).backgroundColor,
              fontSize: widget.fontsize ?? 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
