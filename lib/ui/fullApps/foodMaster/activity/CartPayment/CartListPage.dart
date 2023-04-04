// ignore_for_file: non_constant_identifier_names, unnecessary_new

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/CartPayment/PaymentPage.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ButtonClickAnimation.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/new_dialog.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Address.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Cart.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Item.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Restaurant.dart';

late Map checkoutdata;
double totalcartprice = 0;
late List<String> cartitems;
TimeSlot? deliverytime;

class CartListPage extends StatefulWidget {
  final String? name,
      logom,
      description,
      localimg,
      extra,
      id1,
      id2,
      address,
      phone,
      openTime,
      closeTime,
      mini,
      blurUrl;
  final List? timeslot;
  final int? id;
  final double? price;
  const CartListPage(
      {Key? key,
      this.id,
      this.name,
      this.price,
      this.logom,
      this.description,
      this.extra,
      this.id1,
      this.id2,
      this.address,
      this.phone,
      this.timeslot,
      this.openTime,
      this.closeTime,
      this.localimg,
      this.mini,
      this.blurUrl})
      : super(key: key);
  @override
  _CartListPageState createState() => _CartListPageState();
}

class _CartListPageState extends State<CartListPage> {
  GlobalKey<ScaffoldState>? scaffoldKey;
  late List<Cart> cartlist;
  bool gettingdata = true;
  bool isnodata = false;
  final _focusStreamSubject = PublishSubject<double>();
  int? a;
  final Future<SharedPreferences> _sprefs = SharedPreferences.getInstance();

