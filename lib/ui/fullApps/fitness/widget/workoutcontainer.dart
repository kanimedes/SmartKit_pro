import 'package:flutter/material.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/model/workout.dart';

class Workoutcontainer extends StatefulWidget {
  final Workout workout;
  final double bottom;
  final double right;
  final double? hight;
  final double width;
  final Function ontap;
  const Workoutcontainer({
    Key? key,
    required this.workout,
    required this.bottom,
    required this.right,
    this.hight,
    required this.width,
    required this.ontap,
  }) : super(key: key);

  @override
  State<Workoutcontainer> createState() => _WorkoutcontainerState();
}

class _WorkoutcontainerState extends State<Workoutcontainer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap as void Function()?,
      child: Container(
        margin: EdgeInsets.only(right: widget.right, bottom: widget.bottom),
        height: MediaQuery.of(context).size.height * 0.20,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: AssetImage(
                  widget.workout.imageurl[0],
                ),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
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
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.workout.title,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.workout.duration}  |  ${widget.workout.level}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              widget.workout.bookmark
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
