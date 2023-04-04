// ignore_for_file: unnecessary_new

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/CartPayment/CartListPage.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Address.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/payment_card.dart';

import 'Order_Place.dart';

double? deliverycost;
Address? deliveryaddressinfo;

class PaymentPage extends StatefulWidget {
  String? deliverytime, demethod;

  PaymentPage({Key? key, this.deliverytime, this.demethod}) : super(key: key);
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  RoundedRectangleBorder? cardshape;
  TextStyle? headerstyle;
  EdgeInsets cardmargin = EdgeInsets.only(bottom: 10);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String? paymentmethod;
  bool loadingorder = false;
  double finaltotal = totalcartprice;
  String? deliverymethod = checkoutdata["delivery_method"];
  String address = "address1";

  final _formKey = new GlobalKey<FormState>();
  var numberController = new TextEditingController();
  final _paymentCard = PaymentCard();
  final _autoValidate = false;
  bool showLoader = false;

  final _card = new PaymentCard();

  @override
  void initState() {
    super.initState();
    if (deliverymethod == StringsRes.delivery.toLowerCase()) {
      finaltotal = totalcartprice + 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    cardshape = DesignConfig.setRoundedBorder(ColorsRes.white, 10, false);
    headerstyle = Theme.of(context)
        .textTheme
        .headline6!
        .merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold));

