// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/games/brickBreaker/models/brick.dart';
import 'package:smartkit_pro/ui/games/brickBreaker/widgets/ballContaienr.dart';
import 'package:smartkit_pro/ui/games/brickBreaker/widgets/platformContainer.dart';
import 'package:smartkit_pro/utils/uiUtils.dart';

class BrickBreakerScreen extends StatefulWidget {
  const BrickBreakerScreen({Key? key}) : super(key: key);

  @override
  _BrickBreakerScreenState createState() => _BrickBreakerScreenState();
}

const double ballWidth = 20.0;
const double ballHeight = 20.0;
const double platformHeight = 30.0;

//space between bricks and statusbar
const double defaultTopBricksPadding = 80;
const double inBetweenTopBrickPadding = 10;

const double brickWidthPercentage = 0.175; //with respects to screen width
const double brickHeightPercentage = 0.03; //with respects to screen height
const double inbetweenBrickSpace = 10.0;

//how many pixels ball will move in x and y direction
const double ballMovePixels = 3.0;

//
const int totalBrickRow = 3;
//bricks in row
const int bricksInRow = 4;
const double platfomrWidthPercentage = 0.3;

const double gestureAreaHeightPercentage =
    0.3; //with resppects to screen height

enum BallDirection { DOWN, UP, LEFT, RIGHT }

