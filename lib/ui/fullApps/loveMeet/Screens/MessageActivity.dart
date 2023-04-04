import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Model/Message_Model.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/ChatActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/LoginActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/Screens/MainActivity.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/loveMeet/helper/StringsRes.dart';

class MessageActivity extends StatefulWidget {
  const MessageActivity({Key? key}) : super(key: key);

  @override
  _MessageActivityState createState() => _MessageActivityState();
}

class _MessageActivityState extends State<MessageActivity> {
  String gender = StringsRes.maleText;

  @override
  void initState() {
    super.initState();
  }

  Widget notificationView() {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: messageList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration:
                  DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
              margin: EdgeInsets.only(bottom: 10),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Stack(children: <Widget>[
                  CircleAvatar(
                      radius: 25,
                      child: ClipOval(
                          child: DesignConfig.displayCourseImage(
                              messageList[index].imgurl,
                              100.0,
                              100.0,
                              messageList[index].hash))),
                  messageList[index].status == "on"
                      ? Positioned(
                          right: 1,
                          top: 5,
                          child: CircleAvatar(
                              radius: 5,
                              backgroundColor: ColorsRes.greenColor,
                              child: ClipOval()),
                        )
                      : messageList[index].status == "off"
                          ? Positioned(
                              right: 1,
                              top: 5,
                              child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: ColorsRes.grayColor,
                                  child: ClipOval()),
                            )
                          : Positioned(
                              right: 1,
                              top: 5,
                              child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: Colors.transparent,
                                  child: ClipOval()),
                            )
                ]),
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(messageList[index].name!,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: ColorsRes.darkColor,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text(messageList[index].subTitle!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorsRes.grayColor,
                                  fontWeight: FontWeight.normal,
                                )),
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            messageList[index].counter != "0"
                                ? CircleAvatar(
                                    backgroundColor: ColorsRes.gradientTwo,
                                    radius: 10,
                                    child: ClipOval(
                                        child: Text(messageList[index].counter!,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: ColorsRes.white))))
                                : CircleAvatar(
                                    backgroundColor: ColorsRes.white,
                                    radius: 10,
                                    child: ClipOval(
                                        child: Text(messageList[index].counter!,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: ColorsRes.white)))),
                            SizedBox(height: 5),
                            Text(messageList[index].time!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorsRes.grayColor,
                                )),
                          ])
                    ]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatActivity(
                        title: messageList[index].name,
                        profile: messageList[index].profile,
                        imgurl: messageList[index].imgurl,
                        hash: messageList[index].hash,
                      ),
                    ),
                  );
                },
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return /*WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainActivity(),
          ),
        );
      },
      child:*/
        Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: ColorsRes.backgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorsRes.darkColor,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainActivity(),
              ),
            );
          },
        ),
        title: Text(
          StringsRes.messageText,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: ColorsRes.darkColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              color: ColorsRes.darkColor,
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.more_vert),
              color: ColorsRes.darkColor,
              onPressed: () {}),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: ColorsRes.backgroundColor,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    notificationView(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ) /*)*/;
  }

  Future<void> navigationPage() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginActivity(),
      ),
    );
  }
}
