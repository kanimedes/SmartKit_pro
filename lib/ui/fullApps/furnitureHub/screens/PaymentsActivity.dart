import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';

import '../../widgets/slideAnimation.dart';
import 'PaymentMethodsActivity.dart';

class PaymentsActivity extends StatefulWidget {
  const PaymentsActivity({Key? key}) : super(key: key);

  @override
  _PaymentsActivityState createState() => _PaymentsActivityState();
}

class _PaymentsActivityState extends State<PaymentsActivity>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

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
                    child: ListTile(
                      dense: true,
                      leading: SvgPicture.asset(
                          "assets/images/fullApps/furnitureHub/applepay.svg"),
                      title: Text(
                        StringsRes.applePayText,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorsRes.purpalColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: InkWell(
                        child: Text(
                          StringsRes.defaultText,
                          style: TextStyle(
                              color: ColorsRes.yellowColor,
                              fontSize: 10,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 99),
                  SlideAnimation(
                    position: 3,
                    itemCount: 11,
                    slideDirection: SlideDirection.fromLeft,
                    animationController: _animationController,
                    child: ListTile(
                      dense: true,
                      leading: SvgPicture.asset(
                          "assets/images/fullApps/furnitureHub/paypal.svg"),
                      title: Text(
                        StringsRes.paypalText,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorsRes.purpalColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: SvgPicture.asset(
                          "assets/images/fullApps/furnitureHub/back.svg"),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 99),
                  SlideAnimation(
                    position: 4,
                    itemCount: 11,
                    slideDirection: SlideDirection.fromLeft,
                    animationController: _animationController,
                    child: ListTile(
                      dense: true,
                      leading: SvgPicture.asset(
                          "assets/images/fullApps/furnitureHub/gpay.svg"),
                      title: Text(
                        StringsRes.googlePayText,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorsRes.purpalColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: SvgPicture.asset(
                          "assets/images/fullApps/furnitureHub/back.svg"),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 99),
                  SlideAnimation(
                      position: 5,
                      itemCount: 11,
                      slideDirection: SlideDirection.fromLeft,
                      animationController: _animationController,
                      child: Divider(
                        color: ColorsRes.greyColor,
                        indent: MediaQuery.of(context).size.width / 20,
                        endIndent: MediaQuery.of(context).size.width / 20,
                      )),
                  SlideAnimation(
                    position: 6,
                    itemCount: 11,
                    slideDirection: SlideDirection.fromLeft,
                    animationController: _animationController,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 20,
                          top: MediaQuery.of(context).size.height / 50),
                      child: Text(
                        StringsRes.savedCardsText,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorsRes.purpalColor,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
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
                    child: ListTile(
                      dense: true,
                      leading: SvgPicture.asset(
                          "assets/images/fullApps/furnitureHub/mastercard.svg"),
                      title: Text(
                        "Blacksmith Personal",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorsRes.purpalColor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 10.0),
                          Text(
                            "xxxx 5558",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorsRes.greyColor,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      trailing: SvgPicture.asset(
                          "assets/images/fullApps/furnitureHub/back.svg"),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 99),
                  SlideAnimation(
                    position: 8,
                    itemCount: 11,
                    slideDirection: SlideDirection.fromLeft,
                    animationController: _animationController,
                    child: ListTile(
                      dense: true,
                      leading: SvgPicture.asset(
                          "assets/images/fullApps/furnitureHub/mastercard.svg"),
                      title: Text(
                        "Blacksmith Business",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorsRes.purpalColor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 10.0),
                          Text(
                            "xxxx 5558",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorsRes.greyColor,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      trailing: SvgPicture.asset(
                          "assets/images/fullApps/furnitureHub/back.svg"),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 99),
                  SlideAnimation(
                    position: 9,
                    itemCount: 11,
                    slideDirection: SlideDirection.fromLeft,
                    animationController: _animationController,
                    child: ListTile(
                      dense: true,
                      leading: SvgPicture.asset(
                          "assets/images/fullApps/furnitureHub/visacard.svg"),
                      title: Text(
                        "Blacksmith VISA",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorsRes.purpalColor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 10.0),
                          Text(
                            "xxxx 5558",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorsRes.greyColor,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      trailing: SvgPicture.asset(
                          "assets/images/fullApps/furnitureHub/back.svg"),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 99),
                  SlideAnimation(
                    position: 10,
                    itemCount: 11,
                    slideDirection: SlideDirection.fromLeft,
                    animationController: _animationController,
                    child: ListTile(
                      dense: true,
                      leading: SvgPicture.asset(
                          "assets/images/fullApps/furnitureHub/aecard.svg"),
                      title: Text(
                        "Blacksmith AE",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorsRes.purpalColor,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 10.0),
                          Text(
                            "xxxx 5558",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorsRes.greyColor,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      trailing: SvgPicture.asset(
                          "assets/images/fullApps/furnitureHub/back.svg"),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                  SlideAnimation(
                    position: 11,
                    itemCount: 11,
                    slideDirection: SlideDirection.fromBottom,
                    animationController: _animationController,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentMethodsActivity(),
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
                              StringsRes.addMoreCardText,
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
                ]),
          ),
        ));
  }
}
