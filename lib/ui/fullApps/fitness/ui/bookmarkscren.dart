import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/Utils/utlis.dart';
import 'package:smartkit_pro/ui/fullApps/fitness/model/workout.dart';

import 'package:smartkit_pro/ui/fullApps/fitness/widget/customrRoundedButton.dart';

class Bookmarkscreen extends StatefulWidget {
  const Bookmarkscreen({Key? key}) : super(key: key);

  @override
  State<Bookmarkscreen> createState() => _BookmarkscreenState();
}

class _BookmarkscreenState extends State<Bookmarkscreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController _boxcontainer;
  late AnimationController _buttoncontroller;
  late Animation<Offset> _leftanimation;

  late Animation<Offset> _rightanimatio;

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
    _leftanimation =
        Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _buttoncontroller, curve: Curves.decelerate),
    );
    _rightanimatio = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
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

  Widget _buildworkoutcontainer({
    required Workout workout,
    required double width,
    required double hight,
    required Function ontap,
  }) {
    return GestureDetector(
      onTap: ontap as void Function()?,
      child: Container(
        height: hight,
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
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        workout.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${workout.duration} | ${workout.level}",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              workout.bookmark
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              color: Colors.white,
                              size: 15,
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

  Widget _buildbutton(String id) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomeRoundedButton(
            title: "Back",
            width: MediaQuery.of(context).size.width * 0.40,
            hight: MediaQuery.of(context).size.width * 0.15,
            containercolors: Theme.of(context).primaryColor.withOpacity(0.1),
            textcolor: Theme.of(context).primaryColor,
            ontap: () {
              Navigator.of(context).pop();
            },
            buttonmargin: true,
          ),
          CustomeRoundedButton(
            title: "Next",
            width: MediaQuery.of(context).size.width * 0.40,
            hight: MediaQuery.of(context).size.width * 0.15,
            ontap: () {
              Navigator.of(context)
                  .pop(); // fitnessUiUtils.BOOKMARKlIST.removeWhere(
              //     (element) => element.id == id);
            },
            buttonmargin: true,
          ),
        ],
      ),
    );
  }

  _showmodalbottamsheet(Workout workout) {
    return showModalBottomSheet<void>(
        backgroundColor: Theme.of(context).backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(
              50,
            ),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text("Remove From Bookmrk?"),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              _buildworkoutcontainer(
                hight: MediaQuery.of(context).size.height * 0.13,
                workout: workout,
                width: MediaQuery.of(context).size.width * 0.84,
                ontap: () {},
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              _buildbutton(workout.id),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 11.0,
                right: 11,
                top: MediaQuery.of(context).size.height * 0.12),
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 2,
                  mainAxisExtent: 200),
              itemBuilder: (BuildContext context, int index) {
                return SlideTransition(
                  position: index % 2 == 0 ? _leftanimation : _rightanimatio,
                  child: _buildworkoutcontainer(
                      workout: fitnessUiUtils.BOOKMARKlIST[index],
                      hight: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      ontap: () {
                        _showmodalbottamsheet(
                            fitnessUiUtils.BOOKMARKlIST[index]);
                      }),
                );
              },
              itemCount: fitnessUiUtils.BOOKMARKlIST.length,
            ),
          ),
          Positioned(
            top: 45,
            left: 10,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                Text(
                  "My Bookmark",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
