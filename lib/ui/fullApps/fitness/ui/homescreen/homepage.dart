import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/Utils/utlis.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/model/workout.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/routes.dart';

class FitnessHomePage extends StatefulWidget {
  const FitnessHomePage({Key? key}) : super(key: key);

  @override
  State<FitnessHomePage> createState() => _FitnessHomePageState();
}

class _FitnessHomePageState extends State<FitnessHomePage>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController _boxcontainer;

  late Animation<Offset> _titleanimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 700),
    );
    animationController.forward();
    _boxcontainer =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    _titleanimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _boxcontainer, curve: Curves.decelerate));

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
  Widget _buildappbar() {
    return SlideTransition(
      position: _titleanimation,
      child: Row(
        children: [
          Image.asset(
            "assets/images/fullApps/fitness/smalllogo.png",
            height: 40,
            width: 40,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "Fitness",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.notifaction);
            },
            icon: Icon(
              Icons.notifications_outlined,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.bookmark);
            },
            icon: Icon(
              Icons.bookmark_border,
              size: 25,
            ),
          ),
          SizedBox(
            width: 0,
          )
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
    return SlideTransition(
      position: _titleanimation,
      child: InkWell(
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
                    borderRadius: BorderRadius.circular(25),
                  ),
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
                            fontSize: 20,
                            //fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${workout.duration}  |  ${workout.level}",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                //fontWeight: FontWeight.w600,
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
      ),
    );
  }

  Widget _buildworkoutlist() {
    return SlideTransition(
      position: _titleanimation,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: fitnessUiUtils.workout.length,
          itemBuilder: (BuildContext context, int index) {
            final fitnesslist = fitnessUiUtils.workout[index];
            return SlideTransition(
              position: _titleanimation,
              child: _buildworkoutcontainer(
                  workout: fitnesslist,
                  bottom: 0,
                  right: 15,
                  width: MediaQuery.of(context).size.width * 0.60,
                  ontap: () {
                    Navigator.of(context).pushNamed(Routes.workoutdetailscreen,
                        arguments: {"Model": fitnesslist});
                  }),
            );
          },
        ),
      ),
    );
  }

  Widget _buildlevelworkoutlist() {
    return SlideTransition(
      position: _titleanimation,
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

  Widget buildmorningtext() {
    return SlideTransition(
      position: _titleanimation,
      child: Text(
        "${"Morning, christina"}${"\uD83D\uDC4B"}",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildWorkouttext() {
    return SlideTransition(
      position: _titleanimation,
      child: Row(
        children: const [
          Text(
            "Featured Workout ",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          // Spacer(),
          // GestureDetector(
          //   onTap: () {},
          //   child: Text("See All"),
          // ),
        ],
      ),
    );
  }

  Widget _buildWorkoutleveltext() {
    return SlideTransition(
      position: _titleanimation,
      child: Row(
        children: [
          Text(
            "Workout level",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.workoutlevelscreen);
            },
            child: Text("See All"),
          ),
        ],
      ),
    );
  }

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
              border: Border.all(
                color: Theme.of(context).primaryColor,
              ),
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

  Widget buildrowbutton() {
    return SlideTransition(
      position: _titleanimation,
      child: Row(
        children: [
          _buildbuttonlevel("Beginner", 1),
          _buildbuttonlevel("InterMediate", 2),
          _buildbuttonlevel("Advanced", 3),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildappbar(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              buildmorningtext(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              _buildWorkouttext(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              _buildworkoutlist(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              _buildWorkoutleveltext(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              buildrowbutton(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              _buildlevelworkoutlist(),
              // _buildworkoutcontainer(
              //   imageurl: fitnessUiUtils.getImagePath("advance.jpeg"),
              //   title: "done",
              //   durtion: "10 minit",
              //   level: "5",
              //   isbookmark: false,
              //   width: MediaQuery.of(context).size.width * 0.90,
              // ),
              //  _buildpageviewbuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
