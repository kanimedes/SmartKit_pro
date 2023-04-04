import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/StringsRes.dart';

class ContactUsActivity extends StatefulWidget {
  const ContactUsActivity({Key? key}) : super(key: key);

  @override
  _ContactUsActivityState createState() => _ContactUsActivityState();
}

class _ContactUsActivityState extends State<ContactUsActivity> {
  List<String> subjectList = ["abc", "def", "ghi", "jkl", "mno", "pqr"];
  String? dropDownValue = "abc";
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  Widget showEmailAddress() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        decoration: InputDecoration(
            labelText: StringsRes.emailAddressText,
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

  Widget showComments() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        decoration: InputDecoration(
            labelText: StringsRes.commentsText,
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

  Widget showSelectSubject() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: DropdownButton<String>(
        hint: Text(StringsRes.selectASubjectText,
            style: TextStyle(
              color: ColorsRes.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            )),
        value: dropDownValue,
        iconSize: 24,
        elevation: 16,
        isExpanded: true,
        style: TextStyle(
          color: ColorsRes.textColor,
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropDownValue = newValue;
          });
        },
        items: subjectList.map<DropdownMenuItem<String>>((String value) {
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return navigationPage() as Future<bool>;
      },
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          title: Text(StringsRes.contactUsText,
              style: TextStyle(
                  fontSize: 20,
                  color: ColorsRes.white,
                  fontWeight: FontWeight.normal)),
          centerTitle: true,
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
          color: ColorsRes.backgroundColor,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(StringsRes.getInTouchText,
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.bold)),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(StringsRes.contactUsDescriptionText,
                          style: TextStyle(
                              fontSize: 15,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.normal)),
                    )),
                showEmailAddress(),
                showSelectSubject(),
                showComments(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInActivity(),),);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        right: 20, left: 20, top: 20.0, bottom: 20.0),
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    decoration: DesignConfig.boxDecorationButtonColor(
                        ColorsRes.yellowColor, ColorsRes.yellowColor, 10),
                    child: Text(
                      StringsRes.submitText,
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
