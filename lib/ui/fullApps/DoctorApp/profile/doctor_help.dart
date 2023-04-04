import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/SlideAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import 'doctor_ContactUs.dart';
import 'doctor_FAQ.dart';
import 'doctor_termCondition.dart';
import 'model/commonModel.dart';

class DoctorHelp extends StatefulWidget {
  const DoctorHelp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DoctorHelpState();
  }
}

class DoctorHelpState extends State<DoctorHelp> with TickerProviderStateMixin {
  List<CommonModel> helpList = [
    CommonModel(name: "FAQ"),
    CommonModel(name: "Contact us"),
    CommonModel(name: "Terms & Condition"),
    CommonModel(name: "Privacy Policy"),
  ];
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
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
        appBar: DoctorDesignConfig.appBar(
            context: context,
            isIcon: false,
            title: DoctorStringRes.help,
            iconColor: ColorRes.blue,
            textColor: ColorRes.black),
        body: Container(
          margin:
              EdgeInsets.only(left: size.width * .04, right: size.width * .04),
          child: ListView.builder(
              itemCount: helpList.length,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return DoctorAnimation(
                    delay: 100,
                    child: SlideAnimation(
                        position: 10,
                        itemCount: 20,
                        slideDirection: SlideDirection.fromBottom,
                        animationController: _animationController,
                        child: Column(
                          children: [
                            ListTile(
                              onTap: () {
                                if (index == 0) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const DoctorFAQ(),
                                    ),
                                  );
                                } else if (index == 1) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const DoctorContactUs(),
                                    ),
                                  );
                                } else if (index == 2) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const DoctorTermCon(term: "term"),
                                    ),
                                  );
                                } else if (index == 3) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const DoctorTermCon(term: "privacy"),
                                    ),
                                  );
                                }
                              },
                              title: Text(
                                helpList[index].name!,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: ColorRes.blue,
                                size: 20,
                              ),
                            ),
                            Divider(
                              height: 1,
                              color: Color(0xffacacac),
                            ),
                          ],
                        )));
              }),
        ));
  }
}
