import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/snippets/dialogs/dialogsScreen.dart';

class dialog2 extends StatefulWidget {
  double? dialog2BorderRadius;
  final String title, description, text, svgPath;

  dialog2(
      {Key? key,
      required this.title,
      required this.description,
      required this.text,
      required this.svgPath,
      this.dialog2BorderRadius})
      : super(key: key);

  @override
  State<dialog2> createState() => _dialog2State();
}

class _dialog2State extends State<dialog2> with TickerProviderStateMixin {
  late Animation<double> dialogAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    dialogAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastLinearToSlowEaseIn,
    );
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
        borderRadius: BorderRadius.circular(widget.dialog2BorderRadius ?? 20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return ScaleTransition(
      scale: animationController,
      alignment: Alignment.center,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(widget.dialog2BorderRadius ?? 20))),
              child: ClipPath(
                child: Container(
                  child: Stack(
                    children: [
                      PositionedDirectional(
                        top: 5,
                        end: 0,
                        start: 0,
                        child: Center(
                            child: SvgPicture.asset(
                          "${imagePath}pattern.svg",
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white54,
                        )),
                      ),
                      PositionedDirectional(
                        top: 20,
                        start: MediaQuery.of(context).size.width * 0.24,
                        child: Center(
                            child: SvgPicture.asset(
                          widget.svgPath,
                          height: 130,
                        )),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff68bb9d),
                    borderRadius: BorderRadius.only(
                      topRight:
                          Radius.circular(widget.dialog2BorderRadius ?? 20),
                      topLeft:
                          Radius.circular(widget.dialog2BorderRadius ?? 20),
                    ),
                  ),
                ),
                clipper: Clipper(),
              ),
            ),
            PositionedDirectional(
              bottom: 20,
              end: 20,
              start: 20,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: customButton(
                      buttonText: widget.text,
                      textColor: Colors.white,
                      isTextBold: true,
                      backgroundColor: Color(0xff68bb9d),
                      buttonBorderRadius: 15,
                      voidCallback: () {
                        //Dialog OK button click event
                        animationController.reverse().then((value) {
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height / 2;
    Path path = Path();
    path.lineTo(0, height);
    path.quadraticBezierTo(
        size.width / 4, height - 40, size.width / 2, height - 20);
    path.quadraticBezierTo(3 / 4 * size.width, height, size.width, height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(Clipper oldClipper) => false;
}
