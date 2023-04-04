import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helper/ColorRes.dart';
import '../helper/SlideAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import '../home/doctor_HomePageScreen.dart';

class DoctorWriteReview extends StatefulWidget {
  final String? title, image;
  const DoctorWriteReview({Key? key, this.title, this.image}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DoctorWriteReviewState();
  }
}

class DoctorWriteReviewState extends State<DoctorWriteReview>
    with TickerProviderStateMixin {
  String _selectedYesNo = 'yes';
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: SlideAnimation(
          position: 10,
          itemCount: 20,
          slideDirection: SlideDirection.fromBottom,
          animationController: _animationController,
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * .06,
                right: size.width * .06,
                bottom: size.width * .06),
            child: DoctorDesignConfig.Button(
                onpress: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => DoctorHomeScreen(),
                    ),
                  );
                },
                name: DoctorStringRes.submitRev,
                foreground: ColorRes.blue,
                TextColor: ColorRes.white),
          )),
      appBar: DoctorDesignConfig.appBar(
          context: context,
          isIcon: false,
          title: DoctorStringRes.wrReview,
          iconColor: ColorRes.blue,
          textColor: ColorRes.black),
      body: Container(
        height: size.height,
        width: size.width,
        margin:
            EdgeInsets.only(left: size.width * .06, right: size.width * .06),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * .03,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  widget.image!,
                  height: size.height * .2,
                  width: size.width * .4,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              SlideAnimation(
                  position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromLeft,
                  animationController: _animationController,
                  child: Text(
                    "How was your experience",
                    style: TextStyle(
                        color: ColorRes.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )),
              SlideAnimation(
                  position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromLeft,
                  animationController: _animationController,
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: ColorRes.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          text: "with ",
                          children: [
                        TextSpan(
                            text: widget.title!,
                            style: TextStyle(color: ColorRes.blue)),
                        TextSpan(
                          text: " ?",
                          style: TextStyle(
                              color: ColorRes.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        )
                      ]))),
              SizedBox(
                height: size.height * .02,
              ),
              SlideAnimation(
                  position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromLeft,
                  animationController: _animationController,
                  child: RatingBar.builder(
                    initialRating: 3,
                    itemCount: 5,
                    itemPadding: EdgeInsets.only(
                        left: size.width * .02, right: size.width * .02),
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return SvgPicture.asset(
                            DoctorDesignConfig.getImagePath("star_active.svg"),
                            color: ColorRes.blue,
                          );
                        case 1:
                          return SvgPicture.asset(
                            DoctorDesignConfig.getImagePath("star_active.svg"),
                            color: ColorRes.blue,
                          );
                        case 2:
                          return SvgPicture.asset(
                            DoctorDesignConfig.getImagePath("star_active.svg"),
                            color: ColorRes.blue,
                          );
                        case 3:
                          return SvgPicture.asset(
                            DoctorDesignConfig.getImagePath("star_active.svg"),
                            color: ColorRes.blue,
                          );
                        case 4:
                          return SvgPicture.asset(
                            DoctorDesignConfig.getImagePath("star_active.svg"),
                            color: ColorRes.blue,
                          );
                      }
                      return Container();
                    },
                    onRatingUpdate: (rating) {
                      //rating==5.0?Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRideYourRide(),),):Null;
                      print(rating);
                    },
                  )),
              line(),
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
                    children: const [
                      Text(
                        "Write a Comment",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Max 250 words",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ColorRes.fontColor),
                      )
                    ],
                  )),
              SizedBox(
                height: size.height * .02,
              ),
              SlideAnimation(
                  position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromRight,
                  animationController: _animationController,
                  child: reviewEnter()),
              SizedBox(
                height: size.height * .03,
              ),
              SlideAnimation(
                  position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromBottom,
                  animationController: _animationController,
                  child: Text(
                    "Would you recomment ${widget.title} to your friends ?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
              SizedBox(
                height: size.height * .01,
              ),
              SlideAnimation(
                  position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromBottom,
                  animationController: _animationController,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Theme(
                          data: ThemeData(
                            unselectedWidgetColor:
                                ColorRes.blue.withOpacity(0.5),
                          ),
                          child: Radio<String>(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            value: 'yes',
                            groupValue: _selectedYesNo,
                            onChanged: (value) {
                              setState(() {
                                _selectedYesNo = value!;
                              });
                            },
                          )),
                      SizedBox(
                        width: size.width * .02,
                      ),
                      Text(
                        "Yes",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Theme(
                          data: ThemeData(
                            unselectedWidgetColor:
                                ColorRes.blue.withOpacity(0.5),
                          ),
                          child: Radio<String>(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: 'no',
                            groupValue: _selectedYesNo,
                            onChanged: (value) {
                              setState(() {
                                _selectedYesNo = value!;
                              });
                            },
                          )),
                      Text(
                        "No",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget line() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Divider(
        height: 1,
        color: Color(0xffacacac),
      ),
    );
  }

  Widget reviewEnter() {
    return Container(
        height: MediaQuery.of(context).size.height * .15,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: ColorRes.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12, width: 1),
          boxShadow: [
            new BoxShadow(
              color: Color(0x0f000000),
              blurRadius: 10.0,
            ),
          ],
        ),
        //margin:EdgeInsets.only(left: MediaQuery.of(context).size.width*.01, right: MediaQuery.of(context).size.width*.03),
        child: TextFormField(
          maxLines: 6,
          onTap: () {},
          cursorColor: Color(0xffa2a2a2),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.only(left: 20, top: 15),
            // isDense: true,
            hintText: "Tell people about your experience",
            hintStyle: TextStyle(
              color: Colors.black12,
            ),
            border: InputBorder.none,
          ),
        ));
  }
}
