// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helper/ColorRes.dart';
import '../../helper/DoctorAnimation.dart';
import '../../helper/SlideAnimation.dart';
import '../../helper/StringRes.dart';
import '../../helper/doctore_DesignConfig.dart';
import '../../helper/textFieldShadow.dart';
import 'doctor_PaymentScreen.dart';

class DoctorPatientDetailScreen extends StatefulWidget {
  const DoctorPatientDetailScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DoctorPatientDetailScreenState();
  }
}

class DoctorPatientDetailScreenState extends State<DoctorPatientDetailScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  TextEditingController controllerFName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerProb = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _dropDownValue;
  List<String> ageList = ["10+", "20+", "30+", "40+", "50+"];
  AnimationController? animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    controllerFName.dispose();
    controllerPhone.dispose();
    controllerProb.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: DoctorAnimation(
          delay: 600,
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * .06,
                right: size.width * .06,
                bottom: size.width * .06),
            child: DoctorDesignConfig.Button(
                onpress: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            DoctorPaymentScreen(),
                      ),
                    );
                  }
                },
                name: DoctorStringRes.next,
                foreground: ColorRes.blue,
                TextColor: ColorRes.white),
          )),
      appBar: DoctorDesignConfig.appBar(
          context: context,
          isIcon: false,
          size: size,
          title: DoctorStringRes.patientDetail,
          textColor: ColorRes.black,
          iconColor: ColorRes.blue,
          isSvg: false),
      body: Container(
        alignment: Alignment.topLeft,
        margin:
            EdgeInsets.only(left: size.width * .07, right: size.width * .07),
        child: Form(
          key: _formKey,
          child: ListView(
            /*mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,*/
            children: [
              SizedBox(
                height: size.height * .02,
              ),
              DoctorAnimation(
                  delay: 100, child: title(DoctorStringRes.fullName)),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              DoctorAnimation(delay: 100, child: fullNameEnter()),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              DoctorAnimation(
                  delay: 200, child: title("Select Your Age Range")),
              DoctorAnimation(
                  delay: 200,
                  child: SlideAnimation(
                      position: 10,
                      itemCount: 20,
                      slideDirection: SlideDirection.fromRight,
                      animationController: animationController,
                      child: SizedBox(
                          height: size.height * .09,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: ageList.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(
                                  top: 18, right: 18, bottom: 18),
                              itemBuilder: (_, index) => Container(
                                  margin: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          .02),
                                  child: OutlinedButton(
                                    child: Text(
                                      ageList[index],
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: selectedIndex == index
                                              ? ColorRes.white
                                              : ColorRes.blue),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      alignment: Alignment.center,
                                      backgroundColor: selectedIndex == index
                                          ? ColorRes.blue
                                          : ColorRes.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      side: BorderSide(
                                          color: ColorRes.blue, width: 1),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                  )))))),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              DoctorAnimation(delay: 300, child: title("Phone Number")),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              DoctorAnimation(delay: 300, child: numberEnter()),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              DoctorAnimation(delay: 400, child: title("Gender")),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              DoctorAnimation(delay: 400, child: genderDropDown()),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              DoctorAnimation(delay: 500, child: title("Write Your Problem")),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              DoctorAnimation(delay: 500, child: problemEnter())
            ],
          ),
        ),
      ),
    );
  }

  Widget fullNameEnter() {
    return TextFieldWithBoxShadow(
      child: TextFormField(
          controller: controllerFName,
          cursorColor: Color(0xffa2a2a2),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          validator: (val) => val!.isEmpty ? "Enter your name" : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorRes.blue, width: 2.0),
              borderRadius: BorderRadius.circular(30.0),
            ),
            contentPadding: EdgeInsets.only(left: 20),
            // isDense: true,
            hintText: "Full Name",
            hintStyle: TextStyle(
              color: Colors.black12,
            ),
            border: InputBorder.none,
          )),
      height: MediaQuery.of(context).size.height * .06,
      errorText: "enter valid name",
    );
  }

  Widget numberEnter() {
    return TextFieldWithBoxShadow(
      child: TextFormField(
        controller: controllerPhone,
        cursorColor: Color(0xffa2a2a2),
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        validator: (val) => val!.isEmpty ? "Enter phone number" : null,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorRes.blue, width: 2.0),
            borderRadius: BorderRadius.circular(30.0),
          ),
          suffixIcon: Container(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                DoctorDesignConfig.getImagePath("call_02.svg"),
                color: Colors.grey,
              )),
          contentPadding: EdgeInsets.only(left: 20, top: 15),
          hintText: "Phone Number",
          hintStyle: TextStyle(
            color: Colors.black12,
          ),
          border: InputBorder.none,
        ),
      ),
      height: MediaQuery.of(context).size.height * .06,
      errorText: "Enter phone number",
    );
  }

  Widget title(String title) {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * .03),
      child: RichText(
          text: TextSpan(
              style: TextStyle(
                  color: ColorRes.fontColor, fontWeight: FontWeight.bold),
              text: title,
              children: const [
            TextSpan(text: '*', style: TextStyle(color: Colors.red))
          ])),
    );
  }

  Widget genderDropDown() {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0f000000),
            blurRadius: 20.0,
          ),
        ],
      ),
      // margin:EdgeInsets.only(left: MediaQuery.of(context).size.width*.07, right: MediaQuery.of(context).size.width*.07),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorRes.white,
          // isDense: true,
          suffixIcon: Container(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                DoctorDesignConfig.getImagePath("gender.svg"),
                color: Colors.grey,
              )),
          contentPadding: EdgeInsets.only(right: 15, top: 12, left: 20),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorRes.blue, width: 2.0),
            borderRadius: BorderRadius.circular(30.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: new BorderSide(
              color: Colors.black12,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: new BorderSide(
              color: Colors.black12,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: new BorderSide(
              color: Colors.black12,
              width: 1,
            ),
          ),
        ),
        hint: _dropDownValue == null
            ? Text(
                'Gender',
                style: TextStyle(
                  color: Colors.black12,
                ),
              )
            : Text(
                _dropDownValue,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
        alignment: Alignment.center,
        iconSize: 0,
        style: TextStyle(color: Colors.black),
        items: ['Male', 'Female'].map(
          (val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  val,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ),
            );
          },
        ).toList(),
        validator: (val) => val == null ? "Please select gender" : null,
        onChanged: (val) {
          setState(
            () {
              _dropDownValue = val.toString();
            },
          );
        },
      ),
    );
  }

  Widget problemEnter() {
    return TextFieldWithBoxShadow(
      child: TextFormField(
        controller: controllerProb,
        maxLines: 4,
        cursorColor: Color(0xffa2a2a2),
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        validator: (val) => val!.isEmpty ? "Enter your problem" : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorRes.blue, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: EdgeInsets.only(left: 20, top: 15),
          // isDense: true,
          hintText: "Tell doctor about your problem",
          hintStyle: TextStyle(
            color: Colors.black12,
          ),
          border: InputBorder.none,
        ),
      ),
      height: MediaQuery.of(context).size.height * .12,
      errorText: "Enter your problem",
      borderRadius: 10,
    );
  }
}
