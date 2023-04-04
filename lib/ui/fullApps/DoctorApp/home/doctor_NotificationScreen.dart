import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
class DoctorNotificationScreen extends StatefulWidget{
  const DoctorNotificationScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
   return _DoctorNotificationScreenState();
  }
}
class _DoctorNotificationScreenState extends State<DoctorNotificationScreen>{
  List<NotificationModel> todayList=[
    NotificationModel(color: Colors.red,icon:DoctorDesignConfig.getImagePath("time.svg"),title:"Appointment Alarm",subTitle: "Your appointment will be start after 15 minutes.Stay with app and take care." ),
    NotificationModel(color: Colors.blue,icon: DoctorDesignConfig.getImagePath("check_circel.svg"),title: "Appointment Confirmed",subTitle: "Appointment Confirmed Dr. Jaroman Bell,Call will be held at 11:30 AM | 11 Mar 22")
  ];
  List<NotificationModel> yesterdayList=[
    NotificationModel(color: const Color(0xfff9c223),icon:DoctorDesignConfig.getImagePath("notification_02.svg"),title:"New Feature Available",subTitle: "Now you can mirror video while on video call" ),
  ];
  List<NotificationModel> tuesdayList=[
    NotificationModel(color: Colors.red,icon:DoctorDesignConfig.getImagePath("time.svg"),title:"Appointment Alarm",subTitle: "Your appointment will be start after 15 minutes.Stay with app and take care." ),
    NotificationModel(color: Colors.blue,icon: DoctorDesignConfig.getImagePath("check_circel.svg"),title: "Appointment Confirmed",subTitle: "Appointment Confirmed Dr. Jenny wilsom,Call will be held at 11:30 AM | 11 Mar 22")
  ];
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar:DoctorDesignConfig.appBar(context:context,title: DoctorStringRes.notification,iconColor:  ColorRes.blue,textColor: ColorRes.black,size: size,isIcon: false)
      /*AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: ColorRes.blue),
        title: Text(DoctorStringRes.notification,style: TextStyle(color: ColorRes.black),),
      )*/,
      body: Container(
        height: size.height,
        width: size.width,
        margin: EdgeInsets.only(left: size.width*.06,right: size.width*.06),
        child: ListView(
         // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height*.02,),
            const Text("Today,March 10 2022",style: TextStyle(color: Color(0xff6c747d),fontWeight: FontWeight.w600),),
            ListView.builder(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: todayList.length,
                itemBuilder: (BuildContext context, int index) {
                return DoctorAnimation(delay: 100,
                child:Padding(
                  padding: EdgeInsets.only(top: size.height*.02),
                  child: Card(
                      semanticContainer: true,
                      elevation: 3,
                     // margin: EdgeInsets.only(top: size.height*.03),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      shadowColor: const Color(0xfff5f8ff),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: CircleAvatar(
                            radius: 25,
                            backgroundColor:todayList[index].color,
                            child:SvgPicture.asset(todayList[index].icon!,color: Colors.white,),

                          /*Icon(todayList[index].icon,color: Colors.white,)*/),
                        title: Text(todayList[index].title!,style:const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        subtitle: Text(todayList[index].subTitle!,style: const TextStyle(fontSize: 12),),
                      )),
                ));
              },
            ),
            SizedBox(height: size.height*.02,),
             DoctorAnimation(delay: 200,
              child:Text("Yesterday,March 9 2022",style: TextStyle(color: Color(0xff6c747d),fontWeight: FontWeight.w600),)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: yesterdayList.length,
              itemBuilder: (BuildContext context, int index) {
                return  DoctorAnimation(delay: 200,
                child: Padding(
                  padding: EdgeInsets.only(top: size.height*.015),
                  child: Card(
                      elevation: 3,
                     // margin: EdgeInsets.only(top: size.height*.03),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      shadowColor: const Color(0xfff5f8ff),
                      child: ListTile(
                        leading: CircleAvatar(
                            radius: 25,
                            backgroundColor:yesterdayList[index].color,
                            child:SvgPicture.asset(yesterdayList[index].icon!,color: Colors.white,)
                            ),
                        title: Text(yesterdayList[index].title!,style:const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        subtitle: Text(yesterdayList[index].subTitle!,style: const TextStyle(fontSize: 12),),

                      )),
                ));
              },
            ),
            SizedBox(height: size.height*.02,),
        DoctorAnimation(delay: 300,
          child: Text("Tuesday,March 8 2022",style: TextStyle(color: Color(0xff6c747d),fontWeight: FontWeight.w600)),),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tuesdayList.length,
              itemBuilder: (BuildContext context, int index) {
                return  DoctorAnimation(delay: 200,
                child: Padding(
                  padding: EdgeInsets.only(top: size.height*.02),
                  child: Card(
                      semanticContainer: true,
                      elevation: 3,
                      //margin: EdgeInsets.only(top: size.height*.03),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      shadowColor: const Color(0xfff5f8ff),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: CircleAvatar(
                            radius: 25,
                            backgroundColor:tuesdayList[index].color,
                            child: SvgPicture.asset(tuesdayList[index].icon!,color: Colors.white,)),
                        title: Text(tuesdayList[index].title!,style:const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        subtitle: Text(tuesdayList[index].subTitle!,style: const TextStyle(fontSize: 12),),
                      )),
                ));
              },
            ),
            SizedBox(height: size.height*.02,),
        DoctorAnimation(delay: 400,
          child: Text("Monday,March 7 2022",style: TextStyle(color: Color(0xff6c747d),fontWeight: FontWeight.w600),)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: todayList.length,
              itemBuilder: (BuildContext context, int index) {
                return DoctorAnimation(delay: 400,
                child:Padding(
                  padding: EdgeInsets.only(top: size.height*.02),
                  child: Card(
                      semanticContainer: true,
                      elevation: 3,
                      //margin: EdgeInsets.only(top: size.height*.03),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      shadowColor: const Color(0xfff5f8ff),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: CircleAvatar(
                            radius: 25,
                            backgroundColor:todayList[index].color,
                            child: SvgPicture.asset(todayList[index].icon!,color: Colors.white,)
                           ),
                        title: Text(todayList[index].title!,style:const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        subtitle: Text(todayList[index].subTitle!,style: const TextStyle(fontSize: 12),),
                      )),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
class NotificationModel{
  String ?icon;
  Color ? color;
  String ?title;
  String ?subTitle;
  NotificationModel({this.icon,this.color,this.subTitle,this.title});
}