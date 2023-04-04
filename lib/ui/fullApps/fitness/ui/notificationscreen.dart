// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class NotificationScren extends StatefulWidget {
  const NotificationScren({Key? key}) : super(key: key);

  @override
  State<NotificationScren> createState() => _NotificationScrenState();
}

class _NotificationScrenState extends State<NotificationScren>
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
    _titleanimation = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
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

  Widget buildlisttile(
      String title, String subtitlr, Color iconbackground, IconData icondata) {
    return SlideTransition(
      position: _titleanimation,
      child: Container(
        // color: Colors.teal,
        //height: MediaQuery.of(context).size.height * 0.12,
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(150),
                color: iconbackground,
              ),
              child: Icon(
                icondata,
                color: Theme.of(context).backgroundColor,
                size: 25,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .55,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .55,
                    child: Text(
                      subtitlr,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildtitle(String title) {
    return SlideTransition(
      position: _buttonanimation,
      child: Text(
        title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: MediaQuery.of(context).size.height * 0.04,
                  bottom: MediaQuery.of(context).size.height * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  _buildtitle("Today"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  buildlisttile(
                    "Congratulation!",
                    "You've Been Execrising for 2Hours",
                    Colors.green[700]!,
                    Icons.check_box_rounded,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  buildlisttile(
                    "New Workout is Available!",
                    "Check Now and  Practice",
                    Colors.blue[400]!,
                    Icons.add_box_sharp,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  _buildtitle("Yesterday"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  buildlisttile(
                    "Congratulation!",
                    "You've Been Execrising for 2Hours",
                    Colors.red[300]!,
                    Icons.access_time_rounded,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  buildlisttile(
                    "New Workout is Available!",
                    "Check Now and  Practice",
                    Colors.blue[400]!,
                    Icons.add_box_sharp,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  _buildtitle("Yesterday"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  buildlisttile(
                    "Congratulation!",
                    "You've Been Execrising for 2Hours",
                    Colors.red[300]!,
                    Icons.access_time_rounded,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  buildlisttile(
                    "New Workout is Available!",
                    "Check Now and  Practice",
                    Colors.blue[400]!,
                    Icons.add_box_sharp,
                  ),
                ],
              ),
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
                  "NotiFaction",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
