// ignore_for_file: prefer_final_fields, no_logic_in_create_state, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ease_in_widget.dart';

class BuyCoinProcessPage extends StatefulWidget {
  int _radioValue1 = -1;
  double coinprice = 0;
  String? cointype, image;
  BuyCoinProcessPage(
      this._radioValue1, this.coinprice, this.cointype, this.image,
      {Key? key})
      : super(key: key);

  @override
  BuyCoinProcessPageState createState() {
    return BuyCoinProcessPageState(_radioValue1, coinprice, cointype, image);
  }
}

class BuyCoinProcessPageState extends State<BuyCoinProcessPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false, isdialogloading = false;
  TextEditingController edtusd = TextEditingController();
  TextEditingController edtnaira = TextEditingController();
  TextEditingController edtpayaddress = TextEditingController();

  String message = "";
  double minbuy = 10;
  TextStyle? textStyle;

  int _radioValue1 = -1;
  double coinprice = 0;
  String? cointype, image;
  BuyCoinProcessPageState(
      this._radioValue1, this.coinprice, this.cointype, this.image);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    textStyle = Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
          fontWeight: FontWeight.w600,
          color: ColorsRes.white.withOpacity(0.5),
        ));

    double toppadding =
        (2 * kToolbarHeight) - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: ColorsRes.statusbarcolor,
      ),
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: DesignConfig.gradient,
            ),
            padding: EdgeInsets.only(top: 0, left: 20, right: 20),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: toppadding,
                    ),
                    Center(
                        child: SvgPicture.asset(
                      image!,
                      height: MediaQuery.of(context).size.width / 8,
                    )),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        "1\$ = $coinprice",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.merge(
                            TextStyle(
                                color: ColorsRes.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Center(
                      child: Text(
                        cointype!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.merge(
                            TextStyle(
                                color: ColorsRes.white.withOpacity(0.7),
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    SizedBox(height: 50),
                    Column(children: [
                      Card(
                        shape: DesignConfig.SetRoundedBorder(ColorsRes.grey, 8),
                        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Row(children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.only(start: 5, end: 5),
                              child: TextField(
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                controller: edtusd,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "000000.00",
                                    border: InputBorder.none),
                                onTap: () {
                                  if (_radioValue1 == -1) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Please Select Coin Type")));
                                  }
                                },
                                onChanged: (String enteredcoin) {
                                  if (_radioValue1 == -1) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Please Select Coin Type")));
                                  } else {
                                    SetNairaAmt();
                                  }
                                },
                              ),
                            ),
                          ),
                          Container(
                              padding:
                                  EdgeInsetsDirectional.only(start: 5, end: 20),
                              height: 25,
                              child: VerticalDivider(
                                width: 1,
                                thickness: 1,
                                color: ColorsRes.grey,
                              )),
                          Text("${StringsRes.usd}\t\t",
                              style: TextStyle(
                                color: ColorsRes.black,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.4655,
                              ))
                        ]),
                      ),
                      Card(
                        shape: DesignConfig.SetRoundedBorder(ColorsRes.grey, 8),
                        margin: EdgeInsets.only(
                            bottom: 15, top: 15, left: 10, right: 10),
                        child: Row(children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.only(start: 5, end: 5),
                              child: TextField(
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                controller: edtnaira,
                                enabled: false,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "000000.00",
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          Container(
                              padding:
                                  EdgeInsetsDirectional.only(start: 5, end: 20),
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 5, end: 5.0),
                            child: Icon(
                              Icons.check_circle,
                              color: ColorsRes.white,
                              size: 17,
                            ),
                          ),
                          Text(
                            "${Constant.USCURRENCYSYMBOL}$minbuy\t",
                            style: TextStyle(
                                color: ColorsRes.white,
                                fontWeight: FontWeight.w500),
                          ),
                          Flexible(
                              child: Text(
                            StringsRes.minbuyinfo,
                            style: TextStyle(
                                fontSize: 12,
                                color: ColorsRes.white.withOpacity(0.7)),
                          )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 10, top: 25.0),
                        child: Text(
                            _radioValue1 == 0
                                ? StringsRes.pmacid
                                : StringsRes.paymentaddress,
                            style: textStyle),
                      ),
                      Container(
                        color: ColorsRes.appcolor,
                        margin: EdgeInsetsDirectional.only(
                            bottom: 25, top: 5, start: 10, end: 10),
                        width: double.maxFinite,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          style: TextStyle(color: ColorsRes.white),
                          cursorColor: ColorsRes.white,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: _radioValue1 == 0
                                ? "Enter ${StringsRes.pmacid} here"
                                : "Enter ${StringsRes.paymentaddress} here",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .caption!
                                .merge(TextStyle(
                                    color: ColorsRes.white.withOpacity(0.5))),
                            border: InputBorder.none,
                            hoverColor: ColorsRes.white,
                            fillColor: ColorsRes.white,
                            focusColor: ColorsRes.white,
                          ),
                          validator: (val) => val!.trim().isEmpty
                              ? _radioValue1 == 0
                                  ? StringsRes.enterpmacid
                                  : StringsRes.enterpaymentaddress
                              : null,
                          controller: edtpayaddress,
                        ),
                      ),
                      _radioValue1 != 0
                          ? Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  top: 8.0, start: 5, end: 5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        end: 5.0),
                                    child: Icon(
                                      Icons.check_circle,
                                      color: ColorsRes.white,
                                      size: 17,
                                    ),
                                  ),
                                  Flexible(
                                      child: Text(
                                    StringsRes.coinbuyinfo,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            ColorsRes.white.withOpacity(0.5)),
                                  )),
                                ],
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            top: 8.0, start: 5, end: 5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 5.0),
                              child: Icon(
                                Icons.info,
                                color: ColorsRes.white,
                                size: 17,
                              ),
                            ),
                            Flexible(
                                child: Text(
                              StringsRes.buyconfirminfo,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: ColorsRes.white.withOpacity(0.5)),
                            )),
                          ],
                        ),
                      ),
                    ]),
                    SizedBox(height: 25),
                    isLoading
                        ? CircularProgressIndicator(
                            backgroundColor: ColorsRes.white,
                          )
                        : Container(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: EaseInWidget(
                        onTap: () async {
                          if (!isLoading) {
                            if (_radioValue1 == -1) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Please Select Coin Type")));
                            } else if (edtusd.text.toString().trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text("Enter $cointype Buy Amount")));
                            } else if (double.parse(edtusd.text) < minbuy) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Minimum ${Constant.USCURRENCYSYMBOL}$minbuy Trade Amount is accepted")));
                            } else if (edtpayaddress.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(_radioValue1 == 0
                                          ? StringsRes.enterpmacid
                                          : StringsRes.enterpaymentaddress)));
                            } else {
                              //btn press code
                            }
                          }
                        },
                        child: Image.asset(
                          'assets/images/fullApps/cryptotech/okay.png',
                          height: MediaQuery.of(context).size.width / 8,
                          color: ColorsRes.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                        'assets/images/fullApps/cryptotech/close_button.svg')),
              ),
            ),
          )
        ],
      ),
    );
  }

  void SetNairaAmt() {
    double maincoin = 000000.0;
    if (edtusd.text.toString().trim().isNotEmpty) {
      maincoin = coinprice * double.parse(edtusd.text);
    }
    edtnaira.text = maincoin.toString();
  }
}
