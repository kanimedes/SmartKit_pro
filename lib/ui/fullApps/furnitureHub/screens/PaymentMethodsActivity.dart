import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';

import '../../widgets/slideAnimation.dart';

class PaymentMethodsActivity extends StatefulWidget {
  const PaymentMethodsActivity({Key? key}) : super(key: key);

  @override
  _PaymentMethodsActivityState createState() => _PaymentMethodsActivityState();
}

class _PaymentMethodsActivityState extends State<PaymentMethodsActivity>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  String? paymentType = StringsRes.debitText;
  bool isSwitched = false;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    cardNumberController = TextEditingController(text: "1234 5678 9101 1121");
    expDateController = TextEditingController(text: "10 / 2022");
    cVVController = TextEditingController(text: "121");
    cardHolderController = TextEditingController(text: "Alexander Margarita");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  late TextEditingController cardNumberController,
      expDateController,
      cVVController,
      cardHolderController;

  Widget showCardNumber() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 12,
          vertical: MediaQuery.of(context).size.width / 40),
      child: SlideAnimation(
        position: 6,
        itemCount: 11,
        slideDirection: SlideDirection.fromRight,
        animationController: _animationController,
        child: TextField(
          obscureText: true,
          controller: cardNumberController,
          keyboardType: TextInputType.number,
          style: TextStyle(
              color: ColorsRes.greyColor,
              fontSize: 16,
              fontWeight: FontWeight.normal),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15.0),
            hintStyle: TextStyle(
                color: ColorsRes.greyColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            labelStyle: TextStyle(
                color: ColorsRes.purpalColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            filled: false,
            focusColor: ColorsRes.warmGreyColor,
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: ColorsRes.warmGreyColor,
              ),
            ),
            border: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: ColorsRes.warmGreyColor,
                width: 1,
              ),
            ),
            labelText: StringsRes.cardNumberText,
            hintText: StringsRes.enterCardNumberText,
          ),
        ),
      ),
    );
  }

  Widget showExpDate() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 12,
          vertical: MediaQuery.of(context).size.width / 40),
      child: SlideAnimation(
        position: 7,
        itemCount: 11,
        slideDirection: SlideDirection.fromRight,
        animationController: _animationController,
        child: TextField(
          controller: expDateController,
          keyboardType: TextInputType.datetime,
          style: TextStyle(
              color: ColorsRes.greyColor,
              fontSize: 16,
              fontWeight: FontWeight.normal),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15.0),
            hintStyle: TextStyle(
                color: ColorsRes.greyColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            labelStyle: TextStyle(
                color: ColorsRes.purpalColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            filled: false,
            focusColor: ColorsRes.warmGreyColor,
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: ColorsRes.warmGreyColor,
              ),
            ),
            border: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: ColorsRes.warmGreyColor,
                width: 1,
              ),
            ),
            labelText: StringsRes.expDateText,
            hintText: StringsRes.enterExpDateText,
          ),
        ),
      ),
    );
  }

  Widget showCVV() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 12,
          vertical: MediaQuery.of(context).size.width / 40),
      child: SlideAnimation(
        position: 8,
        itemCount: 11,
        slideDirection: SlideDirection.fromRight,
        animationController: _animationController,
        child: TextField(
          obscureText: true,
          controller: cVVController,
          keyboardType: TextInputType.number,
          style: TextStyle(
              color: ColorsRes.greyColor,
              fontSize: 16,
              fontWeight: FontWeight.normal),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15.0),
            hintStyle: TextStyle(
                color: ColorsRes.greyColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            labelStyle: TextStyle(
                color: ColorsRes.purpalColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            filled: false,
            focusColor: ColorsRes.warmGreyColor,
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: ColorsRes.warmGreyColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              gapPadding: 0.0,
              borderSide: BorderSide(
                color: ColorsRes.warmGreyColor,
                width: 1,
              ),
            ),
            labelText: StringsRes.cVVText,
            hintText: StringsRes.enterCVVText,
          ),
        ),
      ),
    );
  }

  Widget showCardHolder() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 12,
          vertical: MediaQuery.of(context).size.width / 40),
      child: SlideAnimation(
        position: 9,
        itemCount: 11,
        slideDirection: SlideDirection.fromRight,
        animationController: _animationController,
        child: TextField(
          controller: cardHolderController,
          cursorColor: ColorsRes.warmGreyColor,
          keyboardType: TextInputType.datetime,
          style: TextStyle(
              color: ColorsRes.greyColor,
              fontSize: 16,
              fontWeight: FontWeight.normal),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15.0),
            hintStyle: TextStyle(
                color: ColorsRes.greyColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            labelStyle: TextStyle(
                color: ColorsRes.purpalColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            filled: false,
            focusColor: ColorsRes.warmGreyColor,
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: ColorsRes.warmGreyColor,
              ),
            ),
            border: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: ColorsRes.warmGreyColor,
                width: 1,
              ),
            ),
            labelText: StringsRes.cardHolderText,
            hintText: StringsRes.enterCardHolderText,
          ),
        ),
      ),
    );
  }

  Widget showToggle() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 12,
          vertical: MediaQuery.of(context).size.width / 40),
      child: SlideAnimation(
        position: 10,
        itemCount: 11,
        slideDirection: SlideDirection.fromRight,
        animationController: _animationController,
        child: Row(
          children: [
            Expanded(
              child: Text(
                StringsRes.saveCardDataForFuturePaymentsText,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: ColorsRes.purpalColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Switch(
              value: isSwitched,
              activeColor: ColorsRes.greenColor,
              activeTrackColor: ColorsRes.lightGreenColor,
              inactiveThumbColor: ColorsRes.greenColor,
              inactiveTrackColor: ColorsRes.deactiveColor,
              onChanged: (bool value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ],
        ),
      ),
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
            StringsRes.paymentMethodText,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: SlideAnimation(
                          position: 3,
                          itemCount: 11,
                          slideDirection: SlideDirection.fromLeft,
                          animationController: _animationController,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                paymentType = StringsRes.creditText;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 20),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 15,
                              decoration: paymentType == StringsRes.creditText
                                  ? DesignConfig.boxDecorationContainer(
                                      ColorsRes.yellowColor, 10.0)
                                  : DesignConfig.boxDecorationBorderButtonColor(
                                      ColorsRes.deactiveColor, 10.0),
                              child: Text(
                                StringsRes.creditText,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: paymentType == StringsRes.creditText
                                        ? ColorsRes.white
                                        : ColorsRes.deactiveColor,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SlideAnimation(
                          position: 4,
                          itemCount: 11,
                          slideDirection: SlideDirection.fromLeft,
                          animationController: _animationController,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                paymentType = StringsRes.debitText;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 20),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 15,
                              decoration: paymentType == StringsRes.debitText
                                  ? DesignConfig.boxDecorationContainer(
                                      ColorsRes.yellowColor, 10.0)
                                  : DesignConfig.boxDecorationBorderButtonColor(
                                      ColorsRes.deactiveColor, 10.0),
                              child: Text(
                                StringsRes.debitText,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: paymentType == StringsRes.debitText
                                        ? ColorsRes.white
                                        : ColorsRes.deactiveColor,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SlideAnimation(
                          position: 5,
                          itemCount: 11,
                          slideDirection: SlideDirection.fromLeft,
                          animationController: _animationController,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                paymentType = StringsRes.visaText;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 20,
                                  right:
                                      MediaQuery.of(context).size.width / 20),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 15,
                              decoration: paymentType == StringsRes.visaText
                                  ? DesignConfig.boxDecorationContainer(
                                      ColorsRes.yellowColor, 10.0)
                                  : DesignConfig.boxDecorationBorderButtonColor(
                                      ColorsRes.deactiveColor, 10.0),
                              child: Text(
                                StringsRes.visaText,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: paymentType == StringsRes.visaText
                                        ? ColorsRes.white
                                        : ColorsRes.deactiveColor,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  showCardNumber(),
                  SizedBox(height: MediaQuery.of(context).size.height / 99),
                  Row(
                    children: [
                      Expanded(child: showExpDate()),
                      Expanded(child: showCVV()),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 80),
                  showCardHolder(),
                  SizedBox(height: MediaQuery.of(context).size.height / 80),
                  showToggle(),
                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                  SlideAnimation(
                    position: 11,
                    itemCount: 11,
                    slideDirection: SlideDirection.fromBottom,
                    animationController: _animationController,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 20,
                            right: MediaQuery.of(context).size.width / 20,
                            top: MediaQuery.of(context).size.width / 2.5),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 15,
                        decoration: DesignConfig.boxDecorationContainer(
                            ColorsRes.greenColor, 10.0),
                        child: Text(
                          StringsRes.addToCartText,
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
