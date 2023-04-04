import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/games/flappyBall/flappyBallGame.dart';
import 'package:smartkit_pro/utils/uiUtils.dart';

class FlappyBallScreen extends StatefulWidget {
  const FlappyBallScreen({Key? key}) : super(key: key);

  @override
  State<FlappyBallScreen> createState() => _FlappyBallScreenState();
}

class _FlappyBallScreenState extends State<FlappyBallScreen> {
  late bool isGameOver = false;
  late FlappyBallGame flappyBallGame =
      FlappyBallGame(isGameOver: changeGameOver);

  void changeGameOver() {
    isGameOver = !isGameOver;
    setState(() {});
  }

  @override
  void initState() {
    UiUtils.changeStatusBarBrightness(Brightness.light);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          GameWidget<FlappyBallGame>(game: flappyBallGame),
          isGameOver
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white30,
                  child: AlertDialog(
                    title: const Text("Game Over"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              isGameOver = !isGameOver;
                              flappyBallGame =
                                  FlappyBallGame(isGameOver: changeGameOver);
                            });
                          },
                          child: const Text(
                            "Play Agian",
                            style: TextStyle(color: Colors.black),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Go Back",
                              style: TextStyle(color: Colors.black))),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
