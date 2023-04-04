import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helper/ColorRes.dart';
import '../../helper/DoctorAnimation.dart';
import '../../helper/SlideAnimation.dart';
import '../../helper/StringRes.dart';
import '../../helper/doctore_DesignConfig.dart';
import 'doctor_PatientDetailScreen.dart';

class DoctorBookAppointmentScreen extends StatefulWidget {
  final String date;
  const DoctorBookAppointmentScreen({Key? key, required this.date})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DoctorBookAppointmentState();
  }
}

class DoctorBookAppointmentState extends State<DoctorBookAppointmentScreen>
    with TickerProviderStateMixin {
  bool morning = true, evening = false;
  int selectedCard = 0, selectIndexInfo = 0;
  List<String> hourList = [
    "09:00 AM",
    "10:00 AM",
    "11:00 AM",
    "13:00 PM",
    "14:00 PM",
    "15:00 PM",
    "17:00 PM",
    "18:00 PM",
    "19:00 PM",
  ];
  List<InfoModel> infoList = [
    InfoModel(
        title: "Messaging",
        subTitle: "Can messing with Doctor.",
        icon: DoctorDesignConfig.getImagePath("message.svg"),
        charges: "5"),
    InfoModel(
        title: "Voice call",
        subTitle: "Can make a voice call with doctor",
        icon: DoctorDesignConfig.getImagePath("call_02.svg"),
        charges: "10"),
    InfoModel(
        title: "Video call",
        subTitle: "Can make a video call with doctoe",
        icon: DoctorDesignConfig.getImagePath("video_call.svg"),
        charges: "20"),
  ];
  AnimationController? _animationController;
  AnimationController? rotationController;

  @override
  void dispose() {
    rotationController!.dispose();
    _animationController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    rotationController = AnimationController(
      duration: const Duration(milliseconds: 1300),
      vsync: this,
    );
    rotationController!.forward(from: 0.0);
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    print(widget.date);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      bottomNavigationBar: DoctorAnimation(
          delay: 500,
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * .06,
                right: size.width * .06,
                bottom: size.width * .06),
            child: DoctorDesignConfig.Button(
                onpress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const DoctorPatientDetailScreen(),
                    ),
                  );
                },
                name: DoctorStringRes.next,
                foreground: ColorRes.blue,
                TextColor: ColorRes.white),
          )),
      appBar: DoctorDesignConfig.appBar(
          context: context,
          isIcon: false,
          size: size,
          title: DoctorStringRes.bookApp,
          textColor: ColorRes.black,
          iconColor: ColorRes.blue),
      body: Container(
        alignment: Alignment.topLeft,
        margin:
            EdgeInsets.only(left: size.width * .06, right: size.width * .06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.date.toString(),
              style: TextStyle(
                  color: ColorRes.fontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            SlideAnimation(
                position: 10,
                itemCount: 20,
                slideDirection: SlideDirection.fromRight,
                animationController: _animationController,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * .42,
                      height: size.height * .05,
                      child: ElevatedButton.icon(
                        icon: RotationTransition(
                            turns: Tween(begin: 0.0, end: 1.0)
                                .animate(rotationController!),
                            child: Icon(
                              Icons.brightness_5_outlined,
                              color: morning ? ColorRes.white : ColorRes.blue,
                            )),
                        onPressed: () {
                          setState(() {
                            morning = true;
                            evening = false;
                          });
                        },
                        label: Text(
                          DoctorStringRes.morning,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: morning ? ColorRes.white : ColorRes.blue,
                              fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          //minimumSize: const Size(170, 45),
                          primary: morning ? ColorRes.blue : ColorRes.white,
                          alignment: Alignment.center,
                          elevation: 0,
                          side: BorderSide(
                            width: 2.0,
                            color: ColorRes.blue,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * .42,
                      height: size.height * .05,
                      child: ElevatedButton.icon(
                        icon: RotationTransition(
                            turns: Tween(begin: 0.0, end: 1.0)
                                .animate(rotationController!),
                            child: SvgPicture.asset(
                              DoctorDesignConfig.getImagePath("evening.svg"),
                              color: evening ? ColorRes.white : ColorRes.blue,
                            )

                            // Icon(Icons.brightness_5_sharp,color: evening?ColorRes.white:ColorRes.blue,)
                            ),
                        onPressed: () {
                          setState(() {
                            evening = true;
                            morning = false;
                          });
                        },
                        label: Text(
                          DoctorStringRes.evening,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: evening ? ColorRes.white : ColorRes.blue,
                              fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          //minimumSize: const Size(170, 45),
                          primary: evening ? ColorRes.blue : ColorRes.white,
                          alignment: Alignment.center,
                          elevation: 0,
                          side: BorderSide(
                            width: 2.0,
                            color: ColorRes.blue,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: size.height * .02,
            ),
            Text(
              DoctorStringRes.chooseHour,
              style: TextStyle(
                  color: ColorRes.fontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            GridView.builder(
                shrinkWrap: true,
                itemCount: hourList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return DoctorAnimation(
                      delay: 100,
                      child: SlideAnimation(
                          position: 10,
                          itemCount: 20,
                          slideDirection: SlideDirection.fromLeft,
                          animationController: _animationController,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedCard = index;
                              });
                            },
                            child: Text(
                              hourList[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: selectedCard == index
                                      ? ColorRes.white
                                      : ColorRes.blue,
                                  fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                              //minimumSize: const Size(170, 45),
                              primary: selectedCard == index
                                  ? ColorRes.blue
                                  : ColorRes.white,
                              alignment: Alignment.center,
                              elevation: 0,
                              side: BorderSide(
                                width: 2.0,
                                color: ColorRes.blue,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          )));
                }),
            SizedBox(
              height: size.height * .03,
            ),
            Text(
              DoctorStringRes.freeInfo,
              style: TextStyle(
                  color: ColorRes.fontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: infoList.length,
                itemBuilder: (BuildContext context, int index) {
                  InfoModel info = infoList[index];
                  return DoctorAnimation(
                      delay: 300,
                      child: SlideAnimation(
                          position: 10,
                          itemCount: 20,
                          slideDirection: SlideDirection.fromBottom,
                          animationController: _animationController,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectIndexInfo = index;
                              });
                              // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoctorTopDoctorDetail(doctorName: fav.title,reviewText: fav.reviewText,subTitle: fav.subTitle,image: fav.image),),);
                            },
                            child: Container(
                                height: size.height * .09,
                                margin: EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black12,
                                      width: 1,
                                    ),
                                    color: selectIndexInfo == index
                                        ? ColorRes.blue
                                        : ColorRes.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                          height: size.height * .07,
                                          width: size.width * .135,
                                          decoration: BoxDecoration(
                                            color: selectIndexInfo == index
                                                ? ColorRes.white
                                                : Color(0xffe9f0ff),
                                            shape: BoxShape.circle,
                                          ),
                                          child: RotationTransition(
                                            turns: Tween(begin: 0.0, end: 1.0)
                                                .animate(rotationController!),
                                            child: Container(
                                                height: size.height * .05,
                                                width: size.width * .05,
                                                padding: EdgeInsets.all(15),
                                                child: SvgPicture.asset(
                                                  info.icon!,
                                                  color: ColorRes.blue,
                                                )),
                                            //Icon(info.icon!,color: ColorRes.blue,)
                                          )),
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            info.title!,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: selectIndexInfo == index
                                                    ? ColorRes.white
                                                    : Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: size.height * .005,
                                          ),
                                          Text(
                                            info.subTitle!,
                                            style: TextStyle(
                                                color: selectIndexInfo == index
                                                    ? ColorRes.white
                                                    : ColorRes.fontColor,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          "\$" + info.charges!,
                                          style: TextStyle(
                                              color: selectIndexInfo == index
                                                  ? ColorRes.white
                                                  : ColorRes.blue,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                )),
                          )));
                })
          ],
        ),
      ),
    );
  }
}

class InfoModel {
  String? icon;
  String? title;
  String? subTitle;
  String? charges;
  InfoModel({this.icon, this.subTitle, this.title, this.charges});
}
