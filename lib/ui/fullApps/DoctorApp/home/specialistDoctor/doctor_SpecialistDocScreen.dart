import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helper/doctore_DesignConfig.dart';
import '../doctor_HomePageScreen.dart';
import '../../helper/ColorRes.dart';
import '../../helper/StringRes.dart';
import 'doctor_SpecialistDetail.dart';

class DoctorSpecialistDocScreen extends StatefulWidget{
  const DoctorSpecialistDocScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DoctorSpecialistDocScreenState();
  }
}
class DoctorSpecialistDocScreenState extends State<DoctorSpecialistDocScreen>with TickerProviderStateMixin{
  bool typing=false;
  String source="", query="";
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
          style: TextStyle(
              backgroundColor: ColorRes.white, color:ColorRes.blue),
        ));
      } else if (match.start > lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));

        children.add(TextSpan(
          text: source.substring(match.start, match.end),
          style: TextStyle(
              backgroundColor: ColorRes.white, color:ColorRes.blue),
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
  List<SpecialistModel> specialist = [
    SpecialistModel(icon: DoctorDesignConfig.getImagePath("hear_beat.svg"), specialist: "Cardio Specialist", noOfDoctor: "252",color: Colors.red),
    SpecialistModel(icon:DoctorDesignConfig.getImagePath("tooth.svg"), specialist: "Dental Specialist", noOfDoctor: "165",color: Colors.blueGrey),
    SpecialistModel(icon: DoctorDesignConfig.getImagePath("eye.svg"),specialist: "Eye Specialist", noOfDoctor: "263",color: Colors.blue),

    SpecialistModel(icon: DoctorDesignConfig.getImagePath("brain.svg"), specialist: "Brain Specialist", noOfDoctor: "252",color: Colors.green),
    SpecialistModel(icon:DoctorDesignConfig.getImagePath("mouth.svg"), specialist: "Mouth Specialist", noOfDoctor: "165",color: Colors.indigo),
    SpecialistModel(icon:  DoctorDesignConfig.getImagePath("child_care.svg"), specialist: "Child Specialist", noOfDoctor: "263",color: Colors.brown),
    SpecialistModel(icon: DoctorDesignConfig.getImagePath("nerve.svg"), specialist: "Nerve Specialist", noOfDoctor: "252",color: Colors.purple),
    SpecialistModel(icon: DoctorDesignConfig.getImagePath("tooth.svg"), specialist: "Dental Specialist", noOfDoctor: "165",color: Colors.cyan),
    SpecialistModel(icon: DoctorDesignConfig.getImagePath("eye.svg"), specialist: "Eye Specialist", noOfDoctor: "263",color: Colors.lime),
  ];
  AnimationController ?rotationController ;
  List<SpecialistModel> searchList=[];
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    rotationController = AnimationController(duration: const Duration(milliseconds:250), vsync: this,);
    searchList.addAll(specialist);
    rotationController!.forward(from: 0.0);
    super.initState();
  }
@override
  void dispose() {
  rotationController!.dispose();
    super.dispose();
  }
  searchOperation(String searchText) async {
    setState(() {
      specialist = searchList.where((string) => string.specialist!.toLowerCase().contains(searchText.toLowerCase())).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
    backgroundColor: ColorRes.white,
    appBar:AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: 65,
      iconTheme: IconThemeData(color: ColorRes.blue),
      title: typing? Container(
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * .01, right: MediaQuery.of(context).size.width * .01),
          decoration: BoxDecoration(color: Color(0xfff5f6f9),
            borderRadius: BorderRadius.circular(30),
          ),
          child:TextFormField(cursorColor: Color(0xffa2a2a2),
            controller: controller,
            onChanged: (text) {
            text = text.toLowerCase();
            setState(() {
              query = text;
              searchOperation(query);
            });
            },
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: EdgeInsets.only(right:size.width*.05),
                child: IconButton(
                  icon:  Icon(Icons.close,color: ColorRes.fontColor,size: 20,),
                  onPressed: () {
                    setState(() {
                      typing=!typing;
                      controller.clear();
                      query="";
                      searchOperation("");
                    });
                    },),
              ),
              contentPadding: EdgeInsets.only(top: size.height*.015,left:size.width*.05),
              isDense: true,
              hintText: "Search",
              hintStyle: TextStyle(color: ColorRes.fontColor,fontWeight: FontWeight.bold,fontSize:13),
              border: InputBorder.none,
            ), keyboardType: TextInputType.emailAddress,
          )):Text(DoctorStringRes.specialist,style: TextStyle(color:ColorRes.black),),
      actions: [
        !typing? Container(
          margin: EdgeInsets.only(right: size.width*.045),
          width: size.width*.135,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5)
          ),
          child: Card(
              color: Color(0xffe9f0ff),
              margin: EdgeInsets.all(9),
              child: IconButton(
                  icon: SvgPicture.asset(DoctorDesignConfig.getImagePath("filter.svg"),color: ColorRes.blue,),
                  onPressed: (){
                    setState(() {
                      typing=!typing;
                    });
                  }
                  )
          ),
    ):Container(),
      ],
    ),
    body: Container(
      padding: EdgeInsets.only(top: size.height*.02),
      margin: EdgeInsets.only(left: size.width*.06,right: size.width*.06),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: specialist.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            mainAxisSpacing: 17,
            crossAxisSpacing: 17,
          ),
          itemBuilder: (context, index) {
            /*DoctorSpecialistDetail*/
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoctorSpecialistDetail(title:specialist[index].specialist,id: index, ),),);
              },
              child: RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(rotationController!),
                  child:Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: specialist[index].color,
                    ),
                child: Column(
                  children: [
                    SizedBox(height: size.height*.03,),
                    SvgPicture.asset(specialist[index].icon!,color: ColorRes.white,),
                  //  Icon(specialist[index].icon,color: Colors.white,),
                    SizedBox(height: size.height*.02,),
                    RichText(
                        text: TextSpan(
                          children:highlightOccurrences(specialist[index].specialist!, query),
                          style: TextStyle(color: Colors.white),
                        )
                    ),
                    SizedBox(height: size.height*.01,),
                    Text(specialist[index].noOfDoctor!+" Doctors",style: TextStyle(color: Colors.white),)

                  ],
                ),
              )
              ),
            );
          }
          )
    ),
  );
  }
}
