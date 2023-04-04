import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/DoctorApp/helper/ColorRes.dart';

import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';

class DoctorContactUs extends StatefulWidget {
  const DoctorContactUs({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DoctorContactUsState();
  }
}

class DoctorContactUsState extends State<DoctorContactUs> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      appBar: DoctorDesignConfig.appBar(
          context: context,
          isIcon: false,
          title: DoctorStringRes.contactUs,
          iconColor: ColorRes.blue,
          textColor: ColorRes.black),
      body: Column(children: [
        SizedBox(
          height: size.height * .02,
        ),
        name(DoctorStringRes.fName),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        enterData("Full Name"),
        SizedBox(
          height: size.height * .02,
        ),
        name(DoctorStringRes.email),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        emailEnter("Email"),
        SizedBox(
          height: size.height * .02,
        ),
        Container(
          margin: EdgeInsets.only(right: size.width * .08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [name("Message"), Text("Max 250 words")],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        messageEnter(size),
        SizedBox(
          height: size.height * .03,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Wrap(
            children: const <Widget>[
              Text(
                DoctorStringRes.sendMes,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorRes.white,
                    fontSize: 16),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.send,
                color: Colors.white,
                size: 20.0,
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(330, 50),
            primary: ColorRes.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ]),
    );
  }

  Widget messageEnter(dynamic size) {
    return Container(
        height: MediaQuery.of(context).size.height * .15,
        alignment: Alignment.topLeft,
        margin:
            EdgeInsets.only(right: size.width * .08, left: size.width * .06),
        decoration: BoxDecoration(
          color: ColorRes.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12, width: 1),
          boxShadow: [
            new BoxShadow(
              color: Color(0x0f000000),
              blurRadius: 10.0,
            ),
          ],
        ),
        //margin:EdgeInsets.only(left: MediaQuery.of(context).size.width*.01, right: MediaQuery.of(context).size.width*.03),
        child: TextFormField(
          maxLines: 6,
          onTap: () {},
          cursorColor: Color(0xffa2a2a2),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.only(left: 20, top: 15),
            // isDense: true,
            hintText: "Message",
            hintStyle: TextStyle(
              color: Colors.black12,
            ),
            border: InputBorder.none,
          ),
        ));
  }

  Widget name(String name) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .09),
      child: RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.black),
              text: name,
              children: const [
            TextSpan(text: '*', style: TextStyle(color: Colors.red))
          ])),
    );
  }

  Widget enterData(String hintText) {
    return Container(
        height: MediaQuery.of(context).size.height * .06,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: ColorRes.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black12, width: 1),
          boxShadow: [
            new BoxShadow(
              color: Color(0x0f000000),
              blurRadius: 10.0,
            ),
          ],
        ),
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .07,
            right: MediaQuery.of(context).size.width * .07),
        child: TextFormField(
          cursorColor: Color(0xffa2a2a2),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20, top: 15),
            isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black12,
            ),
            border: InputBorder.none,
          ),
        ));
  }

  Widget emailEnter(String hintText) {
    return Container(
        height: MediaQuery.of(context).size.height * .06,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: ColorRes.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black12, width: 1),
          boxShadow: [
            new BoxShadow(
              color: Color(0x0f000000),
              blurRadius: 10.0,
            ),
          ],
        ),
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .07,
            right: MediaQuery.of(context).size.width * .07),
        child: TextFormField(
          cursorColor: Color(0xffa2a2a2),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20, top: 15),
            isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black12,
            ),
            border: InputBorder.none,
            suffixIcon: Icon(Icons.mail),
          ),
        ));
  }
}
