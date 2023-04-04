import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helper/ColorRes.dart';
import '../helper/SlideAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import 'doctore_otpVerify.dart';

class DoctorForgotPass extends StatefulWidget{
  const DoctorForgotPass({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DoctorForgotPassState();
  }
}
class DoctorForgotPassState extends State<DoctorForgotPass>with SingleTickerProviderStateMixin{
  bool email=false,sms=true;
  AnimationController? _animationController ;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar:DoctorDesignConfig.appBar(context:context,isIcon: false,size: size,title:DoctorStringRes.forgotPass,textColor: Colors.black,iconColor:ColorRes.blue) ,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left:size.width*.06,right: size.width*.06,bottom: size.width*.06 ),
        child:DoctorDesignConfig.Button(onpress: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoctorOtpVerify(type:sms?"+6282*******39": "ex****@gmail.com"),),);
        }, name: DoctorStringRes.continueBtn, foreground: ColorRes.blue, TextColor: ColorRes.white),
      ),
      body: Container(
        margin: EdgeInsets.only(left: size.width*.06,right: size.width*.06),
        child: Column(
          children: [
            SizedBox(height: size.height*.02,),
            const Text(DoctorStringRes.forgotPasstext),
            SizedBox(height: size.height*.02,),
            SlideAnimation(
          position: 10,
          itemCount: 20,
          slideDirection: SlideDirection.fromLeft,
          animationController: _animationController,
          child:GestureDetector(
              onTap: (){
                setState(() {
                  sms=true;
                  email=false;
                });
              },
              child: Container(
                height: size.height*.15,
                decoration: BoxDecoration(
                  color: ColorRes.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: sms?ColorRes.blue:Colors.black12,width: sms?2:1),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0f000000),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: ColorRes.blue.withOpacity(0.2),
                      child: const Icon(Icons.chat,color: ColorRes.blue,),
                    ),
                    title: const Text(DoctorStringRes.viasms+":",style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w600),),
                    subtitle: const Text("+6282*******39",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            )),
            SizedBox(height: size.height*.03,),
            SlideAnimation(
          position: 10,
          itemCount: 20,
          slideDirection: SlideDirection.fromRight,
          animationController: _animationController,
          child:GestureDetector(
              onTap: (){
                setState(() {
                  email=true;
                  sms=false;
                });
              },
              child: Container(
                height: size.height*.15,
                decoration: BoxDecoration(
                  color: ColorRes.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color:email?ColorRes.blue: Colors.black12,width: email?2:1),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0f000000),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: ColorRes.blue.withOpacity(0.2),
                      child: const Icon(Icons.email,color: ColorRes.blue,),
                    ),
                    title: const Text(DoctorStringRes.viaemail+":",style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.w600),),
                    subtitle: const Text("ex****@gmail.com",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            )),
            
          ],
        ),
      ),

    );
  }

}