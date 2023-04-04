// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/DoctorApp/helper/ColorRes.dart';

import '../../helper/DoctorAnimation.dart';
import '../../helper/StringRes.dart';
import '../../helper/doctore_DesignConfig.dart';
import '../../helper/textFieldShadow.dart';
import '../doctor_HomePageScreen.dart';

class DoctorPaymentScreen extends StatefulWidget {
  const DoctorPaymentScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DoctorPaymentScreenState();
  }
}

class DoctorPaymentScreenState extends State<DoctorPaymentScreen>
    with TickerProviderStateMixin {
  var _dropDownValue;
  AnimationController? rotationController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    rotationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    rotationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorRes.white,
      bottomNavigationBar: DoctorAnimation(
          delay: 400,
          child: Padding(
            padding: EdgeInsets.only(
                left: size.width * .06,
                right: size.width * .06,
                bottom: size.width * .06),
            child: DoctorDesignConfig.Button(
                onpress: () {
                  rotationController!.forward(from: 0.0);
                  if (_formKey.currentState!.validate()) {
                    {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return object of type Dialog
                            return AlertDialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                content: SizedBox(
                                    height: size.height * .45,
                                    width: size.width * .5,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: size.height * .05,
                                        ),
                                        Container(
                                            height: size.height * .07,
                                            width: size.width * .135,
                                            decoration: BoxDecoration(
                                                color: ColorRes.blue,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: RotationTransition(
                                                turns: Tween(
                                                        begin: 0.0, end: 1.0)
                                                    .animate(
                                                        rotationController!),
                                                child: Container(
                                                    padding: EdgeInsets.all(10),
                                                    child: SvgPicture.asset(
                                                      DoctorDesignConfig
                                                          .getImagePath(
                                                              "message.svg"),
                                                      color: ColorRes.white,
                                                    )) /*const Icon(Icons.message,color: ColorRes.white,)*/)),
                                        SizedBox(
                                          height: size.height * .1,
                                        ),
                                        Text(
                                          DoctorStringRes.success,
                                          style: TextStyle(
                                              color: ColorRes.blue,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: size.height * .02,
                                        ),
                                        const Text(
                                          "Your appointment booking successfully completed,Dr. Jenny Wilsom message you soon.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: ColorRes.fontColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: size.height * .04,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            rotationController!.dispose();
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DoctorHomeScreen()),
                                                    (Route<dynamic> route) =>
                                                        false);
                                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>  DoctorHomeScreen(),),);
                                          },
                                          child: Text(
                                            DoctorStringRes.ok,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: ColorRes.white,
                                                fontSize: 16),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(240, 45),
                                            primary: ColorRes.blue,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )));
                          });
                    }
                  }

                  // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>  const DoctorPaymentScreen(),),);
                },
                name: DoctorStringRes.payNow,
                foreground: ColorRes.blue,
                TextColor: ColorRes.white),
          )),
      appBar: DoctorDesignConfig.appBar(
          context: context,
          isIcon: true,
          icon: Icons.add_circle_outline,
          title: DoctorStringRes.payment,
          iconColor: ColorRes.blue,
          textColor: ColorRes.black,
          size: size,
          isSvg: false),
      body: Container(
        alignment: Alignment.topLeft,
        margin:
            EdgeInsets.only(left: size.width * .04, right: size.width * .04),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DoctorAnimation(
                  delay: 100,
                  child: SizedBox(
                    height: size.height * .25,
                    width: size.width * .95,
                    child: Image.asset(
                      DoctorDesignConfig.getImagePath("masterCard.png"),
                      fit: BoxFit.fill,
                    ),
                  )),
              SizedBox(
                height: size.height * .02,
              ),
              DoctorAnimation(
                  delay: 100, child: title(DoctorStringRes.fullName)),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              DoctorAnimation(delay: 100, child: fullNameEnter()),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              DoctorAnimation(
                  delay: 200, child: title(DoctorStringRes.country)),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              DoctorAnimation(delay: 200, child: country()),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              DoctorAnimation(
                  delay: 300,
                  child: SizedBox(
                    height: size.height * .12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              title(DoctorStringRes.expDate),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              expDateEnter()
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              title(DoctorStringRes.cvv),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01,
                              ),
                              cvvEnter()
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
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

  Widget fullNameEnter() {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .01,
          right: MediaQuery.of(context).size.width * .03),
      child: TextFieldWithBoxShadow(
        errorText: "Enter valid data",
        height: MediaQuery.of(context).size.height * .06,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (val) => val!.isEmpty ? "Enter valid data" : null,
          cursorColor: Color(0xffa2a2a2),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
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
          ),
        ),
      ),
    );
  }

  bool check = false;
  String date = "";
  Widget country() {
    return GestureDetector(
      onTap: () {
        setState(() {
          check = true;
          print(check);
        });
        showCountryPicker(
          context: context,
          showPhoneCode:
              true, // optional. Shows phone code before the country name.
          onSelect: (Country country) {
            setState(() {
              _dropDownValue = country.displayName;
              print('Select country: $_dropDownValue');
            });
          },
        );
      },
      child: Container(
          height: MediaQuery.of(context).size.height * .06,
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                color: check ? ColorRes.blue : Colors.black12,
                width: check ? 2 : 1),
            boxShadow: [
              new BoxShadow(
                color: Color(0x0f000000),
                blurRadius: 10.0,
              ),
            ],
          ),
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .01,
              right: MediaQuery.of(context).size.width * .03),
          child: ListTile(
            /*OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(30.0),
            ),*/
            dense: true,
            title: Text(
              _dropDownValue ?? "Country",
              style: TextStyle(
                color: _dropDownValue != null ? ColorRes.black : Colors.black12,
              ),
            ),
            trailing: Icon(
              Icons.arrow_drop_down,
              size: 30,
            ),
          )),
    );
  }

  Widget expDateEnter() {
    return Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .01,
            right: MediaQuery.of(context).size.width * .03),
        child: TextFieldWithBoxShadow(
            errorText: "Enter date",
            height: MediaQuery.of(context).size.height * .06,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value!.isEmpty ? "Enter date" : null,
              cursorColor: Color(0xffa2a2a2),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: ColorRes.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                contentPadding: EdgeInsets.only(left: 20),
                // isDense: true,
                hintText: DoctorStringRes.expDate,
                hintStyle: TextStyle(
                  color: Colors.black12,
                ),
                border: InputBorder.none,
              ),
            )));
  }

  Widget cvvEnter() {
    return Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .01,
            right: MediaQuery.of(context).size.width * .03),
        child: TextFieldWithBoxShadow(
            errorText: "Enter CVV",
            height: MediaQuery.of(context).size.height * .06,
            child: TextFormField(
              cursorColor: Color(0xffa2a2a2),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) => val!.isEmpty ? "Enter CVV" : null,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: ColorRes.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                contentPadding: EdgeInsets.only(left: 20),
                // isDense: true,
                hintText: DoctorStringRes.cvv,
                hintStyle: TextStyle(
                  color: Colors.black12,
                ),
                border: InputBorder.none,
              ),
            )));
  }
}
