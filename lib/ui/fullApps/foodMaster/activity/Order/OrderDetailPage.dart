// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/Order/OrderList.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/LifecycleEventHandler.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/flutter_rating_bar.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Address.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Item.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Order.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Restaurant.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderDetailPage extends StatefulWidget {
  final int? order, res_id;
  final String? createAT,
      res_name,
      res_add,
      res_ph,
      res_logom,
      res_blur,
      item_vat,
      res_localimg,
      item_extra;
  final List? status;
  final dynamic item_price,
      item_qt,
      item_vatvalue,
      item_variant,
      order_price,
      order_vatValue,
      order_de;

  const OrderDetailPage(
      {Key? key,
      this.order_de,
      this.order,
      this.createAT,
      this.status,
      this.res_add,
      this.res_id,
      this.res_name,
      this.res_ph,
      this.res_logom,
      this.item_qt,
      this.item_price,
      this.res_blur,
      this.item_vat,
      this.item_vatvalue,
      this.item_extra,
      this.item_variant,
      this.order_price,
      this.res_localimg,
      this.order_vatValue})
      : super(key: key);
  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  GlobalKey<ScaffoldState>? scaffoldKey;
  bool refreshorderlist = false;
  bool ordervisibility = false;
  bool statushistoryvisibility = false;
/*  late CameraPosition _kGooglePlex;
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};*/
  LifecycleEventHandler? lifecycle;
  List<Order?> orderlist = [
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
            blurUrl: "LRN+d}E1LNrq^gRPNIV[0%#;z;oN",
            localimg: "assets/images/fullApps/foodMaster/Detail_1.jpg",
            logom:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_1.jpg?alt=media&token=0bafc4f2-9989-4b81-b38f-a82d8072bc9b",
            name: "Bronx VanNest Restorant",
            address: "6 Yukon Drive Raeford, NC 28376",
            phone: "1241548784524125"),
        items: Item(
            id: 1,
            price: 20,
            name: "Pizza",
            orderPivot: OrderPivot(
                qty: 2,
                extras: "1",
                itemId: 1,
                orderId: 1,
                variantName: "test",
                variantPrice: 20,
                vat: 5,
                vatvalue: 40)),
        status: [
          Status(
              name: "done",
              id: 1,
              alias: " ",
              pivot: Pivot1(
                  createdAt: "2021-02-18T11:50:31.000000Z",
                  orderId: 1,
                  comment: "its good ",
                  statusId: 1,
                  userId: 1))
        ],
        address: Address(address: "6 Yukon Drive Raeford, NC 28376"),
        driver: Driver(name: "anish", phone: "1232468578"))
  ];
  Order? order;
  late Status st;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < orderlist.length; i++) {
      order = orderlist[i];
    }
    for (int j = 0; j < order!.status!.length; j++) {
      st = order!.status![j];
    }

    scaffoldKey = GlobalKey<ScaffoldState>();
    ordervisibility = true;
    statushistoryvisibility = true;
    lifecycle = LifecycleEventHandler(resumeCallBack: () async {});
  }

