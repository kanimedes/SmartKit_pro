import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/ColorRes.dart';
import '../helper/StringRes.dart';

class DoctorVideoPlay extends StatefulWidget{
  final String ?image;
  const DoctorVideoPlay({Key? key, this.image}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
   return DoctorVideoPlayState();
  }
}
class DoctorVideoPlayState extends State<DoctorVideoPlay>{
  bool pause=true,play=false;
  double val=3;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.image!),
              ),
            ),
            child:Stack(
              alignment: Alignment.bottomCenter,
              fit: StackFit.passthrough,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                    child: Container(
                      height: size.height,
                      width: size.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color(0xffeeb311).withOpacity(0.9),
                                Color(0xffeeb311).withOpacity(0.4),
                                Colors.transparent,
                                Colors.transparent,
                                Colors.transparent
                              ])
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height*.17,
                  left: 10,right: 10,
                  child: Slider(onChanged: (double value) {
                    setState(() {
                      val=value;
                    });

                  }, value: val,
                    activeColor: ColorRes.blue,
                    max: 7,
                    min: 0,

                  ),
                ),
                Positioned(
                  bottom: size.height*.135,
                  left: 0,right: 0,
                  child: Text("10:05 min",textAlign:TextAlign.center,style: TextStyle(color: ColorRes.white),)
                ),
                Positioned(
                  bottom: size.height*.05,
                  left: 0,right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          setState(() {
                            pause=true;
                            play=false;
                          });

                        },
                        child: Text(DoctorStringRes.pause, style: TextStyle(fontWeight: FontWeight.w600, color: pause?ColorRes.white:ColorRes.blue, fontSize: 16),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(110, 40),
                          primary: pause?ColorRes.blue:Colors.transparent,
                          alignment: Alignment.center,
                          elevation: 0,
                          side: BorderSide(width: 2.0, color: ColorRes.blue,),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width*.05,),
                      ElevatedButton(
                        onPressed: (){
                          setState(() {
                            pause=false;
                            play=true;
                          });

                        },
                        child: Text(DoctorStringRes.stop, style: TextStyle(fontWeight: FontWeight.w600, color: play?ColorRes.white:ColorRes.blue, fontSize: 16),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(110, 40),
                          primary: play?ColorRes.blue:Colors.transparent,
                          alignment: Alignment.center,
                          elevation: 0,
                          side: BorderSide(width: 2.0, color: ColorRes.blue,),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),),
                    ],
                  ),
                ),
              ],
            )),

    );
  }

}
