import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/DoctorApp/home/specialistDoctor/doctor_SpecialistDetail.dart';
import 'package:smartkit_pro/ui/fullApps/DoctorApp/home/topDoctor/doctor_topDoctordetailScreen.dart';

import '../appointment/doctor_myAppointment.dart';
import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/SlideAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import '../history/doctor_history.dart';
import '../profile/doctor_profileTab.dart';
import 'doctor_NotificationScreen.dart';
import 'doctor_favoriteScreen.dart';
import 'model/nearByModel.dart';
import 'nearByDoctor/doctor_NearByDocScreen.dart';
import 'specialistDoctor/doctor_SpecialistDocScreen.dart';
import 'topDoctor/doctor_TopDoctorScreen.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DoctorHomeScreenState();
  }
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  TextEditingController controller = TextEditingController();

  List<SpecialistModel> specialist = [];
  List<TopDoctorModel> topDoctorList = [
    TopDoctorModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_a.jpg"),
        doctorName: "Dr. Jaroman Bell",
        specialist: "Cardio Specialist"),
    TopDoctorModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_b.jpg"),
        doctorName: "Dr. Jenny wilsom",
        specialist: "Dental Specialist"),
    TopDoctorModel(
        image: DoctorDesignConfig.getImageDoctor("doctor_c.jpg"),
        doctorName: "Dr. Denny Bell",
        specialist: "Eye Specialist"),
  ];
  List<SpecialistModel> searchResult = [];
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

  AnimationController? _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    listInit();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  void _onTappedBar(int value) {
    setState(() {
      currentIndex = value;
      /*_animationController!.dispose();
      _animationController!.forward(from: 0.0);*/
    });
    _pageController.jumpToPage(value);
  }

  listInit() {
    return Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        specialist = [
          SpecialistModel(
              icon: DoctorDesignConfig.getImagePath("hear_beat.svg"),
              specialist: "Cardio ",
              noOfDoctor: "252",
              color: Colors.red),
          SpecialistModel(
              icon: DoctorDesignConfig.getImagePath("tooth.svg"),
              specialist: "Dental",
              noOfDoctor: "165",
              color: Colors.blueGrey),
          SpecialistModel(
              icon: DoctorDesignConfig.getImagePath("eye.svg"),
              specialist: "Eye",
              noOfDoctor: "263",
              color: Colors.blue),
        ];
        searchResult.addAll(specialist);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorRes.white,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25),
                topRight: Radius.circular(25)),
            child: BottomNavigationBar(
                backgroundColor: Colors.white,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                unselectedItemColor: Color(0xffcacccf),
                elevation: 0.0,

                //backgroundColor: Colors.white,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: Container(
                        height: size.height * .045,
                        width: size.width * .12,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffe9f0ff),
                        ),
                        child: SvgPicture.asset(
                          DoctorDesignConfig.getImagePath("home.svg"),
                          color: ColorRes.blue,
                        )),
                    label: "",
                    activeIcon: Container(
                      height: size.height * .045,
                      width: size.width * .23,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: const Color(0xffe9f0ff),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: SvgPicture.asset(
                              DoctorDesignConfig.getImagePath(
                                  "home_active.svg"),
                              color: ColorRes.blue,
                            ),
                          ),
                          Expanded(
                              flex: 9,
                              child: Text(
                                DoctorStringRes.home,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: ColorRes.blue),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ))
                        ],
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                        height: size.height * .045,
                        width: size.width * .12,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffe9f0ff),
                        ),
                        child: SvgPicture.asset(
                          DoctorDesignConfig.getImagePath("calender.svg"),
                          color: ColorRes.blue,
                        )),
                    label: "",
                    activeIcon: Container(
                      height: size.height * .045,
                      width: size.width * .23,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: const Color(0xffe9f0ff),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 6,
                              child: SvgPicture.asset(
                                DoctorDesignConfig.getImagePath(
                                    "calender_active.svg"),
                                color: ColorRes.blue,
                              )),
                          Expanded(
                              flex: 9,
                              child: Text(
                                DoctorStringRes.appointment,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: ColorRes.blue),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ))
                        ],
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      height: size.height * .045,
                      width: size.width * .12,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffe9f0ff),
                      ),
                      child: SvgPicture.asset(
                        DoctorDesignConfig.getImagePath("history.svg"),
                        color: ColorRes.blue,
                      ),
                    ),
                    label: "",
                    activeIcon: Container(
                      height: size.height * .045,
                      width: size.width * .23,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xffe9f0ff),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 6,
                            child: SvgPicture.asset(
                              DoctorDesignConfig.getImagePath(
                                  "history_active.svg"),
                              color: ColorRes.blue,
                            ),
                          ),
                          Expanded(
                              flex: 9,
                              child: Text(
                                DoctorStringRes.history,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: ColorRes.blue),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ))
                        ],
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      height: size.height * .045,
                      width: size.width * .12,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffe9f0ff),
                      ),
                      child: SvgPicture.asset(
                        DoctorDesignConfig.getImagePath("account.svg"),
                        color: ColorRes.blue,
                      ),
                    ),
                    label: "",
                    activeIcon: Container(
                      height: size.height * .045,
                      width: size.width * .23,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color(0xffe9f0ff),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 6,
                            child: SvgPicture.asset(
                              DoctorDesignConfig.getImagePath(
                                  "user_active.svg"),
                              color: ColorRes.blue,
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: Text(
                              DoctorStringRes.profile,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: ColorRes.blue),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
                type: BottomNavigationBarType.shifting,
                currentIndex: currentIndex,
                selectedItemColor: const Color(0xffeff4ff),
                onTap: _onTappedBar),
          ),
        ),
        body: specialist.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: ColorRes.blue,
                ),
              )
            : PageView(
                controller: _pageController,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        left: size.width * .04, right: size.width * .04),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        SizedBox(
                          height: size.height * .03,
                        ),
                        AppBar(
                          elevation: 0,
                          backgroundColor: Colors.white,
                          leadingWidth: 0,
                          // leading: SvgPicture.asset(DoctorDesignConfig.getImagePathLogo("home_logo.svg")),
                          title: SvgPicture.asset(
                              DoctorDesignConfig.getImagePathLogo(
                                  "home_logo.svg")),
                          actions: <Widget>[
                            IconButton(
                              icon: SvgPicture.asset(
                                DoctorDesignConfig.getImagePath("heart.svg"),
                                color: ColorRes.blue,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const DoctorFavoriteScreen(),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              icon: SvgPicture.asset(
                                DoctorDesignConfig.getImagePath(
                                    "notification.svg"),
                                color: ColorRes.blue,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const DoctorNotificationScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * .03,
                        ),
                        DoctorAnimation(
                            delay: 100,
                            child: Container(
                                margin: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .01,
                                    right: MediaQuery.of(context).size.width *
                                        .01),
                                decoration: BoxDecoration(
                                  color: const Color(0xfff5f6f9),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: TextFormField(
                                  cursorColor: const Color(0xffa2a2a2),
                                  controller: controller,
                                  onChanged: (text) {
                                    // text = text.toLowerCase();
                                    setState(() {
                                      query = text;
                                      specialist = searchResult.where((items) {
                                        var noteTitle =
                                            items.specialist!.toLowerCase();
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
                                      padding: EdgeInsets.only(
                                          right: size.width * .05),
                                      child: SvgPicture.asset(
                                        DoctorDesignConfig.getImagePath(
                                            "search.svg"),
                                        color: ColorRes.blue,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(
                                        top: size.height * .015,
                                        left: size.width * .05),
                                    isDense: true,
                                    hintText: "Search",
                                    hintStyle: const TextStyle(
                                        color: ColorRes.fontColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ))),
                        DoctorAnimation(
                            delay: 150,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: size.width * .02,
                                  right: size.width * .02,
                                  top: size.height * .03),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    DoctorStringRes.specialist,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const DoctorSpecialistDocScreen(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        DoctorStringRes.seeAll,
                                        style: TextStyle(
                                            color: ColorRes.blue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: size.height * .02,
                        ),
                        DoctorAnimation(
                            delay: 200,
                            child: SlideAnimation(
                                position: 10,
                                itemCount: 20,
                                slideDirection: SlideDirection.fromRight,
                                animationController: _animationController,
                                child: SizedBox(
                                    height: size.height * .2,
                                    child: ListView.builder(
                                        itemCount: specialist.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      DoctorSpecialistDetail(
                                                    title: specialist[index]
                                                            .specialist! +
                                                        " Specialist",
                                                    id: index,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: size.height * .2,
                                              width: size.width * .28,
                                              margin: const EdgeInsets.only(
                                                  right: 5, left: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: specialist[index].color,
                                              ),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: size.height * .03,
                                                  ),
                                                  SvgPicture.asset(
                                                      specialist[index].icon!,
                                                      color: ColorRes.white),
                                                  // Icon(specialist[index].icon,color: Colors.white,),
                                                  SizedBox(
                                                    height: size.height * .02,
                                                  ),
                                                  RichText(
                                                      text: TextSpan(
                                                          children:
                                                              highlightOccurrences(
                                                                  specialist[
                                                                          index]
                                                                      .specialist!,
                                                                  query),
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white))),

                                                  // Text(specialist[index].specialist!,style: TextStyle(color: Colors.white),),
                                                  const Text(
                                                    "Specialist",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * .01,
                                                  ),
                                                  Text(
                                                    specialist[index]
                                                            .noOfDoctor! +
                                                        " Doctors",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        })))),
                        DoctorAnimation(
                            delay: 250,
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: size.width * .02,
                                  right: size.width * .02,
                                  top: size.height * .03),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    DoctorStringRes.topDoctor,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const TopDoctorScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        DoctorStringRes.seeAll,
                                        style: TextStyle(
                                            color: ColorRes.blue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        DoctorAnimation(
                            delay: 350,
                            child: SlideAnimation(
                                position: 10,
                                itemCount: 20,
                                slideDirection: SlideDirection.fromRight,
                                animationController: _animationController,
                                child: SizedBox(
                                    height: size.height * .27,
                                    child: ListView.builder(
                                        itemCount: topDoctorList.length,
                                        shrinkWrap: true,
                                        //padding:EdgeInsets.only(right: 5,left: 5),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (BuildContext
                                                          context) =>
                                                      DoctorTopDoctorDetail(
                                                          doctorName:
                                                              topDoctorList[
                                                                      index]
                                                                  .doctorName,
                                                          image: topDoctorList[
                                                                  index]
                                                              .image,
                                                          subTitle:
                                                              topDoctorList[
                                                                      index]
                                                                  .specialist,
                                                          reviewText:
                                                              "4.9(3841 reviews)"),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: size.height * .27,
                                              width: size.width * .38,
                                              margin: EdgeInsets.only(
                                                  right: 5, left: 5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Card(
                                                elevation: 1,
                                                child: Column(
                                                  children: [
                                                    ClipRRect(
                                                      child: Image.asset(
                                                        topDoctorList[index]
                                                            .image!,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              topRight: Radius
                                                                  .circular(
                                                                      10)),
                                                    ),
                                                    SizedBox(
                                                      height: size.height * .02,
                                                    ),
                                                    Text(
                                                      topDoctorList[index]
                                                          .doctorName!,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    SizedBox(
                                                      height: size.height * .01,
                                                    ),
                                                    Text(
                                                      topDoctorList[index]
                                                          .specialist!,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        })))),
                        DoctorAnimation(
                          delay: 400,
                          child: Container(
                              padding: EdgeInsets.only(
                                  left: size.width * .02,
                                  right: size.width * .02,
                                  top: size.height * .02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    DoctorStringRes.nearByDoc,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const NearByDocScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        DoctorStringRes.seeAll,
                                        style: TextStyle(
                                            color: ColorRes.blue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ))
                                ],
                              )),
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        DoctorAnimation(
                          delay: 350,
                          child: SizedBox(
                            height: size.height * .6,
                            child: GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: nearbyListHome.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.7,
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 15,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              DoctorTopDoctorDetail(
                                                  doctorName:
                                                      nearbyListHome[index]
                                                          .doctorName,
                                                  image: nearbyListHome[index]
                                                      .image,
                                                  subTitle:
                                                      nearbyListHome[index]
                                                          .specialist,
                                                  reviewText:
                                                      "${nearbyListHome[index].noOfStar}(${nearbyListHome[index].count} reviews)"),
                                        ),
                                      );
                                    },
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                nearbyListHome[index].image!,
                                                fit: BoxFit.fill,
                                                width: size.width * .5,
                                              )),
                                          SizedBox(
                                            height: size.height * .005,
                                          ),
                                          Text(
                                            nearbyListHome[index].doctorName!,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: size.height * .005,
                                          ),
                                          Text(
                                            nearbyListHome[index].specialist!,
                                            style: TextStyle(
                                                color: ColorRes.fontColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: size.height * .005,
                                          ),
                                          Row(
                                            children: [
                                              RatingBar.builder(
                                                initialRating:
                                                    nearbyListHome[index]
                                                        .noOfStar!,
                                                itemCount: 5,
                                                itemSize: 15,
                                                itemPadding: EdgeInsets.only(
                                                    left: size.width * .005),
                                                itemBuilder: (context, index) {
                                                  switch (index) {
                                                    case 0:
                                                      return SvgPicture.asset(
                                                        DoctorDesignConfig
                                                            .getImagePath(
                                                                "star_active.svg"),
                                                        color: Colors.amber,
                                                      );
                                                    case 1:
                                                      return SvgPicture.asset(
                                                        DoctorDesignConfig
                                                            .getImagePath(
                                                                "star_active.svg"),
                                                        color: Colors.amber,
                                                      );
                                                    case 2:
                                                      return SvgPicture.asset(
                                                        DoctorDesignConfig
                                                            .getImagePath(
                                                                "star_active.svg"),
                                                        color: Colors.amber,
                                                      );
                                                    case 3:
                                                      return SvgPicture.asset(
                                                        DoctorDesignConfig
                                                            .getImagePath(
                                                                "star_active.svg"),
                                                        color: Colors.amber,
                                                      );
                                                    case 4:
                                                      return SvgPicture.asset(
                                                        DoctorDesignConfig
                                                            .getImagePath(
                                                                "star_active.svg"),
                                                        color: Colors.amber,
                                                      );
                                                  }
                                                  return Container();
                                                },
                                                onRatingUpdate: (rating) {
                                                  //rating==5.0?Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRideYourRide(),),):Null;
                                                  print(rating);
                                                },
                                              ),
                                              Text(
                                                "(${nearbyListHome[index].count})",
                                                style: TextStyle(
                                                    color: ColorRes.fontColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          )
                                        ]),
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ),
                  DoctorMyAppointment(),
                  DoctorHistory(),
                  DoctorProfileTab()
                ],
                onPageChanged: (page) {
                  setState(() {
                    currentIndex = page;
                  });
                },
              ));
  }
}

class SpecialistModel {
  String? icon;
  String? specialist;
  String? noOfDoctor;
  Color? color;
  SpecialistModel({this.specialist, this.icon, this.noOfDoctor, this.color});
}

class TopDoctorModel {
  String? image;
  String? doctorName;
  String? specialist;
  TopDoctorModel({this.image, this.doctorName, this.specialist});
}
