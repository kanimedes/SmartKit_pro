
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/snippets/dialogs/dialogsScreen.dart';

class dialog1 extends StatefulWidget {
  final String title, description, text, svgPath;

  const dialog1(
      {Key? key,
        required this.title,
        required this.description,
        required this.text,
        required this.svgPath})
      : super(key: key);

  @override
  State<dialog1> createState() => _dialog1State();
}

class _dialog1State extends State<dialog1> with TickerProviderStateMixin {
  late Animation<Offset> imageAnimation, dialogAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);

    final curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    );

    dialogAnimation = Tween<Offset>(begin: Offset(0, -10), end: Offset(0, 0))
        .animate(curvedAnimation);

    imageAnimation = Tween<Offset>(begin: Offset(0, -100), end: Offset(0, 0))
        .animate(curvedAnimation)
      ..addListener(() {
        if (imageAnimation.value >= Offset(0, 0)) {
          animationController.forward();
        }
      });

    animationController.forward();
  }

  @override
  dispose() {
    animationController.dispose(); // you need this
    // dialogAnimationController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        MotionDialog(
          animation: dialogAnimation,
          text: widget.text,
          title: widget.title,
          description: widget.description,
        ),
        Positioned(
          left: 15,
          right: 15,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 100,
            child: MotionImage(
              animation: imageAnimation,
            ),
          ),
        ),
      ],
    );
  }
}

class MotionImage extends AnimatedWidget {
  const MotionImage({
    Key? key,
    required Animation<Offset> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<Offset>;

    return Transform.translate(
      offset: animation.value,
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: SvgPicture.asset("${imagePath}opps_not_internet.svg")),
    );
  }
}

class MotionDialog extends AnimatedWidget {
  String title, text, description;

  MotionDialog({
    Key? key,
    required this.text,
    required this.title,
    required this.description,
    required Animation<Offset> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<Offset>;

    return Transform.translate(
      offset: animation.value,
      child: Container(
        padding: const EdgeInsets.only(
            left: 15, top: 100 + 15, right: 15, bottom: 15),
        margin: const EdgeInsets.only(top: 100),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 1), blurRadius: 1),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 22,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: customButton(
                width: 150,
                height: 40,
                fontSize: 20,
                buttonText: text,
                textColor: Colors.white,
                isTextBold: true,
                backgroundColor: Colors.yellow[700],
                buttonBorderRadius: 20,
                voidCallback: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}