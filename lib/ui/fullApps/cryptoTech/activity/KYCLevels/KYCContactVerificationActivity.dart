// ignore_for_file: no_logic_in_create_state, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/KYCLevels/KYCLevel1CompleteActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';

class KYCContactVerificationActivity extends StatefulWidget {
  String phoneno = '';

  KYCContactVerificationActivity(this.phoneno, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return KYCContactVerificationState(phoneno);
  }
}

class KYCContactVerificationState
    extends State<KYCContactVerificationActivity> {
  String phoneno = '';
  bool isloading = false, issentotp = false;
  bool btnenable = false;
  TextEditingController edtotp = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  KYCContactVerificationState(this.phoneno);

  @override
  Widget build(BuildContext context) {
    double toppadding = 2 * kToolbarHeight;
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorsRes.bgcolor,
        body: Stack(
          children: [
            Container(
                padding: EdgeInsets.only(
                    top: toppadding, left: 20, right: 20, bottom: 20),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringsRes.contactverificaiton,
                          style: Theme.of(context).textTheme.headline6!.merge(
                              TextStyle(
                                  color: ColorsRes.appcolor,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 10),
                        issentotp ? VerifyOTP() : ConfirmNumber(),
                      ]),
                )),
            Align(
              alignment: Alignment.topLeft,
              child: IntrinsicHeight(
                child: AppBar(
                    systemOverlayStyle: SystemUiOverlayStyle.light,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Text(StringsRes.kycapplication,
                        style: TextStyle(color: ColorsRes.appcolor)),
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset(
                          'assets/images/fullApps/cryptotech/back_button.svg'),
                    )),
              ),
            )
          ],
        ));
  }

  Widget ConfirmNumber() {
    String displaynumber = phoneno;
    int numSpace = 6;
    displaynumber = displaynumber.replaceRange(0, numSpace, '*' * numSpace);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(StringsRes.mobilenoconfirm,
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .merge(TextStyle(color: ColorsRes.appcolor.withOpacity(0.8)))),
      Container(
        width: double.maxFinite,
        decoration: DesignConfig.BoxDecorationBorderContainer(
            ColorsRes.appcolor.withOpacity(0.8), 10),
        padding: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
        margin: EdgeInsets.only(top: 20),
        child: Text(
          displaynumber,
          style: TextStyle(color: ColorsRes.appcolor),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      isloading ? CircularProgressIndicator() : Container(),
      SizedBox(
        height: 10,
      ),
      GestureDetector(
        onTap: () async {
          setState(() {
            issentotp = true;
          });
        },
        child: DesignConfig.EnDisButton(
            StringsRes.verify.toUpperCase(), ColorsRes.white, context),
      ),
    ]);
  }

  Widget VerifyOTP() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(StringsRes.otpinfo,
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .merge(TextStyle(color: ColorsRes.appcolor.withOpacity(0.8)))),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        style: TextStyle(color: ColorsRes.appcolor),
        cursorColor: ColorsRes.appcolor,
        decoration: InputDecoration(
            //border: InputBorder.none,
            hintText: StringsRes.enter_otp,
            hintStyle: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorsRes.appcolor.withOpacity(0.5))),
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorsRes.appcolor.withOpacity(0.2)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorsRes.appcolor.withOpacity(0.2)),
            ),
            border: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorsRes.appcolor.withOpacity(0.2)),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsRes.red.withOpacity(0.7)),
            ),
            errorStyle: TextStyle(color: ColorsRes.grey)),
        controller: edtotp,
        keyboardType: TextInputType.number,
        validator: (val) => val!.trim().isEmpty ? StringsRes.enter_otp : null,
        onChanged: (String txt) {
          if (txt.trim().isEmpty && btnenable) {
            setState(() {
              btnenable = false;
            });
          } else if (!btnenable) {
            setState(() {
              btnenable = true;
            });
          }
        },
      ),
      SizedBox(
        height: 30,
      ),
      isloading ? CircularProgressIndicator() : Container(),
      SizedBox(
        height: 10,
      ),
      GestureDetector(
        onTap: () async {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => KYCLevel1CompleteActivity()));
        },
        child: DesignConfig.EnDisButton(
            StringsRes.next.toUpperCase(),
            btnenable ? ColorsRes.white : ColorsRes.firstgradientcolor,
            context),
      ),
    ]);
  }
}
