import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/games/brickBreaker/brickBreakerScreen.dart';

class BallContainer extends StatelessWidget {
  const BallContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ballHeight,
      width: ballWidth,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
    );
  }
}
