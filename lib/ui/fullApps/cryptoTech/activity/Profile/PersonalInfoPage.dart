import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/SignUp/Signup_Page2.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/UIData.dart';

StreamController<String>? profileupdatestream;

class PersonalInfoPage extends StatefulWidget {
  @override
  PersonalInfoPageState createState() {
    return PersonalInfoPageState();
  }
}

class PersonalInfoPageState extends State<PersonalInfoPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false, isdialogloading = false;
  TextEditingController edtfname = TextEditingController(text: UIData.fname);
  TextEditingController edtlname = TextEditingController(text: UIData.lname);
  TextEditingController edtmobile =
      TextEditingController(text: UIData.usermobileno);
  TextEditingController edtabout = TextEditingController(text: UIData.aboutme);

  TextStyle? textStyle;
  double topheight = 200;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  File? profileimagefile;
  String mobileno = '';

  @override
  void dispose() {
    if (profileupdatestream != null && !profileupdatestream!.isClosed) {
      profileupdatestream!.sink.close();
    }
    super.dispose();
  }

  @override
  void initState() {
    mobileno = UIData.usermobileno;
    profileupdatestream = StreamController<String>();
    profileupdatestream!.stream.listen((response) {
      if (response.trim().isNotEmpty) {
        profileimagefile = null;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    textStyle = TextStyle(
      fontWeight: FontWeight.w500,
      color: ColorsRes.black,
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: ColorsRes.statusbarcolor,
      ),
      key: _scaffoldKey,
      backgroundColor: ColorsRes.white,
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: topheight,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      height: topheight,
                      width: double.maxFinite,
                      padding: const EdgeInsets.only(bottom: 50),
                      child: OctoImage(
                        image: CachedNetworkImageProvider(
                          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/cryptotech%2Fprofileback.jpg?alt=media&token=7f5818ee-c56c-417b-9355-b929e1c2326c",
                        ),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          "LGE0tM0]].I.}a5l\$%R*ofafkBay",
                        ),
                        errorBuilder: OctoError.icon(color: ColorsRes.black),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Signup_Page2(" ", " ", " ")));
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        backgroundColor: ColorsRes.white,
                        radius: 58,
                        child: Stack(children: [
                          CircleAvatar(
                            radius: 52,
                            child: ClipOval(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: profileimagefile != null
                                  ? Image.file(
                                      profileimagefile!,
                                      fit: BoxFit.fill,
                                      width: 95,
                                      height: 95,
                                    )
                                  : Constant.ImageWidget(
                                      UIData.userimage, 95, 95),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, left: 50),
                        child: CircleAvatar(
                            radius: 16,
                            backgroundColor: ColorsRes.appcolor,
                            child: CircleAvatar(
                                radius: 13,
                                backgroundColor: ColorsRes.white,
                                child: Icon(
                                  Icons.edit,
                                  color: ColorsRes.appcolor,
                                  size: 15,
                                ))),
                      )),
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
                                  'assets/images/fullApps/cryptotech/close_button.svg'),
                            )),
                      ))
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                children: [
                  Text(StringsRes.email_address, style: textStyle),
                  Card(
                    shape: DesignConfig.SetRoundedBorder(ColorsRes.appcolor, 8),
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(
                          top: 14, bottom: 14, left: 10, right: 10),
                      child: Text(
                        UIData.useremail,
                        style: TextStyle(
                          color: ColorsRes.firstgradientcolor,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                      visible: mobileno.trim().isNotEmpty,
                      child: SizedBox(height: 12)),
                  Visibility(
                      visible: mobileno.trim().isNotEmpty,
                      child: Text(StringsRes.mobile_number, style: textStyle)),
                  Visibility(
                    visible: mobileno.trim().isNotEmpty,
                    child: Card(
                      shape:
                          DesignConfig.SetRoundedBorder(ColorsRes.appcolor, 8),
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.only(
                            top: 14, bottom: 14, left: 10, right: 10),
                        child: Text(
                          UIData.usermobileno,
                          style: TextStyle(
                            color: ColorsRes.firstgradientcolor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(StringsRes.kycverified, style: textStyle),
                  Card(
                    color: UIData.iskycverified == "0"
                        ? ColorsRes.grey
                        : ColorsRes.white,
                    shape: DesignConfig.SetRoundedBorder(
                        UIData.iskycverified == "0"
                            ? ColorsRes.grey
                            : ColorsRes.appcolor,
                        8),
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(
                          top: 14, bottom: 14, left: 10, right: 10),
                      child: Text(
                        UIData.iskycverified == "0"
                            ? StringsRes.notverified
                            : StringsRes.verified,
                        style: TextStyle(
                          color: UIData.iskycverified == "0"
                              ? ColorsRes.white
                              : ColorsRes.firstgradientcolor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(StringsRes.first_name, style: textStyle),
                  Card(
                    shape: DesignConfig.SetRoundedBorder(ColorsRes.appcolor, 8),
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: edtfname,
                        validator: (val) => val!.trim().isEmpty
                            ? StringsRes.enter_first_name
                            : null,
                        style: TextStyle(color: ColorsRes.firstgradientcolor),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(StringsRes.last_name, style: textStyle),
                  Card(
                    shape: DesignConfig.SetRoundedBorder(ColorsRes.appcolor, 8),
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: edtlname,
                        validator: (val) => val!.trim().isEmpty
                            ? StringsRes.enter_last_name
                            : null,
                        style: TextStyle(color: ColorsRes.firstgradientcolor),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(StringsRes.aboutme, style: textStyle),
                  Card(
                    shape: DesignConfig.SetRoundedBorder(ColorsRes.appcolor, 8),
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        minLines: 3,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        controller: edtabout,
                        validator: (val) =>
                            val!.trim().isEmpty ? StringsRes.aboutme : null,
                        style: TextStyle(color: ColorsRes.firstgradientcolor),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                  Center(
                    child:
                        isLoading ? CircularProgressIndicator() : Container(),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 20, right: 20),
                    child: GestureDetector(
                        onTap: () async {},
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            margin: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                color: ColorsRes.profileshade1,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: ColorsRes.profileshade2,
                                    offset: Offset(
                                      3,
                                      3,
                                    ),
                                  ),
                                  BoxShadow(
                                    blurRadius: 5,
                                    color: ColorsRes.profileshade3,
                                    offset: Offset(
                                      -3,
                                      -3,
                                    ),
                                  ),
                                ],
                                borderRadius: BorderRadius.all(Radius.circular(
                                  12,
                                ))),
                            child: Center(
                                child: Text(StringsRes.update.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .button!
                                        .merge(TextStyle(
                                            color: ColorsRes.white,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 0.5,
                                            fontFamily: 'MyFont')))))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
