import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/SlideAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';

class DoctorInviteFrd extends StatefulWidget{
  const DoctorInviteFrd({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DoctorInviteFrdState();
  }
}
class DoctorInviteFrdState extends State<DoctorInviteFrd>with TickerProviderStateMixin{
  List<InviteFrdModel> inviteList=[
    InviteFrdModel(title: "Robert Fox",check: false,phone: "+6512345678",image: DoctorDesignConfig.getImageDoctor("doctor_d.jpg")),
    InviteFrdModel(title: "Amit shah",check: false,phone: "+91-1234567896",image: DoctorDesignConfig.getImageDoctor("doctor_e.jpg")),
    InviteFrdModel(title: "Vijay Mota",check: true,phone: "+65-9874562315",image: DoctorDesignConfig.getImageDoctor("doctor_f.jpg")),
    InviteFrdModel(title: "Mayur Vyas",check: false,phone: "+85-12358469741",image:DoctorDesignConfig.getImageDoctor("doctor_g.jpg")),
    InviteFrdModel(title: "Jyotika Rathod",check: true,phone: "+91-78985632145",image: DoctorDesignConfig.getImageDoctor("doctor_h.jpg")),
    InviteFrdModel(title: "Devangi Joshi",check: false,phone: "+25-1234567898",image: DoctorDesignConfig.getImageDoctor("doctor_i.jpg")),
    InviteFrdModel(title: "Priya Parmar ",check: false,phone: "+22-745836921",image:DoctorDesignConfig.getImageDoctor("doctor_j.jpg")),
    InviteFrdModel(title: "Ajit Zala",check: false,phone: "+91-1234567898",image: DoctorDesignConfig.getImageDoctor("doctor_k.jpg")),
    InviteFrdModel(title: "Chintan Thakker",check: false,phone: "+65-785412369",image: DoctorDesignConfig.getImageDoctor("doctor_l.jpg")),
  ];
  AnimationController? _animationController ;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }
  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: DoctorDesignConfig.appBar(context:context,isIcon: false,title:DoctorStringRes.inviteFrd,iconColor: ColorRes.blue,textColor: ColorRes.black ),
      body:Container(
        margin: EdgeInsets.only(left: size.width*.06,right: size.width*.06),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: inviteList.length,
            itemBuilder: (BuildContext context, int index) {
              InviteFrdModel invite=inviteList[index];
              return DoctorAnimation(delay: 100,
              child:SlideAnimation(
              position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromBottom,
                  animationController: _animationController,
                  child:Container(
                    height: size.height*.1,
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xffedf0f1),width: 1),
                      boxShadow: [
                        new BoxShadow(
                            color: Color(0xfff7faff),
                            blurRadius: 20.0,
                            blurStyle: BlurStyle.outer

                        ),
                      ],),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            flex: 4,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                                child:Image.asset(invite.image!,height: size.height*.13,width: size.width*.3,fit: BoxFit.fill,)
                            ),
                        ),
                        SizedBox(width: size.width*.05,),
                        Expanded( flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(invite.title!,style:TextStyle(fontSize: 14,color:Colors.black,fontWeight: FontWeight.bold),),
                              SizedBox(height: size.height*.01,),
                             Text(invite.phone!,style: TextStyle(color: ColorRes.fontColor,fontWeight: FontWeight.w600),)
                            ],
                          ),
                        ),

                        Expanded(
                          flex: 5,
                          child: ElevatedButton(
                            child: Text("Invite", style: TextStyle(fontWeight: FontWeight.w600, color: invite.check==true?ColorRes.white:ColorRes.blue, fontSize: 16),),
                            style: ElevatedButton.styleFrom(
                              //minimumSize: const Size(170, 45),
                              primary: invite.check==true?ColorRes.blue:ColorRes.white,
                              alignment: Alignment.center,
                              elevation: 0,
                              side: BorderSide(width: 2.0, color: ColorRes.blue,),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ), onPressed: () {
                              setState(() {
                                 invite.check=!invite.check!;
                              });

                          },),
                        ),

                      ],
                    ),
              )));

            }
        ),
      ),

    );
  }

}
class InviteFrdModel {
  String ?image;
  String ? title;
  String ? phone;
  bool ?check;
  InviteFrdModel({this.check,this.title,this.image,this.phone});
}