import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:smartkit_pro/ui/fullApps/fitness/Utils/utlis.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';

class YoganextScreen extends StatefulWidget {
  final int index;
  const YoganextScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<YoganextScreen> createState() => _YoganextScreenState();

  static Route<dynamic> routes(RouteSettings settings) {
    final argument = settings.arguments as Map;
    return CupertinoPageRoute(
        builder: (_) => YoganextScreen(index: argument["index"]));
  }
}

class _YoganextScreenState extends State<YoganextScreen> {
  final _scaffolkey = GlobalKey<ScaffoldState>();

  late Timer _timer;
  int _start = 9;
  @override
  void initState() {
    super.initState();
    print(" current index ${widget.index}");
    print("********");

    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Widget _buildtimercontainer() {
    return Column(
      children: [
        Text(
          "TAKE A REST",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Text(
          "00:0$_start",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }

  Widget _buildbutton() {
    return CustomeRoundedButton(
      title: "skip Rest",
      width: MediaQuery.of(context).size.width * 0.84,
      hight: MediaQuery.of(context).size.height * 0.06,
      ontap: () {
        Navigator.of(context).pushNamed(Routes.winner);
      },
    );
  }

  Widget _buildprevious() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Next Movement(${widget.index + 1}/${fitnessUiUtils.workoutvideo.length})",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Text(
          fitnessUiUtils.workoutvideo[widget.index + 1].title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        GestureDetector(
          onTap: () {
            fitnessUiUtils.workoutvideo.length - 1 == widget.index
                ? Navigator.of(context).pushNamed(Routes.winner)
                : Navigator.of(context).pushNamed(Routes.mainyoga,
                    arguments: {"index": widget.index + 1});
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.49,
                width: MediaQuery.of(context).size.width * 0.84,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    image: AssetImage(
                      fitnessUiUtils.workoutvideo[widget.index + 1].imageurl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  height: 60,
                  width: 60,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.white
                          // border: Border.all(color: Colors.white),
                          ),
                  child: Center(
                      child: Icon(
                    Icons.play_arrow_rounded,
                    size: 35,
                  ))),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolkey,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                _buildtimercontainer(),
                Divider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                _buildprevious(),
                Spacer(),
                _buildbutton(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
