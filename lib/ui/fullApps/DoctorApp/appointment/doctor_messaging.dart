import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helper/ColorRes.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import 'doctor_messag_call_End.dart';

class DoctorMessaging extends StatefulWidget{
  final String ?title,time,image,cls;
  const DoctorMessaging({Key? key, this.title, this.time, this.image,this.cls}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DoctorMessagingState();
  }
}
class DoctorMessagingState extends State<DoctorMessaging>{

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
   return Scaffold(
     backgroundColor:  ColorRes.white,
     resizeToAvoidBottomInset: true,
     bottomNavigationBar: widget.cls=="history"?Container(height: 0,):Container(
       height: size.height*.08,
       alignment: Alignment.center,
       margin: EdgeInsets.only(left: size.width*.06,right: size.width*.06,bottom: size.height*.02),
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
           color: ColorRes.white,
           border: Border.all(color: Colors.black12,width: 1)
       ),
       child:TextFormField(
         style: const TextStyle(
             fontSize: 15,
             fontWeight: FontWeight.w500),
         cursorColor: Colors.black,
         decoration: InputDecoration(
           suffixIcon:IconButton(
               onPressed: (){ },
               icon: SvgPicture.asset(DoctorDesignConfig.getImagePath("send.svg"),color:ColorRes.blue)),
           /*const Icon(Icons.send,color: ColorRes.blue,)*/
           contentPadding: EdgeInsets.only(left: size.width*.05,top: size.height*.015),
           border: InputBorder.none,
           hintText: "Type Message...",
           hintStyle: TextStyle(
               fontSize: 14,
               color: ColorRes.fontColor.withOpacity(0.8)),
                       //border: InputBorder.none,
         ),
         keyboardType: TextInputType.text,
       ),
     ),
     appBar:DoctorDesignConfig.appBar(context:context,isIcon: true,icon: Icons.more_vert,title:DoctorStringRes.messaging,iconColor: ColorRes.blue,textColor: ColorRes.black,size: size,),
     body:  Container(
       margin: EdgeInsets.only(left: size.width*.06,right: size.width*.06),
         child: ListView(
             children: [
               GestureDetector(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoctorMessageEnd(image: widget.image,title: widget.title,callType: "Messaging",),),);
                 },
                 child: Container(
                     height: size.height*.11,
                     margin: EdgeInsets.only(top: 20),
                     decoration: BoxDecoration(border:Border.all(color: Colors.black12,width: 1,),
                         borderRadius: BorderRadius.circular(15)
                     ),
                     child:Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Expanded(
                           flex: 3,
                           child: ClipRRect(
                               borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                               child: Image.asset(widget.image!,height: size.height*.13,width: size.width*.2,fit: BoxFit.fill,))
                         ),
                         SizedBox(width: size.width*.05,),
                         Expanded(
                           flex: 6,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               /*  RichText(
                                          text: TextSpan(
                                            children:highlightOccurrences(appointment.title!, query),*/

                               Text(widget.title!,style:TextStyle(fontSize: 14,color:Colors.black,fontWeight: FontWeight.bold),),
                               SizedBox(height: size.height*.01,),
                               Text(widget.time!,style: TextStyle(fontSize: 10,color: ColorRes.black,fontWeight: FontWeight.w600),),
                             ],
                           ),
                         ),

                       ],
                     )
                 ),
               ),
               ListView.builder(
                   itemCount: ChatList.length,
                   shrinkWrap: true,
                   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.02, bottom: 10,),
                       physics: NeverScrollableScrollPhysics(),
                       itemBuilder: (context, index) {
                         return  ChatList[index].messageType == "receiver"
                                 ?  Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   SizedBox(height: size.height*.01,),
                                   Stack(
                                     children: [
                                       Container(
                                         margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*.1),
                                         padding: EdgeInsets.only(left: 15,bottom: 20,right: 15,top: 15),
                                         decoration: BoxDecoration(color: Color(0xffe9f0ff).withOpacity(0.5),
                                             borderRadius: BorderRadius.circular(5)

                                         ),
                                         child: Text(
                                           ChatList[index].messageContent!,
                                           textAlign: TextAlign.justify,
                                           style: TextStyle(
                                               fontSize: 14,color: ColorRes.fontColor,fontWeight: FontWeight.w600
                                           ),
                                         ),
                                       ),
                                       Positioned(
                                         bottom: 0,
                                         right: MediaQuery.of(context).size.width*.11,
                                         child: Text(
                                           ChatList[index].time!,
                                           textAlign: TextAlign.justify,
                                           style: TextStyle(
                                               fontSize: 14,color: ColorRes.fontColor,fontWeight: FontWeight.w600
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ]
                             ): Column(crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               SizedBox(height: size.height*.01,),
                                   Stack(
                                     children: [
                                       Container(//margin: EdgeInsets.only(right: MediaQuery.of(context).size.width*.4),
                                         padding: EdgeInsets.only(left: 15,bottom: 20,right: 15,top: 15),
                                         decoration: BoxDecoration(color: ColorRes.blue,
                                             borderRadius: BorderRadius.circular(5)

                                         ),
                                         child: Text(
                                           ChatList[index].messageContent!,
                                           style: TextStyle(
                                               fontSize: 14,color: Colors.white70,fontWeight: FontWeight.w600
                                           ),
                                         ),
                                       ),
                                       Positioned(
                                         bottom: 0,
                                         right: 0,
                                         child: Text(
                                           ChatList[index].time!,
                                           textAlign: TextAlign.justify,
                                           style: TextStyle(
                                               fontSize: 14,color: Colors.white70,fontWeight: FontWeight.w600
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                           ]
                         );
                       }
                       )

               ]
         )
     ),
   );
  }
}
class ChatModel{
  String? messageContent;
  String? messageType;
  String? time;
  ChatModel({this.messageContent, this.messageType, this.time});
}
List<ChatModel> ChatList = [
  ChatModel(messageContent: "Hello Adam ,\nI am Dr. Albert Flores.\nI will help you to solved your disease complaints.", messageType: "receiver", time: "10:30"),
  ChatModel(messageContent: "First you tell me about your illness so far.", messageType: "receiver", time: "10:35"),
  ChatModel(messageContent: "This is very important so that i can help you.", messageType: "receiver", time: "10:36"),
  ChatModel(messageContent: "Hello Doctor ", messageType: "sender", time: "10.00"),
  ChatModel(messageContent: "I have a heart problem from the past 3 days,\nI often feel tired and and out of breath.", messageType: "sender", time: "10.01"),
  ChatModel(messageContent: "Sometimes i throw up too.", messageType: "sender", time: "10:37"),
  ChatModel(messageContent: "To much weakness", messageType: "sender", time: "10:40"),
];