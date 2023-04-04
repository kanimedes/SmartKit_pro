import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';

class Getready extends StatefulWidget {
  const Getready({Key? key}) : super(key: key);

  @override
  State<Getready> createState() => _GetreadyState();
}

class _GetreadyState extends State<Getready> {
  final int _duration = 10;
  late final _controller = CountDownController();
  final _scaffolkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              " Get Ready!",
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 00.07),
            CircularCountDownTimer(
              duration: 5,
              initialDuration: 0,
              controller: _controller,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              ringColor: const Color.fromARGB(255, 144, 156, 212),
              ringGradient: null,
              fillColor: const Color(0xff6841FF),
              fillGradient: null,
              //backgroundColor: Colors.purple[500],
              backgroundGradient: null,
              strokeWidth: 15.0,
              strokeCap: StrokeCap.round,
              textStyle: const TextStyle(
                fontSize: 60.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textFormat: CountdownTextFormat.S,
              isReverse: true,
              isReverseAnimation: false,
              isTimerTextShown: true,
              autoStart: true,
              onStart: () {
                debugPrint('Countdown Started');
              },
              onComplete: () {
                Navigator.of(context).pushReplacementNamed(Routes.mainyoga,
                    arguments: {"index": 0});
              },
            ),
          ],
        ),
      ),
    );
  }
}
