import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import 'doctor_myAppointmentDetail.dart';

class DoctorMyAppointment extends StatefulWidget {
  const DoctorMyAppointment({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DoctorMyAppointmentState();
  }
}

class DoctorMyAppointmentState extends State<DoctorMyAppointment>
    with TickerProviderStateMixin {
  TabController? tabController;
  bool upcoming = true, past = false;
  TextEditingController controller = TextEditingController();
  List<AppointmentModel> appointmentList = [
    AppointmentModel(
        icon: DoctorDesignConfig.getImagePath("call_02.svg"),
        title: "Dr. Jenny Wilsom",
        image: DoctorDesignConfig.getImageDoctor("doctor_a.jpg"),
        callType: "Voice call -",
        status: "Scheduled",
        time: "11:00-11:30 AM"),
    AppointmentModel(
        icon: DoctorDesignConfig.getImagePath("message.svg"),
        title: "Dr. Albert Flores",
        image: DoctorDesignConfig.getImageDoctor("doctor_b.jpg"),
        callType: "Messaging -",
        status: "Scheduled",
        time: "10:00-10:30 AM"),
    AppointmentModel(
        icon: DoctorDesignConfig.getImagePath("video_call.svg"),
        title: "Dr. Amit Mehta",
        image: DoctorDesignConfig.getImageDoctor("doctor_c.jpg"),
        callType: "Video call -",
        status: "In progress",
        time: "9:00-10:00 AM"),
  ];
  List<AppointmentModel> appointmentList1 = [
    AppointmentModel(
        icon: DoctorDesignConfig.getImagePath("video_call.svg"),
        title: "Dr. Kristin Waston",
        image: DoctorDesignConfig.getImageDoctor("doctor_d.jpg"),
        callType: "Video call -",
        status: "Scheduled",
        time: "2:00-2:30 PM"),
    AppointmentModel(
        icon: DoctorDesignConfig.getImagePath("message.svg"),
        title: "Dr. Ronald Richards",
        image: DoctorDesignConfig.getImageDoctor("doctor_e.jpg"),
        callType: "Messaging -",
        status: "In Progress",
        time: "2:30-3:00 PM"),
    AppointmentModel(
        icon: DoctorDesignConfig.getImagePath("call_02.svg"),
        title: "Dr. Albert Flores",
        image: DoctorDesignConfig.getImageDoctor("doctor_f.jpg"),
        callType: "Voice call -",
        status: "Scheduled",
        time: "3:00-3:30 PM"),
  ];
  List<AppointmentModel> pastList = [
    AppointmentModel(
        icon: DoctorDesignConfig.getImagePath("video_call.svg"),
        title: "Dr. Amit Mehta ",
        image: DoctorDesignConfig.getImageDoctor("doctor_g.jpg"),
        callType: "Video call  -",
        status: "Scheduled",
        time: "11:00-11:30 AM"),
    AppointmentModel(
        icon: DoctorDesignConfig.getImagePath("message.svg"),
        title: "Dr. Albert Flores",
        image: DoctorDesignConfig.getImageDoctor("doctor_h.jpg"),
        callType: "Messaging -",
        status: "Scheduled",
        time: "10:00-10:30 AM"),
    AppointmentModel(
        icon: DoctorDesignConfig.getImagePath("call_02.svg"),
        title: "Dr. Jenny Wilsom",
        image: DoctorDesignConfig.getImageDoctor("doctor_i.jpg"),
        callType: "Voice call -",
        status: "In progress",
        time: "9:00-10:00 AM"),
  ];
  List<AppointmentModel> pastList1 = [
    AppointmentModel(
        icon: DoctorDesignConfig.getImagePath("message.svg"),
        title: "Dr. Albert Flores ",
        image: DoctorDesignConfig.getImageDoctor("doctor_t.jpg"),
        callType: "Messaging  -",
        status: "Scheduled",
        time: "2:00-2:30 PM"),
    AppointmentModel(
        icon: DoctorDesignConfig.getImagePath("video_call.svg"),
        title: "Dr. Ronald Richards",
        image: DoctorDesignConfig.getImageDoctor("doctor_k.jpg"),
        callType: "Video call -",
        status: "In Progress",
        time: "2:30-3:00 PM"),
    AppointmentModel(
        icon: DoctorDesignConfig.getImagePath("call_02.svg"),
        title: "Dr. Kristin Waston",
        image: DoctorDesignConfig.getImageDoctor("doctor_l.jpg"),
        callType: "Voice call -",
        status: "Scheduled",
        time: "3:00-3:30 PM"),
  ];
  AnimationController? rotationController;
  List<AppointmentModel> searchResult = [];
  List<AppointmentModel> searchResult1 = [];
  List<AppointmentModel> searchResult2 = [];
  List<AppointmentModel> searchResult3 = [];
  String source = "", query = "";
  List<TextSpan> highlightOccurrences(source, query) {
    if (query == null || query.isEmpty) {
      return [TextSpan(text: source)];
    }

    var matches = <Match>[];
    for (final token in query.trim().toLowerCase().split(' ')) {
      matches.addAll(token.allMatches(source.toLowerCase()));
    }

    if (matches.isEmpty) {
      return [TextSpan(text: source)];
    }
    matches.sort((a, b) => a.start.compareTo(b.start));

    int lastMatchEnd = 0;
    final List<TextSpan> children = [];
    for (final match in matches) {
      if (match.end <= lastMatchEnd) {
        // already matched -> ignore
      } else if (match.start <= lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.end),
          style:
              TextStyle(backgroundColor: ColorRes.white, color: ColorRes.blue),
        ));
      } else if (match.start > lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));

        children.add(TextSpan(
          text: source.substring(match.start, match.end),
          style:
              TextStyle(backgroundColor: ColorRes.white, color: ColorRes.blue),
        ));
      }

      if (lastMatchEnd < match.end) {
        lastMatchEnd = match.end;
      }
    }
    if (lastMatchEnd < source.length) {
      children.add(TextSpan(
        text: source.substring(lastMatchEnd, source.length),
      ));
    }
    return children;
  }

  @override
  void initState() {
    rotationController = AnimationController(
      duration: const Duration(milliseconds: 1300),
      vsync: this,
    );
    rotationController!.forward(from: 0.0);
    searchResult.addAll(appointmentList);
    searchResult1.addAll(appointmentList1);
    searchResult2.addAll(pastList);
    searchResult3.addAll(pastList1);
    super.initState();
  }

  @override
  void dispose() {
    rotationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: DoctorDesignConfig.appBar1(
          leadingImage: DoctorDesignConfig.getImagePath("calender_active.svg"),
          isIcon: true,
          size: size,
          textColor: ColorRes.black,
          iconColor: ColorRes.blue,
          title: DoctorStringRes.myAppointment,
          icon: Icons.add_circle_outline,
          onPress: () {}),
      body: Container(
          margin:
              EdgeInsets.only(left: size.width * .06, right: size.width * .06),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * .02,
                ),
                DoctorAnimation(
                    delay: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              upcoming = true;
                              past = false;
                              rotationController!.forward(from: 0.0);
                            });
                          },
                          child: Text(
                            "Upcoming",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color:
                                    upcoming ? ColorRes.white : ColorRes.blue,
                                fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            minimumSize:
                                Size(size.width * .42, size.height * .055),
                            primary: upcoming ? ColorRes.blue : ColorRes.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: const BorderSide(
                                  width: 2.0,
                                  color: ColorRes.blue,
                                )),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              upcoming = false;
                              past = true;
                              rotationController!.forward(from: 0.0);
                            });
                          },
                          child: Text(
                            "Past",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: past ? ColorRes.white : ColorRes.blue,
                                fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            minimumSize:
                                Size(size.width * .42, size.height * .055),
                            primary: past ? ColorRes.blue : ColorRes.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(
                                  width: 2.0,
                                  color: ColorRes.blue,
                                )),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: size.height * .02,
                ),
                DoctorAnimation(
                    delay: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size.width * .72,
                          decoration: BoxDecoration(
                            color: Color(0xfff5f6f9),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            controller: controller,
                            cursorColor: Color(0xffa2a2a2),
                            onChanged: (text) {
                              // text = text.toLowerCase();
                              setState(() {
                                query = text;
                                appointmentList = searchResult.where((items) {
                                  var noteTitle = items.title!.toLowerCase();
                                  return noteTitle.contains(text);
                                }).toList();
                                appointmentList1 = searchResult1.where((items) {
                                  var noteTitle = items.title!.toLowerCase();
                                  return noteTitle.contains(text);
                                }).toList();
                                pastList = searchResult2.where((items) {
                                  var noteTitle = items.title!.toLowerCase();
                                  return noteTitle.contains(text);
                                }).toList();
                                pastList1 = searchResult3.where((items) {
                                  var noteTitle = items.title!.toLowerCase();
                                  return noteTitle.contains(text);
                                }).toList();
                              });
                              if (controller.text == "") {
                                controller.clear();
                                query = "";
                                setState(() {});
                              }
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
                            margin: EdgeInsets.only(top: 9, bottom: 9, left: 9),
                            decoration: BoxDecoration(
                                color: Color(0xffe9f0ff),
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                                icon: SvgPicture.asset(
                                  DoctorDesignConfig.getImagePath("filter.svg"),
                                  color: ColorRes.blue,
                                ),
                                /*Icon(
                          Icons.filter_list_rounded,size: 20,
                          color: Colors.blue,
                        ),*/
                                onPressed: () {})),
                      ],
                    )),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: size.height * .02,
                      ),
                      DoctorAnimation(
                          delay: 300,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              upcoming
                                  ? "Tomorrow,March 28 2022"
                                  : "Yesterday, March 26 2022",
                              style: TextStyle(
                                  color: ColorRes.fontColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          )),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: upcoming
                              ? appointmentList.length
                              : pastList.length,
                          itemBuilder: (BuildContext context, int index) {
                            AppointmentModel appointment = upcoming
                                ? appointmentList[index]
                                : pastList[index];
                            return DoctorAnimation(
                                delay: 300,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MyAppointmentDetail(
                                                time: appointment.time,
                                                status: appointment.status,
                                                callType: appointment.callType,
                                                image: appointment.image,
                                                title: appointment.title,
                                                icon: appointment.icon),
                                      ),
                                    );
                                  },
                                  child: Container(
                                      height: size.height * .11,
                                      margin: EdgeInsets.only(top: 20),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black12,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(15),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15)),
                                                    child: Image.asset(
                                                      appointment.image!,
                                                      height: size.height * .13,
                                                      width: size.width * .2,
                                                      fit: BoxFit.cover,
                                                    )),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 2,
                                                  child: Container(
                                                      height:
                                                          size.height * .045,
                                                      width: size.width * .1,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10)),
                                                        color: ColorRes.blue,
                                                      ),
                                                      // /margin: EdgeInsets.only(left: 18,right: 18,top: 20,bottom: 20),
                                                      child: IconButton(
                                                          icon:
                                                              SvgPicture.asset(
                                                            appointment.icon!,
                                                            color: Colors.white,
                                                          ),
                                                          /*Icon(
                                              appointment.icon,size: 20,
                                              color: Colors.white,
                                            ),*/
                                                          onPressed: () {})),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * .05,
                                          ),
                                          Expanded(
                                            flex: 6,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                RichText(
                                                    text: TextSpan(
                                                  children:
                                                      highlightOccurrences(
                                                          appointment.title!,
                                                          query),
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                //Text(appointment.title!,style:TextStyle(fontSize: 14,color:Colors.black,fontWeight: FontWeight.bold),),
                                                SizedBox(
                                                  height: size.height * .01,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    text: appointment.callType!,
                                                    style: TextStyle(
                                                        color: ColorRes.black,
                                                        fontSize: 10),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: appointment
                                                              .status,
                                                          style: TextStyle(
                                                              color:
                                                                  ColorRes.blue,
                                                              fontSize: 10)),
                                                    ],
                                                  ),
                                                ),
                                                // Icon(Icons.star_half,color: ColorRes.blue,size: 12,),

                                                SizedBox(
                                                  height: size.height * .01,
                                                ),
                                                Text(
                                                  appointment.time!,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: ColorRes.black,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // SizedBox(width: size.width*.05,),
                                          Expanded(
                                            flex: 3,
                                            child: Card(
                                                color: Color(0xffe9f0ff),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                margin: EdgeInsets.only(
                                                    left: 18,
                                                    right: 18,
                                                    top: 20,
                                                    bottom: 20),
                                                child: RotationTransition(
                                                    turns: Tween(
                                                            begin: 0.0,
                                                            end: 1.0)
                                                        .animate(
                                                            rotationController!),
                                                    child: IconButton(
                                                        icon: SvgPicture.asset(
                                                          appointment.icon!,
                                                          color: ColorRes.blue,
                                                        ),
                                                        /* Icon(
                                        appointment.icon,size: 20,
                                        color: Colors.blue,
                                      ),*/
                                                        onPressed: () {}))),
                                          ),
                                        ],
                                      )),
                                ));
                          }),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      DoctorAnimation(
                          delay: 400,
                          child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              upcoming
                                  ? "Today,March 27 2022"
                                  : "Monday, March 25 2022",
                              style: TextStyle(
                                  color: ColorRes.fontColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          )),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: upcoming
                              ? appointmentList1.length
                              : pastList1.length,
                          itemBuilder: (BuildContext context, int index) {
                            AppointmentModel appointment = upcoming
                                ? appointmentList1[index]
                                : pastList1[index];
                            return DoctorAnimation(
                                delay: 400,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MyAppointmentDetail(
                                                time: appointment.time,
                                                status: appointment.status,
                                                callType: appointment.callType,
                                                image: appointment.image,
                                                title: appointment.title,
                                                icon: appointment.icon),
                                      ),
                                    );
                                    // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoctorTopDoctorDetail(doctorName: fav.title,reviewText: fav.reviewText,subTitle: fav.subTitle,image: fav.image),),);
                                  },
                                  child: Container(
                                      height: size.height * .11,
                                      margin: EdgeInsets.only(top: 20),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black12,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(15),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15)),
                                                    child: Image.asset(
                                                      appointment.image!,
                                                      height: size.height * .13,
                                                      width: size.width * .2,
                                                      fit: BoxFit.cover,
                                                    )),
                                                Positioned(
                                                  bottom: 0,
                                                  right: 2,
                                                  child: Container(
                                                      height:
                                                          size.height * .045,
                                                      width: size.width * .1,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10)),
                                                        color: ColorRes.blue,
                                                      ),
                                                      // /margin: EdgeInsets.only(left: 18,right: 18,top: 20,bottom: 20),
                                                      child: IconButton(
                                                          icon:
                                                              SvgPicture.asset(
                                                            appointment.icon!,
                                                            color: Colors.white,
                                                          ),
                                                          onPressed: () {})),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * .05,
                                          ),
                                          Expanded(
                                            flex: 6,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                RichText(
                                                    text: TextSpan(
                                                  children:
                                                      highlightOccurrences(
                                                          appointment.title!,
                                                          query),
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                                //Text(appointment.title!,style:TextStyle(fontSize: 14,color:Colors.black,fontWeight: FontWeight.bold),),
                                                SizedBox(
                                                  height: size.height * .01,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    text: appointment.callType!,
                                                    style: TextStyle(
                                                        color: ColorRes.black,
                                                        fontSize: 10),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: appointment
                                                              .status,
                                                          style: TextStyle(
                                                              color:
                                                                  ColorRes.blue,
                                                              fontSize: 10)),
                                                    ],
                                                  ),
                                                ),
                                                // Icon(Icons.star_half,color: ColorRes.blue,size: 12,),

                                                SizedBox(
                                                  height: size.height * .01,
                                                ),
                                                Text(
                                                  appointment.time!,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: ColorRes.black,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // SizedBox(width: size.width*.05,),
                                          Expanded(
                                            flex: 3,
                                            child: Card(
                                                color: Color(0xffe9f0ff),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                margin: EdgeInsets.only(
                                                    left: 18,
                                                    right: 18,
                                                    top: 20,
                                                    bottom: 20),
                                                child: RotationTransition(
                                                    turns: Tween(
                                                            begin: 0.0,
                                                            end: 1.0)
                                                        .animate(
                                                            rotationController!),
                                                    child: IconButton(
                                                        icon: SvgPicture.asset(
                                                          appointment.icon!,
                                                          color: ColorRes.blue,
                                                        ),
                                                        onPressed: () {}))),
                                          ),
                                        ],
                                      )),
                                ));
                          }),
                    ],
                  ),
                )
              ])),
    );
  }
}

class AppointmentModel {
  String? image;
  String? title;
  String? callType;
  String? time;
  String? icon;
  String? status;
  AppointmentModel(
      {this.title,
      this.icon,
      this.image,
      this.callType,
      this.status,
      this.time});
}
