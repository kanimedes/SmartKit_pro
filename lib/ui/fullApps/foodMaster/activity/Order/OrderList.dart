import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/Order/OrderDetailPage.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Address.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Item.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Order.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Restaurant.dart';

Order? selectedorder;
late int selectedorderindex;
late List<Order> orderlist;
StreamController<String>? orderstreamdata;

class OrderList extends StatefulWidget {
  final dynamic restorant;

  const OrderList({Key? key, this.restorant}) : super(key: key);
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  GlobalKey<ScaffoldState>? scaffoldKey;
  bool isloadmore = true;
  bool ispageLoading = false;
  Status? status;
  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
    orderlist = [
      Order(
          id: 1,
          createdAt: "2021-02-18T11:50:31.000000Z",
          updatedAt: "2021-02-26T12:17:24.000000Z",
          addressId: 1,
          clientId: 1,
          restorantId: 1,
          driverId: 1,
          deliveryPrice: 50,
          orderPrice: 100,
          paymentMethod: "cash on delivery",
          paymentStatus: "",
          comment: "",
          lat: "1.2222",
          lng: "2.56885",
          srtipePaymentId: "1359584555",
          fee: 20,
          feeValue: 10,
          staticFee: 2,
          deliveryMethod: 2,
          deliveryPickupInterval: "",
          vatvalue: 3,
          paymentProcessorFee: 1,
          timeToPrepare: "8:00AM",
          tableId: "1",
          phone: "123654789955",
          whatsappAddress: "12345687",
          paymentLink: "",
          restorant: Restaurant(
              logom:
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_5.jpg?alt=media&token=f7a971b4-f8d4-441e-9f43-7df80f802d90",
              blurUrl: "LRNu|VE1LNrq^hRPNIV[0%#;z;oN",
              localimg: "assets/images/fullApps/foodMaster/Detail_1.jpg",
              name: "Bronx VanNest Restorant",
              address: "6 Yukon Drive Raeford, NC 28376",
              phone: "1241548784524125"),
          items: Item(
              id: 1,
              orderPivot: OrderPivot(
                  qty: 2,
                  extras: "Extra Cheese",
                  itemId: 1,
                  orderId: 1,
                  variantName: "test",
                  variantPrice: 20,
                  vat: 5,
                  vatvalue: 40)),
          status: [Status(name: "done", id: 1, alias: " ")],
          address: Address(address: "6 Yukon Drive Raeford, NC 28376")),
      Order(
          id: 1,
          createdAt: "2021-02-18T11:50:31.000000Z",
          updatedAt: "2021-02-26T12:17:24.000000Z",
          addressId: 1,
          clientId: 1,
          restorantId: 1,
          driverId: 1,
          deliveryPrice: 50,
          orderPrice: 100,
          paymentMethod: "cash on delivery",
          paymentStatus: "",
          comment: "",
          lat: "1.2222",
          lng: "2.56885",
          srtipePaymentId: "1359584555",
          fee: 20,
          feeValue: 10,
          staticFee: 2,
          deliveryMethod: 2,
          deliveryPickupInterval: "",
          vatvalue: 3,
          paymentProcessorFee: 1,
          timeToPrepare: "8:00AM",
          tableId: "1",
          phone: "123654789955",
          whatsappAddress: "12345687",
          paymentLink: "",
          restorant: Restaurant(
              localimg: "assets/images/fullApps/foodMaster/Detail_2.jpg",
              logom:
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_2.jpg?alt=media&token=f83c3e5a-0e9c-49e2-a423-6cca71a4d373",
              blurUrl: "LNNlYvTDyZEg.PD\$X9I.0NITnLs*",
              name: "Bronx VanNest Restorant",
              address: "6 Yukon Drive Raeford, NC 28376",
              phone: "1241548784524125"),
          items: Item(
              id: 1,
              orderPivot: OrderPivot(
                  qty: 2,
                  extras: "Extra Cheese",
                  itemId: 1,
                  orderId: 1,
                  variantName: "test",
                  variantPrice: 20,
                  vat: 5,
                  vatvalue: 40)),
          status: [Status(name: "done", id: 1, alias: " ")],
          address: Address(address: "6 Yukon Drive Raeford, NC 28376")),
      Order(
          id: 1,
          createdAt: "2021-02-18T11:50:31.000000Z",
          updatedAt: "2021-02-26T12:17:24.000000Z",
          addressId: 1,
          clientId: 1,
          restorantId: 1,
          driverId: 1,
          deliveryPrice: 50,
          orderPrice: 100,
          paymentMethod: "cash on delivery",
          paymentStatus: "",
          comment: "",
          lat: "1.2222",
          lng: "2.56885",
          srtipePaymentId: "1359584555",
          fee: 20,
          feeValue: 10,
          staticFee: 2,
          deliveryMethod: 2,
          deliveryPickupInterval: "",
          vatvalue: 3,
          paymentProcessorFee: 1,
          timeToPrepare: "8:00AM",
          tableId: "1",
          phone: "123654789955",
          whatsappAddress: "12345687",
          paymentLink: "",
          restorant: Restaurant(
              localimg: "assets/images/fullApps/foodMaster/Detail_3.jpg",
              logom:
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_3.jpg?alt=media&token=26f47478-19ba-4179-b6ed-a74c422449ec",
              blurUrl: "LlOMy\$%gTeV@xuRiofWA.TM{VYbb",
              name: "Bronx VanNest Restorant",
              address: "6 Yukon Drive Raeford, NC 28376",
              phone: "1241548784524125"),
          items: Item(
              id: 1,
              orderPivot: OrderPivot(
                  qty: 2,
                  extras: "Extra Cheese",
                  itemId: 1,
                  orderId: 1,
                  variantName: "test",
                  variantPrice: 20,
                  vat: 5,
                  vatvalue: 40)),
          status: [Status(name: "done", id: 1, alias: " ")],
          address: Address(address: "6 Yukon Drive Raeford, NC 28376")),
      Order(
          id: 1,
          createdAt: "2021-02-18T11:50:31.000000Z",
          updatedAt: "2021-02-26T12:17:24.000000Z",
          addressId: 1,
          clientId: 1,
          restorantId: 1,
          driverId: 1,
          deliveryPrice: 50,
          orderPrice: 100,
          paymentMethod: "cash on delivery",
          paymentStatus: "",
          comment: "",
          lat: "1.2222",
          lng: "2.56885",
          srtipePaymentId: "1359584555",
          fee: 20,
          feeValue: 10,
          staticFee: 2,
          deliveryMethod: 2,
          deliveryPickupInterval: "",
          vatvalue: 3,
          paymentProcessorFee: 1,
          timeToPrepare: "8:00AM",
          tableId: "1",
          phone: "123654789955",
          whatsappAddress: "12345687",
          paymentLink: "",
          restorant: Restaurant(
              localimg: "assets/images/fullApps/foodMaster/Detail_4.jpg",
              logom:
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_4.jpg?alt=media&token=89144de7-cbdb-4cae-a065-95c96774e941",
              blurUrl: "LHH-F_~R0hjF0N-CRjI@wgVu%1jE",
              name: "Bronx VanNest Restorant",
              address: "6 Yukon Drive Raeford, NC 28376",
              phone: "1241548784524125"),
          items: Item(
              id: 1,
              orderPivot: OrderPivot(
                  qty: 2,
                  extras: "Extra Cheese",
                  itemId: 1,
                  orderId: 1,
                  variantName: "test",
                  variantPrice: 20,
                  vat: 5,
                  vatvalue: 40)),
          status: [Status(name: "done", id: 1, alias: " ")],
          address: Address(address: "6 Yukon Drive Raeford, NC 28376")),
      Order(
          id: 1,
          createdAt: "2021-02-18T11:50:31.000000Z",
          updatedAt: "2021-02-26T12:17:24.000000Z",
          addressId: 1,
          clientId: 1,
          restorantId: 1,
          driverId: 1,
          deliveryPrice: 50,
          orderPrice: 100,
          paymentMethod: "cash on delivery",
          paymentStatus: "",
          comment: "",
          lat: "1.2222",
          lng: "2.56885",
          srtipePaymentId: "1359584555",
          fee: 20,
          feeValue: 10,
          staticFee: 2,
          deliveryMethod: 2,
          deliveryPickupInterval: "",
          vatvalue: 3,
          paymentProcessorFee: 1,
          timeToPrepare: "8:00AM",
          tableId: "1",
          phone: "123654789955",
          whatsappAddress: "12345687",
          paymentLink: "",
          restorant: Restaurant(
              localimg: "assets/images/fullApps/foodMaster/Detail_5.jpg",
              logom:
                  "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_5.jpg?alt=media&token=f7a971b4-f8d4-441e-9f43-7df80f802d90",
              blurUrl: "L3Bn[v^404OXK5\$hNGJA050\$}p^4",
              name: "Bronx VanNest Restorant",
              address: "6 Yukon Drive Raeford, NC 28376",
              phone: "1241548784524125"),
          items: Item(
              id: 1,
              orderPivot: OrderPivot(
                  qty: 2,
                  extras: "Extra Cheese",
                  itemId: 1,
                  orderId: 1,
                  variantName: "test",
                  variantPrice: 20,
                  vat: 5,
                  vatvalue: 40)),
          status: [Status(name: "done", id: 1, alias: " ")],
          address: Address(address: "6 Yukon Drive Raeford, NC 28376"))
    ];
    for (int i = 0; i < statuslist.length; i++) {
      status = statuslist[i];
    }