  Future<void> DecrementCounter() async {
    final SharedPreferences prefs = await _sprefs;
    setState(() {
      a = a! - 1;
      prefs.setString('counter', a.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    deliveryaddressinfo = addwithfeelist.first;
    deliverycost = double.parse(addwithfeelist.first.cost_total!);
    deliverytime = timeSlotlist.first;
    scaffoldKey = GlobalKey<ScaffoldState>();
    checkoutdata = {};
    a = widget.id;
    cartlist = [
      Cart(
        id: 1,
        extrasprice: 1.1999,
        restaurantid: "1",
        userid: "",
        itemid: "1",
        useritemid: "_1_1",
        userresid: "_1",
        qty: "10",
        variantid: "",
        extrasSelected: "2",
        perprice: "50.3",
        totalprice: widget.price.toString(),
        extradesc: widget.extra,
        extraids: "2",
        itemname: widget.name,
        itemimage: widget.logom,
        itemprice: widget.price.toString(),
        extraslist: [
          Extras(
              id: 1,
              itemId: 1,
              price: "140.0",
              name: "Chicken Supreme Pizza",
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-02-18T10:09:05.000000Z",
              deletedAt: null,
              extraForAllVariants: 1),
          Extras(
              id: 2,
              itemId: 1,
              price: "90.0",
              name: "Chicken Ultimate S/w",
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-02-18T10:09:05.000000Z",
              deletedAt: null,
              extraForAllVariants: 1),
          Extras(
              id: 3,
              itemId: 1,
              price: "200.0",
              name: "Chicken Feast Pizza",
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-02-18T10:09:05.000000Z",
              deletedAt: null,
              extraForAllVariants: 1),
          Extras(
              id: 4,
              itemId: 1,
              price: "75.0",
              name: "Chicken Supreme Pizza",
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-02-18T10:09:05.000000Z",
              deletedAt: null,
              extraForAllVariants: 1)
        ],
        item: Item(
            id: 1,
            name: widget.name,
            description: "chicken on a plate,totilla cake",
            image: widget.logom,
            price: widget.price,
            categoryId: 1,
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-03-04T08:02:48.000000Z",
            available: 1,
            hasVariants: 0,
            vat: 21,
            deletedAt: null,
            logom: widget.logom,
            icon: widget.logom,
            shortDescription: "peeled tomatoes, mozzarella salad,...",
            variants: [],
            categoryName: "Salads",
            blurUrl: widget.blurUrl,
            localimg: widget.localimg,
            extras: [
              Extras(
                  id: 1,
                  itemId: 1,
                  price: "140.0",
                  name: "Chicken Supreme Pizza",
                  createdAt: "2021-02-18T10:09:05.000000Z",
                  updatedAt: "2021-02-18T10:09:05.000000Z",
                  deletedAt: null,
                  extraForAllVariants: 1),
              Extras(
                  id: 2,
                  itemId: 1,
                  price: "90.0",
                  name: "Chicken Ultimate S/w",
                  createdAt: "2021-02-18T10:09:05.000000Z",
                  updatedAt: "2021-02-18T10:09:05.000000Z",
                  deletedAt: null,
                  extraForAllVariants: 1),
              Extras(
                  id: 3,
                  itemId: 1,
                  price: "200.0",
                  name: "Chicken Feast Pizza",
                  createdAt: "2021-02-18T10:09:05.000000Z",
                  updatedAt: "2021-02-18T10:09:05.000000Z",
                  deletedAt: null,
                  extraForAllVariants: 1),
              Extras(
                  id: 4,
                  itemId: 1,
                  price: "75.0",
                  name: "Chicken Supreme Pizza",
                  createdAt: "2021-02-18T10:09:05.000000Z",
                  updatedAt: "2021-02-18T10:09:05.000000Z",
                  deletedAt: null,
                  extraForAllVariants: 1)
            ]),
      ),
      Cart(
          id: 2,
          extrasprice: 2.1999,
          restaurantid: "2",
          userid: "",
          itemid: "2",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "20",
          variantid: "",
          extrasSelected: "2",
          perprice: "6.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [
            Extras(
                id: 5,
                itemId: 2,
                price: "140.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 6,
                itemId: 2,
                price: "90.0",
                name: "Chicken Ultimate S/w",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 7,
                itemId: 2,
                price: "200.0",
                name: "Chicken Feast Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 8,
                itemId: 2,
                price: "75.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5)
          ],
          item: Item(
              id: 2,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              blurUrl: widget.blurUrl,
              localimg: widget.localimg,
              extras: [
                Extras(
                    id: 5,
                    itemId: 2,
                    price: "140.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 6,
                    itemId: 2,
                    price: "90.0",
                    name: "Chicken Ultimate S/w",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 7,
                    itemId: 2,
                    price: "200.0",
                    name: "Chicken Feast Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 8,
                    itemId: 2,
                    price: "75.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5)
              ])),
      Cart(
          id: 3,
          extrasprice: 3.1999,
          restaurantid: "3",
          userid: "",
          itemid: "3",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "11",
          variantid: "",
          extrasSelected: "2",
          perprice: "7.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [
            Extras(
                id: 9,
                itemId: 3,
                price: "140.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 10,
                itemId: 3,
                price: "90.0",
                name: "Chicken Ultimate S/w",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 11,
                itemId: 3,
                price: "200.0",
                name: "Chicken Feast Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 12,
                itemId: 3,
                price: "75.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5)
          ],
          item: Item(
              id: 3,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              blurUrl: widget.blurUrl,
              localimg: widget.localimg,
              extras: [
                Extras(
                    id: 9,
                    itemId: 3,
                    price: "140.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 10,
                    itemId: 3,
                    price: "90.0",
                    name: "Chicken Ultimate S/w",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 11,
                    itemId: 3,
                    price: "200.0",
                    name: "Chicken Feast Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 12,
                    itemId: 3,
                    price: "75.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5)
              ])),
      Cart(
          id: 4,
          extrasprice: 4.1999,
          restaurantid: "4",
          userid: "",
          itemid: "4",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "12",
          variantid: "",
          extrasSelected: "2",
          perprice: "20.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [
            Extras(
                id: 13,
                itemId: 4,
                price: "140.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 14,
                itemId: 4,
                price: "90.0",
                name: "Chicken Ultimate S/w",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 15,
                itemId: 4,
                price: "200.0",
                name: "Chicken Feast Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 16,
                itemId: 4,
                price: "75.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5)
          ],
          item: Item(
              id: 4,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              blurUrl: widget.blurUrl,
              localimg: widget.localimg,
              extras: [
                Extras(
                    id: 13,
                    itemId: 4,
                    price: "140.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 14,
                    itemId: 4,
                    price: "90.0",
                    name: "Chicken Ultimate S/w",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 15,
                    itemId: 4,
                    price: "200.0",
                    name: "Chicken Feast Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 16,
                    itemId: 4,
                    price: "75.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5)
              ])),
      Cart(
          id: 5,
          extrasprice: 5.1999,
          restaurantid: "5",
          userid: "",
          itemid: "5",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "13",
          variantid: "",
          extrasSelected: "2",
          perprice: "6.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [
            Extras(
                id: 17,
                itemId: 5,
                price: "140.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 18,
                itemId: 5,
                price: "90.0",
                name: "Chicken Ultimate S/w",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 19,
                itemId: 5,
                price: "200.0",
                name: "Chicken Feast Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 20,
                itemId: 5,
                price: "75.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5)
          ],
          item: Item(
              id: 5,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              blurUrl: widget.blurUrl,
              localimg: widget.localimg,
              extras: [
                Extras(
                    id: 17,
                    itemId: 5,
                    price: "140.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 18,
                    itemId: 5,
                    price: "90.0",
                    name: "Chicken Ultimate S/w",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 19,
                    itemId: 5,
                    price: "200.0",
                    name: "Chicken Feast Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 20,
                    itemId: 5,
                    price: "75.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5)
              ])),
      Cart(
          id: 6,
          extrasprice: 6.1999,
          restaurantid: "6",
          userid: "",
          itemid: "6",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "14",
          variantid: "",
          extrasSelected: "2",
          perprice: "8.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [
            Extras(
                id: 21,
                itemId: 6,
                price: "140.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 22,
                itemId: 6,
                price: "90.0",
                name: "Chicken Ultimate S/w",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 23,
                itemId: 6,
                price: "200.0",
                name: "Chicken Feast Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 24,
                itemId: 6,
                price: "75.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5)
          ],
          item: Item(
              id: 6,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              blurUrl: widget.blurUrl,
              localimg: widget.localimg,
              extras: [
                Extras(
                    id: 21,
                    itemId: 6,
                    price: "140.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 22,
                    itemId: 6,
                    price: "90.0",
                    name: "Chicken Ultimate S/w",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 23,
                    itemId: 6,
                    price: "200.0",
                    name: "Chicken Feast Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 24,
                    itemId: 6,
                    price: "75.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5)
              ])),
      Cart(
          id: 7,
          extrasprice: 7.1999,
          restaurantid: "7",
          userid: "",
          itemid: "7",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "15",
          variantid: "",
          extrasSelected: "2",
          perprice: "7.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [
            Extras(
                id: 25,
                itemId: 7,
                price: "140.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 26,
                itemId: 7,
                price: "90.0",
                name: "Chicken Ultimate S/w",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 27,
                itemId: 7,
                price: "200.0",
                name: "Chicken Feast Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 28,
                itemId: 7,
                price: "75.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5)
          ],
          item: Item(
              id: 7,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              blurUrl: widget.blurUrl,
              localimg: widget.localimg,
              extras: [
                Extras(
                    id: 25,
                    itemId: 7,
                    price: "140.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 26,
                    itemId: 7,
                    price: "90.0",
                    name: "Chicken Ultimate S/w",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 27,
                    itemId: 7,
                    price: "200.0",
                    name: "Chicken Feast Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 28,
                    itemId: 7,
                    price: "75.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5)
              ])),
      Cart(
          id: 8,
          extrasprice: 8.1999,
          restaurantid: "8",
          userid: "",
          itemid: "8",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "16",
          variantid: "",
          extrasSelected: "2",
          perprice: "9.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [
            Extras(
                id: 29,
                itemId: 8,
                price: "140.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 30,
                itemId: 8,
                price: "90.0",
                name: "Chicken Ultimate S/w",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 31,
                itemId: 8,
                price: "200.0",
                name: "Chicken Feast Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 32,
                itemId: 8,
                price: "75.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5)
          ],
          item: Item(
              id: 8,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              blurUrl: widget.blurUrl,
              localimg: widget.localimg,
              extras: [
                Extras(
                    id: 29,
                    itemId: 8,
                    price: "140.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 30,
                    itemId: 8,
                    price: "90.0",
                    name: "Chicken Ultimate S/w",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 31,
                    itemId: 8,
                    price: "200.0",
                    name: "Chicken Feast Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 32,
                    itemId: 8,
                    price: "75.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5)
              ])),
      Cart(
          id: 9,
          extrasprice: 9.1999,
          restaurantid: "9",
          userid: "",
          itemid: "9",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "17",
          variantid: "",
          extrasSelected: "2",
          perprice: "30.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [
            Extras(
                id: 33,
                itemId: 9,
                price: "140.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 34,
                itemId: 9,
                price: "90.0",
                name: "Chicken Ultimate S/w",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 35,
                itemId: 9,
                price: "200.0",
                name: "Chicken Feast Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 36,
                itemId: 9,
                price: "75.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5)
          ],
          item: Item(
              id: 9,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              blurUrl: widget.blurUrl,
              localimg: widget.localimg,
              extras: [
                Extras(
                    id: 33,
                    itemId: 9,
                    price: "140.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 34,
                    itemId: 9,
                    price: "90.0",
                    name: "Chicken Ultimate S/w",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 35,
                    itemId: 9,
                    price: "200.0",
                    name: "Chicken Feast Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 36,
                    itemId: 9,
                    price: "75.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5)
              ])),
      Cart(
          id: 10,
          extrasprice: 10.1999,
          restaurantid: "10",
          userid: "",
          itemid: "10",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "18",
          variantid: "",
          extrasSelected: "2",
          perprice: "40.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [
            Extras(
                id: 37,
                itemId: 10,
                price: "140.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 38,
                itemId: 10,
                price: "90.0",
                name: "Chicken Ultimate S/w",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 39,
                itemId: 10,
                price: "200.0",
                name: "Chicken Feast Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5),
            Extras(
                id: 40,
                itemId: 10,
                price: "75.0",
                name: "Chicken Supreme Pizza",
                createdAt: "2021-02-18T10:09:05.000000Z",
                updatedAt: "2021-02-18T10:09:05.000000Z",
                deletedAt: null,
                extraForAllVariants: 1,
                qty: 5)
          ],
          item: Item(
              id: 10,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              blurUrl: widget.blurUrl,
              localimg: widget.localimg,
              extras: [
                Extras(
                    id: 37,
                    itemId: 10,
                    price: "140.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 38,
                    itemId: 10,
                    price: "90.0",
                    name: "Chicken Ultimate S/w",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 39,
                    itemId: 10,
                    price: "200.0",
                    name: "Chicken Feast Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5),
                Extras(
                    id: 40,
                    itemId: 10,
                    price: "75.0",
                    name: "Chicken Supreme Pizza",
                    createdAt: "2021-02-18T10:09:05.000000Z",
                    updatedAt: "2021-02-18T10:09:05.000000Z",
                    deletedAt: null,
                    extraForAllVariants: 1,
                    qty: 5)
              ])),
    ];
  }

  cartItemCalculation(Cart cart, Item itemdata) async {
    cart.item = itemdata;

    List<Map> submitdata = [];
    List<String?> extrastring = [];
    List<String> extraids = [];
    List<Extras> cartextraslist = [];

    double extrasprice = 0;
    List<String> cartextraids = cart.extraids!.split(",");

    for (Extras extrasval in itemdata.extras!) {
      if (cartextraids.contains(extrasval.id.toString())) {
        Map extras = {"id": extrasval.id};
        submitdata.add(extras);
        extrastring.add(extrasval.name);
        extraids.add(extrasval.id.toString());
        extrasprice = extrasprice + double.parse(extrasval.price!);
        cartextraslist.add(extrasval);
      }
    }

    double? totalprice = itemdata.price;
    if (extrasprice != 0) {
      totalprice = totalprice! + extrasprice;
    }

    double pricewithqty = totalprice! * int.parse(cart.qty!);

    final Map<String, dynamic> data = <String, dynamic>{};
    data['variantid'] = cart.variantid;
    data['qty'] = cart.qty;
    data['perprice'] = totalprice.toString();
    data['totalprice'] = pricewithqty.toStringAsFixed(2);
    data['extrasSelected'] = json.encode(submitdata);

    String extradesc = "";
    if (cart.variantid!.trim().isNotEmpty) {
      List<Variants> variantlist = [];
      variantlist.addAll(itemdata.variants!
          .where((element) => element.id.toString() == cart.variantid)
          .toList());

      Variants selectedvariantid;
      if (variantlist.isNotEmpty) {
        selectedvariantid = variantlist[0];
        List<String?> varstring = [];

        var res = json.decode(selectedvariantid.options!);
        for (Options options in itemdata.options!) {
          varstring.add(res[options.id.toString()]);
        }
        extradesc = varstring.join(',');
      }
    }

    if (extrastring.isNotEmpty) {
      extradesc = extradesc + "+" + extrastring.join(",");
    }

    data['extradesc'] = extradesc;
    data['extraids'] = extraids.isEmpty ? '' : extraids.join(",");
    data['itemname'] = itemdata.name;
    data['itemimage'] = itemdata.icon;
    data['itemprice'] = itemdata.price.toString();

    cart.extrasprice = extrasprice;
    cart.extraslist = cartextraslist;
    cart.perprice = totalprice.toString();
    cart.totalprice = pricewithqty.toStringAsFixed(2);
    cart.itemname = itemdata.name;
    cart.itemimage = itemdata.icon;
    cart.itemprice = itemdata.price.toString();
    cart.extradesc = extradesc;
    cart.extrasSelected = json.encode(submitdata);
    cart.extraids = extraids.isEmpty ? '' : extraids.join(",");

    if (gettingdata) gettingdata = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.backgroundColor,
      key: scaffoldKey,
      appBar: DesignConfig.setAppbar(StringsRes.lblcart, context),
      body: cartlistWidget(),
    );
  }

  Widget cartlistWidget() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.0,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                itemCount: a,
                itemBuilder: (context, index) {
                  Cart cart = cartlist[index];
                  if (index == 0) totalcartprice = 0;
                  totalcartprice = double.parse(
                      (totalcartprice + double.parse(cart.totalprice!))
                          .toStringAsFixed(2));
                  if (index == a! - 1) {
                    _focusStreamSubject.add(totalcartprice);
                  }

                  return Column(
                    children: [
                      ButtonClickAnimation(
                          onTap: () {
                            itemInfoDialogue(cart);
                          },
                          child: Row(children: [
                            Card(
                              margin: EdgeInsets.all(0),
                              shape: DesignConfig.setRoundedBorder(
                                  Colors.white, 15, false),
                              elevation: 0,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: OctoImage(
                                image: CachedNetworkImageProvider(
                                    '${cart.item!.logom}'),
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                    '${cart.item!.blurUrl}'),
                                height: 75,
                                width: 80,
                                errorBuilder:
                                    OctoError.icon(color: ColorsRes.black),
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Row(children: [
                                    Expanded(
                                      child: Text(cart.item!.name!,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: ColorsRes.black,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                  ]),
                                  Text(widget.description!,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: ColorsRes.grayColor,
                                          fontWeight: FontWeight.normal)),
                                  SizedBox(height: 10),
                                ])),
                          ])),
                      Container(
                          height: MediaQuery.of(context).size.height / 3.4,
                          margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                          decoration: DesignConfig.boxDecorationContainerShadow(
                              ColorsRes.containerShadowColor, 14, 14, 14, 14),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 8),
                                itemCount:
                                    cartlist[widget.id!].extraslist!.length,
                                itemBuilder: (context, index) {
                                  Extras extra =
                                      cartlist[widget.id!].extraslist![index];
                                  return Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 8.0,
                                              bottom: 8.0,
                                              right: 8.0),
                                          child: Text(extra.name!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: ColorsRes.grayColor,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 8.0,
                                                bottom: 8.0,
                                                right: 8.0),
                                            child: qtyWidget(extra, index),
                                          )),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: Text(
                                              Constant.currencysymbol +
                                                  " " +
                                                  extra.price!,
                                              maxLines: 1,
                                              //overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: ColorsRes.black,
                                                  fontWeight:
                                                      FontWeight.normal)),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          )),
                      Container(
                          height: MediaQuery.of(context).size.height / 10.2,
                          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          decoration: DesignConfig.boxDecorationContainerShadow(
                              ColorsRes.containerShadowColor, 14, 14, 14, 14),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0,
                                top: 20.0,
                                bottom: 20.0,
                                right: 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(children: [
                                  SizedBox(width: 8),
                                  SvgPicture.asset(
                                      "assets/images/fullApps/foodMaster/promo.svg"),
                                  SizedBox(width: 8),
                                  Expanded(
                                      child: Text(
                                    StringsRes.applyPromoCode,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: ColorsRes.black,
                                        fontWeight: FontWeight.normal),
                                  )),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: ColorsRes.black,
                                  ),
                                  SizedBox(width: 10),
                                ]),
                              ],
                            ),
                          )),
                      Container(
                          height: MediaQuery.of(context).size.height / 2.6,
                          margin: EdgeInsets.only(top: 10.0, bottom: 22.0),
                          decoration: DesignConfig.boxDecorationContainerShadow(
                              ColorsRes.containerShadowColor, 14, 14, 14, 14),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, top: 20.0, right: 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(width: 8),
                                Row(children: [
                                  SizedBox(width: 8),
                                  Expanded(
                                      child: Text(
                                    StringsRes.itemTotal,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsRes.grayColor,
                                        fontWeight: FontWeight.normal),
                                  )),
                                  SizedBox(width: 10),
                                  Text(
                                    "${Constant.currencysymbol} ${widget.price.toString()}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsRes.grayColor,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(width: 10),
                                ]),
                                SizedBox(height: 10),
                                Row(children: [
                                  SizedBox(width: 8),
                                  Expanded(
                                      child: Text(
                                    StringsRes.deliveryCharges,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsRes.grayColor,
                                        fontWeight: FontWeight.normal),
                                  )),
                                  SizedBox(width: 8),
                                  Text(
                                    "${Constant.currencysymbol} ${widget.price.toString()}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsRes.grayColor,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(width: 8),
                                ]),
                                SizedBox(height: 10),
                                Divider(
                                  color: ColorsRes.grayColor,
                                  height: 2,
                                ),
                                SizedBox(height: 10),
                                Row(children: [
                                  SizedBox(width: 8),
                                  Expanded(
                                      child: Text(
                                    StringsRes.deliveryTip,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsRes.grayColor,
                                        fontWeight: FontWeight.normal),
                                  )),
                                  SizedBox(width: 8),
                                  Text(
                                    StringsRes.addTip,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsRes.orangeColor,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(width: 8),
                                ]),
                                SizedBox(height: 10),
                                Row(children: [
                                  SizedBox(width: 8),
                                  Expanded(
                                      child: Text(
                                    StringsRes.taxesAndCharges,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsRes.grayColor,
                                        fontWeight: FontWeight.normal),
                                  )),
                                  SizedBox(width: 8),
                                  Text(
                                    "${Constant.currencysymbol} ${widget.price.toString()}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: ColorsRes.grayColor,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(width: 8),
                                ]),
                                SizedBox(height: 10),
                                Divider(
                                  color: ColorsRes.grayColor,
                                  height: 2,
                                ),
                                SizedBox(height: 10),
                                Row(children: [
                                  SizedBox(width: 8),
                                  Expanded(
                                      child: Text(
                                    StringsRes.totalPayment,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: ColorsRes.black,
                                        fontWeight: FontWeight.w600),
                                  )),
                                  SizedBox(width: 8),
                                  Text(
                                    "${Constant.currencysymbol} ${widget.price.toString()}",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: ColorsRes.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(width: 8),
                                ]),
                                ButtonClickAnimation(
                                  onTap: () {
                                    checkoutProcess();
                                  },
                                  child: Container(
                                    height: 67.0,
                                    padding:
                                        EdgeInsets.only(top: 13, bottom: 13),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    alignment: Alignment.center,
                                    decoration: DesignConfig.buttonShadowColor(
                                        ColorsRes
                                            .continueShoppingGradient1Color,
                                        37,
                                        ColorsRes
                                            .continueShoppingGradient2Color),
                                    child: Text(
                                      StringsRes.proceedToCheckout,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: ColorsRes.white,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "Poppins"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget qtyWidget(Extras extras, int index) {
    int? qty = extras.qty;
    double perprice = double.parse(extras.price!);
    double pricewithqty;

    return Container(
      padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
      decoration: DesignConfig.boxDecorationContainerborder(
        ColorsRes.grayColor,
        8,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SizedBox(width: 5),
        ButtonClickAnimation(
          onTap: () {
            if (qty! > 1) {
              qty = (qty! - 1);
              pricewithqty = perprice * qty!;
              extras.price = pricewithqty.toString();
              extras.qty = qty;

              updateListItem(index, extras);
            }
          },
          child: Icon(
            Icons.remove,
            color: ColorsRes.orangeColor,
          ),
        ),
        SizedBox(width: 5),
        IntrinsicHeight(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              qty.toString(),
              style: TextStyle(
                  fontSize: 14,
                  color: ColorsRes.orangeColor,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none),
            ),
          ),
        ),
        SizedBox(width: 5),
        ButtonClickAnimation(
          onTap: () {
            qty = qty! + 1;
            pricewithqty = perprice * qty!;
            extras.price = pricewithqty.toString();
            extras.qty = qty;
            updateListItem(index, extras);
          },
          child: Icon(
            Icons.add,
            color: ColorsRes.orangeColor,
          ),
        ),
      ]),
    );
  }

  updateListItem(int index, Extras extras) {
    cartlist[widget.id!].extraslist![index] = extras;
    setState(() {});
  }

  deleteItem(bool isfromlist, int index, String itemid, String restaurantid,
      int cartid) async {
    if (isfromlist) {
      cartlist.removeAt(index);
      if (cartlist.isEmpty) isnodata = true;
      setState(() {});
    }
  }

  void itemInfoDialogue(Cart cart) {
    showNewDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text(),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: ColorsRes.white,
                  radius: 58,
                  child: ClipOval(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: cart.item!.icon != null
                          ? Image.asset(
                              cart.item!.logom!,
                              fit: BoxFit.fill,
                              height: 95,
                              width: 95,
                            )
                          : Image.asset(
                              "assets/images/fullApps/foodMaster/placeholder.png",
                              height: 95,
                              width: 95)),
                ),
                Text(cart.item!.name!,
                    style: Theme.of(context).textTheme.subtitle1!.merge(
                        TextStyle(
                            color: ColorsRes.black,
                            fontWeight: FontWeight.bold))),
                Text(
                    "${Constant.currencysymbol}${cart.item!.price!.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.subtitle1!.merge(
                        TextStyle(
                            color: ColorsRes.orangeColor,
                            fontWeight: FontWeight.bold))),
                if (cart.extraslist!.isNotEmpty)
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(StringsRes.lblextras,
                          style: Theme.of(context).textTheme.subtitle2!.merge(
                              TextStyle(
                                  color: ColorsRes.black,
                                  fontWeight: FontWeight.bold)))),
                if (cart.extraslist!.isNotEmpty)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                        cart.extraslist!.length,
                        (index) => Row(children: [
                              Expanded(
                                child: Text(
                                  cart.extraslist![index].name!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .merge(TextStyle(
                                          color: ColorsRes.grayColor)),
                                ),
                              ),
                              Text(
                                  "${Constant.currencysymbol}${double.parse(cart.extraslist![index].price!).toStringAsFixed(2)}",
                                  style: TextStyle(
                                      color: ColorsRes.black,
                                      fontWeight: FontWeight.bold)),
                            ])),
                  ),
                SizedBox(height: 8),
                Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (cart.extraslist!.isNotEmpty) Divider(),
                      if (cart.extraslist!.isNotEmpty)
                        Text(
                            "${Constant.currencysymbol}${cart.extrasprice!.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: ColorsRes.black,
                                fontWeight: FontWeight.bold)),
                      if (cart.extraslist!.isNotEmpty)
                        Text(
                            "${Constant.currencysymbol}${cart.item!.price!.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: ColorsRes.black,
                                fontWeight: FontWeight.bold)),
                      if (cart.extraslist!.isNotEmpty) Divider(),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Text(cart.qty.toString(),
                            style: TextStyle(
                                color: ColorsRes.black,
                                fontWeight: FontWeight.bold)),
                        Text("\tx\t",
                            style: TextStyle(
                                color: ColorsRes.black,
                                fontWeight: FontWeight.bold)),
                        Text(
                            "${Constant.currencysymbol}${double.parse(cart.perprice!).toStringAsFixed(2)}\t=\t",
                            style: TextStyle(
                                color: ColorsRes.black,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold)),
                        Text(
                            "${Constant.currencysymbol}${double.parse(cart.totalprice!).toStringAsFixed(2)}",
                            style: TextStyle(
                                color: ColorsRes.green,
                                fontWeight: FontWeight.bold)),
                      ]),
                    ]),
              ],
            ),
          ),
        );
      },
    );
  }

  void checkoutProcess() {
    checkoutdata = {};
    List<Map> items = [];
    cartitems = [];

    int resid = 0;
    for (Cart cart in cartlist) {
      Map item = {
        "id": cart.itemid,
        "qty": cart.qty,
        "extrasSelected": cart.extrasSelected,
        "variant": cart.variantid!.trim().isEmpty ? "" : cart.variantid,
      };
      items.add(item);

      cartitems.add("${cart.qty}\tx\t${cart.itemname}");

      if (resid == 0) resid = int.parse(cart.restaurantid!);
    }
    checkoutdata["vendor_id"] = resid;
    checkoutdata["items"] = items;
    Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => PaymentPage(
              demethod: "Pickup",
              deliverytime: "8:00AM-8:30AM",
            )));
  }
}
