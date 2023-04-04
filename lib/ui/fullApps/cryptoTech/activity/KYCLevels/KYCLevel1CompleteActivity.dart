// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';

class KYCLevel1CompleteActivity extends StatefulWidget {
  const KYCLevel1CompleteActivity({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return KYCLevel1CompleteState();
  }
}

class KYCLevel1CompleteState extends State<KYCLevel1CompleteActivity> {
  String acname = "", acno = "", bankname = "", currency = "";
  bool setbankdeatils = false;

  @override
  void initState() {
    super.initState();
  }

  onBackPress() {
    Navigator.pop(context);
    Constant.GoToMainPage("main", context);
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = 2 * kToolbarHeight;

    return WillPopScope(
      onWillPop: () {
        return onBackPress();
      },
      child: Scaffold(
          backgroundColor: ColorsRes.bgcolor,
          body: Stack(
            children: [
              Container(
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  gradient: DesignConfig.gradient,
                ),
                padding: EdgeInsets.only(
                    top: toppadding, left: 20, right: 20, bottom: 20),
                child: Center(
                  child: Card(
                      color: ColorsRes.white,
                      shape: DesignConfig.roundedrectangleshape,
                      //margin: EdgeInsets.only(left: 10, right: 10, top: 10,bottom: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 25.0, bottom: 25, left: 8, right: 8),
                        child: SingleChildScrollView(
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: ColorsRes.firstgradientcolor,
                              size: 50,
                            ),
                            Text(
                              "Great job! you have completed the KYC process for Level 1!",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .merge(
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Congratulations! You have unlocked KYC level 1 and a new unique bank account has been created for you to enable you send and recieve money in Nigeria",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .merge(TextStyle()),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            setbankdeatils ? SetBankDetails() : Container(),
                          ]),
                        ),
                      )),
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
                          onBackPress();
                        },
                        child: SvgPicture.asset(
                            'assets/images/fullApps/cryptotech/back_button.svg'),
                      )),
                ),
              )
            ],
          )),
    );
  }

  Widget SetBankDetails() {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: ColorsRes.textgrey,
          )),
          margin: EdgeInsets.only(top: 10),
          child: IntrinsicHeight(
            child: Row(children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 5, end: 5, top: 8, bottom: 8),
                    child: Text(
                      StringsRes.accountname,
                      style: Theme.of(context).textTheme.caption!.merge(
                          TextStyle(
                              color: ColorsRes.appcolor,
                              fontWeight: FontWeight.bold)),
                    ),
                  )),
              VerticalDivider(
                color: ColorsRes.black,
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 5, end: 5, top: 8, bottom: 8),
                    child: Text(acname,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .merge(TextStyle(color: ColorsRes.black))),
                  )),
            ]),
          )),
      Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: ColorsRes.textgrey),
                  left: BorderSide(color: ColorsRes.textgrey),
                  right: BorderSide(color: ColorsRes.textgrey))),
          child: IntrinsicHeight(
            child: Row(children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 5, end: 5, top: 8, bottom: 8),
                    child: Text(
                      StringsRes.accountno,
                      style: Theme.of(context).textTheme.caption!.merge(
                          TextStyle(
                              color: ColorsRes.appcolor,
                              fontWeight: FontWeight.bold)),
                    ),
                  )),
              VerticalDivider(
                color: ColorsRes.black,
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 5, end: 5, top: 8, bottom: 8),
                    child: Text(
                      acno,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .merge(TextStyle(color: ColorsRes.black)),
                    ),
                  )),
            ]),
          )),
      Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: ColorsRes.textgrey),
                  left: BorderSide(color: ColorsRes.textgrey),
                  right: BorderSide(color: ColorsRes.textgrey))),
          child: IntrinsicHeight(
            child: Row(children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 5, end: 5, top: 8, bottom: 8),
                    child: Text(
                      StringsRes.bankname,
                      style: Theme.of(context).textTheme.caption!.merge(
                          TextStyle(
                              color: ColorsRes.appcolor,
                              fontWeight: FontWeight.bold)),
                    ),
                  )),
              VerticalDivider(
                color: ColorsRes.black,
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 5, end: 5, top: 8, bottom: 8),
                    child: Text(
                      bankname,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .merge(TextStyle(color: ColorsRes.black)),
                    ),
                  )),
            ]),
          )),
      Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: ColorsRes.textgrey),
                  left: BorderSide(color: ColorsRes.textgrey),
                  right: BorderSide(color: ColorsRes.textgrey))),
          child: IntrinsicHeight(
            child: Row(children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 5, end: 5, top: 8, bottom: 8),
                    child: Text(
                      StringsRes.currency,
                      style: Theme.of(context).textTheme.caption!.merge(
                          TextStyle(
                              color: ColorsRes.appcolor,
                              fontWeight: FontWeight.bold)),
                    ),
                  )),
              VerticalDivider(
                color: ColorsRes.black,
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 5, end: 5, top: 8, bottom: 8),
                    child: Text(
                      currency,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .merge(TextStyle(color: ColorsRes.black)),
                    ),
                  )),
            ]),
          )),
    ]);
  }
}
