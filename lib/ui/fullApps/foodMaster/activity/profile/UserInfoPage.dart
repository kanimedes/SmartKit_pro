import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/profile/ChangePassword.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';

import '../MainHomePage.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController edtemail = TextEditingController();

  TextEditingController edtname = TextEditingController();

  TextEditingController edtphone = TextEditingController();

  bool isloading = false;
  final _formKey = GlobalKey<FormState>();

  Future<bool> _backPress() {
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _backPress,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: ColorsRes.backgroundColor,
          body: Stack(
            children: [
              Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 15,
                      left: 15,
                      right: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Card(
                        shape: DesignConfig.setRoundedBorder(
                            ColorsRes.white, 8, false),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            color: ColorsRes.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ClipOval(
                      child: OctoImage(
                    image: CachedNetworkImageProvider(
                      "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofilepic.jpg?alt=media&token=32c9e3f5-57a0-4caf-b176-bb801fea6181",
                    ),
                    placeholderBuilder: OctoPlaceholder.blurHash(
                      "LgJa[zIU%\$xt9ZxaxuNG~qbb?Hoz",
                    ),
                    errorBuilder: OctoError.icon(color: Colors.black),
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  )),
                ),
                Text(
                  "Ankita",
                  style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                      color: ColorsRes.black, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        top: 30, left: 20, right: 20, bottom: 10),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringsRes.lblemail,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ColorsRes.black,
                                  fontWeight: FontWeight.normal),
                            ),
                            Container(
                              decoration:
                                  DesignConfig.boxDecorationContainerShadow(
                                      ColorsRes.containerShadowColor,
                                      14,
                                      14,
                                      14,
                                      14),
                              margin: EdgeInsets.only(top: 3),
                              padding: EdgeInsets.only(
                                  top: 3, bottom: 3, left: 10, right: 10),
                              alignment: Alignment.center,
                              child: TextFormField(
                                controller: edtemail,
                                enabled: false,
                                style: TextStyle(color: ColorsRes.black),
                                cursorColor: ColorsRes.black,
                                decoration: InputDecoration(
                                  hintText: StringsRes.lblemail,
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color:
                                          ColorsRes.grayColor.withOpacity(0.5)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              StringsRes.lblname,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ColorsRes.black,
                                  fontWeight: FontWeight.normal),
                            ),
                            Container(
                              decoration:
                                  DesignConfig.boxDecorationContainerShadow(
                                      ColorsRes.containerShadowColor,
                                      14,
                                      14,
                                      14,
                                      14),
                              margin: EdgeInsets.only(top: 3),
                              padding: EdgeInsets.only(
                                  top: 3, bottom: 3, left: 10, right: 10),
                              alignment: Alignment.center,
                              child: TextFormField(
                                controller: edtname,
                                style: TextStyle(color: ColorsRes.black),
                                cursorColor: ColorsRes.black,
                                decoration: InputDecoration(
                                  hintText: StringsRes.lblname,
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color:
                                          ColorsRes.grayColor.withOpacity(0.5)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              StringsRes.lblmobileno,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ColorsRes.black,
                                  fontWeight: FontWeight.normal),
                            ),
                            Container(
                              decoration:
                                  DesignConfig.boxDecorationContainerShadow(
                                      ColorsRes.containerShadowColor,
                                      14,
                                      14,
                                      14,
                                      14),
                              margin: EdgeInsets.only(top: 3),
                              padding: EdgeInsets.only(
                                  top: 3, bottom: 3, left: 10, right: 10),
                              alignment: Alignment.center,
                              child: TextFormField(
                                controller: edtphone,
                                style: TextStyle(color: ColorsRes.black),
                                cursorColor: ColorsRes.black,
                                decoration: InputDecoration(
                                  hintText: StringsRes.lblmobileno,
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color:
                                          ColorsRes.grayColor.withOpacity(0.5)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            GestureDetector(
                              onTap: () async {
                                Navigator.of(context).pushAndRemoveUntil(
                                    CupertinoPageRoute(
                                        builder: (context) => MainHomePage(
                                              from: "pagefrom",
                                            )),
                                    (Route<dynamic> route) => false);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  child: IntrinsicHeight(
                                    child: Container(
                                      height: 67.0,
                                      padding:
                                          EdgeInsets.only(top: 13, bottom: 13),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      alignment: Alignment.center,
                                      decoration: DesignConfig.buttonShadowColor(
                                          ColorsRes
                                              .continueShoppingGradient1Color,
                                          37,
                                          ColorsRes
                                              .continueShoppingGradient2Color),
                                      child: Text(
                                        StringsRes.lblupdate,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: ColorsRes.white,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: "Poppins"),
                                      ),
                                    ),
                                  )),
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(CupertinoPageRoute(
                                      builder: (context) => ChangePassword()));
                                },
                                child: Text(
                                  StringsRes.lblchangepassword,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(TextStyle(
                                          decoration:
                                              TextDecoration.underline)),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ]),
            ],
          ),
        ));
  }
}
