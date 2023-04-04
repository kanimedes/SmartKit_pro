// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopString.dart';

import 'HappyShopHome.dart';

class HappyShopCheckout extends StatefulWidget {
  const HappyShopCheckout({Key? key}) : super(key: key);

  @override
  _HappyShopCheckoutState createState() => _HappyShopCheckoutState();
}

class _HappyShopCheckoutState extends State<HappyShopCheckout>
    with TickerProviderStateMixin {
  int _curIndex = 0;
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  late List<Widget> fragments;
  Animation? buttonSqueezeanimation;
  late AnimationController buttonController;
  @override
  void initState() {
    super.initState();

    fragments = [Delivery(), Address(), Payment()];
    buttonController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);

    buttonSqueezeanimation = new Tween(
      begin: deviceWidth * 0.7,
      end: 50.0,
    ).animate(new CurvedAnimation(
      parent: buttonController,
      curve: new Interval(
        0.0,
        0.150,
      ),
    ));
  }

  @override
  void dispose() {
    buttonController.dispose();
    super.dispose();
  }

  getAppBar(String title, BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: primary),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: primary,
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.white,
      elevation: 5,
    );
  }

  stepper() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          InkWell(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _curIndex == 0 ? primary : Colors.grey,
                  ),
                  width: 20,
                  height: 20,
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Text("  " + DELIVERY + "  ",
                    style: TextStyle(color: _curIndex == 0 ? primary : null)),
              ],
            ),
            onTap: () {
              setState(() {
                _curIndex = 0;
              });
            },
          ),
          Expanded(child: Divider()),
          InkWell(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _curIndex == 1 ? primary : Colors.grey,
                  ),
                  width: 20,
                  height: 20,
                  child: Center(
                    child: Text(
                      "2",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Text("  " + ADDRESS_LBL + "  ",
                    style: TextStyle(color: _curIndex == 1 ? primary : null)),
              ],
            ),
            onTap: () {
              setState(() {
                _curIndex = 1;
              });
            },
          ),
          Expanded(child: Divider()),
          InkWell(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _curIndex == 2 ? primary : Colors.grey,
                  ),
                  width: 20,
                  height: 20,
                  child: Center(
                    child: Text(
                      "3",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Text("  " + PAYMENT + "  ",
                    style: TextStyle(color: _curIndex == 2 ? primary : null)),
              ],
            ),
            onTap: () {
              if (_curIndex == 0) {
                setState(() {
                  _curIndex = 1;
                });
              } else {
                setState(() {
                  _curIndex = 2;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: getAppBar(CHECKOUT, context),
      body: Column(
        children: [
          stepper(),
          Divider(),
          Expanded(child: fragments[_curIndex]),
        ],
      ),
      persistentFooterButtons: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  TOTAL + " : " + CUR_CURRENCY + " " + "6100",
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_curIndex == 0) {
                  setState(() {
                    _curIndex = _curIndex + 1;
                  });
                } else if (_curIndex == 1) {
                  setState(() {
                    _curIndex = _curIndex + 1;
                  });
                } else if (_curIndex == 2) {
                  showSuccessDialog();
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                  ),
                  primary: Colors.transparent,
                  padding: EdgeInsets.all(0.0)),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: happyshopgradient,
                ),
                child: Container(
                  height: 40.0,
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  alignment: Alignment.center,
                  child: Text(
                    _curIndex == 2 ? PROCEED : CONTINUE,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  showSuccessDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            content: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  Lottie.asset(
                    "assets/images/fullApps/happyshop/OrderSuccess.json",
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    child: Text(
                      "Your Order Successfully Place",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .merge(TextStyle(
                            color: lightblack,
                            letterSpacing: 0.5,
                          )),
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HappyShopHome()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: primary,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 8,
                              color: Colors.white,
                              offset: Offset(
                                -5,
                                -5,
                              ),
                            ),
                            BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 2,
                              color: white,
                              offset: Offset(
                                -2,
                                -2,
                              ),
                            ),
                            BoxShadow(
                              spreadRadius: 1,
                              blurRadius: 4,
                              color: white.withOpacity(0.5),
                              offset: Offset(
                                4,
                                4,
                              ),
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(
                            30.0,
                          ))),
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(
                        "Continue Shopping",
                        style: Theme.of(context).textTheme.headline6!.merge(
                            TextStyle(color: Colors.white, letterSpacing: 0.5)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class Delivery extends StatefulWidget {
  const Delivery();

  @override
  State<StatefulWidget> createState() {
    return StateDelivery();
  }
}

class StateDelivery extends State<Delivery> with TickerProviderStateMixin {
  Animation? buttonSqueezeanimation;
  late AnimationController buttonController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        _deliveryContent(),
      ],
    ));
  }

  @override
  void initState() {
    super.initState();
    buttonController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);

    buttonSqueezeanimation = new Tween(
      begin: deviceWidth * 0.7,
      end: 50.0,
    ).animate(new CurvedAnimation(
      parent: buttonController,
      curve: new Interval(
        0.0,
        0.150,
      ),
    ));
  }

  @override
  void dispose() {
    buttonController.dispose();
    super.dispose();
  }

  _deliveryContent() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        PROMOCODE_LBL,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      child: Icon(Icons.refresh),
                      onTap: () {},
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          enabled: false,
                          isDense: true,
                          contentPadding: EdgeInsets.all(
                            10,
                          ),
                          hintText: 'Promo Code..',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primary),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primary),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(0.0),
                          primary: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                          ),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: happyshopgradient,
                          ),
                          child: Container(
                            constraints: BoxConstraints(
                                minWidth: 98.0,
                                minHeight:
                                    36.0), // min sizes for Material buttons
                            alignment: Alignment.center,
                            child: const Text(
                              'Apply',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0, top: 10),
                  child: Text(
                    ORDER_SUMMARY,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                kIsWeb
                    ? Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Expanded(flex: 5, child: Text(PRODUCTNAME)),
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          QUANTITY_LBL,
                                          textAlign: TextAlign.end,
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          PRICE_LBL,
                                          textAlign: TextAlign.end,
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          SUBTOTAL,
                                          textAlign: TextAlign.end,
                                        )),
                                  ],
                                ),
                                Divider(),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 1,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return orderItem(index);
                                    }),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 28,
                                      bottom: 8.0,
                                      left: 35,
                                      right: 35),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        SUB,
                                      ),
                                      Spacer(),
                                      Text(CUR_CURRENCY + "5000")
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 35, right: 35, top: 8, bottom: 8),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        DELIVERY_CHARGE,
                                      ),
                                      Spacer(),
                                      Text(CUR_CURRENCY + " 250")
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 35, right: 35, top: 8, bottom: 8),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        TAXPER + "(18 %)",
                                      ),
                                      Spacer(),
                                      Text(CUR_CURRENCY + " 900")
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 35, right: 35, top: 8, bottom: 8),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        PROMO_LBL + " (promocode)",
                                      ),
                                      Spacer(),
                                      Text(CUR_CURRENCY + " 50")
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8, left: 35, right: 35),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        TOTAL_PRICE,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      Text(
                                        CUR_CURRENCY + '6100',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: const [
                                  Expanded(flex: 5, child: Text(PRODUCTNAME)),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        QUANTITY_LBL,
                                        textAlign: TextAlign.end,
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        PRICE_LBL,
                                        textAlign: TextAlign.end,
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        SUBTOTAL,
                                        textAlign: TextAlign.end,
                                      )),
                                ],
                              ),
                              Divider(),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 1,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return orderItem(index);
                                  }),
                            ],
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 28, bottom: 8.0, left: 0, right: 0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      SUB,
                                    ),
                                    Spacer(),
                                    Text(CUR_CURRENCY + "5000")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      DELIVERY_CHARGE,
                                    ),
                                    Spacer(),
                                    Text(CUR_CURRENCY + " 250")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      TAXPER + "(18 %)",
                                    ),
                                    Spacer(),
                                    Text(CUR_CURRENCY + " 900")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 8, bottom: 8),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      PROMO_LBL + " (promocode)",
                                    ),
                                    Spacer(),
                                    Text(CUR_CURRENCY + " 50")
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8, left: 0, right: 0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      TOTAL_PRICE,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    Text(
                                      CUR_CURRENCY + '6100',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      )
              ],
            ),
          ),
        ),
      ],
    ));
  }

  orderItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: const [
          Expanded(
              flex: 5,
              child: Text(
                "Nike",
              )),
          Expanded(
              flex: 1,
              child: Text(
                "2",
                textAlign: TextAlign.end,
              )),
          Expanded(
              flex: 2,
              child: Text(
                "2500",
                textAlign: TextAlign.end,
              )),
          Expanded(
              flex: 2,
              child: Text(
                "5000",
                textAlign: TextAlign.end,
              )),
        ],
      ),
    );
  }
}

