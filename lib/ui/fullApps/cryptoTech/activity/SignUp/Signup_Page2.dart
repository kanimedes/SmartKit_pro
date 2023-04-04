//Signup_Page2

// ignore_for_file: no_logic_in_create_state

import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/UIData.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ease_in_widget.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Signup_Page2 extends StatefulWidget {
  String fname, lname, type;

  Signup_Page2(this.fname, this.lname, this.type);

  @override
  State<StatefulWidget> createState() {
    return new Signup_Page2State(fname, lname, type);
  }
}

class Signup_Page2State extends State<Signup_Page2> {
  Color btntextcolor = ColorsRes.firstgradientcolor;

  File? profileimagefile;
  String selectedavatar = '';
  bool isLoading = false;

  String fname, lname, type;

  Signup_Page2State(this.fname, this.lname, this.type);

  List<String> avatarlist = [
    "assets/images/fullApps/cryptotech/avatar/avatar-1.svg",
    "assets/images/fullApps/cryptotech/avatar/avatar-2.svg",
    "assets/images/fullApps/cryptotech/avatar/avatar-3.svg",
    "assets/images/fullApps/cryptotech/avatar/avatar-4.svg",
    "assets/images/fullApps/cryptotech/avatar/avatar-5.svg",
    "assets/images/fullApps/cryptotech/avatar/avatar-6.svg",
    "assets/images/fullApps/cryptotech/avatar/avatar-7.svg",
    "assets/images/fullApps/cryptotech/avatar/avatar-8.svg",
    "assets/images/fullApps/cryptotech/avatar/avatar-9.svg",
    "assets/images/fullApps/cryptotech/avatar/avatar-10.svg",
    "assets/images/fullApps/cryptotech/avatar/avatar-11.svg",
    "assets/images/fullApps/cryptotech/avatar/avatar-12.svg",
  ];

  final _scaffoldprofileKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: ColorsRes.bgcolor,
        shadowColor: Colors.transparent,
      ),
      key: _scaffoldprofileKey,
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            color: ColorsRes.bgcolor,

            padding: EdgeInsets.only(top: toppadding), //,left: 20,right: 20),
            child: Column(
              children: [
                Text(
                  StringsRes.addprofilepic,
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.appcolor, fontWeight: FontWeight.bold)),
                ),
                Text(
                  StringsRes.visualidentity,
                  style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                      color: ColorsRes.txtlightcolor,
                      fontWeight: FontWeight.bold)),
                ),
                GestureDetector(
                  onTap: () async {
                    selectedavatar = '';
                    FilePickerResult result = await (FilePicker.platform
                        .pickFiles() as FutureOr<FilePickerResult>);
                    profileimagefile = File(result.files.single.path!);

                    // getFile(type: FileType.image);
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsetsDirectional.only(bottom: 10, top: 20),
                    child: Stack(
                      children: [
                        ClipOval(
                          child: profileimagefile != null
                              ? selectedavatar.isEmpty
                                  ? Image.file(
                                      profileimagefile!,
                                      width: 110,
                                      height: 110,
                                      fit: BoxFit.cover,
                                    )
                                  : WebsafeSvg.asset(
                                      selectedavatar,
                                      width: 110,
                                      height: 110,
                                      fit: BoxFit.cover,
                                    )
                              : Constant.ImageWidget(
                                  UIData.userimage, 110, 110),
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                              Icons.add_circle,
                              color: ColorsRes.txtlightcolor,
                              size: 35,
                            )),
                      ],
                    ),
                    width: 110,
                    height: 110,
                  ),
                ),
                SizedBox(height: 20),
                isLoading
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: new CircularProgressIndicator(
                          backgroundColor: ColorsRes.white,
                        )),
                      )
                    : Container(),
                EaseInWidget(
                    onTap: () async {
                      //if (type.trim().isNotEmpty)
                      Constant.GoToMainPage("login", context);
                    },
                    child: DesignConfig.EnDisButton(
                        type.trim().isEmpty
                            ? StringsRes.update.toUpperCase()
                            : StringsRes.lblcontinue.toUpperCase(),
                        ColorsRes.white,
                        context)),
                Divider(
                  color: ColorsRes.txtmaincolor,
                  thickness: 2,
                  endIndent: 35,
                  indent: 35,
                  height: 35,
                ),
                Text(
                  StringsRes.selectavatar,
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.textgrey, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: GridView.count(
                    //shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.all(20),
                    childAspectRatio: 2,
                    crossAxisCount: 3, crossAxisSpacing: 5,
                    mainAxisSpacing: 10, //5,
                    children: List.generate(avatarlist.length, (index) {
                      String image = avatarlist[index];
                      return GestureDetector(
                          onTap: () async {
                            File file =
                                await Constant.getImageFileFromAssets(image);
                            selectedavatar = image;

                            setState(() {
                              profileimagefile = file;
                            });
                          },
                          child: WebsafeSvg.asset(image));
                    }),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                        'assets/images/fullApps/cryptotech/back_button.svg')),
              ),
            ),
          )
        ],
      ),
    );
  }
}
