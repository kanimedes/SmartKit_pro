import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/Utils/utlis.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/model/workout.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';

class Workoutseeallactivity extends StatefulWidget {
  final Workout workout;
  const Workoutseeallactivity({
    Key? key,
    required this.workout,
  }) : super(key: key);

  @override
  State<Workoutseeallactivity> createState() => _WorkoutseeallactivityState();

  static Route<dynamic> routes(RouteSettings settings) {
    final argument = settings.arguments as Map;
    return CupertinoPageRoute(builder: (_) {
      return Workoutseeallactivity(
        workout: argument["Model"],
      );
    });
  }
}

class _WorkoutseeallactivityState extends State<Workoutseeallactivity> {
  int currentindex = 0;

  Future<void>? _initializeVideoPlayerFuture;

  Widget _buildlistofactivity() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: fitnessUiUtils.workoutvideo.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: GestureDetector(
              onTap: () {},
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
                    children: [
                      Text(
                        widget.workout.title,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  // _playview(context),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
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
              bottom: 15,
              left: 15,
              right: 15,
              child: CustomeRoundedButton(
                title: "START",
                width: MediaQuery.of(context).size.width * 0.84,
                hight: MediaQuery.of(context).size.height * 0.065,
                borderradius: 40,
              ),
            ),
            Positioned(
              top: 35,
              left: 10,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    "Workout Activity",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