/*  setMapData() {
    if (order!.deliveryMethod == 1 &&
        order!.driver != null &&
        order!.lat!.trim().isNotEmpty &&
        order!.lng!.trim().isNotEmpty &&
        order!.status![order!.status!.length - 1].id == 6) {
      _markers.clear();
      LatLng position =
          LatLng(double.parse(order!.lat!), double.parse(order!.lng!));
      _markers.add(Marker(
        markerId: MarkerId(position.toString()),
        position: position,
        icon: BitmapDescriptor.defaultMarker,
      ));

      _kGooglePlex = CameraPosition(
        target: LatLng(double.parse(order!.lat!), double.parse(order!.lng!)),
        zoom: 14.4746,
      );
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.backgroundColor,
      key: scaffoldKey,
      appBar: DesignConfig.setAppbar(StringsRes.lblorder, context),
      bottomNavigationBar: IntrinsicHeight(
        child: ButtonClickAnimation(
          onTap: () {
            openRateDialog();
          },
          child: IntrinsicHeight(
            child: Container(
              height: 67.0,
              padding: EdgeInsets.only(top: 13, bottom: 13),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              alignment: Alignment.center,
              decoration: DesignConfig.buttonShadowColor(
                  ColorsRes.continueShoppingGradient1Color,
                  37,
                  ColorsRes.continueShoppingGradient2Color),
              child: Text(
                StringsRes.lblratetoorder,
                style: TextStyle(
                    fontSize: 17,
                    color: ColorsRes.white,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins"),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: orderWidget(),
      ),
    );
  }

  /* getOrderDetail() async {
    setMapData();
    refreshorderlist = true;
  }*/

  @override
  void dispose() {
    if (refreshorderlist &&
        orderstreamdata != null &&
        !orderstreamdata!.isClosed) {
      orderlist[selectedorderindex] = selectedorder;
      orderstreamdata!.sink.add("");
    }
    super.dispose();
  }

  Widget orderWidget() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("#${widget.order}",
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: ColorsRes.orangeColor, fontWeight: FontWeight.bold))),
          Text(
            "${widget.createAT}",
            style: Theme.of(context)
                .textTheme
                .button!
                .merge(TextStyle(color: ColorsRes.black)),
          )
        ],
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Text(
          st.name!,
          style: Theme.of(context).textTheme.bodyText1!.merge(TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              )),
        ),
      ),
      restaurantWidget(),
      orderInfoWidget(),
      commentWidget(),
      priceWidget(),
      paymentMethodWidget(),
      deliveryMethodWidget(),
      driverWidget(),
      if (order!.deliveryMethod == 1 &&
          order!.driver != null &&
          order!.lat!.trim().isNotEmpty &&
          order!.lng!.trim().isNotEmpty &&
          order!.status![order!.status!.length - 1].id ==
              6) //.alias=="picked_up")
        //showMapWidget(),
        statusHistoryWidget(),
    ]);
  }

  Widget restaurantWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: DesignConfig.boxDecorationContainerShadow(
          ColorsRes.containerShadowColor, 14, 14, 14, 14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: ColorsRes.grayColor,
                  child: ClipOval(
                      child: OctoImage(
                    image: CachedNetworkImageProvider(widget.res_logom!),
                    placeholderBuilder:
                        OctoPlaceholder.blurHash(widget.res_blur!),
                    height: 80,
                    width: 80,
                    fit: BoxFit.fill,
                    errorBuilder: OctoError.icon(color: ColorsRes.black),
                  )),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.res_name!,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .merge(TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(
                          widget.res_add!,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .merge(TextStyle(color: ColorsRes.grayColor)),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (widget.res_ph != null &&
                                widget.res_ph!.trim().isNotEmpty) {
                              String url = 'tel:${widget.res_ph}';
                              if (await canLaunch(url) == null) {
                                throw 'Could not launch $url';
                              } else {
                                await launch(url);
                              }
                            }
                          },
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Icon(
                              Icons.call,
                              color: ColorsRes.orangeColor,
                              size: 14,
                            ),
                            SizedBox(width: 10),
                            Text(widget.res_ph!),
                          ]),
                        ),
                      ]),
                ),
              ]),
            ]),
      ),
    );
  }

  Widget orderInfoWidget() {
    return Container(
        margin: EdgeInsets.only(bottom: 10.0),
        decoration: DesignConfig.boxDecorationContainerShadow(
            ColorsRes.containerShadowColor, 14, 14, 14, 14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ButtonClickAnimation(
            onTap: () {
              setState(() {
                ordervisibility = !ordervisibility;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text("\t\t${StringsRes.lblorder}",
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                            TextStyle(
                                color: ColorsRes.black,
                                fontWeight: FontWeight.normal)))),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Icon(
                    ordervisibility
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: ColorsRes.grayColor,
                  ),
                ),
              ],
            ),
          ),
          if (ordervisibility)
            Column(
                children: List.generate(orderlist.length, (index) {
              Item? item = orderlist[index]!.items;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                child: itemWidget(item),
              );
            }))
        ]));
  }

  Widget itemWidget(Item? item) {
    double totalprice = order!.items!.orderPivot!.qty! * order!.items!.price!;
    List<String> variants = widget.item_variant.split(",") ?? [];
    List<Extras> extras = [
      Extras(name: "Extras cheese", itemId: 1, id: 1, price: "20")
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Text("\u2022\t",
            style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                color: ColorsRes.black, fontWeight: FontWeight.bold))),
        Text(order!.items!.name!,
            style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                color: ColorsRes.black, fontWeight: FontWeight.bold))),
      ]),
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Row(children: [
          Text(
              "${widget.item_qt}\tx\t${Constant.currencysymbol}${order!.items!.price}\t=\t${Constant.currencysymbol}$totalprice",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: ColorsRes.grayColor))),
          Text(
              "\t-\t${StringsRes.lblvat.toUpperCase()}\t${widget.item_vat}%\t(${Constant.currencysymbol}${widget.item_vatvalue})",
              style: TextStyle(color: ColorsRes.grayColor, fontSize: 10)),
        ]),
      ),
      Padding(
        padding: EdgeInsets.only(left: 5.0, right: 5),
        child: Text(variants.join("\t>\t")),
      ),
      if (extras.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 10),
          child: Text(StringsRes.lblextras,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: ColorsRes.black)),
        ),
      if (extras.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: List.generate(
                extras.length,
                (index) => Row(children: [
                      Icon(
                        Icons.radio_button_off,
                        color: ColorsRes.black,
                        size: 10,
                      ),
                      SizedBox(width: 8),
                      Text(extras[index].id.toString())
                    ])),
          ),
        ),
      Divider(
        color: ColorsRes.grayColor.withOpacity(0.5),
      )
    ]);
  }

  Widget priceWidget() {
    double nettotal = widget.order_price - widget.order_vatValue;
    double total = order!.orderPrice! + order!.deliveryPrice!;

    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: DesignConfig.boxDecorationContainerShadow(
          ColorsRes.containerShadowColor, 14, 14, 14, 14),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("\t\t${StringsRes.lbltotal}",
            style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                color: ColorsRes.black, fontWeight: FontWeight.normal))),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 5, top: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("${StringsRes.nettotal}\t:",
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: ColorsRes.grayColor)),
            Text("${Constant.currencysymbol}${nettotal.toStringAsFixed(2)}")
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 5),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("${StringsRes.lblvat.toUpperCase()}\t:",
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: ColorsRes.grayColor)),
            Text("${Constant.currencysymbol}${widget.order_vatValue}")
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 5),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("${StringsRes.lblsubtotal}\t:",
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: ColorsRes.grayColor)),
            Text("${Constant.currencysymbol}${widget.order_price}")
          ]),
        ),
        if (order!.deliveryMethod == 1)
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${StringsRes.delivery}\t:"),
                  Text("${Constant.currencysymbol}${widget.order_de}")
                ]),
          ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 5, bottom: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("${StringsRes.lbltotal}\t:",
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: ColorsRes.black, fontWeight: FontWeight.bold))),
            Text("${Constant.currencysymbol}$total",
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: ColorsRes.black, fontWeight: FontWeight.bold)))
          ]),
        ),
      ]),
    );
  }

  Widget paymentMethodWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: DesignConfig.boxDecorationContainerShadow(
          ColorsRes.containerShadowColor, 14, 14, 14, 14),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("\t\t${StringsRes.paymentstatus}",
            style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                color: ColorsRes.black, fontWeight: FontWeight.normal))),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 5, top: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("${StringsRes.paymentmethod}\t:"),
            Text(Constant.setFirstLetterUppercase(order!.paymentMethod),
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: ColorsRes.grayColor)),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 5, bottom: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("${StringsRes.lblstatus}:",
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: ColorsRes.grayColor)),
            Text(
              Constant.setFirstLetterUppercase(order!.paymentStatus),
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ]),
        ),
      ]),
    );
  }

  Widget deliveryMethodWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: DesignConfig.boxDecorationContainerShadow(
          ColorsRes.containerShadowColor, 14, 14, 14, 14),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("\t\t${StringsRes.deliverymethod}",
            style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                color: ColorsRes.black, fontWeight: FontWeight.normal))),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 5, top: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("${StringsRes.deliverymethod}\t:"),
            Text(Constant.getDeliveryMethodName(order!.deliveryMethod),
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: ColorsRes.grayColor)),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 5, bottom: 8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
                order!.deliveryMethod == 1
                    ? StringsRes.deliverytime
                    : StringsRes.pickuptime,
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: ColorsRes.grayColor)),
            Text(
              order!.deliveryPickupInterval!,
              style: TextStyle(
                  fontWeight: FontWeight.normal, color: ColorsRes.grayColor),
            )
          ]),
        ),
      ]),
    );
  }

  Widget commentWidget() {
    return Container(
        margin: EdgeInsets.only(bottom: 10.0),
        decoration: DesignConfig.boxDecorationContainerShadow(
            ColorsRes.containerShadowColor, 14, 14, 14, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("\t\t${StringsRes.comment}",
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: ColorsRes.black, fontWeight: FontWeight.normal))),
            Container(
              width: double.maxFinite,
              padding:
                  const EdgeInsets.only(left: 8, right: 5, top: 5, bottom: 5),
              child: Text(order!.comment!),
            ),
          ],
        ));
  }

  Widget deliveryAddressWidget() {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("\t\t${StringsRes.deliveryaddress}",
            style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                color: ColorsRes.grayColor, fontWeight: FontWeight.bold))),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(left: 8, right: 5, top: 5, bottom: 5),
          child: Text(order!.address!.address!),
        ),
      ],
    ));
  }

