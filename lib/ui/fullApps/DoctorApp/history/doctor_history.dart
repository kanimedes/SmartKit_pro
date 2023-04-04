import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../appointment/doctor_messaging.dart';
import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/SlideAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import 'doctor_Voice_VideoCallDetail.dart';

class DoctorHistory extends StatefulWidget {
  const DoctorHistory({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DoctorHistoryState();
  }
}

class MessageModel {
  String? name;
  String? image;
  String? subtitle;
  String? time;
  MessageModel({this.name, this.image, this.subtitle, this.time});
}

class VoiceModel {
  String? name;
  String? image;
  String? status;
  String? time;
  VoiceModel({this.name, this.image, this.status, this.time});
}

class DoctorHistoryState extends State<DoctorHistory>
    with TickerProviderStateMixin {
  int selectedIndex = 0;
  List<MessageModel> messageList = [
    MessageModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_a.jpg"),
        subtitle: "okay,thanks for your time",
        name: "Dr.Jahanvi Kapoor",
        time: "10:30"),
    MessageModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_b.jpg"),
        subtitle: "That was great!",
        name: "Dr.Shivangi Joshi",
        time: "10:30"),
  ];
  List<MessageModel> messageList1 = [
    MessageModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_c.jpg"),
        subtitle: "Congratulation!",
        name: "Dr.Jyoti shah",
        time: "11:00"),
    MessageModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_d.jpg"),
        subtitle: "okay,thanks for your time",
        name: "Dr.Jahanvi Kapoor",
        time: "10:30"),
    MessageModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_e.jpg"),
        subtitle: "That was great!",
        name: "Dr.Shivangi Joshi",
        time: "10:30"),
    MessageModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_f.jpg"),
        subtitle: "Your welcome ",
        name: "Dr.Annetle Black",
        time: "11:00"),
    MessageModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_g.jpg"),
        subtitle: "Nice!",
        name: "Dr.Arlene AcCoy",
        time: "11:30"),
  ];
  List<VoiceModel> voiceList = [
    VoiceModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_s.jpg"),
        status: "Completed",
        name: "Dr.Shivangi Joshi",
        time: "Today,10:00-10:30 AM"),
    VoiceModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_t.jpg"),
        status: "Completed",
        name: "Dr.Jahanvi Kapoor",
        time: "Today,10:30-10:45 AM"),
  ];
  List<VoiceModel> voiceList1 = [
    VoiceModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_q.jpg"),
        status: "Completed",
        name: "Dr.Jahanvi Kapoor",
        time: "Yesterday,10:00-10:30 AM"),
    VoiceModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_k.jpg"),
        status: "Completed",
        name: "Dr.Shivangi Joshi",
        time: "Yesterday,10:30-10:40 AM"),
    VoiceModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_l.jpg"),
        status: "Completed",
        name: "Dr.Jyoti shah",
        time: "Yesterday,11:00-11:15 AM"),
    VoiceModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_m.jpg"),
        status: "Completed",
        name: "Dr.Annetle Black",
        time: "Yesterday,12:00-12:30 PM"),
    VoiceModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_n.jpg"),
        status: "Completed",
        name: "Dr.Arlene AcCoy",
        time: "Yesterday,12:30-01:00 PM"),
  ];
  List<VoiceModel> videoList = [
    VoiceModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_o.jpg"),
        status: "Completed",
        name: "Dr.Jahanvi Kapoor",
        time: "Today,10:30-10:45 AM"),
    VoiceModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_p.jpg"),
        status: "Completed",
        name: "Dr.Shivangi Joshi",
        time: "Today,11:00-11:30 AM"),
  ];
  List<VoiceModel> videoList1 = [
    VoiceModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_q.jpg"),
        status: "Completed",
        name: "Dr.Jyoti shah",
        time: "Yesterday,10:00-10:15 AM"),
    VoiceModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_r.jpg"),
        status: "Completed",
        name: "Dr.Annetle Black",
        time: "Yesterday,10:20-10:40 AM"),
    VoiceModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_s.jpg"),
        status: "Completed",
        name: "Dr.Arlene AcCoy",
        time: "Yesterday,11:30-:12:00 PM"),
    VoiceModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_t.jpg"),
        status: "Completed",
        name: "Dr.Jahanvi Kapoor",
        time: "Yesterday,1:00-1:30 PM"),
    VoiceModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_d.jpg"),
        status: "Completed",
        name: "Dr.Shivangi Joshi",
        time: "Yesterday,2:30-3:00 PM"),
  ];
  AnimationController? _animationController;
  AnimationController? rotationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    rotationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    rotationController!.forward(from: 0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    rotationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: ColorRes.white,
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            leadingWidth: 65,
            leading: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Container(
                  width: size.width * .13,
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: ColorRes.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset(
                    DoctorDesignConfig.getImagePath("history_active.svg"),
                    color: ColorRes.white,
                  )
                  /*Icon(
                  Icons.add_moderator,size: 20,
                  color: Colors.white,
                ),*/
                  ),
            ),
            title: Text(
              DoctorStringRes.history,
              style: TextStyle(color: ColorRes.black),
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(right: size.width * .045),
                width: size.width * .135,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Card(
                    color: Color(0xffe9f0ff),
                    margin: EdgeInsets.all(9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        icon: Icon(
                          Icons.add_circle_outline,
                          size: 20,
                          color: Colors.blue,
                        ),
                        onPressed: () {})),
              ),
            ],
          ),
          //appBar: DoctorDesignConfig.appBar1(isIcon: true,size:size,textColor: ColorRes.black,iconColor: ColorRes.blue,title:DoctorStringRes.history,icon: Icons.add_circle_outline,onPress: (){}  ),
          body: Container(
            margin: EdgeInsets.only(
                left: size.width * .06, right: size.width * .06),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * .02,
                  ),
                  TabBar(
                    tabs: <Widget>[
                      Tab(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              border: Border.all(
                                color: ColorRes.blue,
                                width: 2,
                              ),
                            ),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text("Messaging"))),
                        // text: "Messaging",
                      ),
                      Tab(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              border: Border.all(
                                color: ColorRes.blue,
                                width: 2,
                              ),
                            ),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text("Voice Call"))),
                      ),
                      Tab(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              border: Border.all(
                                color: ColorRes.blue,
                                width: 2,
                              ),
                            ),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text("Video Call"))),
                      ),
                    ],
                    indicatorSize: TabBarIndicatorSize.label,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                        _animationController!.forward(from: 0.0);
                        rotationController!.forward(from: 0.0);
                      });
                    },
                    unselectedLabelColor: ColorRes.blue,
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: EdgeInsets.only(left: 5, right: 5),
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                        color: ColorRes.blue),
                  ),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  DoctorAnimation(
                      delay: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: size.width * .72,
                            // margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * .01, right: MediaQuery.of(context).size.width * .01),
                            decoration: BoxDecoration(
                              color: Color(0xfff5f6f9),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextFormField(
                              cursorColor: Color(0xffa2a2a2),
                              onChanged: (text) {
                                text = text.toLowerCase();
                                setState(() {
                                  /* query = text;
                            data = data.where((items) {
                              var noteTitle = items.title!.toLowerCase();
                              return noteTitle.contains(text);
                            }).toList();*/
                                });
                              },
                              decoration: InputDecoration(
                                suffixIcon: Padding(
                                  padding:
                                      EdgeInsets.only(right: size.width * .05),
                                  child: IconButton(
                                    icon: SvgPicture.asset(
                                      DoctorDesignConfig.getImagePath(
                                          "search.svg"),
                                      color: ColorRes.blue,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        // typing=!typing;
                                      });
                                    },
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(
                                    top: size.height * .015,
                                    left: size.width * .05),
                                isDense: true,
                                hintText: "Search",
                                hintStyle: TextStyle(
                                    color: ColorRes.fontColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                              width: size.width * .11,
                              margin:
                                  EdgeInsets.only(top: 9, bottom: 9, left: 9),
                              decoration: BoxDecoration(
                                  color: Color(0xffe9f0ff),
                                  borderRadius: BorderRadius.circular(10)),
                              child: /*Card(
                          color: Color(0xffe9f0ff),
                          margin: EdgeInsets.all(9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child:*/
                                  Padding(
                                padding: EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  DoctorDesignConfig.getImagePath("filter.svg"),
                                  color: ColorRes.blue,
                                ),
                              )),
                        ],
                      )),
                  SizedBox(
                    height: size.height * .02,
                  ),
                  SizedBox(
                    height: size.height * .6,
                    child: TabBarView(
                      children: [
                        messagingTab(size),
                        voiceTab(size),
                        videoTab(size),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget messagingTab(dynamic size) {
    return ListView(
      children: [
        SlideAnimation(
            position: 10,
            itemCount: 20,
            slideDirection: SlideDirection.fromBottom,
            animationController: _animationController,
            child: Text(
              "Today",
              style: TextStyle(
                  color: ColorRes.fontColor, fontWeight: FontWeight.bold),
            )),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: messageList.length,
            itemBuilder: (BuildContext context, int index) {
              MessageModel history = messageList[index];
              return SlideAnimation(
                  position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromBottom,
                  animationController: _animationController,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => DoctorMessaging(
                                title: history.name,
                                image: history.image,
                                time: history.time,
                                cls: "history"),
                          ),
                        );
                      },
                      child: Container(
                        height: size.height * .11,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Color(0xffedf0f1), width: 1),
                          boxShadow: [
                            new BoxShadow(
                                color: Color(0xfff7faff),
                                blurRadius: 20.0,
                                blurStyle: BlurStyle.outer),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(40.0),
                                child: Image.asset(
                                  history.image!,
                                  height: size.height * .08,
                                  width: size.width * .18,
                                  fit: BoxFit.fill,
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  history.name!,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: size.height * .005,
                                ),
                                Text(
                                  history.subtitle!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ColorRes.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  history.time!,
                                  style: TextStyle(
                                      color: ColorRes.fontColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )));
            }),
        SizedBox(
          height: size.height * .02,
        ),
        SlideAnimation(
            position: 10,
            itemCount: 20,
            slideDirection: SlideDirection.fromBottom,
            animationController: _animationController,
            child: Text(
              "Yesterday, March 25 2022",
              style: TextStyle(
                  color: ColorRes.fontColor, fontWeight: FontWeight.bold),
            )),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: messageList1.length,
            itemBuilder: (BuildContext context, int index) {
              MessageModel history = messageList1[index];
              return SlideAnimation(
                  position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromBottom,
                  animationController: _animationController,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => DoctorMessaging(
                                title: history.name,
                                image: history.image,
                                time: history.time,
                                cls: "history"),
                          ),
                        );
                        // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoctorTopDoctorDetail(doctorName: fav.title,reviewText: fav.reviewText,subTitle: fav.subTitle,image: fav.image),),);
                      },
                      child: Container(
                        height: size.height * .11,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Color(0xffedf0f1), width: 1),
                          boxShadow: [
                            new BoxShadow(
                                color: Color(0xfff7faff),
                                blurRadius: 20.0,
                                blurStyle: BlurStyle.outer),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(40.0),
                                child: Image.asset(
                                  history.image!,
                                  height: size.height * .08,
                                  width: size.width * .18,
                                  fit: BoxFit.fill,
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  history.name!,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: size.height * .005,
                                ),
                                Text(
                                  history.subtitle!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ColorRes.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  history.time!,
                                  style: TextStyle(
                                      color: ColorRes.fontColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )));
            }),
      ],
    );
  }

  Widget voiceTab(dynamic size) {
    return ListView(
      children: [
        SlideAnimation(
            position: 10,
            itemCount: 20,
            slideDirection: SlideDirection.fromBottom,
            animationController: _animationController,
            child: Text(
              "Today",
              style: TextStyle(
                  color: ColorRes.fontColor, fontWeight: FontWeight.bold),
            )),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: voiceList.length,
            itemBuilder: (BuildContext context, int index) {
              VoiceModel voice = voiceList[index];
              return SlideAnimation(
                  position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromBottom,
                  animationController: _animationController,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DoctorVoiceCallDetail(
                                    time: voice.time,
                                    image: voice.image,
                                    title: voice.name,
                                    status: voice.status,
                                    cls: "voice"),
                          ),
                        );
                      },
                      child: Container(
                        height: size.height * .1,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Color(0xffedf0f1), width: 1),
                          boxShadow: [
                            new BoxShadow(
                                color: Color(0xfff7faff),
                                blurRadius: 20.0,
                                blurStyle: BlurStyle.outer),
                          ],
                        ),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                flex: 4,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15)),
                                        child: Image.asset(
                                          voice.image!,
                                          height: size.height * .13,
                                          width: size.width * .3,
                                          fit: BoxFit.fill,
                                        )),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                          height: size.height * .045,
                                          width: size.width * .1,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10)),
                                            color: ColorRes.blue,
                                          ),
                                          // /margin: EdgeInsets.only(left: 18,right: 18,top: 20,bottom: 20),
                                          child: RotationTransition(
                                              turns: Tween(begin: 0.0, end: 1.0)
                                                  .animate(rotationController!),
                                              child: Padding(
                                                padding: EdgeInsets.all(8),
                                                child: SvgPicture.asset(
                                                  DoctorDesignConfig
                                                      .getImagePath(
                                                          "call_02.svg"),
                                                  color: ColorRes.white,
                                                ),
                                                /*Icon(
                                              Icons.call,size: 20,
                                              color: Colors.white,
                                            ),*/
                                              ))),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Expanded(
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    voice.name!,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: size.height * .01,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Voice call -",
                                      style: TextStyle(
                                          color: ColorRes.black, fontSize: 10),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: voice.status!,
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 10)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * .01,
                                  ),
                                  Text(
                                    voice.time!,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  //Text(voice.status!,style: TextStyle(fontSize: 14,color: ColorRes.black,),),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                      width: size.width * .11,
                                      margin: EdgeInsets.only(
                                          top: 9, bottom: 9, left: 9),
                                      decoration: BoxDecoration(
                                          color: Color(0xffe9f0ff),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: RotationTransition(
                                          turns: Tween(begin: 0.0, end: 1.0)
                                              .animate(rotationController!),
                                          child: Padding(
                                            padding: EdgeInsets.all(12),
                                            child: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              size: 15,
                                              color: ColorRes.blue,
                                            ),
                                          ))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )));
            }),
        SizedBox(
          height: size.height * .02,
        ),
        SlideAnimation(
            position: 10,
            itemCount: 20,
            slideDirection: SlideDirection.fromBottom,
            animationController: _animationController,
            child: Text(
              "Yesterday, March 25 2022",
              style: TextStyle(
                  color: ColorRes.fontColor, fontWeight: FontWeight.bold),
            )),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: voiceList1.length,
            itemBuilder: (BuildContext context, int index) {
              VoiceModel voice1 = voiceList1[index];
              return SlideAnimation(
                  position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromBottom,
                  animationController: _animationController,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DoctorVoiceCallDetail(
                                    time: voice1.time,
                                    image: voice1.image,
                                    title: voice1.name,
                                    status: voice1.status,
                                    cls: "voice"),
                          ),
                        );
                        // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoctorTopDoctorDetail(doctorName: fav.title,reviewText: fav.reviewText,subTitle: fav.subTitle,image: fav.image),),);
                      },
                      child: Container(
                        height: size.height * .1,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Color(0xffedf0f1), width: 1),
                          boxShadow: [
                            new BoxShadow(
                                color: Color(0xfff7faff),
                                blurRadius: 20.0,
                                blurStyle: BlurStyle.outer),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                flex: 4,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15)),
                                        child: Image.asset(
                                          voice1.image!,
                                          height: size.height * .13,
                                          width: size.width * .3,
                                          fit: BoxFit.fill,
                                        )),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: size.height * .045,
                                        width: size.width * .1,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10)),
                                          color: ColorRes.blue,
                                        ),
                                        // /margin: EdgeInsets.only(left: 18,right: 18,top: 20,bottom: 20),
                                        child: RotationTransition(
                                            turns: Tween(begin: 0.0, end: 1.0)
                                                .animate(rotationController!),
                                            child: RotationTransition(
                                                turns: Tween(
                                                        begin: 0.0, end: 1.0)
                                                    .animate(
                                                        rotationController!),
                                                child: IconButton(
                                                    icon: SvgPicture.asset(
                                                      DoctorDesignConfig
                                                          .getImagePath(
                                                              "call_02.svg"),
                                                      color: ColorRes.white,
                                                    ),
                                                    /*Icon(
                                                      Icons.call,size: 20,
                                                      color: Colors.white,
                                                    ),*/
                                                    onPressed: () {}))),
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Expanded(
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    voice1.name!,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: size.height * .01,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Voice call -",
                                      style: TextStyle(
                                          color: ColorRes.black, fontSize: 10),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: voice1.status!,
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 10)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * .01,
                                  ),
                                  Text(
                                    voice1.time!,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  //Text(voice.status!,style: TextStyle(fontSize: 14,color: ColorRes.black,),),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                      width: size.width * .11,
                                      margin: EdgeInsets.only(
                                          top: 9, bottom: 9, left: 9),
                                      decoration: BoxDecoration(
                                          color: Color(0xffe9f0ff),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            size: 15,
                                            color: Colors.blue,
                                          ),
                                          onPressed: () {})),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )));
            }),
      ],
    );
  }

  Widget videoTab(dynamic size) {
    return ListView(
      children: [
        SlideAnimation(
            position: 10,
            itemCount: 20,
            slideDirection: SlideDirection.fromBottom,
            animationController: _animationController,
            child: Text(
              "Today",
              style: TextStyle(
                  color: ColorRes.fontColor, fontWeight: FontWeight.bold),
            )),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: videoList.length,
            itemBuilder: (BuildContext context, int index) {
              VoiceModel video = videoList[index];
              return SlideAnimation(
                  position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromBottom,
                  animationController: _animationController,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DoctorVoiceCallDetail(
                                    time: video.time,
                                    image: video.image,
                                    title: video.name,
                                    status: video.status,
                                    cls: "video"),
                          ),
                        );
                        // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoctorTopDoctorDetail(doctorName: fav.title,reviewText: fav.reviewText,subTitle: fav.subTitle,image: fav.image),),);
                      },
                      child: Container(
                        height: size.height * .1,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Color(0xffedf0f1), width: 1),
                          boxShadow: [
                            new BoxShadow(
                                color: Color(0xfff7faff),
                                blurRadius: 20.0,
                                blurStyle: BlurStyle.outer),
                          ],
                        ),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                flex: 4,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15)),
                                        child: Image.asset(
                                          video.image!,
                                          height: size.height * .13,
                                          width: size.width * .3,
                                          fit: BoxFit.fill,
                                        )),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: size.height * .045,
                                        width: size.width * .1,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10)),
                                          color: ColorRes.blue,
                                        ),
                                        // /margin: EdgeInsets.only(left: 18,right: 18,top: 20,bottom: 20),
                                        child: RotationTransition(
                                            turns: Tween(begin: 0.0, end: 1.0)
                                                .animate(rotationController!),
                                            child: Padding(
                                              padding: EdgeInsets.all(8),
                                              child: SvgPicture.asset(
                                                DoctorDesignConfig.getImagePath(
                                                    "video_call.svg"),
                                                color: ColorRes.white,
                                              ),
                                              /*Icon(
                                              Icons.video_call,size: 20,
                                              color: Colors.white,
                                            ),*/
                                            )),
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Expanded(
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    video.name!,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: size.height * .01,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Video call -",
                                      style: TextStyle(
                                          color: ColorRes.black, fontSize: 10),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: video.status!,
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 10)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * .01,
                                  ),
                                  Text(
                                    video.time!,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  //Text(voice.status!,style: TextStyle(fontSize: 14,color: ColorRes.black,),),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: size.width * .11,
                                    margin: EdgeInsets.only(
                                        top: 9, bottom: 9, left: 9),
                                    decoration: BoxDecoration(
                                        color: Color(0xffe9f0ff),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: RotationTransition(
                                        turns: Tween(begin: 0.0, end: 1.0)
                                            .animate(rotationController!),
                                        child: Padding(
                                          padding: EdgeInsets.all(12),
                                          child: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            size: 15,
                                            color: ColorRes.blue,
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )));
            }),
        SizedBox(
          height: size.height * .02,
        ),
        SlideAnimation(
            position: 10,
            itemCount: 20,
            slideDirection: SlideDirection.fromBottom,
            animationController: _animationController,
            child: Text(
              "Yesterday, March 25 2022",
              style: TextStyle(
                  color: ColorRes.fontColor, fontWeight: FontWeight.bold),
            )),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: videoList1.length,
            itemBuilder: (BuildContext context, int index) {
              VoiceModel video1 = videoList1[index];
              return SlideAnimation(
                  position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromBottom,
                  animationController: _animationController,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DoctorVoiceCallDetail(
                                    time: video1.time,
                                    image: video1.image,
                                    title: video1.name,
                                    status: video1.status,
                                    cls: "video"),
                          ),
                        );
                        // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoctorTopDoctorDetail(doctorName: fav.title,reviewText: fav.reviewText,subTitle: fav.subTitle,image: fav.image),),);
                      },
                      child: Container(
                        height: size.height * .1,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          color: ColorRes.white,
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Color(0xffedf0f1), width: 1),
                          boxShadow: [
                            new BoxShadow(
                                color: Color(0xfff7faff),
                                blurRadius: 20.0,
                                blurStyle: BlurStyle.outer),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                                flex: 4,
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15)),
                                        child: Image.asset(
                                          video1.image!,
                                          height: size.height * .13,
                                          width: size.width * .3,
                                          fit: BoxFit.fill,
                                        )),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        height: size.height * .045,
                                        width: size.width * .1,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10)),
                                          color: ColorRes.blue,
                                        ),
                                        // /margin: EdgeInsets.only(left: 18,right: 18,top: 20,bottom: 20),
                                        child: RotationTransition(
                                            turns: Tween(begin: 0.0, end: 1.0)
                                                .animate(rotationController!),
                                            child: IconButton(
                                                icon: SvgPicture.asset(
                                                  DoctorDesignConfig
                                                      .getImagePath(
                                                          "video_call.svg"),
                                                  color: ColorRes.white,
                                                ),
                                                /*Icon(
                                              Icons.video_call,size: 20,
                                              color: Colors.white,
                                            ),*/
                                                onPressed: () {})),
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                              width: size.width * .05,
                            ),
                            Expanded(
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    video1.name!,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: size.height * .01,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: "Video call -",
                                      style: TextStyle(
                                          color: ColorRes.black, fontSize: 10),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: video1.status!,
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 10)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * .01,
                                  ),
                                  Text(
                                    video1.time!,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  //Text(voice.status!,style: TextStyle(fontSize: 14,color: ColorRes.black,),),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: size.width * .11,
                                    margin: EdgeInsets.only(
                                        top: 9, bottom: 9, left: 9),
                                    decoration: BoxDecoration(
                                        color: Color(0xffe9f0ff),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: RotationTransition(
                                        turns: Tween(begin: 0.0, end: 1.0)
                                            .animate(rotationController!),
                                        child: IconButton(
                                            icon: Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              size: 15,
                                              color: Colors.blue,
                                            ),
                                            onPressed: () {})),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )));
            }),
      ],
    );
  }
}