    setupChannel();
  }

  void setupChannel() {
    orderstreamdata = StreamController<String>();
    orderstreamdata!.stream.listen((response) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (orderstreamdata != null && !orderstreamdata!.isClosed) {
      orderstreamdata!.sink.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        key: scaffoldKey,
        appBar: DesignConfig.setAppbar(StringsRes.myorders, context),
        body: Column(children: [
          Expanded(child: orderWidget()),
          Container(
            height: ispageLoading ? 50.0 : 0,
            color: Colors.transparent,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ]));
  }

  orderWidget() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        separatorBuilder: (context, index) => SizedBox(height: 5),
        itemCount: orderlist.length,
        itemBuilder: (context, index) {
          Order order = orderlist[index];
          double totalprice = order.deliveryPrice! + order.orderPrice!;

          return ButtonClickAnimation(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => OrderDetailPage(
                          order: order.id,
                          createAT: order.createdAt,
                          status: order.status,
                          res_name: order.restorant!.name,
                          res_id: order.restorant!.id,
                          res_add: order.restorant!.address,
                          res_ph: order.restorant!.phone,
                          res_logom: order.restorant!.logom,
                          res_blur: order.restorant!.blurUrl,
                          res_localimg: order.restorant!.localimg,
                          item_qt: order.items!.orderPivot!.qty,
                          item_price: order.items!.price,
                          item_vat: order.items!.orderPivot!.vat.toString(),
                          item_vatvalue: order.items!.orderPivot!.vatvalue,
                          item_variant: order.items!.orderPivot!.variantName,
                          order_price: order.orderPrice,
                          order_vatValue: order.vatvalue,
                          order_de: order.deliveryPrice)));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10, top: 10.0),
              decoration: DesignConfig.boxDecorationContainerShadow(
                  ColorsRes.containerShadowColor, 14, 14, 14, 14),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: ColorsRes.grayColor,
                              child: ClipOval(
                                child: OctoImage(
                                  image: CachedNetworkImageProvider(
                                      order.restorant!.logom!),
                                  placeholderBuilder: OctoPlaceholder.blurHash(
                                      order.restorant!.blurUrl!),
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.fill,
                                  errorBuilder:
                                      OctoError.icon(color: ColorsRes.black),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          "${Constant.getFormatparse(order.createdAt!)}\t\t\t\u2022${order.items!.id} Items",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .merge(TextStyle(
                                                  color: ColorsRes.grayColor
                                                      .withOpacity(0.7))),
                                        )),
                                        Text(
                                            "${Constant.currencysymbol}$totalprice",
                                            style: Theme.of(context)
                                                .textTheme
                                                .button!
                                                .merge(TextStyle(
                                                    color: ColorsRes.black,
                                                    fontWeight:
                                                        FontWeight.normal))),
                                      ],
                                    ),
                                    Text(
                                      order.restorant!.name!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .merge(TextStyle(
                                              fontWeight: FontWeight.normal)),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Row(
                                          children: [
                                            Text(
                                              Constant.getDeliveryMethodName(
                                                  order.deliveryMethod),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .merge(TextStyle()),
                                            ),
                                            Text(
                                              "\t\u2022\t",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .merge(TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color:
                                                          ColorsRes.grayColor)),
                                            ),
                                            Text(
                                              order.status!.last.name!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .merge(TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: ColorsRes
                                                          .orangeColor)),
                                            ),
                                          ],
                                        )),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          color: ColorsRes.grayColor,
                                        )
                                      ],
                                    ),
                                  ]),
                            ),
                          ]),
                    ]),
              ),
            ),
          );
        });
  }
}
