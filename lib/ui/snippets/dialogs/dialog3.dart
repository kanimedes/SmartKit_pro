import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/snippets/dialogs/dialogsScreen.dart';

class dialog3 extends StatefulWidget {
  final double? dialogBoxRadius,
      topLeftRadius,
      bottomLeftRadius,
      topRightRadius,
      bottomRightRadius;
  final String title,
      description,
      textPositiveButton,
      textNegativeButton,
      svgPath;

  const dialog3(
      {Key? key,
      this.dialogBoxRadius,
      this.topLeftRadius,
      this.bottomLeftRadius,
      this.topRightRadius,
      this.bottomRightRadius,
      required this.title,
      required this.description,
      required this.textPositiveButton,
      required this.textNegativeButton,
      required this.svgPath})
      : super(key: key);

  @override
  State<dialog3> createState() => _dialog3State();
}

class _dialog3State extends State<dialog3> with TickerProviderStateMixin {
  late Animation<Offset> imageAnimation, dialogAnimation;
  late AnimationController animationController;
  double offsetDx = WidgetsBinding.instance.window.physicalSize.width;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero);
    animationController =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);

    final curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    );

    dialogAnimation =
        Tween<Offset>(begin: Offset(offsetDx, 0), end: Offset(0, 0))
            .animate(curvedAnimation);

    animationController.forward();
  }

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(widget.dialogBoxRadius ?? 30))),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return MotionDialog(
      animation: dialogAnimation,
      title: widget.title,
      description: widget.description,
      textPositiveButton: widget.textPositiveButton,
      textNegativeButton: widget.textNegativeButton,
      svgPath: widget.svgPath,
      dialogBoxRadius: widget.dialogBoxRadius,
      topLeftRadius: widget.topLeftRadius,
      bottomLeftRadius: widget.bottomLeftRadius,
      animationController: animationController,
    );
  }
}

class MotionDialog extends AnimatedWidget {
  final double? dialogBoxRadius,
      topLeftRadius,
      bottomLeftRadius,
      topRightRadius,
      bottomRightRadius;
  final String title,
      description,
      textPositiveButton,
      textNegativeButton,
      svgPath;
  AnimationController animationController;

  MotionDialog(
      {Key? key,
      this.dialogBoxRadius,
      this.topLeftRadius,
      this.bottomLeftRadius,
      this.topRightRadius,
      this.bottomRightRadius,
      required this.animationController,
      required Animation<Offset> animation,
      required this.title,
      required this.description,
      required this.textPositiveButton,
      required this.textNegativeButton,
      required this.svgPath})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<Offset>;
    return Transform.translate(
      offset: Directionality.of(context) == TextDirection.rtl
          ? animation.value * (-1)
          : animation.value,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsetsDirectional.fromSTEB(110 + 20, 20, 20, 20),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(topLeftRadius ?? 30),
                    bottomStart: Radius.circular(bottomLeftRadius ?? 30),
                    topEnd: Radius.circular(topRightRadius ?? 30),
                    bottomEnd: Radius.circular(bottomRightRadius ?? 30)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black, offset: Offset(0, 1), blurRadius: 1),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              textDirection: Directionality.of(context),
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  textDirection: Directionality.of(context),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    customButton(
                      height: 30,
                      width: 60,
                      buttonText: textNegativeButton,
                      textColor: Colors.white,
                      isTextBold: true,
                      backgroundColor: Colors.red[400],
                      buttonBorderRadius: 15,
                      voidCallback: () {animationController.reverse().then((value) {
                        Navigator.of(context).pop();
                      });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    customButton(
                      height: 30,
                      width: 60,
                      buttonText: textPositiveButton,
                      textColor: Colors.white,
                      isTextBold: true,
                      backgroundColor: Colors.green[400],
                      buttonBorderRadius: 15,
                      voidCallback: () {animationController.reverse().then((value) {
                        Navigator.of(context).pop();
                      });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          PositionedDirectional(
            start: 20,
            top: 20,
            bottom: 20,
            child: SizedBox(
              height: 110,
              width: 110,
              child: CircleAvatar(
                backgroundColor: Colors.black12,
                radius: 100,
                child: ClipRRect(
                    child: SvgPicture.asset(
                  svgPath,
                  width: 60,
                  height: 60,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
