import 'package:flutter/material.dart';
import 'package:smartkit_pro/utils/convertNumber.dart';

class ExerciseList extends StatefulWidget {
  final List<AnimationController> animaitonControllers;

  const ExerciseList({
    Key? key,
    required this.animaitonControllers,
  }) : super(key: key);

  @override
  State<ExerciseList> createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  late double rectBottomPercentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.clamp,
          colors: <Color>[Colors.transparent, Colors.black],
        ).createShader(Rect.fromLTRB(
            rect.left, rect.top, rect.right, rect.bottom * (0.025)));
      },
      blendMode: BlendMode.dstIn,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.metrics.pixels != 0.0) {
            rectBottomPercentage = ConvertNumber.inRange(
                currentValue: notification.metrics.pixels,
                minValue: notification.metrics.minScrollExtent,
                maxValue: notification.metrics.maxScrollExtent,
                newMaxValue: 0.025,
                newMinValue: 0.0);

            setState(() {});
          }

          return true;
        },
        child: ListView.builder(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * (0.075),
                right: MediaQuery.of(context).size.width * (0.075),
                top: MediaQuery.of(context).size.height * (0.025),
                bottom: MediaQuery.of(context).size.height * 0.075),
            itemCount: widget.animaitonControllers.length,
            itemBuilder: (context, index) {
              return ExerciseDetailsContainer(
                index: index,
                animationController: widget.animaitonControllers[index],
              );
            }),
      ),
    );
  }
}

class ExerciseDetailsContainer extends StatefulWidget {
  final int index;
  final AnimationController animationController;
  const ExerciseDetailsContainer(
      {Key? key, required this.index, required this.animationController})
      : super(key: key);

  @override
  State<ExerciseDetailsContainer> createState() =>
      _ExerciseDetailsContainerState();
}

class _ExerciseDetailsContainerState extends State<ExerciseDetailsContainer> {
  late Animation<double> fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(
          parent: widget.animationController, curve: Curves.easeInOut));

  late Animation<Offset> slideAnimation =
      Tween<Offset>(begin: const Offset(0.0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
              parent: widget.animationController, curve: Curves.easeInOut));

  @override
  void initState() {
    //Start animation controller
    Future.delayed(Duration(milliseconds: 750 + (widget.index * 200)), () {
      widget.animationController.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Container(
          margin: const EdgeInsets.only(bottom: 15.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * (0.1125),
          child: LayoutBuilder(builder: (context, boxConstraints) {
            return Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            "assets/images/animatedScreens/fitnessAnimation/dailyLesson.jpg")),
                  ),
                  width: boxConstraints.maxWidth * (0.3),
                ),
                SizedBox(
                  width: boxConstraints.maxWidth * (0.05),
                ),
                SizedBox(
                  width: boxConstraints.maxWidth * (0.45),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "STEADY EXERCISE",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "BODY WEIGHT",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: boxConstraints.maxWidth * (0.2),
                  child: const Text(
                    "5 MIN",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
