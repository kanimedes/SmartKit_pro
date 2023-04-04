// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';

class TrackOrdersActivity extends StatefulWidget {
  String? name, orderNo, rating, price, imgurl, hash, image, type;
  TrackOrdersActivity(
      {Key? key,
      this.name,
      this.orderNo,
      this.rating,
      this.price,
      this.imgurl,
      this.hash,
      this.image,
      this.type})
      : super(key: key);

  @override
  _TrackOrdersActivityState createState() => _TrackOrdersActivityState();
}

class _TrackOrdersActivityState extends State<TrackOrdersActivity>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  Widget processingData() {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0, left: 12.0, right: 12.0),
      child: Column(
        children: [
          Row(children: [
            Column(
              children: [
                Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsRes.orangeColor,
                    ),
                    margin: EdgeInsets.only(top: 30.0)),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 30,
                    color: ColorsRes.orangeColor,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/images/fullApps/furnitureHub/trac_placed.svg",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order Placed",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsRes.purpalColor,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.9,
                        child: Text(
                            "We have received your order on 20-Dec-2019",
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 12,
                                color: ColorsRes.greyColor,
                                fontWeight: FontWeight.normal)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
          Row(children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 25,
                    color: ColorsRes.orangeColor,
                    alignment: Alignment.topLeft,
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsRes.orangeColor,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 25,
                    color: ColorsRes.orangeColor,
                    alignment: Alignment.topLeft,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/fullApps/furnitureHub/trac_comnfirm.svg",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order Confirmed",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsRes.purpalColor,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.9,
                        child: Text("We has been confirmed on 20-Dec-2019",
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 12,
                                color: ColorsRes.greyColor,
                                fontWeight: FontWeight.normal)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
          Row(children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 25,
                    color: ColorsRes.orangeColor,
                    alignment: Alignment.topLeft,
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsRes.greenStatusColor,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 25,
                    color: ColorsRes.greyColor,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/fullApps/furnitureHub/trac_processed.svg",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Order Processed",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsRes.greenStatusColor,
                              fontWeight: FontWeight.bold)),
                      Text("We are preparing your order",
                          style: TextStyle(
                              fontSize: 12,
                              color: ColorsRes.greenStatusColor,
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                ],
              ),
            ),
          ]),
          Row(children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 25,
                    color: ColorsRes.greyColor,
                    alignment: Alignment.topLeft,
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsRes.greyColor,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 25,
                    color: ColorsRes.greyColor,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/fullApps/furnitureHub/trac_ship.svg",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Ready to Ship",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsRes.greyColor,
                              fontWeight: FontWeight.bold)),
                      Text("Your order is ready for shipping",
                          style: TextStyle(
                              fontSize: 12,
                              color: ColorsRes.greyColor,
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                ],
              ),
            ),
          ]),
          Row(children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 30,
                    color: ColorsRes.greyColor,
                    alignment: Alignment.topLeft,
                  ),
                ),
                Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsRes.greyColor,
                    ),
                    margin: EdgeInsets.only(bottom: 30.0)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/fullApps/furnitureHub/trac_deliver.svg",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Out for Delivery",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsRes.greyColor,
                              fontWeight: FontWeight.bold)),
                      Text("Your order is Out for Delivery",
                          style: TextStyle(
                              fontSize: 12,
                              color: ColorsRes.greyColor,
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Widget deliveredData() {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0, left: 12.0, right: 12.0),
      child: Column(
        children: [
          Row(children: [
            Column(
              children: [
                Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsRes.orangeColor,
                    ),
                    margin: EdgeInsets.only(top: 30.0)),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 30,
                    color: ColorsRes.orangeColor,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/images/fullApps/furnitureHub/trac_placed.svg",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order Placed",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsRes.purpalColor,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.9,
                        child: Text(
                            "We have received your order on 20-Dec-2019",
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 12,
                                color: ColorsRes.greyColor,
                                fontWeight: FontWeight.normal)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
          Row(children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 25,
                    color: ColorsRes.orangeColor,
                    alignment: Alignment.topLeft,
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsRes.orangeColor,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 25,
                    color: ColorsRes.orangeColor,
                    alignment: Alignment.topLeft,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/fullApps/furnitureHub/trac_comnfirm.svg",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Order Confirmed",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsRes.purpalColor,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.9,
                        child: Text("We has been confirmed on 20-Dec-2019",
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 12,
                                color: ColorsRes.greyColor,
                                fontWeight: FontWeight.normal)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
          Row(children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 25,
                    color: ColorsRes.orangeColor,
                    alignment: Alignment.topLeft,
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsRes.greenStatusColor,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 25,
                    color: ColorsRes.greenStatusColor,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/fullApps/furnitureHub/trac_processed.svg",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Order Processed",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsRes.greenStatusColor,
                              fontWeight: FontWeight.bold)),
                      Text("We are preparing your order",
                          style: TextStyle(
                              fontSize: 12,
                              color: ColorsRes.greenStatusColor,
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                ],
              ),
            ),
          ]),
          Row(children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 25,
                    color: ColorsRes.greenStatusColor,
                    alignment: Alignment.topLeft,
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsRes.greenStatusColor,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 25,
                    color: ColorsRes.greenStatusColor,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/fullApps/furnitureHub/trac_ship_green.svg",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Ready to Ship",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsRes.greenStatusColor,
                              fontWeight: FontWeight.bold)),
                      Text("Your order is ready for shipping",
                          style: TextStyle(
                              fontSize: 12,
                              color: ColorsRes.greenStatusColor,
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                ],
              ),
            ),
          ]),
          Row(children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 3,
                    height: 30,
                    color: ColorsRes.greenStatusColor,
                    alignment: Alignment.topLeft,
                  ),
                ),
                Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsRes.greenStatusColor,
                    ),
                    margin: EdgeInsets.only(bottom: 30.0)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/images/fullApps/furnitureHub/trac_deliver_green.svg",
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Delivery",
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsRes.greenStatusColor,
                              fontWeight: FontWeight.bold)),
                      Text("Your order is Delivery",
                          style: TextStyle(
                              fontSize: 12,
                              color: ColorsRes.greenStatusColor,
                              fontWeight: FontWeight.normal)),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: ColorsRes.backgroundColor,
          shadowColor: Colors.transparent,
          title: Text(
            StringsRes.trackOrdersText,
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
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios,
                      color: ColorsRes.purpalColor))),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            decoration:
                DesignConfig.buttonShadowDetalColor(ColorsRes.white, 10.0),
            margin: EdgeInsets.only(
                top: 10.0,
                left: MediaQuery.of(context).size.width / 20,
                right: MediaQuery.of(context).size.width / 20),
            padding: EdgeInsets.only(
              top: 12,
              bottom: 12.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 12, bottom: 12.0, left: 12.0, right: 12.0),
                      child: Text("Order No : " + widget.orderNo!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsRes.purpalColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5)),
                    ),
                    Divider(color: ColorsRes.greyColor, height: 2.3),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 12, bottom: 12.0, left: 12.0, right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.name!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: ColorsRes.purpalColor,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5)),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Text(
                                    "Total amount : ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ColorsRes.greyColor,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    widget.price!,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ColorsRes.purpalColor,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Card(
                              margin: EdgeInsets.only(bottom: 0.0),
                              shape: DesignConfig.setRoundedBorder(
                                  Colors.transparent, 10, false),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: OctoImage(
                                image: CachedNetworkImageProvider(
                                  widget.imgurl!,
                                ),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  widget.hash!,
                                ),
                                errorBuilder:
                                    OctoError.icon(color: ColorsRes.black),
                                fit: BoxFit.cover,
                                width: 49,
                                height: 49,
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 12.0, left: 12.0, right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ratings : ",
                            style: TextStyle(
                                fontSize: 12,
                                color: ColorsRes.greyColor,
                                fontWeight: FontWeight.normal),
                            maxLines: 1,
                          ),
                          DesignConfig.displayRating(widget.rating!, true),
                        ],
                      ),
                    ),
                    Divider(color: ColorsRes.greyColor, height: 2.3),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 12, left: 12.0, right: 12.0),
                      child: Text(StringsRes.trackOrderText,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorsRes.purpalColor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5)),
                    ),
                    widget.type == "processing"
                        ? processingData()
                        : deliveredData(),
                  ]),
            )));
  }
}
