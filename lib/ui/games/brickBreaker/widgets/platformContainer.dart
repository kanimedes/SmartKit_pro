import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/games/brickBreaker/brickBreakerScreen.dart';

class PlatformContainer extends StatelessWidget {
  final double width;
  const PlatformContainer({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: platformHeight,
      decoration: const BoxDecoration(color: Colors.white),
    );
  }
}
