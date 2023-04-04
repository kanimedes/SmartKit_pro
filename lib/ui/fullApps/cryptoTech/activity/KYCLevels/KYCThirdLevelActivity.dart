// ignore_for_file: no_logic_in_create_state, non_constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';

import '../TermsConditionActivity.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();

class KYCThirdLevelActivity extends StatelessWidget {
  String dailylimit = "", monthlylimit = "";

  KYCThirdLevelActivity(this.dailylimit, this.monthlylimit, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 30;
    return Scaffold(
      backgroundColor: ColorsRes.bgcolor,
      key: scaffoldKey,
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: DesignConfig.gradient,
            ),
            padding: EdgeInsets.only(top: toppadding),
            child: Card(
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: MyCustomForm(dailylimit, monthlylimit),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(StringsRes.kycapplication,
                    style: TextStyle(color: ColorsRes.white)),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(
                      'assets/images/fullApps/cryptotech/back_button.svg'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  String dailylimit = "", monthlylimit = "";

  MyCustomForm(this.dailylimit, this.monthlylimit, {Key? key})
      : super(key: key);
  @override
  MyCustomFormState createState() {
    return MyCustomFormState(dailylimit, monthlylimit);
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  String dailylimit = "", monthlylimit = "";

  MyCustomFormState(this.dailylimit, this.monthlylimit);

  final _formKey = GlobalKey<FormState>();

  late List<File> documentlist;

  bool isLoading = false, isdialogloading = false;

  String? fname, lname, dob, mobileno, address;

  String? selecteddoctype = "passport";

  @override
  void initState() {
    super.initState();
    documentlist = [];
  }

  Color GetColor(String item) {
    return selecteddoctype == item
        ? ColorsRes.firstgradientcolor
        : ColorsRes.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Text(
            StringsRes.selfindocupload,
            style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                color: ColorsRes.secondgradientcolor,
                fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            StringsRes.kyclevel3info,
            style: Theme.of(context)
                .textTheme
                .caption!
                .merge(TextStyle(color: ColorsRes.black)),
          ),
          SizedBox(
            height: 8,
          ),
          Html(
            data:
                "<ul><li>${StringsRes.dailylimit} - <b>$dailylimit</b>,</li><li>${StringsRes.monthlylimit} - <b>$monthlylimit</b></li><ul>",
            // style: {
            //   "ul": Style(
            //     color: ColorsRes.firstgradientcolor,
            //     fontSize: FontSize.medium,
            //   ),
            // },
          ),
          Divider(
            color: ColorsRes.grey,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info,
                color: ColorsRes.secondgradientcolor,
                size: 16,
              ),
              Flexible(
                  child: Text("\t${StringsRes.uploaddocinfo}",
                      style: Theme.of(context).textTheme.subtitle2!.merge(
                          TextStyle(color: ColorsRes.secondgradientcolor)))),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          RadioListTile(
            dense: true,
            value: "passport",
            groupValue: selecteddoctype,
            secondary: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset(
                    "assets/images/fullApps/cryptotech/passport.png",
                    color: GetColor("passport"))),
            title: Text(
              StringsRes.passport,
              style: TextStyle(color: GetColor("passport")),
            ),
            onChanged: (dynamic val) {
              setState(() {
                selecteddoctype = val;
              });
            },
            activeColor: ColorsRes.firstgradientcolor,
            selected: true,
          ),
          RadioListTile(
            dense: true,
            value: "national card",
            secondary: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset(
                    "assets/images/fullApps/cryptotech/nationalcard.png",
                    color: GetColor("national card"))),
            groupValue: selecteddoctype,
            title: Text(
              StringsRes.nationalcard,
              style: TextStyle(color: GetColor("national card")),
            ),
            onChanged: (dynamic val) {
              setState(() {
                selecteddoctype = val;
              });
            },
            activeColor: ColorsRes.firstgradientcolor,
          ),
          RadioListTile(
            dense: true,
            secondary: SizedBox(
                height: 30,
                width: 30,
                child: Image.asset(
                    "assets/images/fullApps/cryptotech/drivinglicence.png",
                    color: GetColor("driver licence"))),
            value: "driver licence",
            groupValue: selecteddoctype,
            title: Text(
              StringsRes.driverlicence,
              style: TextStyle(color: GetColor("driver licence")),
            ),
            onChanged: (dynamic val) {
              setState(() {
                selecteddoctype = val;
              });
            },
            activeColor: ColorsRes.firstgradientcolor,
          ),
          Divider(
            color: ColorsRes.grey,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            StringsRes.avoiddeleyinfotitle,
            style: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
                color: ColorsRes.secondgradientcolor,
                fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 5,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Icon(Icons.arrow_right, color: ColorsRes.grey),
            Flexible(
                child: Text(
              "\tChosen documents must not be expired.",
              style: TextStyle(color: ColorsRes.black, fontSize: 13),
            ))
          ]),
          SizedBox(height: 5),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Icon(
              Icons.arrow_right,
              color: ColorsRes.grey,
            ),
            Flexible(
                child: Text(
              "\tDocument should be in good condition and clearly visible.",
              style: TextStyle(color: ColorsRes.black, fontSize: 13),
            ))
          ]),
          SizedBox(height: 5),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Icon(Icons.arrow_right, color: ColorsRes.grey),
            Flexible(
                child: Text(
              "\tMake sure that there is no light glare on the card.",
              style: TextStyle(color: ColorsRes.black, fontSize: 13),
            ))
          ]),
          Divider(
            color: ColorsRes.grey,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            StringsRes.documenttoupload,
            style: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
                color: ColorsRes.secondgradientcolor,
                fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 5,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Icon(Icons.arrow_right, color: ColorsRes.grey),
            Flexible(
                child: Text(
              "\tFront of ID Card",
              style: TextStyle(color: ColorsRes.black, fontSize: 13),
            ))
          ]),
          SizedBox(height: 5),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Icon(
              Icons.arrow_right,
              color: ColorsRes.grey,
            ),
            Flexible(
                child: Text(
              "\tBack of the ID Card",
              style: TextStyle(color: ColorsRes.black, fontSize: 13),
            ))
          ]),
          SizedBox(height: 5),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Icon(Icons.arrow_right, color: ColorsRes.grey),
            Flexible(
                child: Text(
              "\tSelfie with Document you choose with a piece of paper showing this info for www.smartkit/AppFeature/FullApp/CryptoTech.ng verification, with todays date",
              style: TextStyle(color: ColorsRes.black, fontSize: 13),
            ))
          ]),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: ColorsRes.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                  if (!isLoading) {
                    FilePickerResult result = await (FilePicker.platform
                        .pickFiles() as FutureOr<FilePickerResult>);
                    File file = File(result.files.single.path!);
                    if (file != null) {
                      documentlist.add(file);
                      setState(() {});
                    }
                  }
                },
                child: Card(
                  color: ColorsRes.orange,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.file_copy_outlined,
                          color: ColorsRes.white,
                        ),
                        Text(
                          StringsRes.selectdocument,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              color: ColorsRes.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: List.generate(documentlist.length, (i) {
              File item = documentlist[i];
              String name = item.path.split("/").last;
              return Padding(
                padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "\t${i + 1}\t",
                        style: TextStyle(
                            backgroundColor: ColorsRes.secondgradientcolor,
                            color: ColorsRes.white),
                      ),
                      Expanded(
                          child: Text(
                        "\t$name",
                        style: Theme.of(context).textTheme.caption,
                      )),
                      GestureDetector(
                          onTap: () {
                            if (!isLoading) {
                              documentlist.remove(item);
                              setState(() {});
                            }
                          },
                          child: Container(
                              padding: EdgeInsets.all(3),
                              margin:
                                  EdgeInsetsDirectional.only(top: 2, bottom: 2),
                              decoration: DesignConfig.BoxDecorationContainer(
                                  ColorsRes.red, 5),
                              child: Icon(
                                Icons.clear,
                                color: ColorsRes.white,
                              )))
                    ]),
              );
            }),
          ),
          SizedBox(
            height: 5,
          ),
          isLoading ? Center(child: CircularProgressIndicator()) : Container(),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () async {
              if (_formKey.currentState!.validate() && !isLoading) {
                if (documentlist.length != 3) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(StringsRes.upload3docs)));
                } else {
                  ConfirmInfoDialog();
                }
              }
            },
            child: Container(
              decoration: DesignConfig.circulargradient_box,
              margin: EdgeInsets.only(top: 10),
              width: double.maxFinite,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                StringsRes.submitdetails,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.white,
                      letterSpacing: 1.65,
                      fontWeight: FontWeight.w700,
                      //fontWeight: FontWeight.w500,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ConfirmInfoDialog() {
    bool? check1 = false,
        check2 = false,
        check3 = false,
        check4 = false,
        iserror = false;

    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0),
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "\t${StringsRes.confirminformation}",
                        style: Theme.of(context).textTheme.headline6!.merge(
                            TextStyle(
                                color: ColorsRes.secondgradientcolor,
                                fontWeight: FontWeight.bold)),
                      )),
                      IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: ColorsRes.appcolor,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                        child: Column(children: [
                      CheckboxListTile(
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("\u2023"),
                            SizedBox(width: 5),
                            Expanded(
                              child: RichText(
                                  text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .merge(TextStyle(
                                              color: ColorsRes.black)),
                                      text: "I Have Read The ",
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: StringsRes.terms_and_condition,
                                        style: TextStyle(
                                            color: ColorsRes.firstgradientcolor,
                                            decoration:
                                                TextDecoration.underline),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TermsConditionActivity(
                                                            StringsRes
                                                                .terms_and_condition)));
                                          }),
                                    TextSpan(text: "\t${StringsRes.Lbl_AND}\t"),
                                    TextSpan(
                                        text: StringsRes.privacy_policy,
                                        style: TextStyle(
                                            color: ColorsRes.firstgradientcolor,
                                            decoration:
                                                TextDecoration.underline),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TermsConditionActivity(
                                                            StringsRes
                                                                .privacy_policy)));
                                          }),
                                  ])),
                            ),
                          ],
                        ),
                        value: check1,
                        onChanged: (val) {
                          setState(() {
                            check1 = val;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("\u2023"),
                            SizedBox(width: 5),
                            Expanded(
                                child: Text(
                              "All The Personal Information I Have Entered Is Correct.",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .merge(TextStyle(color: ColorsRes.black)),
                            )),
                          ],
                        ),
                        value: check2,
                        onChanged: (val) {
                          setState(() {
                            check2 = val;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("\u2023"),
                            SizedBox(width: 5),
                            Expanded(
                                child: Text(
                              "I Certify That, I Am Perticipating In The Coins Purchase Trade In The Capacity Of An Individual (And Beneficial Owner) And Not As An Agent (Or Representative Of A Third Party Corporate Entity.)",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .merge(TextStyle(color: ColorsRes.black)),
                            )),
                          ],
                        ),
                        value: check3,
                        onChanged: (val) {
                          setState(() {
                            check3 = val;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("\u2023"),
                            SizedBox(width: 5),
                            Expanded(
                                child: Text(
                              "I Understand That, I Can Only Make Payments From Accounts Belonging To Only Me And All Accounts Name Must Match My Verified Documents.",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .merge(TextStyle(color: ColorsRes.black)),
                            )),
                          ],
                        ),
                        value: check4,
                        onChanged: (val) {
                          setState(() {
                            check4 = val;
                          });
                        },
                      ),
                    ])),
                  ),
                  iserror!
                      ? Text(
                          "\t\tYour acceptance needed for Process\t\t",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: ColorsRes.red,
                              fontWeight: FontWeight.bold),
                        )
                      : Container(),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        iserror = false;
                      });
                      if (_formKey.currentState!.validate() && !isLoading) {
                        if (documentlist.length != 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(StringsRes.upload3docs)));
                        } else if (check1 == false ||
                            check2 == false ||
                            check3 == false ||
                            check4 == false) {
                          setState(() {
                            iserror = true;
                          });
                        } else {
                          Navigator.of(context).pop();
                          Navigator.pop(context);

                          Constant.GoToMainPage("main", context);
                        }
                      }
                    },
                    child: Container(
                      decoration: DesignConfig.circulargradient_box,
                      margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                      width: double.maxFinite,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        StringsRes.processverification,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .merge(TextStyle(
                              color: ColorsRes.white,
                              letterSpacing: 1.65,
                              fontWeight: FontWeight.w700,
                              //fontWeight: FontWeight.w500,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }
}
