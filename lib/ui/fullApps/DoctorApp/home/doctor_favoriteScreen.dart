import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import 'model/commonModel.dart';
class DoctorFavoriteScreen extends StatefulWidget{
  const DoctorFavoriteScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DoctorFavoriteScreenState();
  }
}
class DoctorFavoriteScreenState extends State<DoctorFavoriteScreen>{
  bool typing=false;
  String source="", query="";
  TextEditingController controller = TextEditingController();
  List<CommonModel> favList=[
    CommonModel(title:"Dr. Ronald Richards",subTitle:"Cardio Specialist-Nanyang Hospital",image:DoctorDesignConfig.getImageDoctor("doctor_a.jpg"),like: true,reviewText:"4.9(3841 reviews)"),
    CommonModel(title:"Dr. Eleanor Pena",subTitle:"Cardio Specialist-Bracket Medical",image:DoctorDesignConfig.getImageDoctor("doctor_c.jpg"),like: false,reviewText:"4.8(3400 reviews)"),
    CommonModel(title:"Dr. Ralph Edwards",subTitle:"Cardio Specialist-Smithly Landon",image:DoctorDesignConfig.getImageDoctor("doctor_e.jpg"),like: true,reviewText:"4.9(3821 reviews)"),
    CommonModel(title:"Dr. Dianne Russell",subTitle:"Cardio Specialist-Ramsay Collage",image:DoctorDesignConfig.getImageDoctor("doctor_f.jpg"),like: true,reviewText:"4.8(3321 reviews)"),
    CommonModel(title:"Dr. Albert Flores",subTitle:"Cardio Specialist-Bracket Hospital",image:DoctorDesignConfig.getImageDoctor("doctor_h.jpg"),like: false,reviewText:"4.8(3521 reviews)"),

    CommonModel(title:"Dr. Ronald Richards",subTitle:"Cardio Specialist-Nanyang Hospital",image:DoctorDesignConfig.getImageDoctor("doctor_i.jpg"),like: true,reviewText:"4.9(3841 reviews)"),
    CommonModel(title:"Dr. Eleanor Pena",subTitle:"Cardio Specialist-Bracket Medical",image:DoctorDesignConfig.getImageDoctor("doctor_k.jpg"),like: false,reviewText:"4.8(3400 reviews)"),
    CommonModel(title:"Dr. Ralph Edwards",subTitle:"Cardio Specialist-Smithly Landon",image:DoctorDesignConfig.getImageDoctor("doctor_m.jpg"),like: true,reviewText:"4.9(3821 reviews)"),
    CommonModel(title:"Dr. Dianne Russell",subTitle:"Cardio Specialist-Ramsay Collage",image:DoctorDesignConfig.getImageDoctor("doctor_o.jpg"),like: true,reviewText:"4.8(3321 reviews)"),
    CommonModel(title:"Dr. Albert Flores",subTitle:"Cardio Specialist-Bracket Hospital",image:DoctorDesignConfig.getImageDoctor("doctor_q.jpg"),like: true,reviewText:"4.8(3521 reviews)"),

  ];
  List<CommonModel> searchLists=[];
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
          style: const TextStyle(
              backgroundColor: ColorRes.white, color:ColorRes.blue),
        ));
      } else if (match.start > lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));

        children.add(TextSpan(
          text: source.substring(match.start, match.end),
          style: const TextStyle(
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
@override
  void initState() {
  searchLists.addAll(favList);
    super.initState();
  }
  searchOperation(String searchText) async {
    setState(() {
      query=searchText;
      favList = searchLists.where((string) => string.title!.toLowerCase().contains(searchText.toLowerCase())).toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorRes.white,
      appBar:AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 65,
       // toolbarHeight: size.height*.12,
        iconTheme: const IconThemeData(color: ColorRes.blue),
        title: typing? Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * .01, right: MediaQuery.of(context).size.width * .01),
            decoration: BoxDecoration(color: const Color(0xfff5f6f9),
              borderRadius: BorderRadius.circular(30),
            ),
            child:TextFormField(cursorColor: const Color(0xffa2a2a2),
              autofocus: true,
              controller: controller,
              onChanged: searchOperation,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right:size.width*.05),
                  child: IconButton(
                    icon: SvgPicture.asset(DoctorDesignConfig.getImagePath("search.svg"),color: ColorRes.blue,),
                    onPressed: () {
                      setState(() {
                        typing=!typing;
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
            )):Text(DoctorStringRes.favoriteDoctor,style: TextStyle(color:ColorRes.black),),
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
                    )),

          ):Container(),

        ],
      ),

      //DoctorDesignConfig.appBar(context:context,title: DoctorStringRes.favoriteDoctor,iconColor: ColorRes.blue,textColor: ColorRes.black,size:size,icon: Icons.filter_list_rounded,onPress: (){},isIcon: true,isSvg: true ),
      body: Container(
        height: size.height,
        width: size.width,
        margin: EdgeInsets.only(left: size.width*.06,right: size.width*.06),
        child:  ListView.builder(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: favList.length,
          itemBuilder: (BuildContext context, int index) {
          return  DoctorAnimation(delay: 400,
          child:Container(
            height: size.height*.1,
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(border:Border.all(color: Colors.black12,width: 1,),
                  borderRadius: BorderRadius.circular(15)
              ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                  child: Image.asset(favList[index].image!,height: size.height*.12,width: size.width*.2,fit: BoxFit.contain,)),
             // SizedBox(width: size.width*.05,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                      text: TextSpan(
                        children:highlightOccurrences(favList[index].title!, query),
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: ColorRes.black),
                      )
                  ),
                 // Text(favList[index].title!,style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                  SizedBox(height: size.height*.005,),
                  Wrap(
                    children: [
                      Icon(Icons.star_half,color: ColorRes.blue,size: 12,),
                      Text(favList[index].reviewText!,style: TextStyle(fontSize: 10,color: ColorRes.fontColor,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: size.height*.005,),
                  Text(favList[index].subTitle!,style: TextStyle(fontSize: 10,color: ColorRes.fontColor,fontWeight: FontWeight.bold),),
                ],
              ),
             // SizedBox(width: size.width*.05,),
              Container(
                margin: EdgeInsets.only(right: size.width*.02),
                width: size.width*.135,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Card(
                    color: const Color(0xffe9f0ff),
                    margin: const EdgeInsets.all(9),
                    child: IconButton(
                        icon:SvgPicture.asset(DoctorDesignConfig.getImagePath("heart_active.svg"),color: ColorRes.blue,),
                        onPressed: (){
                          showModalBottomSheet(context: context,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: const Radius.circular(30),topLeft: Radius.circular(30)),),
                              builder:(context) {
                            return SizedBox(
                              height: size.height*.3,
                              child: Column(
                                children: [
                                  Container(
                                      height: size.height*.1,
                                      margin: const EdgeInsets.all(30),
                                          decoration: BoxDecoration(
                                              border:Border.all(color: Colors.black12,width: 1,),
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              ClipRRect(
                                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15)),
                                                  child: Image.asset(favList[index].image!,height: size.height*.12,width: size.width*.2,fit: BoxFit.contain,)),
                                              // SizedBox(width: size.width*.05,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(favList[index].title!,style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                                  SizedBox(height: size.height*.005,),
                                                  Wrap(
                                                    children: [
                                                      const Icon(Icons.star_half,color: ColorRes.blue,size: 12,),
                                                      Text(favList[index].reviewText!,style: const TextStyle(fontSize: 10,color:ColorRes.fontColor,fontWeight: FontWeight.bold),),
                                                    ],
                                                  ),
                                                  SizedBox(height: size.height*.005,),
                                                  Text(favList[index].subTitle!,style: const TextStyle(fontSize: 10,color:ColorRes.fontColor,fontWeight: FontWeight.bold),),
                                                ],
                                              ),
                                              // SizedBox(width: size.width*.05,),
                                              Container(
                                                margin: EdgeInsets.only(right: size.width*.02),
                                                width: size.width*.135,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5)
                                                ),
                                                child: Card(
                                                    color: const Color(0xffe9f0ff),
                                                    margin: const EdgeInsets.all(9),
                                                    child: IconButton(
                                                        icon: const Icon(
                                                         Icons.favorite,size: 20,
                                                          color: Colors.blue,
                                                        ),
                                                        onPressed: (){}
                                                    )),

                                              ),

                                            ],
                                          )
                                  ),
                                  const Text("Remove from favorite?",style: TextStyle(fontWeight: FontWeight.w600),),
                              SizedBox(height: size.height*.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  OutlinedButton(
                                    child: const Text('cancle',  style: TextStyle(fontSize: 18),),
                                    style: OutlinedButton.styleFrom(
                                      minimumSize:  const Size(150, 50),
                                      //primary:Color(0xffe6b2f4),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                      side: const BorderSide(color: ColorRes.blue, width: 1),
                                    ),
                                    onPressed: () {
                                     Navigator.pop(context);
                                    },
                                  ),
                                  ElevatedButton(
                                    onPressed: (){
                                      setState(() {
                                        favList.removeAt(index);
                                        Navigator.pop(context);
                                      });

                                    },
                                    child: const Text("Yes,Remove", style: TextStyle(
                                        fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18),),
                                    style: ElevatedButton.styleFrom(
                                      minimumSize:  const Size(150, 50),
                                      primary: ColorRes.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                      //minimumSize:  Size(150, 50),

                                    ),),


                                ])
                                ],
                              ),
                            );
                          });
                        /* if (favList[index].like == false) {
                           setState(() {
                             favList[index].like=true;
                           });
                         }
                         else{
                           setState(() {
                             favList[index].like=false;
                             favList.removeAt(index);
                           });
                         }*/
                        }
                    )),

              ),

            ],
          )
          ));

          }
      ),
  )
    );
  }
}