class _BrickBreakerScreenState extends State<BrickBreakerScreen>
    with TickerProviderStateMixin {
  bool isReadyToPlay = false;

  //to track x and y point of ball
  late double ballX = 0.5;
  late double ballY = 0.5;

  BallDirection ballVerticalDirection = BallDirection.UP;

  BallDirection ballHorizontalDirection = BallDirection.LEFT;

  late double platFormWidth;

  //game loop
  late Timer? timer;
  late Size screenSize;

  late bool gameOver = false;
  late bool gameCompleted = false;

  late List<Brick> bricks = [];

  late int score = 0;

  late final AnimationController _platformSlideAnimationController =
      AnimationController(vsync: this, value: 0.5);

  late final Animation<double> _platformSlideAnimation =
      Tween<double>(begin: 0.0, end: (1.0 - platfomrWidthPercentage))
          .animate(_platformSlideAnimationController);

  late bool gameStarted = false;

  @override
  void initState() {
    super.initState();

    UiUtils.changeStatusBarBrightness(Brightness.light);
    Future.delayed(const Duration(milliseconds: 500), () {
      initGame();
      addBricks();
      isReadyToPlay = true;
      setState(() {});
    });
  }

  void initGame() {
    screenSize = MediaQuery.of(context).size;
    //initial position of ball
    ballX = screenSize.width * (0.5) - ballWidth * (0.5);
    ballY = screenSize.height * (0.5) - ballHeight * (0.5);
    //calculating platform width
    platFormWidth = screenSize.width * platfomrWidthPercentage;
  }

  //to calculate the brick x position
  double _calculateBrickX(int currentBrickIndex) {
    //it calculates the brick left padding
    double brickX = (MediaQuery.of(context).size.width -
            ((MediaQuery.of(context).size.width *
                    brickWidthPercentage *
                    bricksInRow) +
                inbetweenBrickSpace * (bricksInRow - 1))) *
        0.5;

    for (var i = currentBrickIndex; i > 0; i--) {
      brickX = screenSize.width * brickWidthPercentage +
          brickX +
          inbetweenBrickSpace;
    }

    return brickX;
  }

  double _calculateBrickY(int currentRowIndex) {
    //top padding of bricks
    double brickY = defaultTopBricksPadding;

    for (var i = currentRowIndex; i > 0; i--) {
      brickY = screenSize.height * brickHeightPercentage +
          brickY +
          //if brick row in not first then add inBetweenTopPadding
          (currentRowIndex == 0 ? 0 : inBetweenTopBrickPadding);
    }

    return brickY;
  }

  //bircks will be add in row wise
  //fitst row of bricks build and so on
  void addBricks() {
    for (var i = 0; i < totalBrickRow; i++) {
      for (var j = 0; j < bricksInRow; j++) {
        bricks.add(Brick(
          bricX: _calculateBrickX(j),
          brickHeight: screenSize.height * brickHeightPercentage,
          brickWidth: screenSize.width * brickWidthPercentage,
          brickY: _calculateBrickY(i),
          broken: false,
        ));
      }
    }
  }

  void startTimer(Size screenSize) {
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      breakBricks();

      changeBallDirection(screenSize);
      moveBall();
      if (allBricksBroken()) {
        gameCompleted = true;
        setState(() {});
        timer.cancel();
        gameCompletedDialog();
      }
    });
  }

  //to move the ball
  void moveBall() {
    setState(() {
      if (ballVerticalDirection == BallDirection.DOWN) {
        ballY += ballMovePixels;
      } else if (ballVerticalDirection == BallDirection.UP) {
        ballY -= ballMovePixels;
      }

      if (ballHorizontalDirection == BallDirection.RIGHT) {
        ballX += ballMovePixels;
      } else if (ballHorizontalDirection == BallDirection.LEFT) {
        ballX -= ballMovePixels;
      }
    });
  }

  bool isBallTouchesToPlatform() {
    //need to calculate the left padding so we will get the x position of platform
    final lower = screenSize.width * _platformSlideAnimation.value;

    //will add the platformWidth
    final higher = lower + platFormWidth;
    //if ballX is in between this range then it touches the platform
    return (ballX >= lower && ballX <= higher);
  }

  //
  void changeBallDirection(Size screenSize) {
    //it will be bottom limit for ball to go
    final platformY = screenSize.height * gestureAreaHeightPercentage;
    setState(() {
      //maximum ball can go to the down side
      if (ballY >= (screenSize.height - platformY - ballHeight)) {
        //need to check if ball is touching the platform or not
        if (isBallTouchesToPlatform()) {
          ballVerticalDirection = BallDirection.UP;
        } else {
          //user failed to bounce the ball back
          timer?.cancel();
          gameOver = true;
        }
      } else if (ballY < defaultTopBricksPadding) {
        ballVerticalDirection = BallDirection.DOWN;
      }

      //change ballX direction
      if (ballX < 0) {
        ballHorizontalDirection = BallDirection.RIGHT;
      } else if (ballX > screenSize.width - (ballWidth)) {
        ballHorizontalDirection = BallDirection.LEFT;
      }
    });

    if (gameOver) {
      gameOverDialog();
    }
  }

  bool allBricksBroken() {
    bool allBricksBroken = true;
    for (var i = 0; i < bricks.length - 1; i++) {
      //checking any brick is unbroken or not
      if (!bricks[i].broken) {
        allBricksBroken = false;
        break;
      }
    }
    return allBricksBroken;
  }

  void breakBricks() {
    for (var i = (bricks.length - 1); i >= 0; i--) {
      Brick brick = bricks[i];
      if (!brick.broken) {
        //check for ballY has in the range of brickY
        if (ballY >= brick.brickY &&
            ballY <= brick.brickY + brick.brickHeight) {
          //check for ballX has in range of brickY
          if (ballX >= brick.bricX && ballX <= brick.bricX + brick.brickWidth) {
            bricks[i] = brick.breakBrick();
            score++;

            ballVerticalDirection = BallDirection.DOWN;
            setState(() {});
            break;
          }
        }
      } else {}
    }
  }

  Widget _buildBrick(Brick brick) {
    return brick.broken
        ? Container()
        : Positioned(
            top: brick.brickY,
            left: brick.bricX,
            child: Container(
              width: brick.brickWidth,
              height: brick.brickHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white),
            ));
  }

  void restartGame() async {
    initGame();
    bricks.clear();
    score = 0;
    gameCompleted = false;
    gameOver = false;
    addBricks();
    ballVerticalDirection = BallDirection.UP;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 500));
    startTimer(screenSize);
  }

  void gameOverDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => WillPopScope(
              onWillPop: () => Future.value(false),
              child: AlertDialog(
                title: const Text("Game over",
                    style: TextStyle(color: Colors.black)),
                content: Text("Score is : $score",
                    style: const TextStyle(color: Colors.black)),
                actions: [
                  CupertinoButton(
                      child: const Text("Restart",
                          style: TextStyle(color: Colors.black)),
                      onPressed: () {
                        restartGame();
                        Navigator.of(context).pop();
                      }),
                  CupertinoButton(
                      child: const Text(
                        "Exit",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ));
  }

  void gameCompletedDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => WillPopScope(
              onWillPop: () => Future.value(false),
              child: AlertDialog(
                title: const Text(
                  "You won",
                  style: TextStyle(color: Colors.black),
                ),
                content: Text("Score is : $score",
                    style: const TextStyle(color: Colors.black)),
                actions: [
                  TextButton(
                      child: const Text(
                        "Restart",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        restartGame();
                        Navigator.of(context).pop();
                      }),
                  TextButton(
                      child: const Text(
                        "Exit",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ));
  }

  Widget _buildScore() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 20.0, bottom: 30.0),
        child: Text(
          "Score : $score",
          style: const TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: gameStarted
          ? const SizedBox()
          : FloatingActionButton(
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.play_arrow,
                color: Colors.black,
                size: 40.0,
              ),
              onPressed: () {
                startTimer(screenSize);
                setState(() {
                  gameStarted = true;
                });
              }),
      backgroundColor: Colors.black,
      body: isReadyToPlay
          ? Stack(
              children: [
                ...bricks.map((brick) => _buildBrick(brick)).toList(),
                Positioned(
                  left: ballX,
                  top: ballY,
                  child: const BallContainer(),
                ),
                AnimatedBuilder(
                  builder: (context, child) {
                    return Positioned(
                      child: PlatformContainer(
                        width: platFormWidth,
                      ),
                      bottom: screenSize.height * gestureAreaHeightPercentage -
                          platformHeight,
                      left: screenSize.width * (_platformSlideAnimation.value),
                    );
                  },
                  animation: _platformSlideAnimationController,
                ),
                _buildScore(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onHorizontalDragUpdate: (dragUpdateDetails) {
                      if (gameOver || gameCompleted) {
                        return;
                      }
                      final dragged = dragUpdateDetails.primaryDelta! /
                          MediaQuery.of(context).size.width;

                      _platformSlideAnimationController.value =
                          _platformSlideAnimationController.value +
                              dragged * (1.275);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent)),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height *
                          gestureAreaHeightPercentage,
                    ),
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}
