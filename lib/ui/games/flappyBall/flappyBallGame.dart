import 'dart:math';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/games/flappyBall/bric.dart';

class FlappyBallGame extends FlameGame with TapDetector {
  final VoidCallback isGameOver;
  FlappyBallGame({required this.isGameOver});

  late bool gameStarted = false;

  Random random = Random.secure();
  late Size screenSize;

  late double gravity = 0.95;
  late double velocity = 0;

  late double circleDy;
  late double circleDx;

  final int totalBrics = 5;
  final double brickWidthPercentage = 0.075;
  final double minBricHeightPercentage = 0.2;
  final double maxBricHeightPercentage = 0.4;
  final double inBetweenBricSpacePercentage = 0.2;
  late double bricX;
  late List<Bric> topBrics = [];
  late List<Bric> bottomBrics = [];
  late double bricHeightPercentage =
      (maxBricHeightPercentage + minBricHeightPercentage) / 2;
  late bool gameOver = false;

  double getHeight() {
    Random random = Random.secure();
    double height = random.nextDouble();

    if (height <= minBricHeightPercentage ||
        height >= maxBricHeightPercentage) {
      height = getHeight();
    }
    return double.parse(height.toStringAsFixed(2));
  }

  void addTopBrics() {
    for (var i = 0; i < totalBrics; i++) {
      topBrics.add(Bric(
          heightPercentage: getHeight(),
          dx: (bricX + (size.x * inBetweenBricSpacePercentage * i)),
          isTopPosition: true));
    }
  }

  void addBottomBrics() {
    for (var i = 0; i < totalBrics; i++) {
      bottomBrics.add(Bric(
          heightPercentage: getHeight(),
          dx: (bricX + (size.x * inBetweenBricSpacePercentage * i)),
          isTopPosition: false));
    }
  }

  @override
  Future<void> onLoad() async {
    screenSize = size.toSize();
    circleDy = size.y * (0.5) - 15;
    circleDx = size.x * (0.3);
    bricX = size.x * (0.5 - (brickWidthPercentage / 2));

    addTopBrics();
    addBottomBrics();
    Future.delayed(const Duration(seconds: 1), () {
      gameStarted = true;
    });
    super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    Paint paint = Paint()..color = Colors.white;

    canvas.drawCircle(Offset(circleDx, circleDy), 30, paint);
    //draw top brics
    for (var i = 0; i < totalBrics; i++) {
      Bric bric = topBrics[i];
      canvas.drawRect(
          Offset(bric.dx, bric.isTopPosition ? 0 : size.y) &
              Size(size.x * brickWidthPercentage,
                  size.y * (bric.heightPercentage)),
          paint);
    }
    // draw bottom brics
    for (var i = 0; i < totalBrics; i++) {
      Bric bric = bottomBrics[i];
      canvas.drawRect(
          Offset(
                  bric.dx,
                  bric.isTopPosition
                      ? 0
                      : size.y * (1.0 - bric.heightPercentage)) &
              Size(size.x * brickWidthPercentage,
                  size.y * (bric.heightPercentage)),
          paint);
    }
    super.render(canvas);
  }

  @override
  void update(double dt) {
    if (!gameStarted) {
      return;
    }
    if (gameOver) {
      return;
    }
    //detect collision

    for (var i = 0; i < totalBrics; i++) {
      Bric topBric = topBrics[i];
      Bric bottomBric = bottomBrics[i];

      //check collision with topBrics
      if (circleDy >=
          size.y - (size.y * (bottomBric.heightPercentage) + 30.0)) {
        if (circleDx >= (bottomBric.dx) &&
            circleDx <= (bottomBric.dx + size.x * brickWidthPercentage)) {
          //game over

          gameOver = true;
          isGameOver();
          break;
        }
      } else if (circleDy <= (size.y * (topBric.heightPercentage) + 30)) {
        //check for topBric x
        if (circleDx >= (topBric.dx) &&
            circleDx <= (topBric.dx + size.x * brickWidthPercentage)) {
          //game over
          gameOver = true;
          isGameOver();
          break;
        }
      }
    }

    if (!gameOver) {
      //update circleDy
      if (circleDy >= (size.y - 30)) {
        circleDy = size.y - 30;
        velocity = 0;
      } else if (circleDy <= 30) {
        circleDy = 30;
        velocity = 0;
      } else {
        velocity = velocity + gravity;
        velocity = velocity * (0.9);
        circleDy = circleDy + velocity;
      }

      //move brics horizontally
      for (var i = 0; i < totalBrics; i++) {
        Bric bric = topBrics[i];
        if (bric.dx < (size.x * (-brickWidthPercentage))) {
          topBrics[i] =
              bric.copyWith(dx: size.x, heightPercentage: getHeight());
        } else {
          topBrics[i] = bric.copyWith(dx: bric.dx - (dt * 150));
        }
      }

      //move bottom brics horizontally
      for (var i = 0; i < totalBrics; i++) {
        Bric bric = bottomBrics[i];
        if (bric.dx < (size.x * (-brickWidthPercentage))) {
          bottomBrics[i] =
              bric.copyWith(dx: size.x, heightPercentage: getHeight());
        } else {
          bottomBrics[i] = bric.copyWith(dx: bric.dx - (dt * 150));
        }
      }
    }

    super.update(dt);
  }

  @override
  void onTap() {
    if (gameStarted) {
      velocity = velocity - (15 * gravity);
    }
  }
}