class Address extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateAddress();
  }
}

int? selectedAddress;

class StateAddress extends State<Address> with TickerProviderStateMixin {
  Animation? buttonSqueezeanimation;
  late AnimationController buttonController;

  @override
  void initState() {
    super.initState();
    addressList.clear();
    buttonController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);

    buttonSqueezeanimation = new Tween(
      begin: deviceWidth * 0.7,
      end: 50.0,
    ).animate(new CurvedAnimation(
      parent: buttonController,
      curve: new Interval(
        0.0,
        0.150,
      ),
    ));
  }

  @override
  void dispose() {
    buttonController.dispose();
    super.dispose();
  }

  List addressList = [
    {
      "address": "lorem ipsum",
      "area": "Bhuj",
      "city": "Bhuj",
      "state": "Gujrat",
      "country": "India",
      "mobile": "0123456789"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: addressList.isEmpty
              ? Text(NOADDRESS)
              : ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: addressList.length,
                  itemBuilder: (context, index) {
                    return addressItem(index);
                  }),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () async {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: happyshopgradient,
              ),
              child: Container(
                height: 40.0,
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.only(left: 15.0, right: 15.0),

                // min sizes for Material buttons
                alignment: Alignment.center,
                child: Text(
                  ADDADDRESS,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  addressItem(int index) {
    return RadioListTile(
      value: (index),
      groupValue: selectedAddress,
      onChanged: (dynamic val) {},
      title: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              Text(
                addressList[index].name + "  ",
                style: TextStyle(color: Colors.black),
              ),
              Container(
                decoration: BoxDecoration(
                    color: lightgrey, borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.all(3),
                child: Text(
                  addressList[index].type,
                ),
              )
            ],
          )),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.edit,
                color: Colors.black54,
                size: 17,
              ),
            ),
            onTap: () async {},
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.delete,
                color: Colors.black54,
                size: 17,
              ),
            ),
          )
        ],
      ),
      isThreeLine: true,
      subtitle: Text(addressList[index]['address'] +
          ", " +
          addressList[index]['area'] +
          ", " +
          addressList[index]['city'] +
          ", " +
          addressList[index]['state'] +
          ", " +
          addressList[index]['country'] +
          "\n" +
          addressList[index]['mobile']),
    );
  }
}