    return Scaffold(
      backgroundColor: ColorsRes.backgroundColor,
      key: scaffoldKey,
      appBar: DesignConfig.setAppbar(StringsRes.lblpayment, context),
      bottomNavigationBar: paymentmethod == StringsRes.stripe.toLowerCase()
          ? null
          : Container(
              height: MediaQuery.of(context).size.height / 5.2,
              decoration: DesignConfig.boxDecorationHalfContainerShadow(
                  ColorsRes.containerShadowColor, 16, 0, 16, 0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 13, bottom: 10, left: 20.0, right: 20.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total payment",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ColorsRes.black,
                                  fontWeight: FontWeight.w600)),
                          Text(
                            "${Constant.currencysymbol}${totalcartprice.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 18,
                                color: ColorsRes.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                  ),
                  ButtonClickAnimation(
                    onTap: () {
                      callPaymentStatus();
                    },
                    child: IntrinsicHeight(
                      child: Container(
                        height: 67.0,
                        padding: EdgeInsets.only(top: 13, bottom: 13),
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        alignment: Alignment.center,
                        decoration: DesignConfig.buttonShadowColor(
                            ColorsRes.continueShoppingGradient1Color,
                            37,
                            ColorsRes.continueShoppingGradient2Color),
                        child: Text(
                          StringsRes.makeAPayment,
                          style: TextStyle(
                              fontSize: 17,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Poppins"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      //  : null,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          summaryWidget(),
          paymentTypeWidget(),
        ]),
      ),
    );
  }

  summaryWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringsRes.shippingto,
            style: TextStyle(fontSize: 18, color: ColorsRes.black),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                address = "address1";
              });
            },
            child: Container(
              decoration: DesignConfig.boxDecorationContainerShadow(
                  ColorsRes.containerShadowColor, 14, 14, 14, 14),
              margin: EdgeInsets.only(top: 5, bottom: 10.0),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(children: [
                Row(
                  children: [
                    Icon(
                      "address1" == address
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                      color: "address1" == address
                          ? ColorsRes.orangeColor
                          : ColorsRes.grayColor,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      StringsRes.home,
                      style: TextStyle(fontSize: 16, color: ColorsRes.black),
                    )
                  ],
                ),
                SizedBox(width: 10),
                Row(
                  children: const [
                    SizedBox(width: 30.0),
                    Expanded(
                      child: Text(
                        "262, 263, 2nd floor, Time Squire, Mirzapar highway, bhuj kutch 370001",
                        style:
                            TextStyle(fontSize: 14, color: ColorsRes.grayColor),
                      ),
                    ),
                  ],
                )
              ]),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                address = "address2";
              });
            },
            child: Container(
              decoration: DesignConfig.boxDecorationContainerShadow(
                  ColorsRes.containerShadowColor, 14, 14, 14, 14),
              margin: EdgeInsets.only(top: 5, bottom: 10.0),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(children: [
                Row(
                  children: [
                    Icon(
                      "address2" == address
                          ? Icons.radio_button_checked
                          : Icons.radio_button_off,
                      color: "address2" == address
                          ? ColorsRes.orangeColor
                          : ColorsRes.grayColor,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      StringsRes.home,
                      style: TextStyle(fontSize: 16, color: ColorsRes.black),
                    )
                  ],
                ),
                SizedBox(width: 10),
                Row(
                  children: const [
                    SizedBox(width: 30.0),
                    Expanded(
                      child: Text(
                        "262, 263, 2nd floor, Time Squire, Mirzapar highway, bhuj kutch 370001",
                        style:
                            TextStyle(fontSize: 14, color: ColorsRes.grayColor),
                      ),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentTypeWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            StringsRes.paymentmethod,
            style: TextStyle(fontSize: 18, color: ColorsRes.black),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                paymentmethod = StringsRes.creditCard.toLowerCase();
              });
            },
            child: Container(
              decoration: DesignConfig.boxDecorationContainerShadow(
                  ColorsRes.containerShadowColor, 14, 14, 14, 14),
              margin: EdgeInsets.only(top: 5, bottom: 10.0),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(children: [
                SvgPicture.asset(
                  "assets/images/fullApps/foodMaster/card.svg",
                  fit: BoxFit.fitHeight,
                  height: 20,
                  width: 60,
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Text(
                  StringsRes.creditCard,
                  style: TextStyle(fontSize: 18, color: ColorsRes.black),
                )),
                Icon(
                  StringsRes.creditCard.toLowerCase() == paymentmethod
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: StringsRes.creditCard.toLowerCase() == paymentmethod
                      ? ColorsRes.orangeColor
                      : ColorsRes.grayColor,
                ),
              ]),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                paymentmethod = StringsRes.gpay.toLowerCase();
              });
            },
            child: Container(
              decoration: DesignConfig.boxDecorationContainerShadow(
                  ColorsRes.containerShadowColor, 14, 14, 14, 14),
              margin: EdgeInsets.only(top: 5, bottom: 10.0),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(children: [
                SvgPicture.asset(
                  "assets/images/fullApps/foodMaster/gpay.svg",
                  fit: BoxFit.contain,
                  height: 20,
                  width: 70,
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Text(
                  StringsRes.gpay,
                  style: TextStyle(fontSize: 18, color: ColorsRes.black),
                )),
                Icon(
                  StringsRes.gpay.toLowerCase() == paymentmethod
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: StringsRes.gpay.toLowerCase() == paymentmethod
                      ? ColorsRes.orangeColor
                      : ColorsRes.grayColor,
                ),
              ]),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                paymentmethod = StringsRes.paypal.toLowerCase();
              });
            },
            child: Container(
              decoration: DesignConfig.boxDecorationContainerShadow(
                  ColorsRes.containerShadowColor, 14, 14, 14, 14),
              margin: EdgeInsets.only(top: 5, bottom: 10.0),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(children: [
                SvgPicture.asset(
                  "assets/images/fullApps/foodMaster/paytm.svg",
                  fit: BoxFit.contain,
                  height: 30,
                  width: 70,
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Text(
                  StringsRes.paypal,
                  style: TextStyle(fontSize: 18, color: ColorsRes.black),
                )),
                Icon(
                  StringsRes.paypal.toLowerCase() == paymentmethod
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: StringsRes.paypal.toLowerCase() == paymentmethod
                      ? ColorsRes.orangeColor
                      : ColorsRes.grayColor,
                ),
              ]),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Future callPaymentStatus() async {
    Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (context) => Order_Place()));
    setState(() {
      loadingorder = false;
    });
  }
}
