import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/Screens/NewsLetterActivity.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/GlassBoxCurve.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/StringsRes.dart';

class SignUpActivity extends StatefulWidget {
  const SignUpActivity({Key? key}) : super(key: key);

  @override
  SignUpActivityState createState() => SignUpActivityState();
}

class SignUpActivityState extends State<SignUpActivity> {
  bool descTextShowFlag = false;
  List<String> countryList = [
    "India",
    "USA",
    "UK",
    "Canada",
    "America",
    "Dubai",
    "Seychelles"
  ];
  String? dropDownValue = "India";
  DateTime currentDate = DateTime.now();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget showUsername() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
      decoration: DesignConfig.boxDecorationButtonColor(
          Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.8), 50),
      padding: const EdgeInsets.only(left: 20.0),
      child: TextFormField(
        style: TextStyle(color: ColorsRes.black),
        cursorColor: ColorsRes.black,
        decoration: InputDecoration(
          hintText: StringsRes.userNameText,
          hintStyle: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: ColorsRes.grayColor)),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.name,
      ),
    );
  }

  Widget showPassword() {
    return Container(
      margin: EdgeInsets.only(
        top: 15.0,
        left: 30.0,
        right: 30.0,
      ),
      decoration: DesignConfig.boxDecorationButtonColor(
          Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.8), 50),
      padding: const EdgeInsets.only(left: 20.0),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(color: ColorsRes.black),
        cursorColor: ColorsRes.black,
        decoration: InputDecoration(
          hintText: StringsRes.passwordText,
          hintStyle: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: ColorsRes.grayColor)),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget showEmail() {
    return Container(
      margin: EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
      decoration: DesignConfig.boxDecorationButtonColor(
          Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.8), 50),
      padding: const EdgeInsets.only(left: 20.0),
      child: TextFormField(
        style: TextStyle(color: ColorsRes.black),
        cursorColor: ColorsRes.black,
        decoration: InputDecoration(
          hintText: StringsRes.emailText,
          hintStyle: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: ColorsRes.grayColor)),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget showSelectCountry() {
    return Container(
      margin: EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
      decoration: DesignConfig.boxDecorationButtonColor(
          Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.8), 50),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: DropdownButton<String>(
        underline: Container(color: Colors.transparent, height: 2.0),
        dropdownColor: ColorsRes.white,
        hint: Text(StringsRes.countryText,
            style: TextStyle(
              color: ColorsRes.grayColor,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            )),
        value: dropDownValue,
        iconSize: 24,
        elevation: 16,
        iconDisabledColor: ColorsRes.grayColor,
        iconEnabledColor: ColorsRes.grayColor,
        isExpanded: true,
        style: TextStyle(
          color: ColorsRes.grayColor,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropDownValue = newValue;
          });
        },
        items: countryList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              textAlign: TextAlign.right,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget showBirthday() {
    return GestureDetector(
      onTap: () {
        selectDate(context);
      },
      child: Container(
        margin: EdgeInsets.only(top: 15.0, left: 30.0, right: 30.0),
        decoration: DesignConfig.boxDecorationButtonColor(
            Colors.white.withOpacity(0.8), Colors.white.withOpacity(0.8), 50),
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 12.0, bottom: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(StringsRes.birthdayText,
                style: TextStyle(
                    color: ColorsRes.grayColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 18)),
            Icon(Icons.arrow_drop_down, color: ColorsRes.grayColor),
          ],
        ),
      ),
    );
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
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: OctoImage(
                      image: CachedNetworkImageProvider(
                          'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fimage_b.jpg?alt=media&token=2279a2b7-205e-4543-8260-b379377c5ba4'),
                      placeholderBuilder: OctoPlaceholder.blurHash(
                        'LA7{HstRnNyEK-.SkDkWMJXT%zWB',
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      errorBuilder:
                          OctoError.icon(color: ColorsRes.bottomColor),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3.7),
                height: MediaQuery.of(context).size.height,
                child: GlassBoxCurve(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Text(
                            StringsRes.signUpText,
                            style: TextStyle(
                                fontSize: 35,
                                color: ColorsRes.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        showUsername(),
                        showPassword(),
                        showEmail(),
                        showSelectCountry(),
                        showBirthday(),
                        Container(
                          margin: EdgeInsets.only(
                              left: 30.0, top: 20.0, right: 30.0),
                          child: Row(children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    descTextShowFlag = !descTextShowFlag;
                                  });
                                },
                                child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    decoration:
                                        DesignConfig.boxDecorationButtonColor(
                                            Colors.white.withOpacity(0.8),
                                            Colors.white.withOpacity(0.8),
                                            10),
                                    child: Icon(Icons.done,
                                        color: descTextShowFlag
                                            ? ColorsRes.grayColor
                                            : Colors.transparent))),
                            SizedBox(width: 10.0),
                            Text(
                              StringsRes.iAgreeToAllTermsText,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorsRes.white,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ]),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsLetterActivity(),
                              ),
                            );
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration:
                                    DesignConfig.boxDecorationButtonColor(
                                        ColorsRes.blueColor,
                                        ColorsRes.blueColor,
                                        25),
                                alignment: AlignmentDirectional.center,
                                margin: EdgeInsets.only(
                                    left: 30.0,
                                    top:
                                        MediaQuery.of(context).size.height / 40,
                                    right: 30.0,
                                    bottom: MediaQuery.of(context).size.height /
                                        35),
                                padding:
                                    EdgeInsets.only(top: 15.0, bottom: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      StringsRes.signUpText,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorsRes.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.arrow_forward,
                                        color: ColorsRes.white),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
