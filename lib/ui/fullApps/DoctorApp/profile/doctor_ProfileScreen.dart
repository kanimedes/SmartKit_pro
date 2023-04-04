// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../doctor_congratesScreen.dart';
import '../helper/ColorRes.dart';
import '../helper/DoctorAnimation.dart';
import '../helper/SlideAnimation.dart';
import '../helper/StringRes.dart';
import '../helper/doctore_DesignConfig.dart';
import '../helper/textFieldShadow.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DoctorProfileScreenState();
  }
}

class DoctorProfileScreenState extends State<DoctorProfileScreen>
    with TickerProviderStateMixin {
  var _dropDownValue;
  final _formKey = GlobalKey<FormState>();
  bool date = false;
  AnimationController? _animationController;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerFName = TextEditingController();
  TextEditingController controllerAdd = TextEditingController();
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

//image camera
  _getFromCamera() async {
    DoctorDesignConfig.image =
        await _picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  final ImagePicker _picker = ImagePicker();
// image gallery
  _getFromGallery() async {
    DoctorDesignConfig.image =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  // show dialog to take image
  void _showPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
                height: 150,
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton.icon(
                            icon: Icon(
                              Icons.photo_library,
                              color: ColorRes.blue,
                            ),
                            label: Text(
                              'Photo Library',
                              style: TextStyle(
                                  color: ColorRes.blue,
                                  fontSize: 18,
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              _getFromGallery();
                              Navigator.of(context).pop();
                            }),
                        TextButton.icon(
                          icon: Icon(
                            Icons.photo_camera,
                            color: ColorRes.blue,
                          ),
                          label: Text(
                            'Camera',
                            style: TextStyle(
                                color: ColorRes.blue,
                                fontSize: 18,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            _getFromCamera();
                            Navigator.of(context).pop();
                          },
                        )
                      ]),
                )));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorRes.blue),
        title: const Text(
          DoctorStringRes.profile,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      bottomNavigationBar: DoctorAnimation(
          delay: 700,
          child: SlideAnimation(
              position: 10,
              itemCount: 20,
              slideDirection: SlideDirection.fromBottom,
              animationController: _animationController,
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width * .06,
                    right: size.width * .06,
                    bottom: size.width * .06),
                child: DoctorDesignConfig.Button(
                    onpress: () {
                      if (_formKey.currentState!.validate()) {
                        {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DoctorCongratsScreen(),
                            ),
                          );
                        }
                      }
                      /* if(controllerAdd.text.isEmpty || controllerEmail.text.isEmpty||textEditingController.text.isEmpty||_dropDownValue.toString().isEmpty) {
                DoctorDesignConfig.setSnackBar(context, "Please fill all data");
              }
              else {*/
                      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoctorCongratsScreen(),),);
                      //}
                    },
                    name: DoctorStringRes.confirm,
                    foreground: ColorRes.blue,
                    TextColor: ColorRes.white),
              ))),
      body: Container(
        height: size.height,
        width: size.width,
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .07,
            right: MediaQuery.of(context).size.width * .07),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                DoctorAnimation(
                    delay: 100,
                    child: DoctorDesignConfig.image == null
                        ? Container(
                            height: size.height * .14,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: ColorRes.white,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black12, width: 1),
                              boxShadow: [
                                new BoxShadow(
                                  color: Color(0x0f000000),
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _showPicker();
                                  },
                                  child: Container(
                                    width: size.width * .135,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Color(0xffe9f0ff),
                                      shape: BoxShape.circle,
                                    ),
                                    child: SvgPicture.asset(
                                      DoctorDesignConfig.getImagePath(
                                          "upload.svg"),
                                      color: ColorRes.blue,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                Text(
                                  "Upload Photo Profile",
                                  style: TextStyle(color: ColorRes.fontColor),
                                )
                              ],
                            ))
                        : Stack(
                            children: [
                              Container(
                                  alignment: Alignment.topCenter,
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          .03),
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor:
                                        ColorRes.white.withOpacity(0.5),
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      child: ClipOval(
                                          child: Image.file(
                                        File(DoctorDesignConfig.image!.path),
                                        width: 135,
                                        height: 135,
                                        fit: BoxFit.fill,
                                      )),
                                    ),
                                  )),
                              Padding(
                                padding: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.height * .1,
                                    left: MediaQuery.of(context).size.width *
                                        .51),
                                child: CircleAvatar(
                                  radius: 13,
                                  child: FloatingActionButton(
                                      onPressed: () {
                                        _showPicker();
                                        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GoRideEditProfileShow(),),);
                                      },
                                      backgroundColor: ColorRes.blue,
                                      mini: true,
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 15,
                                      )),
                                ),
                              ),
                            ],
                          )),
                SizedBox(
                  height: size.height * .02,
                ),
                DoctorAnimation(delay: 100, child: line()),
                SizedBox(
                  height: size.height * .02,
                ),
                DoctorAnimation(
                    delay: 200,
                    child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .05),
                        child: DoctorDesignConfig.name(DoctorStringRes.fName))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                DoctorAnimation(
                    delay: 200, child: enterData("Full Name", controllerFName)),
                SizedBox(
                  height: size.height * .01,
                ),
                DoctorAnimation(
                    delay: 300,
                    child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .05),
                        child: DoctorDesignConfig.name(DoctorStringRes.email))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                DoctorAnimation(delay: 300, child: emailEnter()),
                SizedBox(
                  height: size.height * .01,
                ),
                DoctorAnimation(
                    delay: 400,
                    child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .05),
                        child:
                            DoctorDesignConfig.name(DoctorStringRes.gender))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                DoctorAnimation(delay: 400, child: genderDropDown()),
                SizedBox(
                  height: size.height * .01,
                ),
                DoctorAnimation(
                    delay: 500,
                    child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .05),
                        child: DoctorDesignConfig.name(DoctorStringRes.dob))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                DoctorAnimation(delay: 500, child: dob()),
                SizedBox(
                  height: size.height * .01,
                ),
                DoctorAnimation(
                    delay: 600,
                    child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .05),
                        child:
                            DoctorDesignConfig.name(DoctorStringRes.address))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                DoctorAnimation(
                    delay: 600, child: enterData("Address", controllerAdd)),
              ],
            )),
      ),
    );
  }

  Widget line() {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: Divider(
        height: 1,
        color: Color(0xffacacac),
      ),
    );
  }

  Widget enterData(String hintText, TextEditingController controller) {
    return TextFieldWithBoxShadow(
        errorText: "Enter valid data",
        height: MediaQuery.of(context).size.height * .06,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (val) => val!.isEmpty ? "Enter valid data" : null,
          controller: controller,
          cursorColor: Color(0xffa2a2a2),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorRes.blue, width: 2.0),
              borderRadius: BorderRadius.circular(30.0),
            ),
            errorBorder: InputBorder.none, focusedErrorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 20),
            //isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black12,
            ),
            border: InputBorder.none,
          ),
        ));
  }

  Widget emailEnter() {
    return TextFieldWithBoxShadow(
      errorText: "Enter valid email",
      height: MediaQuery.of(context).size.height * .06,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (val) => val!.isEmpty ? "Enter valid email" : null,
        controller: controllerEmail,
        cursorColor: const Color(0xffa2a2a2),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorRes.blue, width: 2.0),
              borderRadius: BorderRadius.circular(30.0),
            ),
            contentPadding: const EdgeInsets.only(left: 20, top: 17),
            hintText: "Email",
            hintStyle: const TextStyle(
              color: Colors.black12,
            ),
            border: InputBorder.none,
            suffixIcon: Container(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  DoctorDesignConfig.getImagePath("email.svg"),
                  color: Colors.grey,
                ))),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget genderDropDown() {
    return TextFieldWithBoxShadow(
      errorText: "Please select gender",
      height: MediaQuery.of(context).size.height * .06,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
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
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            enabledBorder: InputBorder.none),
        hint: _dropDownValue == null
            ? Text(
                'Gender',
                style: TextStyle(
                  color: Colors.black12,
                ),
              )
            : Text(
                _dropDownValue,
                style: TextStyle(color: Colors.black),
              ),
        iconSize: 0,
        style: TextStyle(color: Colors.black),
        items: ['Male', 'Female'].map(
          (val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(val),
              ),
            );
          },
        ).toList(),
        autovalidateMode: AutovalidateMode.onUserInteraction,
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

  DateTime? _selectedDate;
  TextEditingController textEditingController = TextEditingController();
  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate! : DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.blue,
                onPrimary: Colors.white,
                surface: ColorRes.fontColor,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      setState(() {
        _selectedDate = newSelectedDate;
      });
      textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  Widget dob() {
    return TextFieldWithBoxShadow(
      errorText: "Enter valid date",
      height: MediaQuery.of(context).size.height * .06,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (val) => val!.isEmpty ? "Enter valid date" : null,
        controller: textEditingController,
        cursorColor: const Color(0xffa2a2a2),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: ColorRes.blue, width: 2.0),
              borderRadius: BorderRadius.circular(30.0),
            ),
            focusedErrorBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 20, top: 12),
            hintText: "Date of Birth",
            hintStyle: const TextStyle(
              color: Colors.black12,
            ),
            border: InputBorder.none,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  date = true;
                });
                _selectDate(context);
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  DoctorDesignConfig.getImagePath("calender.svg"),
                  color: Colors.grey,
                ),
              ),
            )),
        keyboardType: TextInputType.datetime,
      ),
    );
  }
}
