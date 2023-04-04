// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/OrderCancelled_Model.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/OrderDelivered_Model.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/OrderProcessing_Model.dart';

import 'TrackOrdersActivity.dart';

class MyOrdersActivity extends StatefulWidget {
  const MyOrdersActivity({Key? key}) : super(key: key);

  @override
  _MyOrdersActivityState createState() => _MyOrdersActivityState();
}

class _MyOrdersActivityState extends State<MyOrdersActivity>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  PageController? _controller;
  bool descTextShowFlag = false;
  TabController? _tabController;
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _tabController = TabController(vsync: this, length: 3);
    _tabController!.addListener(() {
      setState(() {
        _activeIndex = _tabController!.index;
      });
    });
  }

  Widget deliveredData() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.69,
      color: ColorsRes.backgroundColor,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: orderDeliveredList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                decoration:
                    DesignConfig.buttonShadowDetalColor(ColorsRes.white, 10.0),
                margin: EdgeInsets.only(top: 10.0, left: 5, right: 5),
                padding: EdgeInsets.only(
                    top: 12, bottom: 12.0, left: 12.0, right: 12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Order No : " +
                                          orderDeliveredList[index].orderNo!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: ColorsRes.purpalColor,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5)),
                                  Text(orderDeliveredList[index].time!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: ColorsRes.greyColor,
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: 0.5)),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Text(
                                    "Tracking number : ",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: ColorsRes.greyColor,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    orderDeliveredList[index].trackingNo!,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: ColorsRes.purpalColor,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    "Total amount : ",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: ColorsRes.greyColor,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    orderDeliveredList[index].price!,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: ColorsRes.purpalColor,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    orderDeliveredList[index].status!,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ColorsRes.greenStatusColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrackOrdersActivity(
                                            name:
                                                orderDeliveredList[index].name!,
                                            orderNo: orderDeliveredList[index]
                                                .orderNo!,
                                            rating: orderDeliveredList[index]
                                                .rating!,
                                            price: orderDeliveredList[index]
                                                .price!,
                                            imgurl: orderDeliveredList[index]
                                                .imgurl!,
                                            hash:
                                                orderDeliveredList[index].hash!,
                                            image: orderDeliveredList[index]
                                                .image!,
                                            type: "delivered",
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              15,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              15,
                                          top: 7.0,
                                          bottom: 7.0),
                                      decoration: DesignConfig
                                          .boxDecorationBorderButtonColor(
                                              ColorsRes.greyColor, 20.0),
                                      child: Text(
                                        StringsRes.detailsText,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: ColorsRes.purpalColor,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget processingData() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.69,
      color: ColorsRes.backgroundColor,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: orderProcessingList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                decoration:
                    DesignConfig.buttonShadowDetalColor(ColorsRes.white, 10.0),
                margin: EdgeInsets.only(top: 10.0, left: 5, right: 5),
                padding: EdgeInsets.only(
                    top: 12, bottom: 12.0, left: 12.0, right: 12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Order No : " +
                                          orderProcessingList[index].orderNo!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: ColorsRes.purpalColor,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5)),
                                  Text(orderProcessingList[index].time!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: ColorsRes.greyColor,
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: 0.5)),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Text(
                                    "Tracking number : ",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: ColorsRes.greyColor,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    orderProcessingList[index].trackingNo!,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: ColorsRes.purpalColor,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    "Total amount : ",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: ColorsRes.greyColor,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    orderProcessingList[index].price!,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: ColorsRes.purpalColor,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    orderProcessingList[index].status!,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ColorsRes.yellowColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              TrackOrdersActivity(
                                            name: orderProcessingList[index]
                                                .name!,
                                            orderNo: orderProcessingList[index]
                                                .orderNo!,
                                            rating: orderProcessingList[index]
                                                .rating!,
                                            price: orderProcessingList[index]
                                                .price!,
                                            imgurl: orderProcessingList[index]
                                                .imgurl!,
                                            hash: orderProcessingList[index]
                                                .hash!,
                                            image: orderProcessingList[index]
                                                .image!,
                                            type: "processing",
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              15,
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              15,
                                          top: 7.0,
                                          bottom: 7.0),
                                      decoration: DesignConfig
                                          .boxDecorationBorderButtonColor(
                                              ColorsRes.greyColor, 20.0),
                                      child: Text(
                                        StringsRes.detailsText,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: ColorsRes.purpalColor,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget cancelledData() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.69,
      color: ColorsRes.backgroundColor,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: orderCancelledList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                decoration:
                    DesignConfig.buttonShadowDetalColor(ColorsRes.white, 10.0),
                margin: EdgeInsets.only(top: 10.0, left: 5, right: 5),
                padding: EdgeInsets.only(
                    top: 12, bottom: 12.0, left: 12.0, right: 12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Order No : " +
                                          orderProcessingList[index].orderNo!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: ColorsRes.purpalColor,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5)),
                                  Text(orderCancelledList[index].time!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: ColorsRes.greyColor,
                                          fontWeight: FontWeight.normal,
                                          letterSpacing: 0.5)),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Text(
                                    "Tracking number : ",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: ColorsRes.greyColor,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    orderCancelledList[index].trackingNo!,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: ColorsRes.purpalColor,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    "Total amount : ",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: ColorsRes.greyColor,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    orderCancelledList[index].price!,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: ColorsRes.purpalColor,
                                        fontWeight: FontWeight.normal),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    orderCancelledList[index].status!,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: ColorsRes.redColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  /*Container(padding : EdgeInsets.only(left: MediaQuery.of(context).size.width/15, right: MediaQuery.of(context).size.width/15, top: 7.0, bottom: 7.0),decoration: DesignConfig.boxDecorationBorderButtonColor(ColorsRes.greyColor, 20.0),child: Text(StringsRes.detailsText,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: ColorsRes.purpalColor,
                                        fontWeight: FontWeight.normal),),),*/
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
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
            StringsRes.myOrdersText,
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
            margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTabController(
                    length: 3,
                    initialIndex: _activeIndex,
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: TabBar(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        indicatorPadding: EdgeInsets.zero,
                        controller: _tabController,
                        labelColor: ColorsRes.white,
                        unselectedLabelColor: ColorsRes.greyColor,
                        indicator: DesignConfig.buttonShadowColor(
                            ColorsRes.yellowColor, 20.0),
                        labelStyle: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        indicatorColor: Colors.transparent,
                        tabs: [
                          Container(
                            padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                            child: Text(StringsRes.deliveredText,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                            child: Text(StringsRes.processingText,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                            child: Text(StringsRes.cancelledText,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .78,
                    child: TabBarView(controller: _tabController, children: [
                      deliveredData(),
                      processingData(),
                      cancelledData(),
                    ]),
                  ),
                  //categoryData(),
                ])));
  }
}
