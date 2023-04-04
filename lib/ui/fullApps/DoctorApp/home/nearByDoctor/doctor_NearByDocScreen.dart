import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../helper/ColorRes.dart';
import '../../helper/DoctorAnimation.dart';
import '../../helper/StringRes.dart';
import '../../helper/doctore_DesignConfig.dart';
import '../model/nearByModel.dart';
import '../topDoctor/doctor_topDoctordetailScreen.dart';

class NearByDocScreen extends StatefulWidget {
  const NearByDocScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return NearByDocScreenState();
  }
}

class NearByDocScreenState extends State<NearByDocScreen> {
  bool typing = false;
  String source = "", query = "";
  List<NearByModel> searchList = [];
  TextEditingController controller = TextEditingController();
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

  searchOperation(String searchText) async {
    setState(() {
      nearbyList = searchList
          .where((string) => string.doctorName!
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    searchList.addAll(nearbyList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorRes.white,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 65,
          iconTheme: IconThemeData(color: ColorRes.blue),
          title: typing
              ? Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .01,
                      right: MediaQuery.of(context).size.width * .01),
                  decoration: BoxDecoration(
                    color: Color(0xfff5f6f9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextFormField(
                    cursorColor: Color(0xffa2a2a2),
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
                        padding: EdgeInsets.only(right: size.width * .05),
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: ColorRes.fontColor,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              typing = !typing;
                              controller.clear();
                              query = "";
                              searchOperation("");
                            });
                          },
                        ),
                      ),
                      contentPadding: EdgeInsets.only(
                          top: size.height * .015, left: size.width * .05),
                      isDense: true,
                      hintText: "Search",
                      hintStyle: TextStyle(
                          color: ColorRes.fontColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ))
              : Text(
                  DoctorStringRes.nearByDoc,
                  style: TextStyle(color: ColorRes.black),
                ),
          actions: [
            !typing
                ? Container(
                    margin: EdgeInsets.only(right: size.width * .045),
                    width: size.width * .135,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Card(
                        color: Color(0xffe9f0ff),
                        margin: EdgeInsets.all(9),
                        child: IconButton(
                            icon: SvgPicture.asset(
                              DoctorDesignConfig.getImagePath("filter.svg"),
                              color: ColorRes.blue,
                            ),
                            onPressed: () {
                              setState(() {
                                typing = !typing;
                              });
                            })),
                  )
                : Container(),
          ],
        ),
        body: Container(
          height: size.height,
          padding: EdgeInsets.only(top: size.height * .02),
          margin:
              EdgeInsets.only(left: size.width * .06, right: size.width * .06),
          child: DoctorAnimation(
            delay: 100,
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: nearbyList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.68,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => DoctorTopDoctorDetail(
                              doctorName: nearbyList[index].doctorName,
                              image: nearbyList[index].image,
                              subTitle: nearbyList[index].specialist,
                              reviewText:
                                  "${nearbyList[index].noOfStar}(${nearbyList[index].count} reviews)"),
                        ),
                      );
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                nearbyList[index].image!,
                                fit: BoxFit.fill,
                                width: size.width * .5,
                              )),
                          SizedBox(
                            height: size.height * .005,
                          ),
                          RichText(
                              text: TextSpan(
                                  children: highlightOccurrences(
                                      nearbyList[index].doctorName, query),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: ColorRes.black))),
                          SizedBox(
                            height: size.height * .005,
                          ),
                          Text(
                            nearbyList[index].specialist!,
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
                                initialRating: nearbyList[index].noOfStar!,
                                itemCount: 5,
                                itemSize: 15,
                                itemPadding:
                                    EdgeInsets.only(left: size.width * .005),
                                itemBuilder: (context, index) {
                                  switch (index) {
                                    case 0:
                                      return SvgPicture.asset(
                                        DoctorDesignConfig.getImagePath(
                                            "star_active.svg"),
                                        color: Colors.amber,
                                      );
                                    case 1:
                                      return SvgPicture.asset(
                                        DoctorDesignConfig.getImagePath(
                                            "star_active.svg"),
                                        color: Colors.amber,
                                      );
                                    case 2:
                                      return SvgPicture.asset(
                                        DoctorDesignConfig.getImagePath(
                                            "star_active.svg"),
                                        color: Colors.amber,
                                      );
                                    case 3:
                                      return SvgPicture.asset(
                                        DoctorDesignConfig.getImagePath(
                                            "star_active.svg"),
                                        color: Colors.amber,
                                      );
                                    case 4:
                                      return SvgPicture.asset(
                                        DoctorDesignConfig.getImagePath(
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
                                "(${nearbyList[index].count})",
                                style: TextStyle(
                                    color: ColorRes.fontColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ]),
                  );
                }),
          ),
        ));
  }
}