/*  Widget showMapWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 22.0),
      decoration: DesignConfig.boxDecorationContainerShadow(
          ColorsRes.containerShadowColor, 14, 14, 14, 14),
      height: 250,
      child: Card(color: Colors.lightBlueAccent,
        shape: DesignConfig.setRoundedBorder(ColorsRes.white, 10, false),
        margin: EdgeInsets.all(0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: GoogleMap(
          padding: EdgeInsets.all(0),
          mapType: MapType.normal,
         initialCameraPosition: _kGooglePlex,
          markers: _markers,
          onTap: (LatLng pos) async {
            final url =
                'https://www.google.com/maps/search/?api=1&query=${*/ /*selectedorder.lat*/ /* order!.lat},${*/ /*selectedorder.lng*/ /* order!.lng}';

            if (await canLaunch(url) != null) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }*/

  Widget statusHistoryWidget() {
    return Container(
        margin: EdgeInsets.only(bottom: 10.0),
        decoration: DesignConfig.boxDecorationContainerShadow(
            ColorsRes.containerShadowColor, 14, 14, 14, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonClickAnimation(
              onTap: () {
                setState(() {
                  statushistoryvisibility = !statushistoryvisibility;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text("\t\t${StringsRes.statushistory}",
                          style: Theme.of(context).textTheme.subtitle1!.merge(
                              TextStyle(
                                  color: ColorsRes.black,
                                  fontWeight: FontWeight.normal)))),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      ordervisibility
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: ColorsRes.grayColor,
                    ),
                  ),
                ],
              ),
            ),
            if (statushistoryvisibility)
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: order!.status!.length,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  itemBuilder: (con, ind) {
                    Status status = order!.status![ind];
                    return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (ind != 0)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                3,
                                (ii) => Padding(
                                    padding: EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        top: ii == 0 ? 0 : 5,
                                        bottom: ii == 2 ? 0 : 5),
                                    child: Container(
                                      height: 3,
                                      width: 2,
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                          Row(children: [
                            Icon(
                              Icons.circle_notifications,
                              color: ColorsRes.orangeColor,
                            ),
                            SizedBox(width: 8),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Text(status.name!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .merge(TextStyle(
                                              color: ColorsRes.black))),
                                  Text(
                                      Constant.getFormatparse(
                                          status.pivot!.createdAt!),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .merge(TextStyle(
                                              color: ColorsRes.grayColor))),
                                ]),
                          ])
                        ]);
                  })
          ],
        ));
  }

  Widget driverWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: DesignConfig.boxDecorationContainerShadow(
          ColorsRes.containerShadowColor, 14, 14, 14, 14),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("\t\t${StringsRes.lbldriver}",
            style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                color: ColorsRes.black, fontWeight: FontWeight.normal))),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 5, top: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("${StringsRes.lblname}\t:"),
            Text(Constant.setFirstLetterUppercase(order!.driver!.name),
                style: TextStyle(
                    fontWeight: FontWeight.normal, color: ColorsRes.grayColor)),
          ]),
        ),
        if (order!.driver!.phone!.trim().isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 5, bottom: 8),
            child: GestureDetector(
              onTap: () async {
                if (widget.res_ph != null && widget.res_ph!.trim().isNotEmpty) {
                  String url = 'tel:${order!.driver!.phone}';
                  if (await canLaunch(url) == null) {
                    throw 'Could not launch $url';
                  } else {
                    await launch(url);
                  }
                }
              },
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(
                  Icons.call,
                  color: ColorsRes.orangeColor,
                  size: 14,
                ),
                SizedBox(width: 10),
                Text(order!.driver!.phone!,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: ColorsRes.grayColor)),
              ]),
            ),
          ),
      ]),
    );
  }

  void openRateDialog() {
    TextEditingController edtmsg = TextEditingController();

    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(StringsRes.addyourreview,
                style: TextStyle(color: ColorsRes.orangeColor)),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        StringsRes.yourratting,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      RatingBar(
                        initialRating: 0.5,
                        minRating: 0.5,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (updaterating) {},
                      ),
                      Text(
                        StringsRes.message,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: edtmsg,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        cursorColor: ColorsRes.orangeColor,
                        //style: TextStyle(color: ColorsRes.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.rate_review),
                          hintText: StringsRes.message,
                          //border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  StringsRes.lblcancel,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text(StringsRes.lblsubmit,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
