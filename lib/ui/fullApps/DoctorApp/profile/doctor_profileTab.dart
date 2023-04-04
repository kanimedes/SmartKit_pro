import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../helper/ColorRes.dart';
import '../helper/SlideAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import '../login/doctor_SignInScreen.dart';
import 'doctor_Apperance.dart';
import 'doctor_InvireFrd.dart';
import 'doctor_NotificationPro.dart';
import 'doctor_ProfileScreen.dart';
import 'doctor_Security.dart';
import 'doctor_help.dart';

class DoctorProfileTab extends StatefulWidget {
  const DoctorProfileTab({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DoctorProfileTabState();
  }
}

class DoctorProfileTabState extends State<DoctorProfileTab>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  AnimationController? rotationController;
  List<ProfileModel> profileList = [
    ProfileModel(
        icon: DoctorDesignConfig.getImagePath("notification_02.svg"),
        name: "Notification"),
    ProfileModel(
        icon: DoctorDesignConfig.getImagePath("security.svg"),
        name: "Security"),
    ProfileModel(
        icon: DoctorDesignConfig.getImagePath("eye.svg"), name: "Appearances"),
    ProfileModel(
        icon: DoctorDesignConfig.getImagePath("help.svg"), name: "Help"),
    ProfileModel(
        icon: DoctorDesignConfig.getImagePath("invite.svg"),
        name: "Invite Friends"),
    ProfileModel(
        icon: DoctorDesignConfig.getImagePath("logout.svg"),
        name: "Logout",
        logout: true),
  ];
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    rotationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    rotationController!.forward(from: 0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    rotationController!.dispose();
    super.dispose();
  }

  //image camera
  _getFromCamera() async {
    DoctorDesignConfig.image =
        await _picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  final ImagePicker _picker = ImagePicker();
// image gallery
  _getFromGallery() async {
    DoctorDesignConfig.image =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  // show dialog to take image
  void _showPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
                height: 150,
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton.icon(
                            icon: Icon(
                              Icons.photo_library,
                              color: ColorRes.blue,
                            ),
                            label: Text(
                              'Photo Library',
                              style: TextStyle(
                                  color: ColorRes.blue,
                                  fontSize: 18,
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              _getFromGallery();
                              Navigator.of(context).pop();
                            }),
                        TextButton.icon(
                          icon: Icon(
                            Icons.photo_camera,
                            color: ColorRes.blue,
                          ),
                          label: Text(
                            'Camera',
                            style: TextStyle(
                                color: ColorRes.blue,
                                fontSize: 18,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            _getFromCamera();
                            Navigator.of(context).pop();
                          },
                        )
                      ]),
                )));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: DoctorDesignConfig.appBar1(
          leadingImage: DoctorDesignConfig.getImagePath("user_active.svg"),
          isIcon: true,
          size: size,
          title: DoctorStringRes.profile,
          textColor: ColorRes.black,
          iconColor: ColorRes.blue,
          icon: Icons.edit,
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const DoctorProfileScreen(),
              ),
            );
          }),
      body: Container(
        margin:
            EdgeInsets.only(left: size.width * .06, right: size.width * .06),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .03),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: ColorRes.white.withOpacity(0.5),
                          child: Container(
                            padding: EdgeInsets.all(2),
                            child: ClipOval(
                                child: DoctorDesignConfig.image != null
                                    ? Image.file(
                                        File(DoctorDesignConfig.image!.path),
                                        width: 135,
                                        height: 135,
                                        fit: BoxFit.fill,
                                      )
                                    : Image.asset(
                                        DoctorDesignConfig.getImageDoctor(
                                            "doctor_a.jpg"),
                                        width: 135,
                                        height: 135,
                                        fit: BoxFit.fill,
                                      )),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .11,
                          left: MediaQuery.of(context).size.width * .2),
                      child: CircleAvatar(
                        radius: 13,
                        child: FloatingActionButton(
                          onPressed: () {
                            _showPicker();
                          },
                          backgroundColor: ColorRes.blue,
                          mini: true,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              DoctorDesignConfig.getImagePath("edit.svg"),
                              color: ColorRes.white,
                            ),
                          ),
                          //Icon(Icons.edit,color: Colors.white,size: 15,)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width * .04,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Text(
                      "Adam Smith",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(
                      height: size.height * .005,
                    ),
                    Text("abc.smith@gmail.com",
                        style: TextStyle(
                            color: ColorRes.fontColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                    SizedBox(
                      height: size.height * .005,
                    ),
                    Text("India",
                        style: TextStyle(
                            color: ColorRes.fontColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)),
                  ],
                )
              ],
            ),
            DoctorDesignConfig.line(),
            ListView.builder(
                itemCount: profileList.length,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SlideAnimation(
                      position: 10,
                      itemCount: 20,
                      slideDirection: SlideDirection.fromBottom,
                      animationController: _animationController,
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * .015,
                          ),
                          ListTile(
                            onTap: () {
                              if (index == 0) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const NotificationPro(),
                                  ),
                                );
                              } else if (index == 1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const DoctorSecurity(),
                                  ),
                                );
                              } else if (index == 2) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const DoctorAppearance(),
                                  ),
                                );
                              } else if (index == 3) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const DoctorHelp(),
                                  ),
                                );
                              } else if (index == 4) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const DoctorInviteFrd(),
                                  ),
                                );
                              } else {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DoctorSignInScreen()),
                                    (Route<dynamic> route) => false);
                              }
                            },
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: size.height * .1,
                              width: size.width * .135,
                              decoration: BoxDecoration(
                                  color: profileList[index].logout == true
                                      ? Color(0xfffce7e7)
                                      : Color(0xffe9f0ff),
                                  borderRadius: BorderRadius.circular(10)),
                              child: RotationTransition(
                                  turns: Tween(begin: 0.0, end: 1.0)
                                      .animate(rotationController!),
                                  child: IconButton(
                                      icon: SvgPicture.asset(
                                        profileList[index].icon!,
                                        color: profileList[index].logout == true
                                            ? Color(0xfff43b51)
                                            : ColorRes.blue,
                                      ),
                                      /*Icon(
                                   profileList[index].icon,size: 20,
                                   color: profileList[index].logout==true?Color(0xfff43b51):Colors.blue,
                                 ),*/
                                      onPressed: () {})),
                            ),
                            title: Text(
                              profileList[index].name!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: profileList[index].logout == true
                                ? SizedBox(
                                    height: 0,
                                    width: 0,
                                  )
                                : Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: ColorRes.blue,
                                    size: 20,
                                  ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: size.height * .015,
                            ),
                            child: Divider(
                              height: 1,
                              color: Color(0xffacacac),
                            ),
                          ),
                        ],
                      ));
                })
/*fce7e7*/
            /*f43b51*/
          ],
        ),
      ),
    );
  }
}

class ProfileModel {
  String? name;
  String? icon;
  bool? logout;
  ProfileModel({this.icon, this.name, this.logout});
}
