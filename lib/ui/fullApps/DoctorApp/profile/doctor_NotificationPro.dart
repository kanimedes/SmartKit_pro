import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/SlideAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import 'model/commonModel.dart';

class NotificationPro extends StatefulWidget {
  const NotificationPro({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NotificationProState();
  }
}

class NotificationProState extends State<NotificationPro>
    with TickerProviderStateMixin {
  List<CommonModel> notificationList = [
    CommonModel(name: "Sound", check: false),
    CommonModel(name: "Vibrate", check: true),
    CommonModel(name: "New tips available", check: false),
    CommonModel(name: "New service available", check: false),
  ];
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorRes.white,
        appBar: DoctorDesignConfig.appBar(
            context: context,
            isIcon: false,
            title: DoctorStringRes.notification,
            iconColor: ColorRes.blue,
            textColor: ColorRes.black),
        body: Container(
          margin:
              EdgeInsets.only(left: size.width * .04, right: size.width * .04),
          child: ListView.builder(
              itemCount: notificationList.length,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return DoctorAnimation(
                    delay: 100,
                    child: SlideAnimation(
                        position: 10,
                        itemCount: 20,
                        slideDirection: SlideDirection.fromBottom,
                        animationController: _animationController,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                notificationList[index].name!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              trailing: CupertinoSwitch(
                                  activeColor: ColorRes.blue,
                                  value: notificationList[index].check!,
                                  onChanged: (value) {
                                    setState(() {
                                      notificationList[index].check = value;
                                    });
                                  }),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: size.height * .015,
                              ),
                              child: const Divider(
                                height: 1,
                                color: Color(0xffacacac),
                              ),
                            ),
                          ],
                        )));
              }),
        ));
  }
}
