import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagAppbar.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagCheckout.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagHome.dart';

class GrobagCart extends StatefulWidget {
  const GrobagCart({Key? key}) : super(key: key);

  @override
  _GrobagCartState createState() => _GrobagCartState();
}

class _GrobagCartState extends State<GrobagCart> {
  double disPrice = 10, oriPrice = 1000, delCharge = 100, totalPrice = 890;
  List cartList = [
    {
      'localimg': "assets/images/fullApps/grobag/product_5.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_5.jpg?alt=media&token=05c0d79e-c784-4e41-8634-429a88b6ebc5",
      'blurUrl': "LOPEaz_J},ENOpM}\$yoe-iR*EPs.",
      'name': "Pineapple",
      'descprice': "45",
      'price': "50f",
      'qty': '250 gm',
      'cartCount': 1
    },
    {
      'localimg': "assets/images/fullApps/grobag/product_6.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_6.jpg?alt=media&token=ffab6aaa-8bdb-490c-a081-21b330c2e5c2",
      'blurUrl': "LbQZ{8R4~CxGR5aJniWV^+o0E1S#",
      'name': "Strawberry",
      'descprice': "250",
      'price': "500",
      'qty': '250 gm',
      'cartCount': 1
    },
    {
      'localimg': "assets/images/fullApps/grobag/product_7.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_7.jpg?alt=media&token=53603a0a-e39d-4858-994b-254d63561f51",
      'blurUrl': "LHR8e+}=:-B7]-RnODS}{ONIOp,@",
      'name': "Pear",
      'descprice': "25",
      'price': "50",
      'qty': "1 kg",
      'cartCount': 1
    },
    {
      'localimg': "assets/images/fullApps/grobag/product_8.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_8.jpg?alt=media&token=4bd2a674-dc5e-4dcf-859d-1a3b9a9f24c7",
      'blurUrl': "LADb}@%J9OM|~VIaR--m04IW-+%1",
      'name': "Avocado",
      'descprice': "1000",
      'price': "1200",
      'qty': '500 gm',
      'cartCount': 1
    },
    {
      'localimg': "assets/images/fullApps/grobag/product_9.jpg",
      'img':
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/grobag%2Fproduct_9.jpg?alt=media&token=2bee53f6-153e-4937-876a-f3b61a24fd08",
      'blurUrl': "LGRJ*2%a?Tt4HzjaRmag~fRmD;e;",
      'name': "Tomato",
      'descprice': "1300",
      'price': "1400",
      'qty': '2 kg',
      'cartCount': 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GrobagAppbar(title: 'Cart'),
        body: cartList.isEmpty
            ? cartEmpty()
            : Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      itemCount: cartList.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return listItem(index);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 5.0, left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Total Price',
                        ),
                        Spacer(),
                        Text("\$" "$oriPrice")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Delivery Charge",
                        ),
                        Spacer(),
                        Text("\$" " $delCharge")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Discount",
                        ),
                        Spacer(),
                        Text('\$' " $disPrice")
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 20, right: 20),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Grand Total',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          '\$' " $totalPrice",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      height: 48,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text("CHECKOUT",
                            style: TextStyle(
                              color: white,
                            )),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GrobagCheckout()));
                    },
                  ),
                ],
              ));
  }

  cartEmpty() {
    return Center(
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          noCartImage(context),
          noCartText(context),
          noCartDec(context),
          shopNow()
        ]),
      ),
    );
  }

  Widget listItem(int index) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          cartList.removeAt(index);
        });
      },
      key: Key(cartList[index]["name"]),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey,
        ),
        alignment: AlignmentDirectional.centerEnd,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: Card(
        elevation: 0.1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: OctoImage(
                  image: CachedNetworkImageProvider(
                    cartList[index]["img"],
                  ),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    cartList[index]['blurUrl'],
                  ),
                  height: 80,
                  width: 80,
                  errorBuilder: OctoError.icon(color: black),
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        cartList[index]["qty"],
                        style: TextStyle(color: secondary),
                      ),
                      Text(
                        cartList[index]["name"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: fontLight, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  margin: EdgeInsetsDirectional.only(
                                      end: 8, top: 8, bottom: 8),
                                  child: Icon(
                                    Icons.remove,
                                    size: 14,
                                    color: primary,
                                  ),
                                  decoration: BoxDecoration(
                                      color: primary.withOpacity(0.2),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                ),
                                onTap: () {
                                  if (cartList[index]["cartCount"] != 1) {
                                    setState(() {
                                      cartList[index]["cartCount"] =
                                          cartList[index]["cartCount"] - 1;
                                    });
                                  }
                                },
                              ),
                              Text("${cartList[index]["cartCount"]}"),
                              GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  margin: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.add,
                                    size: 14,
                                    color: primary,
                                  ),
                                  decoration: BoxDecoration(
                                      color: primary.withOpacity(0.2),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                ),
                                onTap: () {
                                  setState(() {
                                    cartList[index]["cartCount"] =
                                        cartList[index]["cartCount"] + 1;
                                  });
                                },
                              )
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "\$" + cartList[index]["descprice"] + "  ",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: primary),
                              ),
                              Text(
                                "\$" + cartList[index]["price"],
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        color: lightBack,
                                        decoration: TextDecoration.lineThrough),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  noCartImage(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/fullApps/grobag/emptycart.svg',
    );
  }

  noCartText(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20),
        child: Text("Your Cart Is Empty",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: primary, fontWeight: FontWeight.normal)));
  }

  noCartDec(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
      child: Text("Looking like you haven't added anything to your cart yet",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: fontLight,
                fontWeight: FontWeight.normal,
              )),
    );
  }

  shopNow() {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: CupertinoButton(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 45,
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text('Shop Now',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: white, fontWeight: FontWeight.normal))),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => GrobagHome()),
              ModalRoute.withName('/'));
        },
      ),
    );
  }
}
