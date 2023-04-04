// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/BankingWalletTransactionActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/UIData.dart';

import 'KYCLevels/KYCApplicationActivity.dart';
import 'TransferBankMoneyActivity.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class BankingActivity extends StatefulWidget {
  const BankingActivity({Key? key}) : super(key: key);

  @override
  BankingState createState() => BankingState();
}

class BankingState extends State<BankingActivity> {
  String acname = UIData.username,
      acno = "123456789",
      bankname = "SBI",
      currency = Constant.CURRENCYSYMBOL;
  String daily_transaction_limit = "50",
      monthly_transaction_limit = "100",
      remaining_daily_transaction_limit = "30",
      remaining_monthly_transaction_limit = "50";
  bool setbankdeatils = true, setlimits = false, gettingbankdata = false;
  late double toppadding;
  String currkyclevel = "3";

  @override
  Widget build(BuildContext context) {
    toppadding = kToolbarHeight + 20;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: ColorsRes.statusbarcolor,
      ),
      key: _scaffoldKey,
      backgroundColor: ColorsRes.white,
      bottomNavigationBar: gettingbankdata || !setbankdeatils
          ? null
          : GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BankingWalletTransactionActivity()));
              },
              child: Container(
                height: 55,
                margin: EdgeInsets.all(5),
                decoration:
                    DesignConfig.BoxDecorationContainer(ColorsRes.appcolor, 8),
                alignment: Alignment.center,
                child: Text(StringsRes.bankingwallettransaction,
                    style: Theme.of(context).textTheme.subtitle1!.merge(
                        TextStyle(
                            color: ColorsRes.white,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold))),
              ),
            ),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: DesignConfig.gradient,
            ),
            padding: EdgeInsets.only(
              top: toppadding,
            ),
            child: gettingbankdata
                ? Center(
                    child: CircularProgressIndicator(
                    backgroundColor: ColorsRes.white,
                  ))
                : BankingData(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(
                    StringsRes.banking,
                    style: Theme.of(context).textTheme.subtitle1!.merge(
                        TextStyle(
                            color: ColorsRes.white,
                            fontWeight: FontWeight.bold)),
                  ),
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
      ),
    );
  }

  Widget BankingData() {
    return setbankdeatils
        ? ListView(children: <Widget>[
            Center(
                child: Text(StringsRes.bankingbalance,
                    style: Theme.of(context).textTheme.headline6!.merge(
                        TextStyle(
                            color: ColorsRes.white,
                            fontWeight: FontWeight.bold)))),
            Center(
                child: Text("${Constant.CURRENCYSYMBOL}${UIData.bankbalance}",
                    style: Theme.of(context).textTheme.headline6!.merge(
                        TextStyle(
                            color: ColorsRes.white,
                            fontWeight: FontWeight.bold)))),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(
                  Icons.info,
                  color: ColorsRes.white,
                  size: 17,
                ),
                Expanded(
                    child: Text(
                  StringsRes.bankingsendmoneyinfo,
                  style: Theme.of(context)
                      .textTheme
                      .overline!
                      .merge(TextStyle(color: ColorsRes.white)),
                )),
              ]),
            ),
            SizedBox(height: 10),
            Card(
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: SizedBox(height: 20),
            ),
            setlimits ? SetLimitData() : Container(),
            SetAcStatusData(),
            setbankdeatils ? setBankDetail() : Container(),
          ])
        : Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Text(
                  StringsRes.nobankactitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.white.withOpacity(0.8),
                      fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                Center(
                    child: Image.asset(
                  "assets/images/fullApps/cryptotech/bank.png",
                  height: 100,
                  width: 100,
                )),
                SizedBox(height: 10),
                Text(
                  "smartkit/AppFeature/FullApp/CryptoTech.ng offers an instant bank account which allows you perfom transactions with low fees! You can send and recieve money to any Bank account in Nigeria.",
                  style: Theme.of(context).textTheme.subtitle2!.merge(
                      TextStyle(color: ColorsRes.white.withOpacity(0.8))),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "To activate a bank account for your self please verify your identity, your bank account will be created and ready to use instantly after verification.",
                  style: Theme.of(context).textTheme.subtitle2!.merge(
                      TextStyle(color: ColorsRes.white.withOpacity(0.8))),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KYCApplicationActivity()));
                  },
                  child: DesignConfig.ButtonWithShadow(
                      "Activate my Bank Account Now!",
                      ColorsRes.appcolor,
                      context),
                )
              ]),
            ),
          );
  }

  Widget setBankDetail() {
    return Container(
      color: ColorsRes.white,
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        Divider(
          color: ColorsRes.grey,
        ),
        Text(
          StringsRes.bankacdetail,
          style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
              color: ColorsRes.secondgradientcolor,
              fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 10,
        ),
        Row(children: <Widget>[
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 5, end: 5, top: 8, bottom: 8),
                child: Text(StringsRes.accountname,
                    style: TextStyle(color: ColorsRes.black)),
              )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 5, end: 5, top: 8, bottom: 8),
                child:
                    Text(": $acname", style: TextStyle(color: ColorsRes.black)),
              )),
        ]),
        Row(children: <Widget>[
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 5, end: 5, top: 8, bottom: 8),
                child: Text(
                  StringsRes.accountno,
                  style: TextStyle(color: ColorsRes.black),
                ),
              )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 5, end: 5, top: 8, bottom: 8),
                child: Text(
                  ": $acno",
                  style: TextStyle(color: ColorsRes.black),
                ),
              )),
        ]),
        Row(children: <Widget>[
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 5, end: 5, top: 8, bottom: 8),
                child: Text(StringsRes.bankname,
                    style: TextStyle(color: ColorsRes.black)),
              )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 5, end: 5, top: 8, bottom: 8),
                child: Text(": $bankname",
                    style: TextStyle(color: ColorsRes.black)),
              )),
        ]),
        Row(children: <Widget>[
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 5, end: 5, top: 8, bottom: 8),
                child: Text(StringsRes.currency,
                    style: TextStyle(color: ColorsRes.black)),
              )),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 5, end: 5, top: 8, bottom: 8),
                child: Text(": $currency",
                    style: TextStyle(color: ColorsRes.black)),
              )),
        ]),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: DesignConfig.BoxDecorationContainer(
                    ColorsRes.topupcolor, 5),
                padding: EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 8),
                alignment: Alignment.center,
                child: Text(
                  "${StringsRes.topupfees} - ${Constant.CURRENCYSYMBOL}50",
                  style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Container(
                decoration: DesignConfig.BoxDecorationContainer(
                    ColorsRes.transfercolor, 5),
                padding: EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 8),
                alignment: Alignment.center,
                child: Text(
                  "${StringsRes.transferfees} - ${Constant.CURRENCYSYMBOL}100",
                  style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Divider(
          color: ColorsRes.grey,
          thickness: 1,
          height: 25,
        ),
        Container(
            decoration: DesignConfig.BoxDecorationContainer(ColorsRes.grey, 8),
            padding: EdgeInsets.all(5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info,
                  color: ColorsRes.white,
                  size: 16,
                ),
                SizedBox(width: 8),
                Expanded(
                    child: Text(
                  StringsRes.topupinfo,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .merge(TextStyle(color: ColorsRes.white)),
                )),
              ],
            )),
      ]),
    );
  }

  Widget SetLimitData() {
    return Container(
      color: ColorsRes.white,
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              StringsRes.transferlimits,
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: ColorsRes.appcolor, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 5),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: ColorsRes.textgrey,
                )),
                child: IntrinsicHeight(
                  child: Row(children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 5, end: 5, top: 8, bottom: 8),
                      child: Text(
                        StringsRes.dailylimit,
                        textAlign: TextAlign.center,
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
                        child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 5, end: 5, top: 8, bottom: 8),
                      child: Text(StringsRes.monthlylimit,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.caption!.merge(
                              TextStyle(
                                  color: ColorsRes.appcolor,
                                  fontWeight: FontWeight.bold))),
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
                        child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 5, end: 5, top: 8, bottom: 8),
                      child: Text(
                        "${Constant.CURRENCYSYMBOL}$daily_transaction_limit",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .merge(TextStyle(color: ColorsRes.black)),
                      ),
                    )),
                    VerticalDivider(
                      color: ColorsRes.black,
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 5, end: 5, top: 8, bottom: 8),
                      child: Text(
                          "${Constant.CURRENCYSYMBOL}$monthly_transaction_limit",
                          textAlign: TextAlign.center,
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
                        child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 5, end: 5, top: 8, bottom: 8),
                      child: Text(
                        StringsRes.remaindailylimit,
                        textAlign: TextAlign.center,
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
                        child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 5, end: 5, top: 8, bottom: 8),
                      child: Text(StringsRes.remainmonthlylimit,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.caption!.merge(
                              TextStyle(
                                  color: ColorsRes.appcolor,
                                  fontWeight: FontWeight.bold))),
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
                        child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 5, end: 5, top: 8, bottom: 8),
                      child: Text(
                        "${Constant.CURRENCYSYMBOL}$remaining_daily_transaction_limit",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .merge(TextStyle(color: ColorsRes.black)),
                      ),
                    )),
                    VerticalDivider(
                      color: ColorsRes.black,
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 5, end: 5, top: 8, bottom: 8),
                      child: Text(
                          "${Constant.CURRENCYSYMBOL}$remaining_monthly_transaction_limit",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .merge(TextStyle(color: ColorsRes.black))),
                    )),
                  ]),
                )),
          ]),
    );
  }

  Widget SetAcStatusData() {
    return Container(
      color: ColorsRes.white,
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 5),
            Text(
              StringsRes.youracstatus,
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: ColorsRes.secondgradientcolor,
                  fontWeight: FontWeight.bold)),
            ),
            currkyclevel == '0'
                ? Container()
                : Card(
                    shape:
                        DesignConfig.SetRoundedBorder(ColorsRes.appcolor, 10),
                    margin: EdgeInsets.only(top: 5),
                    color: ColorsRes.appcolor,
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Row(children: [
                        Expanded(
                            child: Container(
                          decoration: DesignConfig.BoxDecorationContainerSide(
                              currkyclevel == '1' && UIData.iskycverified == "1"
                                  ? ColorsRes.white
                                  : ColorsRes.appcolor,
                              8,
                              true,
                              false,
                              true,
                              false),
                          height: 10,
                        )),
                        Expanded(
                            child: Container(
                          color:
                              currkyclevel == '2' && UIData.iskycverified == "1"
                                  ? ColorsRes.white
                                  : ColorsRes.appcolor,
                          height: 10,
                        )),
                        Expanded(
                            child: Container(
                          decoration: DesignConfig.BoxDecorationContainerSide(
                              currkyclevel == '3' && UIData.iskycverified == "1"
                                  ? ColorsRes.white
                                  : ColorsRes.appcolor,
                              8,
                              false,
                              true,
                              false,
                              true),
                          height: 10,
                        )),
                      ]),
                    ),
                  ),
            currkyclevel == '0'
                ? Container()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Expanded(
                            child: Text(
                          StringsRes.level1,
                          style: TextStyle(color: ColorsRes.appcolor),
                        )),
                        Expanded(
                            child: Text(
                          StringsRes.level2,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: ColorsRes.appcolor),
                        )),
                        Expanded(
                            child: Text(
                          StringsRes.level3,
                          textAlign: TextAlign.end,
                          style: TextStyle(color: ColorsRes.appcolor),
                        )),
                      ]),
            SizedBox(height: 5),
            Text(
              currkyclevel == '0'
                  ? StringsRes.kycpending
                  : "${StringsRes.kyclevel} $currkyclevel ${UIData.iskycverified == "1" ? StringsRes.completed : StringsRes.pending}",
              style: TextStyle(
                  color: ColorsRes.firstgradientcolor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TransferBankMoneyActivity()));
                },
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    StringsRes.transfermoney,
                    style: TextStyle(
                        color: ColorsRes.appcolor,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => KYCApplicationActivity()));
                },
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "${StringsRes.upgradetolevel} ${UIData.iskycverified != "1" ? currkyclevel : int.parse(currkyclevel) + 1}",
                    style: TextStyle(
                        color: ColorsRes.appcolor,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
