import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/CartModel.dart';

import '../../widgets/slideAnimation.dart';
import 'CheckoutActivity.dart';

class CartActivity extends StatefulWidget {
  const CartActivity({Key? key}) : super(key: key);

  @override
  _CartActivityState createState() => _CartActivityState();
}

class _CartActivityState extends State<CartActivity>
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

  Widget cartData() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.6,
      color: ColorsRes.backgroundColor,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: cartList.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return SlideAnimation(
              position: index,
              itemCount: cartList.length,
              slideDirection: SlideDirection.fromBottom,
              animationController: _animationController,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: DesignConfig.buttonShadowDetalColor(
                      ColorsRes.white, 10.0),
                  margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 10.0,
                  ),
                  padding: EdgeInsets.only(top: 12, bottom: 12.0, left: 12.0),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Stack(children: <Widget>[
                                Card(
                                    margin: EdgeInsets.only(bottom: 0.0),
                                    shape: DesignConfig.setRoundedBorder(
                                        Colors.transparent, 10, false),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: OctoImage(
                                      image: CachedNetworkImageProvider(
                                        cartList[index].imgurl!,
                                      ),
                                      placeholderBuilder:
                                          OctoPlaceholder.blurHash(
                                        cartList[index].hash!,
                                      ),
                                      errorBuilder: OctoError.icon(
                                          color: ColorsRes.black),
                                      fit: BoxFit.cover,
                                      width: 105,
                                      height: 105,
                                    )),
                              ]),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cartList[index].name!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: ColorsRes.violateColor,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5)),
                                    SizedBox(height: 5),
                                    Text(
                                      cartList[index].description!,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: ColorsRes.greyColor
                                              .withOpacity(0.7),
                                          fontWeight: FontWeight.normal),
                                      maxLines: 3,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      cartList[index].price!,
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: ColorsRes.yellowColor
                                              .withOpacity(0.7),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (cartList[index].quantity! >
                                                  1) {
                                                cartList[index].quantity =
                                                    (cartList[index].quantity! -
                                                        1);
                                              }
                                            });
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  top: 10.0,
                                                  bottom: 5.0,
                                                  right: 10.0),
                                              decoration: DesignConfig
                                                  .buttonShadowColor(
                                                      ColorsRes.white, 20.0),
                                              padding: EdgeInsets.only(
                                                  bottom: 5.0,
                                                  top: 5.0,
                                                  left: 5.0,
                                                  right: 5.0),
                                              child: Icon(Icons.remove,
                                                  color: ColorsRes.greyColor,
                                                  size: 10.0)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, bottom: 5.0),
                                          child: Text(
                                              cartList[index]
                                                  .quantity
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorsRes.violateColor)),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              cartList[index].quantity =
                                                  (cartList[index].quantity! +
                                                      1);
                                            });
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  top: 10.0,
                                                  bottom: 5.0,
                                                  left: 10.0),
                                              decoration: DesignConfig
                                                  .buttonShadowColor(
                                                      ColorsRes.white, 20.0),
                                              padding: EdgeInsets.only(
                                                  bottom: 5.0,
                                                  top: 5.0,
                                                  left: 5.0,
                                                  right: 5.0),
                                              child: Icon(Icons.add,
                                                  color: ColorsRes.yellowColor,
                                                  size: 10.0)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                              margin: EdgeInsets.only(
                                  top: 1.0, bottom: 5.0, right: 10.0),
                              decoration: DesignConfig.buttonShadowColor(
                                  ColorsRes.backgroundColor, 20.0),
                              padding: EdgeInsets.only(
                                  bottom: 5.0, top: 5.0, left: 5.0, right: 5.0),
                              child: Icon(Icons.close,
                                  color: ColorsRes.greyColor, size: 10.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    _animationController!.repeat();
    return Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        appBar: AppBar(
          backgroundColor: ColorsRes.backgroundColor,
          shadowColor: Colors.transparent,
          title: Text(
            StringsRes.myCartText,
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
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: ColorsRes.backgroundColor,
            child: Column(children: [
              SizedBox(height: MediaQuery.of(context).size.height / 99),
              cartData(),
              Container(
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
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                    builder: (context) => CheckoutActivity(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 0.0),
                                padding: EdgeInsets.only(
                                    left: 30.0,
                                    right: 30.0,
                                    top: 11.0,
                                    bottom: 11.0),
                                decoration: DesignConfig.boxDecorationContainer(
                                    ColorsRes.greenColor, 20.0),
                                child: Text(
                                  StringsRes.checkoutText,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ColorsRes.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ]),
                    ],
                  )),
            ]),
          ),
        ));
  }
}
