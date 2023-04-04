import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/Utils/utlis.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/ui/homescreen/yogascreen.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';

//import 'package:video_player/video_player.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/model/workout.dart';

class workoutdetailsScreen extends StatefulWidget {
  final Workout workout;
  const workoutdetailsScreen({
    Key? key,
    required this.workout,
  }) : super(key: key);
  @override
  _workoutvideoscreenState createState() => _workoutvideoscreenState();
  static Route<dynamic> routes(RouteSettings settings) {
    final argument = settings.arguments as Map;
    return CupertinoPageRoute(
        builder: (_) => workoutdetailsScreen(
              workout: argument["Model"],
            ));
  }
}

class _workoutvideoscreenState extends State<workoutdetailsScreen> {
  int currentindex = 0;

  Widget _buildbuttonlevel(String title) {
    return Expanded(
      child: Container(
        height: 40,
        width: 80,
        alignment: Alignment.center,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).backgroundColor),
        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildWorkoutleveltext() {
    return Row(
      children: [
        Text(
          "Workout Activity",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              Routes.workoutallactivity,
              arguments: {"Model": widget.workout},
            );
          },
          child: Text("See All"),
        ),
      ],
    );
  }

  Widget _buildlistofactivity() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: fitnessUiUtils.workoutvideo.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(Routes.mainyoga, arguments: {"index": index});
              },
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        topLeft: Radius.circular(20),
                      ),
                      image: DecorationImage(
                          image: AssetImage(
                            fitnessUiUtils.workoutvideo[index].imageurl,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        fitnessUiUtils.workoutvideo[index].title,
                        // textAlign: TextAlign.center,
                        //maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        //softWrap: false,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.workout.duration,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 7,
      width: currentindex == index ? 25 : 7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: currentindex == index
            ? Colors.white
            : Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _dots() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
            left: 20, bottom: MediaQuery.of(context).size.height * 0.12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => buildDot(index, context),
          ),
        ),
      ),
    );
  }

  Widget _buildpageviewbuilder() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.300,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        //fit: StackFit.passthrough,
        //alignment: Alignment.center,
        children: [
          PageView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.00),
                      Colors.black.withOpacity(0.00),
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.5),
                    ],
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      widget.workout.imageurl[currentindex],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: Image.asset(
                //   widget.workout.imageurl[currentindex],
                //   fit: BoxFit.cover,
                // ),
              );
            },
            itemCount: widget.workout.imageurl.length,
            onPageChanged: (value) {
              currentindex = value;
              setState(() {});
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.27,
            right: 0,
            left: 0,
            child: _dots(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  _buildpageviewbuilder(),
                  // _playview(context),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.workout.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            _buildbuttonlevel(widget.workout.level),
                            _buildbuttonlevel(widget.workout.duration),
                            _buildbuttonlevel(
                                "${fitnessUiUtils.workoutvideo.length} Workouts")
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        _buildWorkoutleveltext(),
                        _buildlistofactivity(),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 45,
              left: 15,
              right: 15,
              child: CustomeRoundedButton(
                  title: "START",
                  width: MediaQuery.of(context).size.width * 0.84,
                  hight: MediaQuery.of(context).size.height * 0.065,
                  borderradius: 40,
                  ontap: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (_) => Getready()));
                  }),
            ),
            Positioned(
              top: 15,
              left: 10,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            Positioned(
              right: 5,
              top: 15,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.bookmark_outline),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.circle_rounded),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
