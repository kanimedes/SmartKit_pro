import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../helper/ColorRes.dart';
import '../../helper/DoctorAnimation.dart';
import '../../helper/StringRes.dart';
import '../../helper/doctore_DesignConfig.dart';
import '../model/commonModel.dart';
import 'doctor_topDoctordetailScreen.dart';

class TopDoctorScreen extends StatefulWidget {
  const TopDoctorScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return TopDoctorScreenState();
  }
}

class TopDoctorScreenState extends State<TopDoctorScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  bool typing = false;
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
          style: const TextStyle(
              backgroundColor: ColorRes.white, color: ColorRes.blue),
        ));
      } else if (match.start > lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));

        children.add(TextSpan(
          text: source.substring(match.start, match.end),
          style: const TextStyle(
              backgroundColor: ColorRes.white, color: ColorRes.blue),
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

  List<String> typeList = ['All', 'Brain', 'Cardio', 'Eye', 'Dentist'];
  TextEditingController controller = TextEditingController();
  List<CommonModel> searchResult = [];
  @override
  void initState() {
    listInit();
    super.initState();
  }

  listInit() {
    setState(() {
      data = selectedIndex == 0
          ? allList
          : selectedIndex == 1
              ? brainList
              : selectedIndex == 2
                  ? cardioList
                  : selectedIndex == 3
                      ? eyeList
                      : dentistList;
      searchResult.addAll(data);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  searchOperation(String searchText) async {
    setState(() {
      query = searchText;
      data = searchResult
          .where((string) =>
              string.title!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 65,
        toolbarHeight: size.height * .12,
        iconTheme: const IconThemeData(color: ColorRes.blue),
        title: typing
            ? Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .01,
                    right: MediaQuery.of(context).size.width * .01),
                decoration: BoxDecoration(
                  color: const Color(0xfff5f6f9),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  cursorColor: const Color(0xffa2a2a2),
                  autofocus: true,
                  controller: controller,
                  onChanged: searchOperation,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: size.width * .05),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          DoctorDesignConfig.getImagePath("search.svg"),
                          color: ColorRes.blue,
                        ),
                        onPressed: () {
                          setState(() {
                            typing = !typing;
                            controller.clear();
                            query = "";
                            searchOperation("");
                            //setState(() {});
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
                DoctorStringRes.topDoctor,
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
            itemCount: typeList.length,
            onPageChanged: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            itemBuilder: (_, index) => ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  CommonModel fav = selectedIndex == 0
                      ? allList[index]
                      : selectedIndex == 1
                          ? brainList[index]
                          : selectedIndex == 2
                              ? cardioList[index]
                              : selectedIndex == 3
                                  ? eyeList[index]
                                  : dentistList[index];
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                        children: highlightOccurrences(
                                            fav.title!, query),
                                        /* Text(fav.title!,*/ style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      margin: EdgeInsets.only(
                                          left: 18,
                                          right: 18,
                                          top: 20,
                                          bottom: 20),
                                      child: IconButton(
                                          icon: Icon(
                                            fav.like == true
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            size: 20,
                                            color: ColorRes.blue,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              fav.like = !fav.like!;
                                            });
                                          })),
                                ),
                              ],
                            )),
                      ));
                })),
      ),
    );
  }

  Widget topBarWidget() {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * .07,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: typeList.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(18),
        itemBuilder: (_, index) => Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .01,
              right: MediaQuery.of(context).size.width * .01),
          child: OutlinedButton(
            child: Text(
              typeList[index],
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
                borderRadius: BorderRadius.circular(10.0),
              ),
              side: BorderSide(color: ColorRes.blue, width: 1),
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
