import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayGround extends StatefulWidget {
  const PlayGround({Key? key}) : super(key: key);

  @override
  State<PlayGround> createState() => _PlayGroundState();
}

class _PlayGroundState extends State<PlayGround> with TickerProviderStateMixin {
  double opecity = 1.0;
  late ScrollController scrollController = ScrollController()
    ..addListener(scrollListener);

  void scrollListener() {
    animationController.value = ConvertNumber.inRange(
      currentValue: scrollController.offset,
      minValue: scrollController.position.minScrollExtent,
      maxValue: scrollController.position.maxScrollExtent,
      newMaxValue: 1.0,
      newMinValue: 0.0,
    );
  }

  late final AnimationController animationController =
      AnimationController(vsync: this);
  late final Animation<double> _animation = Tween<double>(begin: 0, end: 1)
      .animate(CurvedAnimation(
          parent: animationController, curve: Curves.easeInOut));

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    animationController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Container(
                  color: Colors.redAccent.withOpacity(_animation.value),
                );
              }),
          ListView.builder(
            controller: scrollController,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                "itme$index",
                style: TextStyle(color: Colors.white),
              ),
            ),
            itemCount: 50,
          )
        ],
      ),
    );
  }
}

class ConvertNumber {
  //
  //using min max normalization
  //
  static double inRange({
    required double currentValue,
    required double minValue,
    required double maxValue,
    required double newMaxValue,
    required double newMinValue,
  }) {
    double converatedValue = 0.0;
    converatedValue = (currentValue - minValue) /
            (maxValue - minValue) *
            (newMaxValue - newMinValue) +
        newMinValue;
    return converatedValue;
  }
}
