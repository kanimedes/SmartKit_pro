import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper/ColorRes.dart';
import '../helper/StringRes.dart';

class DoctorFAQ extends StatefulWidget {
  const DoctorFAQ({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DoctorFAQState();
  }
}

class DoctorFAQState extends State<DoctorFAQ> {
  int selectedIndex = 0;
  List<FAQModel> FAQList = [
    FAQModel(
        title: "What is DoctorQ?",
        des: "DoctorQ is greatest medical online consultation App"),
    FAQModel(
        title: "How to use DoctorQ?",
        des: "Login in DoctorQ then fix appointment to doctor also"),
    FAQModel(title: "Is DoctorQ is safe for me?", des: "yes"),
    FAQModel(
        title: "How to schedule consultation on DoctorQ ?",
        des:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
    FAQModel(
        title: "How to logout from DoctorQ?",
        des:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
    FAQModel(
        title: "Is there free tips to get in health in app?",
        des:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"),
  ];
  List<String> topList = ['General', 'Login', 'Account', 'Doctor', 'Tips'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfff7faff),
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
          DoctorStringRes.FAQ,
          style: TextStyle(color: ColorRes.black),
        ),
        bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * .01),
            child: topBarWidget()),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: FAQList.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildPlayerModelList(FAQList[index]);
          },
        ),
      ),
    );
  }

  bool data = false;
  /*f7faff*/
  Widget _buildPlayerModelList(FAQModel items) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorRes.white,
          border: Border.all(
              color: data ? ColorRes.blue : ColorRes.white, width: 1)),
      child: ExpansionTile(
        iconColor: ColorRes.blue,
        collapsedIconColor: ColorRes.blue,
        onExpansionChanged: (check) {
          setState(() {
            data = check;
          });
        },
        title: Text(
          items.title!,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: ColorRes.black),
        ),
        children: <Widget>[
          Divider(
            height: 1,
            color: Color(0xffacacac),
          ),
          ListTile(
            title: Text(
              items.des!,
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: ColorRes.fontColor),
            ),
          )
        ],
      ),
    );
  }

  Widget topBarWidget() {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * .09,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topList.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(18),
        itemBuilder: (_, index) => Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .01,
              right: MediaQuery.of(context).size.width * .01),
          child: OutlinedButton(
            child: Text(
              topList[index],
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

class FAQModel {
  String? title;
  String? des;
  FAQModel({this.title, this.des});
}
