import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class ProfileActivity extends StatefulWidget {
  const ProfileActivity({Key? key}) : super(key: key);

  @override
  _ProfileActivityState createState() => _ProfileActivityState();
}

class _ProfileActivityState extends State<ProfileActivity> {
  TextEditingController? name, email, phone;
  @override
  void initState() {
    name = TextEditingController(text: "Black Smith");
    email = TextEditingController(text: "blacksmith@gmail.com");
    phone = TextEditingController(text: "+919989765432");
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  Widget showName() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        controller: name,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        decoration: InputDecoration(
            labelText: StringsRes.userNameText,
            prefixIcon: Icon(Icons.person_rounded, color: ColorsRes.white),
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            )),
      ),
    );
  }

  Widget showMobile() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        controller: phone,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        decoration: InputDecoration(
            labelText: StringsRes.phoneNumberText,
            prefixIcon: Icon(Icons.phone, color: ColorsRes.white),
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            )),
      ),
    );
  }

  Widget showEmail() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        controller: email,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        decoration: InputDecoration(
            labelText: StringsRes.emailAddressText,
            prefixIcon: Icon(Icons.email, color: ColorsRes.white),
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return navigationPage() as Future<bool>;
      },
      child: Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: GestureDetector(
              child: Icon(Icons.arrow_back_ios, color: ColorsRes.white),
              onTap: () {
                Navigator.pop(context);
              }),
          backgroundColor: ColorsRes.backgroundColor,
          shadowColor: Colors.transparent,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          decoration: DesignConfig.boxDecorationContainer(
              ColorsRes.white.withAlpha(50), 20),
          margin: EdgeInsets.only(
              left: 20,
              right: 20.0,
              top: MediaQuery.of(context).size.height / 8,
              bottom: MediaQuery.of(context).size.height / 8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  // image set in circle
                  Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: ColorsRes.backgroundColor,
                        child: ClipOval(
                          child: OctoImage(
                            image: CachedNetworkImageProvider(
                                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/cryptotech%2Fprofilepic.jpg?alt=media&token=2be2819f-6007-4763-a727-cb93f08f460c"),
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              "LNIX]g_3.TIU%NRjRPxukXR*s9of",
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            errorBuilder: OctoError.icon(
                                color: ColorsRes.backgroundColor),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )),
                  //edit image
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .07,
                          left: MediaQuery.of(context).size.width * .48),
                      child: FloatingActionButton(
                        mini: true,
                        backgroundColor: ColorsRes.white,
                        child: Icon(Icons.camera_enhance_outlined,
                            color: ColorsRes.backgroundColor),
                        onPressed: () async {},
                      )),
                ]),
                showName(),
                showMobile(),
                showEmail(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      //Navigator.pop(context);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    decoration: DesignConfig.boxDecorationButtonColor(
                        ColorsRes.yellowColor, ColorsRes.yellowColor, 10),
                    child: Text(
                      StringsRes.logoutProfileText,
                      style: TextStyle(
                        color: ColorsRes.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
