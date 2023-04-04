import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/Utils/utlis.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/model/workout.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';

class Workoutlevel extends StatefulWidget {
  const Workoutlevel({Key? key}) : super(key: key);

  @override
  State<Workoutlevel> createState() => _WorkoutlevelState();
}

class _WorkoutlevelState extends State<Workoutlevel>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController _boxcontainer;
  late AnimationController _buttoncontroller;
  late Animation<Offset> _titleanimation;

  late Animation<Offset> _buttonanimation;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 700),
    );
    animationController.forward();
    _boxcontainer =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _buttoncontroller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _titleanimation = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _boxcontainer, curve: Curves.decelerate));
    _buttonanimation = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: _buttoncontroller, curve: Curves.decelerate));
    _buttoncontroller.forward();
    _boxcontainer.forward(from: 0.01);
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  int selectindex = 1;

  Widget _buildbuttonlevel(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          selectindex = index;
          setState(() {});
        },
        child: Container(
          height: 40,
          width: 80,
          alignment: Alignment.center,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(20),
              color: selectindex == index
                  ? Theme.of(context).primaryColor
                  : Colors.transparent),
          child: Text(
            title,
            style: TextStyle(
              color: selectindex == index
                  ? Theme.of(context).backgroundColor
                  : Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildrowbutton() {
    return SlideTransition(
      position: _titleanimation,
      child: Row(
        children: [
          _buildbuttonlevel("Beginner", 1),
          _buildbuttonlevel("Intermediate", 2),
          _buildbuttonlevel("Advanced", 3),
        ],
      ),
    );
  }

  Widget _buildworkoutcontainer({
    required Workout workout,
    required double bottom,
    required double right,
    // ignore: unused_element
    double? hight,
    required double width,
    required Function ontap,
  }) {
    return InkWell(
      onTap: ontap as void Function()?,
      child: Container(
        margin: EdgeInsets.only(right: right, bottom: bottom),
        height: MediaQuery.of(context).size.height * 0.20,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: AssetImage(
                  workout.image,
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
                        workout.title,
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
                            "${workout.duration}  |  ${workout.level}",
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
                              workout.bookmark
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

  Widget _buildlevelworkoutlist() {
    return SlideTransition(
      position: _buttonanimation,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(bottom: 15),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            //scrollDirection: Axis.horizontal,
            itemCount: selectindex == 1
                ? fitnessUiUtils.beginnerworkout.length
                : selectindex == 2
                    ? fitnessUiUtils.intermemediateworkout.length
                    : fitnessUiUtils.advanworkout.length,
            itemBuilder: (BuildContext context, int index) {
              final fitnesslist = selectindex == 1
                  ? fitnessUiUtils.beginnerworkout[index]
                  : selectindex == 2
                      ? fitnessUiUtils.intermemediateworkout[index]
                      : fitnessUiUtils.advanworkout[index];
              return _buildworkoutcontainer(
                  workout: fitnesslist,
                  bottom: 15,
                  right: 0,
                  width: MediaQuery.of(context).size.width * 0.60,
                  ontap: () {
                    Navigator.of(context).pushNamed(
                      Routes.workoutdetailscreen,
                      arguments: {"Model": fitnesslist},
                    );
                  });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildappbar() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          "Workout Level",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    _buildappbar(),
                    SizedBox(
                      height: 10,
                    ),
                    _buildrowbutton(),
                    //

                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.02),
                        child: _buildlevelworkoutlist()),
                    // _buildbeginnerworkoutlist(),
                  ],
                ),
              ),
              // Column(
              //   children: [
              //     _buildappbar(),
              //     SizedBox(
              //       height: 10,
              //     ),
              //     _buildrowbutton(),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
