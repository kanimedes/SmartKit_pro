import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helper/ColorRes.dart';
import '../../helper/DoctorAnimation.dart';
import '../../helper/doctore_DesignConfig.dart';
import '../model/commonModel.dart';
import '../topDoctor/doctor_topDoctordetailScreen.dart';

class DoctorSpecialistDetail extends StatefulWidget {
  final String? title;
  final int? id;
  const DoctorSpecialistDetail({Key? key, this.title, this.id})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DoctorSpecialistDetailState();
  }
}

class DoctorSpecialistDetailState extends State<DoctorSpecialistDetail> {
  @override
  void initState() {
    data = widget.id == 0
        ? cardioList
        : widget.id == 1
            ? dentistList
            : widget.id == 2
                ? eyeList
                : widget.id == 3
                    ? brainList
                    : widget.id == 4
                        ? mouthList
                        : widget.id == 5
                            ? childList
                            : widget.id == 6
                                ? nerveList
                                : widget.id == 7
                                    ? dentistList
                                    : eyeList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorRes.white,
        appBar: DoctorDesignConfig.appBar(
            context: context,
            isIcon: false,
            title: widget.title!,
            textColor: ColorRes.black,
            iconColor: ColorRes.blue,
            size: size),
        body: Container(
          margin:
              EdgeInsets.only(left: size.width * .06, right: size.width * .06),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                CommonModel fav = widget.id == 0
                    ? cardioList[index]
                    : widget.id == 1
                        ? dentistList[index]
                        : widget.id == 2
                            ? eyeList[index]
                            : widget.id == 3
                                ? brainList[index]
                                : widget.id == 4
                                    ? mouthList[index]
                                    : widget.id == 5
                                        ? childList[index]
                                        : widget.id == 6
                                            ? nerveList[index]
                                            : widget.id == 7
                                                ? dentistList[index]
                                                : eyeList[index];
                return DoctorAnimation(
                    delay: 100,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DoctorTopDoctorDetail(
                                    doctorName: fav.title,
                                    reviewText: fav.reviewText,
                                    subTitle: fav.subTitle,
                                    image: fav.image),
                          ),
                        );
                      },
                      child: Container(
                          height: size.height * .1,
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        bottomLeft: Radius.circular(15)),
                                    child: Image.asset(
                                      fav.image!,
                                      height: size.height * .13,
                                      width: size.width * .2,
                                      fit: BoxFit.fill,
                                    )),
                              ),
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
                                      fav.title!,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: size.height * .005,
                                    ),
                                    Wrap(
                                      children: [
                                        Icon(
                                          Icons.star_half,
                                          color: ColorRes.blue,
                                          size: 12,
                                        ),
                                        Text(
                                          fav.reviewText!,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: ColorRes.fontColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: size.height * .005,
                                    ),
                                    Text(
                                      fav.subTitle!,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: ColorRes.fontColor,
                                          fontWeight: FontWeight.bold),
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
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    margin: EdgeInsets.only(
                                        left: 18,
                                        right: 18,
                                        top: 20,
                                        bottom: 20),
                                    child: IconButton(
                                        icon: SvgPicture.asset(
                                            fav.like == true
                                                ? DoctorDesignConfig
                                                    .getImagePath(
                                                        "heart_active.svg")
                                                : DoctorDesignConfig
                                                    .getImagePath("heart.svg"),
                                            color: ColorRes.blue),

                                        /* Icon(
                                       fav.like==true?Icons.favorite:Icons.favorite_border,size: 20,
                                       color: Colors.blue,
                                     ),*/
                                        onPressed: () {
                                          setState(() {
                                            fav.like = !fav.like!;
                                          });
                                        })),
                              ),
                            ],
                          )),
                    ));
              }),
        ));
  }
}
