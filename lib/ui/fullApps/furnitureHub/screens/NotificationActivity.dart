import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/Notification_Model.dart';

import '../../widgets/slideAnimation.dart';

class NotificationActivity extends StatefulWidget {
  const NotificationActivity({Key? key}) : super(key: key);

  @override
  _NotificationActivityState createState() => _NotificationActivityState();
}

class _NotificationActivityState extends State<NotificationActivity>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  Widget notificationListData() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.2,
      color: ColorsRes.backgroundColor,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: notificationList.length,
          itemBuilder: (BuildContext context, int index) {
            return SlideAnimation(
              position: index,
              itemCount: notificationList.length,
              slideDirection: SlideDirection.fromBottom,
              animationController: _animationController,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(
                    top: 5.0,
                  ),
                  padding: EdgeInsets.only(top: 5, bottom: 5.0, left: 12.0),
                  child: ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 40,
                        right: MediaQuery.of(context).size.width / 40),
                    leading: SvgPicture.asset(notificationList[index].image!),
                    title: Expanded(
                      child: Text(
                        notificationList[index].title!,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorsRes.purpalColor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.0),
                        Text(
                          notificationList[index].time!,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: ColorsRes.greyColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Divider(color: ColorsRes.greyColor),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        appBar: AppBar(
          backgroundColor: ColorsRes.backgroundColor,
          shadowColor: Colors.transparent,
          title: Text(
            StringsRes.notificationText,
            style: TextStyle(
                color: ColorsRes.violateColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            child: Divider(
              color: ColorsRes.greyColor,
              height: 2.3,
            ),
            preferredSize: Size(50, 5),
          ),
          centerTitle: true,
          leading: SlideAnimation(
            position: 1,
            itemCount: 11,
            slideDirection: SlideDirection.fromTop,
            animationController: _animationController,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:
                      Icon(Icons.arrow_back_ios, color: ColorsRes.purpalColor)),
            ),
          ),
          actions: [
            SlideAnimation(
              position: 1,
              itemCount: 11,
              slideDirection: SlideDirection.fromTop,
              animationController: _animationController,
              child: InkWell(
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height / 40),
                  child: Text(
                    StringsRes.clearAllText,
                    style: TextStyle(
                        color: ColorsRes.yellowColor,
                        fontSize: 10,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: ColorsRes.backgroundColor,
            child: Column(children: [
              SizedBox(height: MediaQuery.of(context).size.height / 99),
              notificationListData(),
            ]),
          ),
        ));
  }
}
