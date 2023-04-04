import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/games/snack/utils/randomNumber.dart';
import 'package:smartkit_pro/utils/uiUtils.dart';

enum SnackDirection { left, up, down, right }

class SnackGameScreen extends StatefulWidget {
  const SnackGameScreen({Key? key}) : super(key: key);

  @override
  State<SnackGameScreen> createState() => _SnackGameScreenState();
}

class _SnackGameScreenState extends State<SnackGameScreen> {
  List<int> snake = [];
  Timer? gameLoop;
  late int columns = 0;
  late int score = 0;
  late int rows = 0;
  late bool isLoading = true;
  late SnackDirection snackDirection = SnackDirection.down;
  late bool gameOver = false;
  late int foodIndex = 0;
  late double blockHeightAndWidth = 30.0;

  Color _gridContainerColor(int index) {
    if (snake.contains(index)) return Colors.green;
    if (foodIndex == index) return Colors.red;
    return Colors.white.withOpacity(0.8);
  }

  @override
  void dispose() {
    gameLoop?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    UiUtils.changeStatusBarBrightness(Brightness.light);
    Future.delayed(Duration.zero, () async {
      columns = (MediaQuery.of(context).size.width ~/ blockHeightAndWidth);
      rows =
          (MediaQuery.of(context).size.height * (0.7) ~/ blockHeightAndWidth);
      snake.add((columns ~/ 2) * 5);
      snake.add(snake.first - columns);

      isLoading = false;
      foodIndex = RandomNumber.randomInteger(columns * rows);

      setState(() {});
      await Future.delayed(const Duration(milliseconds: 100));
      startTimer();
    });
  }

  void reStart() {
    snake = [];
    snake.add((columns ~/ 2) * 5);
    snake.add(snake.first - columns);

    isLoading = false;
    gameOver = false;
    snackDirection = SnackDirection.down;
    score = 0;
    foodIndex = RandomNumber.randomInteger(columns * rows);
    startTimer();
    setState(() {});
  }

  void startTimer() {
    gameLoop = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      if (snackDirection == SnackDirection.down) {
        //check snack is not hitting bottom edge
        if ((rows * columns) - snake.first > columns) {
          snake.insert(0, snake.first + columns);
        } else {
          timer.cancel();
          gameOver = true;
        }
      } else if (snackDirection == SnackDirection.up) {
        //check snack is not hitting bottom edge
        if (snake.first > columns) {
          snake.insert(0, snake.first - columns);
        } else {
          timer.cancel();
          gameOver = true;
        }
      } else if (snackDirection == SnackDirection.right) {
        bool hittingEdge = false;
        for (var i = 0; i < rows; i++) {
          if (snake.first == (columns - 1) + columns * i) {
            hittingEdge = true;
          }
        }

        if (!hittingEdge) {
          snake.insert(0, snake.first + 1);
        } else {
          timer.cancel();
          gameOver = true;
        }
      } else if (snackDirection == SnackDirection.left) {
        //check for left edge
        bool hittingEdge = false;
        for (var i = 0; i < rows; i++) {
          if (snake.first == (i * columns)) {
            hittingEdge = true;
          }
        }

        if (!hittingEdge) {
          snake.insert(0, snake.first - 1);
        } else {
          timer.cancel();
          gameOver = true;
        }
      }
      if (snake.sublist(1).contains(snake.first)) {
        timer.cancel();
        gameOver = true;
      } else {
        if (snake.contains(foodIndex)) {
          score++;
          foodIndex = RandomNumber.randomInteger(columns * rows);
        } else {
          snake.removeLast();
        }
      }

      setState(() {});
    });
  }

  /*
  if (snackDirection != SnackDirection.down) {
          snackDirection = SnackDirection.up;
        }
   */
  Widget _buildControlButton(IconData iconData, Function onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey.shade900,
              boxShadow: [
                const BoxShadow(
                  blurRadius: 10,
                  color: Colors.black,
                  offset: Offset(3, 3),
                ),
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey.shade800,
                  offset: const Offset(-3, -3),
                ),
              ]),
          child: Icon(
            iconData,
            color: Colors.white.withOpacity(0.8),
          ),
          height: 65.0,
          width: 65.0,
        ),
      ),
    );
  }

  Widget _buildControlMenu() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildControlButton(Icons.arrow_upward, () {
                if (snackDirection != SnackDirection.down) {
                  snackDirection = SnackDirection.up;
                }
              }),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildControlButton(Icons.arrow_back_rounded, () {
                    if (snackDirection != SnackDirection.right) {
                      snackDirection = SnackDirection.left;
                    }
                  }),
                  _buildControlButton(Icons.arrow_downward, () {
                    if (snackDirection != SnackDirection.up) {
                      snackDirection = SnackDirection.down;
                    }
                  }),
                  _buildControlButton(Icons.arrow_forward, () {
                    if (snackDirection != SnackDirection.left) {
                      snackDirection = SnackDirection.right;
                    }
                  }),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _buildScore() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 20.0, bottom: 115.0),
        child: Text(
          "Score : $score",
          style:
              TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 18.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                RawKeyboardListener(
                  autofocus: true,
                  focusNode: FocusNode(),
                  onKey: (key) {
                    if (key.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
                      if (snackDirection != SnackDirection.right) {
                        snackDirection = SnackDirection.left;
                      }
                    } else if (key
                        .isKeyPressed(LogicalKeyboardKey.arrowRight)) {
                      if (snackDirection != SnackDirection.left) {
                        snackDirection = SnackDirection.right;
                      }
                    } else if (key.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
                      if (snackDirection != SnackDirection.down) {
                        snackDirection = SnackDirection.up;
                      }
                    } else if (key.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
                      if (snackDirection != SnackDirection.up) {
                        snackDirection = SnackDirection.down;
                      }
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                    ),
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2.5,
                        vertical: 2.5,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: 2.5,
                          mainAxisSpacing: 2.5),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.only(
                            right: 5.0,
                          ),
                          alignment: Alignment.centerRight,
                          child: snake.first == index
                              ? const CircleAvatar(
                                  backgroundColor: Colors.yellow,
                                  radius: 5,
                                )
                              : const SizedBox(),
                          decoration: BoxDecoration(
                              color: _gridContainerColor(index),
                              borderRadius: BorderRadius.circular(2.5)),
                        );
                      },
                      itemCount: rows * columns,
                    ),
                  ),
                ),
                _buildControlMenu(),
                _buildScore(),
                gameOver
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        alignment: Alignment.center,
                        child: AlertDialog(
                          content: Text(
                            "Score $score",
                            style: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600),
                          ),
                          actions: [
                            CupertinoButton(
                                child: Text("Back",
                                    style: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontWeight: FontWeight.w500)),
                                onPressed: () {
                                  //
                                  Navigator.of(context).pop();
                                }),
                            CupertinoButton(
                                child: Text("Play Again",
                                    style: TextStyle(
                                        color: Colors.grey.shade900,
                                        fontWeight: FontWeight.w500)),
                                onPressed: () {
                                  reStart();
                                }),
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
    );
  }
}
