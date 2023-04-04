import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/UIData.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/searchable_dropdown.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/model/Bank.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class TransferBankMoneyActivity extends StatefulWidget {
  @override
  TransferBankMoneyState createState() => new TransferBankMoneyState();
}

class TransferBankMoneyState extends State<TransferBankMoneyActivity> {
  String acname = UIData.username,
      acno = "123456789",
      bankname = "SBI",
      currency = Constant.CURRENCYNAME;

  String daily_transaction_limit = "50",
      monthly_transaction_limit = "100",
      remaining_daily_transaction_limit = "30",
      remaining_monthly_transaction_limit = "50";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 20;
    return new Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsRes.bgcolor,
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
            child: BankingData(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(
                    StringsRes.transfermoney,
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
    return ListView(
        //padding:  EdgeInsets.only(bottom: 10,top: 10,left: 10,right: 10),
        children: <Widget>[
          Center(
              child: Text(StringsRes.bankingbalance,
                  style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold)))),
          Center(
              child: Text("${Constant.CURRENCYSYMBOL}${UIData.bankbalance}",
                  style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold)))),
          Card(
            margin: EdgeInsets.only(top: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: SizedBox(height: 20),
          ),
          SetBankDetail(),
          Container(
              color: ColorsRes.white,
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 8, top: 10),
              child: MyCustomForm()),
        ]);
  }

  Widget SetBankDetail() {
    return Container(
      color: ColorsRes.white,
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        Text(
          StringsRes.bankacdetail,
          style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
              color: ColorsRes.appcolor, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
            //decoration: BoxDecoration(border: Border.all(color: ColorsRes.textgrey,)),
            margin: EdgeInsets.only(top: 10),
            child: Row(children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 5, end: 5, top: 8, bottom: 8),
                    child: Text(
                      StringsRes.accountname,
                      style: TextStyle(color: ColorsRes.black),
                    ),
                  )),
              //VerticalDivider(color: ColorsRes.black,),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 5, end: 5, top: 8, bottom: 8),
                    child: Text(": $acname",
                        style: TextStyle(color: ColorsRes.black)),
                  )),
            ])),
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
          //VerticalDivider(color: ColorsRes.black,),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 5, end: 5, top: 8, bottom: 8),
                child:
                    Text(": $acno", style: TextStyle(color: ColorsRes.black)),
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
          //VerticalDivider(color: ColorsRes.black,),
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
          //VerticalDivider(color: ColorsRes.black,),
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
        Divider(
          color: ColorsRes.grey,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          StringsRes.transferfundtoanybank,
          style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
              color: ColorsRes.secondgradientcolor,
              fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          StringsRes.transferbankamtinfo,
          style: Theme.of(context).textTheme.caption!.merge(TextStyle(
              color: ColorsRes.grey.withOpacity(0.8),
              fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 10,
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
                    style: Theme.of(context).textTheme.caption!.merge(
                          TextStyle(
                              color: ColorsRes.white,
                              fontWeight: FontWeight.bold),
                        )),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                decoration: DesignConfig.BoxDecorationContainer(
                    ColorsRes.transfercolor, 5),
                padding: EdgeInsets.only(left: 5, right: 5, top: 8, bottom: 8),
                alignment: Alignment.center,
                child: Text(
                    "${StringsRes.transferfees} - ${Constant.CURRENCYSYMBOL}100",
                    style: Theme.of(context).textTheme.caption!.merge(
                          TextStyle(
                              color: ColorsRes.white,
                              fontWeight: FontWeight.bold),
                        )),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtbankname = TextEditingController();
  TextEditingController edtacno = TextEditingController();
  TextEditingController edtacname = TextEditingController();
  TextEditingController edtpassword = TextEditingController();
  TextEditingController edttransactionpin = TextEditingController();
  TextEditingController edtamount = TextEditingController();
  TextEditingController edtdob = TextEditingController();
  late List<Bank> banklist;
  Bank? selectedbank;
  bool isbankavailable = false, isgettingdata = false, isloading = false;

  @override
  void initState() {
    super.initState();
    banklist = [];
    banklist = UIData.getBankList() as List<Bank>;
    selectedbank = banklist[0];
  }

  @override
  Widget build(BuildContext context) {
    return isgettingdata
        ? Center(child: CircularProgressIndicator())
        : Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Divider(
                  color: ColorsRes.grey,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(StringsRes.bankname,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .merge(TextStyle(color: ColorsRes.appcolor))),
                SizedBox(
                  height: 5,
                ),
                Card(
                  shape: DesignConfig.SetRoundedBorder(
                      ColorsRes.firstgradientcolor, 8),
                  margin: EdgeInsets.only(bottom: 10, top: 5),
                  child: SearchableDropdown<Bank>(
                    isCaseSensitiveSearch: false, isExpanded: true,
                    value: selectedbank,
                    //isDense: true,
                    onChanged: (Bank newValue) {
                      setState(() {
                        if (selectedbank!.id != newValue.id) {
                          selectedbank = newValue;
                        }
                      });
                    },
                    items: banklist.map((Bank value) {
                      return DropdownMenuItem<Bank>(
                        value: value,
                        child: Text("\t\t${value.name}",
                            style: TextStyle(
                                color: ColorsRes.black,
                                fontSize: 14)), // (${value.code})"),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(StringsRes.accountno,
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
                      hintText: StringsRes.accountno,
                      hintStyle: TextStyle(color: ColorsRes.grey),
                    ),
                    controller: edtacno,
                    keyboardType: TextInputType.text,
                    validator: (val) =>
                        val!.trim().isEmpty ? StringsRes.enteracno : null,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(StringsRes.accountname,
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
                      hintText: StringsRes.accountname,
                      hintStyle: TextStyle(color: ColorsRes.grey),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (val) =>
                        val!.trim().isEmpty ? StringsRes.enteracname : null,
                    controller: edtacname,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StringsRes.transactionpin,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .merge(TextStyle(color: ColorsRes.appcolor))),
                      GestureDetector(
                          onTap: () async {
                            Constant.ResetPinDialog(context, _scaffoldKey);
                          },
                          child: Text(StringsRes.resetpin,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .merge(TextStyle(
                                      color: ColorsRes.firstgradientcolor,
                                      decoration: TextDecoration.underline)))),
                    ],
                  ),
                ),
                Container(
                  decoration: DesignConfig.outlineboxtext,
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: TextFormField(
                    style: TextStyle(color: ColorsRes.black, fontSize: 14),
                    cursorColor: ColorsRes.appcolor,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: StringsRes.transactionpin,
                      hintStyle: TextStyle(color: ColorsRes.grey),
                    ),
                    obscureText: true,
                    obscuringCharacter: "*",
                    validator: (val) => val!.trim().isEmpty
                        ? StringsRes.enter_transactionpin
                        : null,
                    controller: edttransactionpin,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(StringsRes.password,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .merge(TextStyle(color: ColorsRes.appcolor))),
                ),
                Container(
                  decoration: DesignConfig.outlineboxtext,
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: TextFormField(
                    style: TextStyle(color: ColorsRes.black, fontSize: 14),
                    cursorColor: ColorsRes.appcolor,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: StringsRes.password,
                      hintStyle: TextStyle(color: ColorsRes.grey),
                    ),
                    obscuringCharacter: "*",
                    obscureText: true,
                    validator: (val) =>
                        val!.trim().isEmpty ? StringsRes.enter_password : null,
                    controller: edtpassword,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(StringsRes.transferamount,
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
                  child: Row(children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(start: 5, end: 5),
                        child: TextFormField(
                          style:
                              TextStyle(color: ColorsRes.black, fontSize: 14),
                          cursorColor: ColorsRes.appcolor,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          validator: (val) => val!.trim().isEmpty
                              ? StringsRes.enteramount
                              : null,
                          controller: edtamount,
                          decoration: InputDecoration(
                              isDense: true,
                              hintText: "0000.00",
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsetsDirectional.only(start: 5, end: 20),
                        height: 25,
                        child: VerticalDivider(
                          width: 1,
                          thickness: 1,
                          color: ColorsRes.grey,
                        )),
                    Text("${StringsRes.naira}\t\t",
                        style: TextStyle(
                          color: ColorsRes.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.4655,
                        ))
                  ]),
                ),
                SizedBox(
                  height: 5,
                ),
                isloading
                    ? Center(child: new CircularProgressIndicator())
                    : Container(),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () async {},
                  child: Container(
                    decoration: DesignConfig.circulargradient_box,
                    margin: EdgeInsets.only(top: 10),
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(top: 13, bottom: 13),
                    child: Text(
                      StringsRes.transfernow,
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
  }
}
