import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/SlideAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import 'model/commonModel.dart';

class DoctorAppearance extends StatefulWidget {
  const DoctorAppearance({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DoctorAppearanceState();
  }
}

class DoctorAppearanceState extends State<DoctorAppearance>
    with TickerProviderStateMixin {
  List<CommonModel> appList = [
    CommonModel(name: "Dark mode", check: true),
    CommonModel(name: "Blur background", check: false),
    CommonModel(name: "Full screen mode", check: true),
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
          title: DoctorStringRes.appearance,
          iconColor: ColorRes.blue,
          textColor: ColorRes.black),
      body: Container(
        margin:
            EdgeInsets.only(left: size.width * .04, right: size.width * .04),
        child: ListView.builder(
            itemCount: appList.length,
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
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
                            title: Text(
                              appList[index].name!,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            trailing: CupertinoSwitch(
                                activeColor: ColorRes.blue,
                                value: appList[index].check!,
                                onChanged: (value) {
                                  setState(() {
                                    appList[index].check = value;
                                  });
                                }),
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xffacacac),
                          ),
                        ],
                      )));
            }),
      ),
    );
  }
}
