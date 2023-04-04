import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/newsApp/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/newsApp/helper/StringsRes.dart';

class SignupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignupPageState();
  }
}

class SignupPageState extends State<SignupPage> {
  bool acceptterms = false;
  bool isloading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController edtusername = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String gender = StringsRes.lblfemale;

  @override
  void initState() {
    super.initState();
  }

  setSnackbar(String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      OctoImage(
        image: CachedNetworkImageProvider(
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/newsapp%2Flogin.jpg?alt=media&token=adfaa403-8a44-4169-ad7f-e2b2f088c5d5"),
        placeholderBuilder:
            OctoPlaceholder.blurHash("L09[1oE].Ap000ofo#%g00.Ao}%h"),
        errorBuilder: OctoError.icon(color: Colors.black),
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: kToolbarHeight),
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .merge(TextStyle(color: ColorsRes.yellow)),
                              text: "Welcome to ",
                              children: const <TextSpan>[
                                TextSpan(
                                    text: "News,",
                                    style: TextStyle(
                                        color: ColorsRes.yellow,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Text(
                            StringsRes.signupscreenlabel,
                            style: TextStyle(color: ColorsRes.white),
                          ),
                          SizedBox(height: 30),
                          Text(StringsRes.labelsignup,
                              style:
                                  Theme.of(context).textTheme.headline5!.merge(
                                        TextStyle(
                                            color: ColorsRes.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            color: ColorsRes.yellow,
                            height: 2,
                          ),
                          Container(
                            decoration:
                                DesignConfig.boxDecorationContainerBorder(
                                    ColorsRes.white, 10),
                            margin: EdgeInsets.only(top: 20),
                            padding:
                                EdgeInsets.only(left: 10, top: 5, bottom: 5),
                            child: TextFormField(
                              style: TextStyle(color: ColorsRes.white),
                              cursorColor: ColorsRes.black,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: ColorsRes.white,
                                ),
                                hintText: StringsRes.username,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .merge(TextStyle(color: ColorsRes.white)),
                                border: InputBorder.none,
                              ),
                              //validator: (val) => val.trim().isEmpty ? 'Enter Username' : null,
                              controller: edtusername,
                            ),
                          ),
                          Container(
                            decoration:
                                DesignConfig.boxDecorationContainerBorder(
                                    ColorsRes.white, 10),
                            margin: EdgeInsets.only(top: 20),
                            padding:
                                EdgeInsets.only(left: 10, top: 5, bottom: 5),
                            child: TextFormField(
                              style: TextStyle(color: ColorsRes.white),
                              cursorColor: ColorsRes.black,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: ColorsRes.white,
                                ),
                                hintText: StringsRes.emailaddress,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .merge(TextStyle(color: ColorsRes.white)),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              // validator: (val) => Constant.validateEmail(val),
                              controller: edtemail,
                            ),
                          ),
                          Container(
                            decoration:
                                DesignConfig.boxDecorationContainerBorder(
                                    ColorsRes.white, 10),
                            margin: EdgeInsets.only(top: 20, bottom: 15),
                            padding:
                                EdgeInsets.only(left: 10, top: 5, bottom: 5),
                            child: TextFormField(
                              style: TextStyle(color: ColorsRes.white),
                              cursorColor: ColorsRes.black,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: ColorsRes.white,
                                ),
                                hintText: StringsRes.password,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .merge(TextStyle(color: ColorsRes.white)),
                                border: InputBorder.none,
                              ),
                              obscureText: true,
                              //validator: (val) => val.trim().isEmpty ? 'Enter Password' : null,
                              controller: edtpsw,
                            ),
                          ),
                          Row(children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  gender = StringsRes.lblmale;
                                });
                              },
                              child: Row(children: [
                                CircleAvatar(
                                  backgroundColor: gender == StringsRes.lblmale
                                      ? ColorsRes.appcolor
                                      : Colors.transparent,
                                  child: SvgPicture.asset(
                                    "assets/images/fullApps/newsapp/svg/male.svg",
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  StringsRes.lblmale,
                                  style: TextStyle(
                                    color: gender == StringsRes.lblmale
                                        ? ColorsRes.white
                                        : ColorsRes.white.withOpacity(0.5),
                                  ),
                                )
                              ]),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  gender = StringsRes.lblfemale;
                                });
                              },
                              child: Row(children: [
                                CircleAvatar(
                                  backgroundColor:
                                      gender == StringsRes.lblfemale
                                          ? ColorsRes.appcolor
                                          : Colors.transparent,
                                  child: SvgPicture.asset(
                                    "assets/images/fullApps/newsapp/svg/female.svg",
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  StringsRes.lblfemale,
                                  style: TextStyle(
                                    color: gender == StringsRes.lblfemale
                                        ? ColorsRes.white
                                        : ColorsRes.white.withOpacity(0.5),
                                  ),
                                )
                              ]),
                            ),
                          ]),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {},
                                child: GestureDetector(
                                  onTap: () {},
                                  child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          style: Theme.of(context)
                                              .textTheme
                                              .button!
                                              .merge(TextStyle(
                                                  color: ColorsRes.white,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 0.5)),
                                          text: StringsRes.termsconfirm,
                                          children: <TextSpan>[
                                            TextSpan(
                                                text:
                                                    StringsRes.termsncondition,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button!
                                                    .merge(TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        color: ColorsRes.yellow,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        letterSpacing: 0.5))),
                                          ])),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {}
                            },
                            child: Container(
                              width: double.maxFinite,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.symmetric(vertical: 18),
                              child: Text(
                                StringsRes.labelsignup,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .merge(TextStyle(
                                        color: ColorsRes.appcolor,
                                        fontWeight: FontWeight.bold)),
                              ),
                              decoration:
                                  DesignConfig.boxDecorationContainerColor(
                                      ColorsRes.white, 15),
                            ),
                          ),
                          if (isloading)
                            Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new CircularProgressIndicator(),
                            )),
                        ]),
                  ),
                ),
              ),
            ),
            bottomWidget(),
          ],
        ),
      ),
    ]);
  }

  Widget bottomWidget() {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(children: const [
        Expanded(
            child: Divider(
          color: ColorsRes.white,
          endIndent: 10,
        )),
        Text(
          "Or",
          style: TextStyle(color: ColorsRes.white),
        ),
        Expanded(
            child: Divider(
          color: ColorsRes.white,
          indent: 10,
        )),
      ]),
      Text(
        StringsRes.signinwith,
        style: TextStyle(color: ColorsRes.white),
      ),
      Row(children: [
        Expanded(
            child: GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            padding: EdgeInsets.symmetric(vertical: 18),
            decoration:
                DesignConfig.boxDecorationContainerColor(ColorsRes.fbcolor, 15),
            child: Text(
              StringsRes.facebook,
              style: TextStyle(
                  color: ColorsRes.white, fontWeight: FontWeight.bold),
            ),
          ),
        )),
        Expanded(
            child: GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            padding: EdgeInsets.symmetric(vertical: 18),
            decoration: DesignConfig.boxDecorationContainerColor(
                ColorsRes.googlecolor, 15),
            child: Text(
              StringsRes.google,
              style: TextStyle(
                  color: ColorsRes.white, fontWeight: FontWeight.bold),
            ),
          ),
        )),
      ]),
    ]);
  }
}
