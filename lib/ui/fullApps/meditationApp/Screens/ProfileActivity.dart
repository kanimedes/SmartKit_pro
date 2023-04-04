import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/Screens/SubscriptionActivity.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/meditationApp/helper/StringsRes.dart';

class ProfileActivity extends StatefulWidget {
  const ProfileActivity({Key? key}) : super(key: key);

  @override
  ProfileActivityState createState() => ProfileActivityState();
}

class ProfileActivityState extends State<ProfileActivity> {
  bool _obscureTextold = true;
  late TextEditingController emailController, passwordController;

  final Shader linearGradient = LinearGradient(
    colors: const <Color>[
      ColorsRes.gradientColor1,
      ColorsRes.gradientColor2,
      ColorsRes.gradientColor3
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  Widget showEmail() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 12, vertical: 5),
      child: TextFormField(
        controller: emailController,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: ColorsRes.black,
        ),
        decoration: InputDecoration(
            labelText: StringsRes.email,
            prefixIcon: SvgPicture.asset(
                "assets/images/fullApps/meditationApp/mail.svg",
                height: 20.0,
                width: 20.0,
                fit: BoxFit
                    .scaleDown), //Icon(Icons.email_outlined, color: ColorsRes.textBorderColor),
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            hintText: StringsRes.email,
            hintStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.textBorderColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.textBorderColor),
            )),
      ),
    );
  }

  Widget showPassword() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 12, vertical: 5),
      child: TextFormField(
        controller: passwordController,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        obscureText: _obscureTextold,
        decoration: InputDecoration(
            prefixIcon: SvgPicture.asset(
                "assets/images/fullApps/meditationApp/password.svg",
                height: 20.0,
                width: 20.0,
                fit: BoxFit
                    .scaleDown), //Icon(Icons.vpn_key_outlined, color: ColorsRes.textBorderColor),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureTextold = !_obscureTextold;
                });
              },
              child: Icon(
                _obscureTextold ? Icons.visibility : Icons.visibility_off,
                color: ColorsRes.black,
              ),
            ),
            labelText: StringsRes.password,
            labelStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            hintText: StringsRes.password,
            hintStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.textBorderColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.textBorderColor),
            )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: "blacksmith_as@gmail.com");
    passwordController = TextEditingController(text: "123456");
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: ColorsRes.backgroundColor,
          body: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                OctoImage(
                  image: CachedNetworkImageProvider(
                      "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fdr_backimage.png?alt=media&token=ed3313ff-469b-42c1-bee5-b0f327d6db8f"),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    "L34x;+tQ01My_MWBDjayofRQV[tQ",
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.8,
                  errorBuilder: OctoError.icon(color: ColorsRes.black),
                  fit: BoxFit.fill,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 3.9,
                      right: MediaQuery.of(context).size.width / 16),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Container(
                        margin: EdgeInsets.only(left: 20),
                        width: 104.0,
                        height: 104.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          border: Border.all(
                            color: Colors.white,
                            width: 5.0,
                          ),
                        ),
                        child: CircleAvatar(
                            radius: 30,
                            child: ClipOval(
                                child: OctoImage(
                              image: CachedNetworkImageProvider(
                                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/meditation%2Fprofile_pic.jpg?alt=media&token=1895b957-f322-43fe-ad83-e3d0331e2740",
                              ),
                              placeholderBuilder: OctoPlaceholder.blurHash(
                                "LiK-Rf-;?way%2R*NGs:?bM{-;jZ",
                              ),
                              errorBuilder:
                                  OctoError.icon(color: ColorsRes.black),
                              fit: BoxFit.fill,
                            )))),
                  ),
                ),
                //Container(alignment: Alignment.topLeft,margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15.9, left: MediaQuery.of(context).size.width / 16),child: Icon(Icons.arrow_back, color: ColorsRes.white)),
                Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 8.9,
                    ),
                    child: Column(
                      children: const [
                        Text("Blacksmith_as",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: ColorsRes.white,
                              fontFamily: "TrebuchetMS",
                            )),
                        SizedBox(height: 6.0),
                        Text("Blacksmith45@gmail.com",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: ColorsRes.white,
                              fontFamily: "Lato",
                            )),
                        Text("+01 9876 654 333",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: ColorsRes.white,
                              fontFamily: "Lato",
                            )),
                      ],
                    )),

                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2.3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Divider(
                        height: 2,
                        color: ColorsRes.textBorderColor,
                        indent: MediaQuery.of(context).size.height / 18,
                        endIndent: MediaQuery.of(context).size.height / 18,
                      ),
                      SizedBox(height: 15.0),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubscriptionActivity(),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: MediaQuery.of(context).size.height / 14,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 9),
                            decoration: DesignConfig.buttonShadowColor(
                                ColorsRes.gradientColor1,
                                11.0,
                                ColorsRes.gradientColor2,
                                ColorsRes.gradientColor3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                    "assets/images/fullApps/meditationApp/dr.premium.png",
                                    height: 20.0,
                                    width: 20.0,
                                    fit: BoxFit.scaleDown),
                                SizedBox(width: 15.0),
                                Text(
                                  StringsRes.bePremium,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: ColorsRes.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: "Lato",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 9),
                        title: Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/fullApps/meditationApp/dr.Inspiration.svg"),
                            SizedBox(width: 18.0),
                            Text(
                              StringsRes.dailyInspiration,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: ColorsRes.textColor,
                                fontSize: 19,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Lato",
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 9),
                        title: Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/fullApps/meditationApp/dr.account.Info.svg"),
                            SizedBox(width: 18.0),
                            Text(
                              StringsRes.accountInfo,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: ColorsRes.textColor,
                                fontSize: 19,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Lato",
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 9),
                        title: Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/fullApps/meditationApp/dr.changepassword.svg"),
                            SizedBox(width: 18.0),
                            Text(
                              StringsRes.changePassword,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: ColorsRes.textColor,
                                fontSize: 19,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Lato",
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 9),
                        title: Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/fullApps/meditationApp/dr.downloads.svg"),
                            SizedBox(width: 18.0),
                            Text(
                              StringsRes.downloads,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: ColorsRes.textColor,
                                fontSize: 19,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Lato",
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 9),
                        title: Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/fullApps/meditationApp/dr.reminders.svg"),
                            SizedBox(width: 18.0),
                            Text(
                              StringsRes.reminders,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: ColorsRes.textColor,
                                fontSize: 19,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Lato",
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 9),
                        title: Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/fullApps/meditationApp/dr.fav.svg"),
                            SizedBox(width: 18.0),
                            Text(
                              StringsRes.myFavorites,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: ColorsRes.textColor,
                                fontSize: 19,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Lato",
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 9),
                        title: Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/fullApps/meditationApp/dr.share.svg"),
                            SizedBox(width: 18.0),
                            Text(
                              StringsRes.shareWithFriends,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: ColorsRes.textColor,
                                fontSize: 19,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Lato",
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 9),
                        title: Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/fullApps/meditationApp/dr.language.svg"),
                            SizedBox(width: 18.0),
                            Text(
                              StringsRes.changeLanguage,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: ColorsRes.textColor,
                                fontSize: 19,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Lato",
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 9),
                        title: Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/fullApps/meditationApp/dr.help.svg"),
                            SizedBox(width: 18.0),
                            Text(
                              StringsRes.helpSupport,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: ColorsRes.textColor,
                                fontSize: 19,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Lato",
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 9),
                        title: Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/fullApps/meditationApp/dr.aboutus.svg"),
                            SizedBox(width: 18.0),
                            Text(
                              StringsRes.aboutUs,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: ColorsRes.textColor,
                                fontSize: 19,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Lato",
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 9),
                        title: Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/fullApps/meditationApp/dr.logout.svg"),
                            SizedBox(width: 18.0),
                            Text(
                              StringsRes.logout,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: ColorsRes.textColor,
                                fontSize: 19,
                                fontWeight: FontWeight.normal,
                                fontFamily: "Lato",
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 9),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
