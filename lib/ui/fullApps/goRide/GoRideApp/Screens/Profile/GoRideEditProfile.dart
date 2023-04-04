import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRIdeConstant.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideColor.dart';
import 'package:smartkit_pro/ui/fullApps/goRide/GoRideApp/Helper/GoRideStringRes.dart';

import '../Widget/AppBar.dart';
import 'GoRideEditProfileShowData.dart';

class GoRideEditProfile extends StatefulWidget {
  const GoRideEditProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return GoRideEditProfileState();
  }
}

class GoRideEditProfileState extends State<GoRideEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GoRideColors.yellow,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * .15,
            ),
            child: PreferredSizeAppBar(
              title: GoRideStringRes.editProfile,
            )),
        body: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: 40),
            decoration: GoRideConstant.boxDecorationContainer(
                GoRideColors.white, false),
            child: Column(children: [
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .1,
                  ),
                  child: Text(
                    GoRideStringRes.FullName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xffababab),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )),
              fullNameEnter(),
              SizedBox(
                height: 25,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .1),
                  child: Text(
                    GoRideStringRes.EmailID,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xffababab),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )),
              emailIdEnter(),
              SizedBox(
                height: 25,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .1),
                  child: Text(
                    GoRideStringRes.PhoneNumber,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xffababab),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )),
              phoneNoEnter(),
              SizedBox(
                height: 25,
              ),
              gender(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          GoRideEditProfileShow(),
                    ),
                  );
                },
                child: Text(
                  GoRideStringRes.SaveProfile,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: GoRideColors.black,
                      fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(310, 50),
                  primary: GoRideColors.yellow,
                ),
              )
            ])));
  }

  Widget fullNameEnter() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .1,
        right: MediaQuery.of(context).size.width * .1,
      ),
      child: TextFormField(
          cursorColor: Color(0xffa2a2a2),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: "Divy M. Jani",
            hintStyle: TextStyle(
                color: GoRideColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffa2a2a2)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffa2a2a2)),
            ),
          )),
    );
  }

  Widget emailIdEnter() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .1,
        right: MediaQuery.of(context).size.width * .1,
      ),
      child: TextFormField(
          cursorColor: Color(0xffa2a2a2),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: "abcd2021@gmail.com",
            hintStyle: TextStyle(
                color: GoRideColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffa2a2a2)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffa2a2a2)),
            ),
          )),
    );
  }

  Widget phoneNoEnter() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * .1,
        right: MediaQuery.of(context).size.width * .1,
      ),
      child: TextFormField(
          cursorColor: Color(0xffa2a2a2),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: "0123456789",
            hintStyle: TextStyle(
                color: GoRideColors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffa2a2a2)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffa2a2a2)),
            ),
          )),
    );
  }

  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;
  Widget gender() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * .08),
          child: Radio(
            value: 1,
            groupValue: id,
            activeColor: GoRideColors.yellow,
            onChanged: (val) {
              setState(() {
                radioButtonItem = 'ONE';
                id = 1;
              });
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 40),
          child: Text(
            'Male',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Radio(
          value: 2,
          groupValue: id,
          activeColor: GoRideColors.yellow,
          onChanged: (val) {
            setState(() {
              radioButtonItem = 'TWO';
              id = 2;
            });
          },
        ),
        Container(
            padding: EdgeInsets.only(right: 40),
            child: Text(
              'Female',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
