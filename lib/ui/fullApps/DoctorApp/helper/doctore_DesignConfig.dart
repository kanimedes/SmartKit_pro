import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'ColorRes.dart';
import 'DoctorAnimation.dart';

class DoctorDesignConfig {
  static line() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Divider(
        height: 1,
        color: Color(0xffacacac),
      ),
    );
  }

  static String getImagePath(String imageName) {
    return "assets/images/fullApps/doctorapp/$imageName";
  }

  static String getImagePathLogo(String imageName) {
    return "assets/images/fullApps/doctorapp/logo/$imageName";
  }

  static String getImageDoctor(String imageName) {
    return "assets/images/fullApps/doctorapp/doctor_images/$imageName";
  }

  static Button(
      {required VoidCallback onpress,
      required String name,
      Color? background,
      required Color foreground,
      required Color TextColor}) {
    return ElevatedButton(
      onPressed: onpress,
      child: Text(
        name,
        style: TextStyle(
            fontWeight: FontWeight.w600, color: TextColor, fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(330, 50),
        primary: foreground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  static appBar(
      {Color? iconColor,
      String? title,
      Color? textColor,
      dynamic size,
      IconData? icon,
      VoidCallback? onPress,
      required bool isIcon,
      required BuildContext context,
      bool? isSvg}) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: 65,
      /* leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
              height: size.height*.05,
              width: size.width*.05,
              child: SvgPicture.asset(DoctorDesignConfig.getImagePath("back.svg"),color: ColorRes.blue,)),),*/
      iconTheme: IconThemeData(color: iconColor),
      title: Text(
        title!,
        style: TextStyle(color: textColor),
      ),
      actions: [
        isIcon
            ? Container(
                margin: EdgeInsets.only(right: size.width * .045),
                width: size.width * .135,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Card(
                    color: Color(0xffe9f0ff),
                    margin: EdgeInsets.all(9),
                    child: IconButton(
                        icon: isSvg ?? false
                            ? SvgPicture.asset(
                                DoctorDesignConfig.getImagePath("filter.svg"),
                                color: ColorRes.blue,
                              )
                            : Icon(
                                icon,
                                size: 20,
                                color: ColorRes.blue,
                              ),
                        onPressed: onPress)),
              )
            : Container(),
      ],
    );
  }

  static appBar1(
      {Color? iconColor,
      String? title,
      Color? textColor,
      dynamic size,
      IconData? icon,
      VoidCallback? onPress,
      required bool isIcon,
      required String leadingImage}) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: 65,
      leading: Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Container(
            width: size.width * .13,
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: ColorRes.blue, borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(
              leadingImage,
              color: ColorRes.white,
            )

            /*Icon(
                    Icons.add_moderator,size: 20,
                    color: Colors.white,
                  ),*/

            ),
      ),
      title: Text(
        title!,
        style: TextStyle(color: textColor),
      ),
      actions: [
        isIcon
            ? Container(
                margin: EdgeInsets.only(right: size.width * .045),
                width: size.width * .135,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Card(
                    color: Color(0xffe9f0ff),
                    margin: EdgeInsets.all(9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        icon: Icon(
                          icon,
                          size: 20,
                          color: ColorRes.blue,
                        ),
                        onPressed: onPress)),
              )
            : Container(),
      ],
    );
  }

  static name(String? name) {
    return RichText(
        text: TextSpan(
            style: const TextStyle(color: Colors.black),
            text: name,
            children: const [
          TextSpan(text: '*', style: TextStyle(color: Colors.red))
        ]));
  }

  static setSnackBar(BuildContext context, String msg) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg,
            textAlign: TextAlign.start,
            style: const TextStyle(
                color: ColorRes.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0)),
        behavior: SnackBarBehavior.fixed,
        duration: const Duration(seconds: 2),
        backgroundColor: ColorRes.blue));
  }

  static String validateEmail(String? value) {
    if (value == null || value.isEmpty /*|| !regex.hasMatch(value)*/) {
      return 'Enter a valid email address';
    } else {
      return "";
    }
  }

  static XFile? image;

  static appName() {
    return RichText(
        text: TextSpan(
            style: TextStyle(color: ColorRes.black),
            text: "DR. ",
            children: const [
          TextSpan(text: "Live", style: TextStyle(color: ColorRes.blue)),
        ]));
  }

  static designCard({dynamic size, AnimationController? rotationController}) {
    return DoctorAnimation(
        delay: 200,
        child: Container(
            height: size.height * .15,
            padding: EdgeInsets.only(top: size.height * .015),
            margin: EdgeInsets.only(top: size.height * .03),
            decoration: BoxDecoration(
                border: Border.all(
                  color: ColorRes.blue,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0)
                            .animate(rotationController!),
                        child: Card(
                            color: Color(0xffe9f0ff),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                DoctorDesignConfig.getImagePath("invite.svg"),
                                color: ColorRes.blue,
                              ),
                              /*Icon(
                                  Icons.supervisor_account,size: 20,
                                  color: Colors.blue,
                                ),*/
                            ))),
                    SizedBox(
                      height: size.height * .005,
                    ),
                    Text(
                      "5000+",
                      style: TextStyle(
                          color: ColorRes.blue, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: size.height * .005,
                    ),
                    Text(
                      "Patients",
                      style: TextStyle(
                          color: ColorRes.black, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Column(
                  children: [
                    RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0)
                            .animate(rotationController),
                        child: Card(
                            color: Color(0xffe9f0ff),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            /*user_active.svg*/
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                DoctorDesignConfig.getImagePath(
                                    "user_active.svg"),
                                color: ColorRes.blue,
                              ),
                            ))),
                    SizedBox(
                      height: size.height * .005,
                    ),
                    Text(
                      "15+",
                      style: TextStyle(
                          color: ColorRes.blue, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: size.height * .005,
                    ),
                    Text(
                      "Years experiences",
                      style: TextStyle(
                          color: ColorRes.black, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Column(
                  children: [
                    RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0)
                            .animate(rotationController),
                        child: Card(
                            color: Color(0xffe9f0ff),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            /*message.svg*/
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                DoctorDesignConfig.getImagePath("message.svg"),
                                color: ColorRes.blue,
                              ),
                            ))),
                    SizedBox(
                      height: size.height * .005,
                    ),
                    Text(
                      "3800+",
                      style: TextStyle(
                          color: ColorRes.blue, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: size.height * .005,
                    ),
                    Text(
                      "Reviews",
                      style: TextStyle(
                          color: ColorRes.black, fontWeight: FontWeight.normal),
                    )
                  ],
                )
              ],
            )));
  }
}
