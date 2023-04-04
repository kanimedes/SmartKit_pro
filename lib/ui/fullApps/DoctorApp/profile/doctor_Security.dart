import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/SlideAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import 'model/commonModel.dart';

class DoctorSecurity extends StatefulWidget{
  const DoctorSecurity({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DoctorSecurityState();
  }
}
class DoctorSecurityState extends State<DoctorSecurity>with TickerProviderStateMixin{
  List<CommonModel> securityList=[
    CommonModel(name: "Face ID",check: true),
    CommonModel(name: "Remember me",check: false),
    CommonModel(name: "Touch ID",check: true),
  ];
  AnimationController? _animationController ;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }
  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: DoctorDesignConfig.appBar(context:context,isIcon: false,title:DoctorStringRes.security,iconColor: ColorRes.blue,textColor: ColorRes.black ),
      body: Container(
        margin: EdgeInsets.only(left: size.width*.04,right: size.width*.04),
        child: ListView.builder(
            itemCount: securityList.length,
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return  DoctorAnimation(delay: 100,
              child:SlideAnimation(
                  position: 10,
                  itemCount: 20,
                  slideDirection: SlideDirection.fromBottom,
                  animationController: _animationController,
                  child:Column(
                children: [
                  ListTile(
                    title: Text(securityList[index].name!,style: TextStyle(fontWeight: FontWeight.w600),),
                    trailing:CupertinoSwitch(
                        activeColor:ColorRes.blue,
                        value:securityList[index].check!,
                        onChanged: (value) {
                          setState(() {
                            securityList[index].check=value;
                          });
                        }) ,
                  ),
                  Container(
                    padding:EdgeInsets.only(top: size.height*.015,),
                    child: Divider(height: 1,color: Color(0xffacacac),),
                  ),
                ],
              )));
            }),
      ),
    );
  }
}