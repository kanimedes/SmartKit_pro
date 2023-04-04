import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';

import '../../widgets/slideAnimation.dart';

class PaymentSuccessActivity extends StatefulWidget {
  const PaymentSuccessActivity({Key? key}) : super(key: key);

  @override
  _PaymentSuccessActivityState createState() => _PaymentSuccessActivityState();
}

class _PaymentSuccessActivityState extends State<PaymentSuccessActivity>
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
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: SlideAnimation(
                position: 1,
                itemCount: 8,
                slideDirection: SlideDirection.fromTop,
                animationController: _animationController,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close, color: ColorsRes.purpalColor))),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              color: ColorsRes.backgroundColor,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 10,
                  right: MediaQuery.of(context).size.width / 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SlideAnimation(
                        position: 2,
                        itemCount: 8,
                        slideDirection: SlideDirection.fromBottom,
                        animationController: _animationController,
                        child: SvgPicture.asset(
                            "assets/images/fullApps/furnitureHub/payment_success.svg")),
                    SizedBox(height: MediaQuery.of(context).size.height / 60),
                    SlideAnimation(
                      position: 3,
                      itemCount: 8,
                      slideDirection: SlideDirection.fromBottom,
                      animationController: _animationController,
                      child: Text(
                        "\$350.00",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorsRes.purpalColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 60),
                    SlideAnimation(
                      position: 4,
                      itemCount: 8,
                      slideDirection: SlideDirection.fromBottom,
                      animationController: _animationController,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text:
                              'Your payment is complete Please check the delivery status at ',
                          style: TextStyle(
                            color: ColorsRes.greyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Order Tracking',
                                style: TextStyle(
                                  color: ColorsRes.purpalColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                )),
                            TextSpan(
                                text: ' page',
                                style: TextStyle(
                                  color: ColorsRes.greyColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 60),
                    SlideAnimation(
                      position: 5,
                      itemCount: 8,
                      slideDirection: SlideDirection.fromBottom,
                      animationController: _animationController,
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 15,
                        decoration: DesignConfig.boxDecorationContainer(
                            ColorsRes.greenColor, 10.0),
                        child: Text(
                          StringsRes.continueShoppingText,
                          style: TextStyle(
                              fontSize: 14,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
