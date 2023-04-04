// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/UIData.dart';

import 'UsernameForPayment.dart';

class PublicPaymentTypes extends StatefulWidget {
  String username;

  PublicPaymentTypes(this.username);

  @override
  State<StatefulWidget> createState() {
    return PublicPaymentTypesState();
  }
}

class PublicPaymentTypesState extends State<PublicPaymentTypes> {
  List<Widget> paymenttypewidgetlist = [];
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    paymenttypewidgetlist = [];
    Createpaymenttypewidgetlist();
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 40;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsRes.bgcolor,
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: DesignConfig.gradient,
            ),
            padding: EdgeInsets.only(top: toppadding),
            child: Container(
              decoration: BoxDecoration(
                color: ColorsRes.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    topLeft: Radius.circular(18)),
              ),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                          child: GridView.count(
                              // primary: false,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 12,
                              crossAxisCount: 2,
                              childAspectRatio: 0.8,
                              children: paymenttypewidgetlist)),
                      isbank
                          ? Padding(
                              padding: EdgeInsets.only(left: 10, right: 5),
                              child: Row(children: [
                                CircleAvatar(
                                    backgroundColor:
                                        ColorsRes.grey.withOpacity(0.5),
                                    child: Image.asset(
                                      "assets/images/fullApps/cryptotech/bank.png",
                                      height: 30,
                                      width: 30,
                                    )),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(children: [
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                StringsRes.lblbank,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .merge(TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )),
                                          Text(":\t"),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                "SBI",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .merge(TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )),
                                        ]),
                                        Row(children: [
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                StringsRes.accountname,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .merge(TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )),
                                          Text(":\t"),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                UIData.username,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .merge(TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )),
                                        ]),
                                        Row(children: [
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                StringsRes.accountno,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .merge(TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )),
                                          Text(":\t"),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                "123456789",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .merge(TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              )),
                                        ]),
                                      ]),
                                )
                              ]))
                          : Container(),
                    ],
                  ),
                  isLoading
                      ? Positioned.fill(
                          child: Container(
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Container()
                ],
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
                title: Text(StringsRes.publicpayment,
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

  AddWidgetData(String type, String name, String image, Color imgcolor,
      bool isloader, double height) {
    TextEditingController edtusd = TextEditingController();

    isloader = true;
    paymenttypewidgetlist.add(Container(
      decoration: DesignConfig.BoxDecorationContainer(ColorsRes.lightgrey, 8),
      padding: EdgeInsets.only(left: 14, right: 10, top: 5, bottom: 5),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              image,
              color: imgcolor,
              height: height,
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                  color: ColorsRes.black.withOpacity(0.5),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: edtusd,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(5),
                hintText: StringsRes.usd,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorsRes.grey.withOpacity(0.5)),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  StringsRes.paynow,
                  style: TextStyle(color: ColorsRes.white),
                ),
                //color: ColorsRes.firstgradientcolor,
                decoration:
                    DesignConfig.BoxDecorationContainer(ColorsRes.appcolor, 8),
              ),
            )
          ]),
    ));
  }

  Createpaymenttypewidgetlist() {
    paymenttypewidgetlist = [];
    if (ispm) {
      AddWidgetData(
          Constant.pm,
          StringsRes.perfectmoney,
          'assets/images/fullApps/cryptotech/pm.svg',
          ColorsRes.cardyellow,
          false,
          36);
    }

    if (ispaxbit) {
      AddWidgetData(
          Constant.paxfulbitcoin,
          StringsRes.paxfulbitcoin,
          'assets/images/fullApps/cryptotech/paxful.svg',
          ColorsRes.cardpurple,
          false,
          36);
    }

    if (isbtc) {
      AddWidgetData(
          Constant.btc,
          StringsRes.btc,
          'assets/images/fullApps/cryptotech/btc.svg',
          ColorsRes.cardblue,
          false,
          36);
    }

    if (iseth) {
      AddWidgetData(
          Constant.eth,
          StringsRes.eth,
          'assets/images/fullApps/cryptotech/eth.svg',
          ColorsRes.cardgreen,
          false,
          36);
    }

    if (isltct) {
      AddWidgetData(
          Constant.ltct,
          StringsRes.ltct,
          'assets/images/fullApps/cryptotech/dollersymbol.svg',
          ColorsRes.cardbrown,
          false,
          36);
    }

    if (isltc) {
      AddWidgetData(
          Constant.ltc,
          StringsRes.ltc,
          'assets/images/fullApps/cryptotech/ltc.svg',
          ColorsRes.cardpich,
          false,
          36);
    }

    if (isusdt) {
      AddWidgetData(
          Constant.usdt,
          StringsRes.usdt,
          'assets/images/fullApps/cryptotech/usdt.svg',
          ColorsRes.cardpink,
          false,
          36);
    }
  }
}
