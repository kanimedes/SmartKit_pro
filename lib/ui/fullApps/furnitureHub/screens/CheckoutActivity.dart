import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';

import '../../widgets/slideAnimation.dart';
import 'PaymentSuccessActivity.dart';
import 'PaymentsActivity.dart';
import 'ShippingAddressActivity.dart';

class CheckoutActivity extends StatefulWidget {
  const CheckoutActivity({Key? key}) : super(key: key);

  @override
  _CheckoutActivityState createState() => _CheckoutActivityState();
}

class _CheckoutActivityState extends State<CheckoutActivity>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  String address = StringsRes.homeText;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  Widget showHomeAddress() {
    return SlideAnimation(
      position: 3,
      itemCount: 11,
      slideDirection: SlideDirection.fromLeft,
      animationController: _animationController,
      child: GestureDetector(
        onTap: () {
          setState(() {
            address = StringsRes.homeText;
          });
        },
        child: Container(
          decoration: DesignConfig.buttonShadowColor(ColorsRes.white, 10),
          margin: EdgeInsets.only(
              top: 5,
              bottom: 5.0,
              left: MediaQuery.of(context).size.width / 20,
              right: MediaQuery.of(context).size.width / 20),
          child: Container(
            decoration: address == StringsRes.homeText
                ? DesignConfig.boxDecorationBorderButtonColor(
                    ColorsRes.yellowColor, 10)
                : DesignConfig.boxDecorationBorderButtonColor(
                    ColorsRes.white, 10),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(children: [
              Row(
                children: [
                  Icon(
                    address == StringsRes.homeText
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off,
                    color: address == StringsRes.homeText
                        ? ColorsRes.yellowColor
                        : ColorsRes.yellowColor,
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      StringsRes.homeText,
                      style:
                          TextStyle(fontSize: 16, color: ColorsRes.purpalColor),
                    ),
                  ),
                  Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: DesignConfig.circleButton(),
                    child: Icon(Icons.remove,
                        color: ColorsRes.greyColor, size: 15),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(width: 30.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "09876543210",
                          style: TextStyle(
                              fontSize: 14, color: ColorsRes.greyColor),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "658 Yost island Apt, Seattle, US",
                          style: TextStyle(
                              fontSize: 14, color: ColorsRes.greyColor),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget showWorkAddress() {
    return SlideAnimation(
      position: 4,
      itemCount: 11,
      slideDirection: SlideDirection.fromLeft,
      animationController: _animationController,
      child: GestureDetector(
        onTap: () {
          setState(() {
            address = StringsRes.workText;
          });
        },
        child: Container(
          decoration: DesignConfig.buttonShadowColor(ColorsRes.white, 10),
          margin: EdgeInsets.only(
              top: 5,
              bottom: 5.0,
              left: MediaQuery.of(context).size.width / 20,
              right: MediaQuery.of(context).size.width / 20),
          child: Container(
            decoration: address == StringsRes.workText
                ? DesignConfig.boxDecorationBorderButtonColor(
                    ColorsRes.yellowColor, 10)
                : DesignConfig.boxDecorationBorderButtonColor(
                    ColorsRes.white, 10),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(children: [
              Row(
                children: [
                  Icon(
                    address == StringsRes.workText
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off,
                    color: address == StringsRes.workText
                        ? ColorsRes.yellowColor
                        : ColorsRes.yellowColor,
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      StringsRes.workText,
                      style:
                          TextStyle(fontSize: 16, color: ColorsRes.purpalColor),
                    ),
                  ),
                  Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: DesignConfig.circleButton(),
                    child: Icon(Icons.remove,
                        color: ColorsRes.greyColor, size: 15),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(width: 30.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "09898253652",
                          style: TextStyle(
                              fontSize: 14, color: ColorsRes.greyColor),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "72 Markham Apt, Ontario, CA",
                          style: TextStyle(
                              fontSize: 14, color: ColorsRes.greyColor),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget showOtherAddress() {
    return SlideAnimation(
      position: 5,
      itemCount: 11,
      slideDirection: SlideDirection.fromLeft,
      animationController: _animationController,
      child: GestureDetector(
        onTap: () {
          setState(() {
            address = StringsRes.otherText;
          });
        },
        child: Container(
          decoration: DesignConfig.buttonShadowColor(ColorsRes.white, 10),
          margin: EdgeInsets.only(
              top: 5,
              bottom: 10.0,
              left: MediaQuery.of(context).size.width / 20,
              right: MediaQuery.of(context).size.width / 20),
          child: Container(
            decoration: address == StringsRes.otherText
                ? DesignConfig.boxDecorationBorderButtonColor(
                    ColorsRes.yellowColor, 10)
                : DesignConfig.boxDecorationBorderButtonColor(
                    ColorsRes.white, 10),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Column(children: [
              Row(
                children: [
                  Icon(
                    address == StringsRes.otherText
                        ? Icons.radio_button_checked
                        : Icons.radio_button_off,
                    color: address == StringsRes.otherText
                        ? ColorsRes.yellowColor
                        : ColorsRes.yellowColor,
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      StringsRes.otherText,
                      style:
                          TextStyle(fontSize: 16, color: ColorsRes.purpalColor),
                    ),
                  ),
                  Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: DesignConfig.circleButton(),
                    child: Icon(Icons.remove,
                        color: ColorsRes.greyColor, size: 15),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(width: 30.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "09898253652",
                          style: TextStyle(
                              fontSize: 14, color: ColorsRes.greyColor),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "72 Markham Apt, Ontario, CA",
                          style: TextStyle(
                              fontSize: 14, color: ColorsRes.greyColor),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget showBottom() {
    return SlideAnimation(
      position: 9,
      itemCount: 11,
      slideDirection: SlideDirection.fromBottom,
      animationController: _animationController,
      child: Container(
          height: MediaQuery.of(context).size.height / 8,
          margin: EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              top: MediaQuery.of(context).size.height / 40),
          child: Column(
            children: [
              Divider(
                color: ColorsRes.greyColor,
                height: 2.3,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 60),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Total Price:",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: ColorsRes.violateColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$350.00",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: ColorsRes.yellowColor,
                          fontSize: 29,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentSuccessActivity(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 0.0),
                    padding: EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 11.0, bottom: 11.0),
                    decoration: DesignConfig.boxDecorationContainer(
                        ColorsRes.greenColor, 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringsRes.payNowText,
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.play_arrow, color: ColorsRes.white)
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        appBar: AppBar(
          backgroundColor: ColorsRes.backgroundColor,
          shadowColor: Colors.transparent,
          title: Text(
            StringsRes.checkoutText,
            style: TextStyle(
                color: ColorsRes.violateColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            child: Divider(
              color: ColorsRes.greyColor,
              height: 2.3,
            ),
            preferredSize: Size(50, 5),
          ),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SlideAnimation(
                position: 1,
                itemCount: 11,
                slideDirection: SlideDirection.fromTop,
                animationController: _animationController,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios,
                        color: ColorsRes.purpalColor))),
          ),
        ),
        bottomNavigationBar: showBottom(),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 40,
                right: MediaQuery.of(context).size.width / 40),
            color: ColorsRes.backgroundColor,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  SlideAnimation(
                    position: 2,
                    itemCount: 11,
                    slideDirection: SlideDirection.fromLeft,
                    animationController: _animationController,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 20),
                      child: Text(
                        StringsRes.paymentMethodText,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorsRes.purpalColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 60),
                  showHomeAddress(),
                  SizedBox(height: MediaQuery.of(context).size.height / 99),
                  showWorkAddress(),
                  SizedBox(height: MediaQuery.of(context).size.height / 99),
                  showOtherAddress(),
                  SizedBox(height: MediaQuery.of(context).size.height / 80),
                  SlideAnimation(
                    position: 6,
                    itemCount: 11,
                    slideDirection: SlideDirection.fromLeft,
                    animationController: _animationController,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShippingAddressActivity(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 20,
                            right: MediaQuery.of(context).size.width / 20),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 15,
                        decoration: DesignConfig.boxDecorationBorderButtonColor(
                            ColorsRes.warmGreyColor, 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 20.0,
                              width: 20.0,
                              decoration: DesignConfig.circleButton(),
                              child: Icon(Icons.add,
                                  color: ColorsRes.greyColor, size: 15),
                              margin: EdgeInsets.only(right: 10.0),
                            ),
                            Text(
                              StringsRes.addLocationText,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: ColorsRes.purpalColor,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 80),
                  SlideAnimation(
                    position: 7,
                    itemCount: 11,
                    slideDirection: SlideDirection.fromLeft,
                    animationController: _animationController,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 20),
                      child: Text(
                        StringsRes.toPayText,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorsRes.purpalColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 60),
                  SlideAnimation(
                    position: 8,
                    itemCount: 11,
                    slideDirection: SlideDirection.fromLeft,
                    animationController: _animationController,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        decoration:
                            DesignConfig.buttonShadowColor(ColorsRes.white, 10),
                        margin: EdgeInsets.only(
                            top: 5,
                            bottom: 5.0,
                            left: MediaQuery.of(context).size.width / 20,
                            right: MediaQuery.of(context).size.width / 20),
                        child: Container(
                          decoration: address == StringsRes.homeText
                              ? DesignConfig.boxDecorationBorderButtonColor(
                                  ColorsRes.yellowColor, 10)
                              : DesignConfig.boxDecorationBorderButtonColor(
                                  ColorsRes.white, 10),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/fullApps/furnitureHub/wallet.svg"),
                                      SizedBox(width: 10.0),
                                      Text(
                                        "Pay Using",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: ColorsRes.greyColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      SizedBox(width: 30.0),
                                      Text(
                                        "Apple Pay",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ColorsRes.purpalColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ]),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PaymentsActivity(),
                                    ),
                                  );
                                },
                                child: Text(
                                  StringsRes.changeText,
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: ColorsRes.yellowColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                ]),
          ),
        ));
  }
}
