import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../helper/ColorRes.dart';
import '../../helper/StringRes.dart';
import '../../helper/doctore_DesignConfig.dart';

class DoctorReviewScreen extends StatefulWidget {
  const DoctorReviewScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DoctorReviewScreenState();
  }
}

class DoctorReviewScreenState extends State<DoctorReviewScreen> {
  int selectedIndex = 0;
  List<ReviewModel> reviewListAll = [
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_a.jpg"),
        reviewText: "The Doctor is great!",
        name: "Jahanvi Kapoor",
        reviewStar: "5",
        date: "December 20,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_b.jpg"),
        reviewText: "Woohoooo!",
        name: "Shivangi Joshi",
        reviewStar: "4",
        date: "December 18,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_c.jpg"),
        reviewText: "Perfect!",
        name: "Jyoti shah",
        reviewStar: "5",
        date: "December 15,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_d.jpg"),
        reviewText: "omg! This ",
        name: "Annetle Black",
        reviewStar: "5",
        date: "November 20,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_e.jpg"),
        reviewText: "Nice!",
        name: "Arlene AcCoy",
        reviewStar: "4",
        date: "November 15,2021"),
  ];
  List<ReviewModel> reviewList5 = [
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_f.jpg"),
        reviewText: "Perfect",
        name: "Shivangi Joshi",
        reviewStar: "5",
        date: "November 20,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_g.jpg"),
        reviewText: "Great!",
        name: "Jahanvi Kapoor",
        reviewStar: "5",
        date: "November 10,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_h.jpg"),
        reviewText: "The Doctor is great!",
        name: "Jyoti shah",
        reviewStar: "5",
        date: "November 1,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_i.jpg"),
        reviewText: "omg! This ",
        name: "Annetle Black",
        reviewStar: "5",
        date: "October 25,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_j.jpg"),
        reviewText: "Nice!",
        name: "Arlene AcCoy",
        reviewStar: "5",
        date: "October 20,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_k.jpg"),
        reviewText: "Woohoooo!",
        name: "John",
        reviewStar: "5",
        date: "October 9,2021"),
  ];
  List<ReviewModel> reviewList4 = [
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_l.jpg"),
        reviewText: "Great",
        name: "Annetle Black",
        reviewStar: "4",
        date: "October 25,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_m.jpg"),
        reviewText: "Perfect!",
        name: "Jahanvi Kapoor",
        reviewStar: "4",
        date: "October 14,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_n.jpg"),
        reviewText: "The Doctor is great!",
        name: "Jyoti shah",
        reviewStar: "4",
        date: "October 11,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_o.jpg"),
        reviewText: "omg! This ",
        name: "Shivangi Joshi",
        reviewStar: "4",
        date: "September 26,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_p.jpg"),
        reviewText: "Nice!",
        name: "Arlene AcCoy",
        reviewStar: "4",
        date: "September 15,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_q.jpg"),
        reviewText: "Woohoooo!",
        name: "John",
        reviewStar: "4",
        date: "September 1,2021"),
  ];
  List<ReviewModel> reviewList3 = [
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_r.jpg"),
        reviewText: "Good",
        name: "Annetle Black",
        reviewStar: "3",
        date: "December 26,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_s.jpg"),
        reviewText: "Nice!",
        name: "Jahanvi Kapoor",
        reviewStar: "3",
        date: "August 11,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_t.jpg"),
        reviewText: "The Doctor is great!",
        name: "Jyoti shah",
        reviewStar: "3",
        date: "August 5,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_b.jpg"),
        reviewText: "omg! This ",
        name: "Shivangi Joshi",
        reviewStar: "3",
        date: "July 17,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_e.jpg"),
        reviewText: "Nice!",
        name: "Arlene AcCoy",
        reviewStar: "3",
        date: "July 16,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_h.jpg"),
        reviewText: "Woohoooo!",
        name: "John",
        reviewStar: "3",
        date: "July 10,2021"),
  ];
  List<ReviewModel> reviewList2 = [
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_i.jpg"),
        reviewText: "Delay",
        name: "Jahanvi Kapoor ",
        reviewStar: "2",
        date: "July 10,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_j.jpg"),
        reviewText: "Poor!",
        name: "Annetle Black",
        reviewStar: "2",
        date: "July 1,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_k.jpg"),
        reviewText: "Bad",
        name: "Jyoti shah",
        reviewStar: "2",
        date: "June 26,2021"),
  ];
  List<ReviewModel> reviewList1 = [
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_l.jpg"),
        reviewText: "Timing not proper",
        name: "Jyoti shah",
        reviewStar: "1",
        date: "May 26,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_o.jpg"),
        reviewText: "Poor!",
        name: "Annetle Black",
        reviewStar: "1",
        date: "April 15,2021"),
    ReviewModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_q.jpg"),
        reviewText: "Very Bad",
        name: "Jahanvi Kapoor ",
        reviewStar: "1",
        date: "March 2,2021"),
  ];
  List<String> starList = ['All', '5', '4', '3', '2', '1'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: size.width * .06,
            right: size.width * .06,
            bottom: size.width * .06),
        child: ElevatedButton.icon(
          icon: Icon(
            Icons.arrow_back,
            color: ColorRes.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text(
            DoctorStringRes.back,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: ColorRes.blue,
                fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(330, 50),
            primary: ColorRes.white,
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
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 65,
        toolbarHeight: size.height * .13,
        iconTheme: IconThemeData(color: ColorRes.blue),
        title: Text(
          DoctorStringRes.reviews,
          style: TextStyle(color: ColorRes.black),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: size.width * .045),
            width: size.width * .135,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: Card(
                color: Color(0xffe9f0ff),
                margin: EdgeInsets.all(9),
                child: IconButton(
                    icon: SvgPicture.asset(
                      DoctorDesignConfig.getImagePath("filter.svg"),
                      color: ColorRes.blue,
                    ),
                    onPressed: () {})),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * .01),
            child: topBarWidget()),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        margin:
            EdgeInsets.only(left: size.width * .06, right: size.width * .06),
        child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: starList.length,
            onPageChanged: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            itemBuilder: (_, index) => ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: selectedIndex == 0
                    ? reviewListAll.length
                    : selectedIndex == 1
                        ? reviewList5.length
                        : selectedIndex == 2
                            ? reviewList4.length
                            : selectedIndex == 3
                                ? reviewList3.length
                                : selectedIndex == 4
                                    ? reviewList2.length
                                    : reviewList1.length,
                itemBuilder: (BuildContext context, int index) {
                  ReviewModel review = selectedIndex == 0
                      ? reviewListAll[index]
                      : selectedIndex == 1
                          ? reviewList5[index]
                          : selectedIndex == 2
                              ? reviewList4[index]
                              : selectedIndex == 3
                                  ? reviewList3[index]
                                  : selectedIndex == 4
                                      ? reviewList2[index]
                                      : reviewList1[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoctorTopDoctorDetail(doctorName: fav.title,reviewText: fav.reviewText,subTitle: fav.subTitle,image: fav.image),),);
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(40.0),
                                child: Image.asset(
                                  review.image!,
                                  height: size.height * .07,
                                  width: size.width * .15,
                                  fit: BoxFit.fill,
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  review.name!,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: size.height * .005,
                                ),
                                Text(
                                  review.date!,
                                  style: TextStyle(
                                      color: ColorRes.fontColor, fontSize: 12),
                                ),
                                SizedBox(
                                  height: size.height * .005,
                                ),
                                Text(
                                  review.reviewText!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ColorRes.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: size.width * .06,
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: size.height * .04,
                                width: size.width * .11,
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, top: 10, bottom: 0),
                                //margin: EdgeInsets.only(top: size.height*.01),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: const [
                                      Color(0xff548fff),
                                      ColorRes.blue /*Color(0xff3a7eff)*/
                                    ],
                                  ),
                                ),
                                child: /*Card(
                                     color: Colors.transparent,
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(10.0),
                                     ),
                                     //margin: EdgeInsets.only(left: 15,right: 15,top: 0,bottom: 0),
                                     child:*/
                                    Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: ColorRes.white,
                                      size: 12,
                                    ),
                                    Text(
                                      review.reviewStar!,
                                      style: TextStyle(
                                          color: ColorRes.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  );
                })),
      ),
    );
  }

  Widget topBarWidget() {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * .08,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: starList.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(18),
        itemBuilder: (_, index) => Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .01,
              right: MediaQuery.of(context).size.width * .01),
          child: OutlinedButton.icon(
            icon: Icon(
              Icons.star,
              color: selectedIndex == index ? ColorRes.white : ColorRes.blue,
              size: 15,
            ),
            label: Text(
              starList[index],
              style: TextStyle(
                  fontSize: 14,
                  color:
                      selectedIndex == index ? ColorRes.white : ColorRes.blue),
            ),
            style: OutlinedButton.styleFrom(
              alignment: Alignment.center,
              backgroundColor:
                  selectedIndex == index ? ColorRes.blue : ColorRes.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              side: BorderSide(color: ColorRes.blue, width: 2),
            ),
            onPressed: () {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

class ReviewModel {
  String? name;
  String? image;
  String? reviewText;
  String? reviewStar;
  String? date;
  ReviewModel(
      {this.name, this.image, this.reviewText, this.reviewStar, this.date});
}
