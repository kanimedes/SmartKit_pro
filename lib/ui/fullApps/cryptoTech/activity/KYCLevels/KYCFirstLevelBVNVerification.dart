// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/KYCLevels/KYCContactVerificationActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();

class KYCFirstLevelBVNVerification extends StatelessWidget {
  String fname, lname, dob, mobileno, address;

  KYCFirstLevelBVNVerification(
      this.fname, this.lname, this.dob, this.mobileno, this.address,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.bgcolor,
      key: scaffoldKey,
      appBar: DesignConfig.SetAppbar(StringsRes.kycapplication)
          as PreferredSizeWidget?,
      body: Builder(
        builder: (context) => Center(
          child: SingleChildScrollView(
            child: Card(
              color: ColorsRes.white,
              shape: DesignConfig.roundedrectangleshape,
              margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 15, bottom: 15),
                child: MyCustomForm(fname, lname, dob, mobileno, address),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  String fname, lname, dob, mobileno, address;

  MyCustomForm(this.fname, this.lname, this.dob, this.mobileno, this.address,
      {Key? key})
      : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState(fname, lname, dob, mobileno, address);
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtbvnnumber = TextEditingController();

  final bool _obscureText = true;
  bool isLoading = false, isdialogloading = false;

  String fname, lname, dob, mobileno, address;

  MyCustomFormState(
      this.fname, this.lname, this.dob, this.mobileno, this.address);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: ColorsRes.secondgradientcolor,
                  child: Text(
                    "02",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .merge(TextStyle(color: ColorsRes.white)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${StringsRes.bvnverification}\t",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .merge(TextStyle(
                                        color: ColorsRes.secondgradientcolor,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                  decoration:
                                      DesignConfig.BoxDecorationContainer(
                                          ColorsRes.topupcolor, 5),
                                  child: Text("\tKYC Level 1\t",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .merge(TextStyle(
                                              color: ColorsRes.white)))),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${StringsRes.note}: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .merge(TextStyle(color: ColorsRes.red)),
                              ),
                              Expanded(
                                  child: Text(
                                StringsRes.bvnverificationnote,
                                style: Theme.of(context).textTheme.caption,
                              )),
                            ],
                          ),
                        ]),
                  ),
                )
              ]),
          SizedBox(
            height: 15,
          ),
          Text(StringsRes.enterbvnno,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: ColorsRes.appcolor))),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: DesignConfig.outlineboxtext,
            padding: EdgeInsets.only(left: 5, right: 5),
            child: TextFormField(
              style: TextStyle(color: ColorsRes.black, fontSize: 14),
              cursorColor: ColorsRes.appcolor,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: StringsRes.enterbvnno,
                hintStyle: TextStyle(color: ColorsRes.grey),
              ),
              controller: edtbvnnumber,
              keyboardType: TextInputType.number,
              validator: (val) =>
                  val!.trim().isEmpty ? StringsRes.enterbvnno : null,
            ),
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
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) =>
                      KYCContactVerificationActivity(mobileno)));
            },
            child: Container(
              decoration: DesignConfig.circulargradient_box,
              margin: EdgeInsets.only(top: 10),
              width: double.maxFinite,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                StringsRes.next,
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
}