class Payment extends StatefulWidget {
  const Payment();

  @override
  State<StatefulWidget> createState() {
    return StatePayment();
  }
}

class StatePayment extends State<Payment> with TickerProviderStateMixin {
  String? allowDay, startingDate;
  bool? cod, paypal, razorpay, paumoney, paystack, flutterwave;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<String> paymentMethodList = [
    COD_LBL,
    PAYPAL_LBL,
    PAYUMONEY_LBL,
    RAZORPAY_LBL,
    PAYSTACK_LBL,
    FLUTTERWAVE_LBL
  ];
  Animation? buttonSqueezeanimation;
  late AnimationController buttonController;

  @override
  void initState() {
    super.initState();
    buttonController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);

    buttonSqueezeanimation = new Tween(
      begin: deviceWidth * 0.7,
      end: 50.0,
    ).animate(new CurvedAnimation(
      parent: buttonController,
      curve: new Interval(
        0.0,
        0.150,
      ),
    ));
  }

  @override
  void dispose() {
    buttonController.dispose();
    super.dispose();
  }

  bool? _isUseWallet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: kIsWeb
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CheckboxListTile(
                        dense: true,
                        contentPadding: EdgeInsets.all(0),
                        value: _isUseWallet,
                        onChanged: (bool? value) {
                          setState(() {
                            _isUseWallet = value;
                          });
                        },
                        title: Text(
                          USE_WALLET,
                          style: TextStyle(fontSize: 15, color: primary),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "250.0",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ),
                    )),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 4,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    PREFERED_TIME,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 5,
                                      itemBuilder: (context, index) {
                                        return dateCell(index);
                                      }),
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 4,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    PAYMENT_METHOD_LBL,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 6,
                                    itemBuilder: (context, index) {
                                      return paymentItem(index);
                                    }),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CheckboxListTile(
                        dense: true,
                        contentPadding: EdgeInsets.all(0),
                        value: _isUseWallet,
                        onChanged: (bool? value) {
                          setState(() {
                            _isUseWallet = value;
                          });
                        },
                        title: Text(
                          USE_WALLET,
                          style: TextStyle(fontSize: 15, color: primary),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "250.0",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ),
                    )),
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              PREFERED_TIME,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Container(
                            height: 80,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return dateCell(index);
                                }),
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              PAYMENT_METHOD_LBL,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return paymentItem(index);
                              }),
                        ],
                      ),
                    )
                  ],
                ),
        ));
  }

  var isselect = false;
  var selsectindex = 0;
  dateCell(int index) {
    var date = DateTime.now();
    DateTime today = (date);
    return InkWell(
      child: Container(
        decoration: isselect == false
            ? BoxDecoration(
                border: Border.all(color: primary),
                borderRadius: BorderRadius.circular(10),
                color: selsectindex != index ? Colors.white : primary)
            : BoxDecoration(
                border: Border.all(color: primary),
                borderRadius: BorderRadius.circular(10),
                color: selsectindex != index ? Colors.white : primary),
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('EEE').format(today.add(Duration(days: index))),
              style: TextStyle(color: Colors.black54),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                DateFormat('dd').format(today.add(Duration(days: index))),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selsectindex == index ? Colors.white : primary),
              ),
            ),
            Text(
              DateFormat('MMM').format(today.add(Duration(days: index))),
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          selsectindex = index;

          isselect != true ? isselect = true : isselect = false;
        });
      },
    );
  }

  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 1.0,
    ));
  }

  Widget timeSlotItem(int index) {
    var selectedTime;
    return RadioListTile(
      dense: true,
      value: (index),
      groupValue: selectedTime,
      onChanged: (dynamic val) {},
      title: Text(
        "",
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  int? selectedRadioTile = 0;
  Widget paymentItem(int index) {
    return RadioListTile(
      value: index,
      groupValue: selectedRadioTile,
      title: Text(
        paymentMethodList[index],
      ),
      onChanged: (dynamic index) {
        setState(() {
          selectedRadioTile = index;
        });
      },
    );
  }
}
