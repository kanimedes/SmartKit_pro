import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';

import 'GrobagTrackorder.dart';

class GrobagMyOrder extends StatefulWidget {
  const GrobagMyOrder({Key? key}) : super(key: key);

  @override
  _GrobagMyOrderState createState() => _GrobagMyOrderState();
}

class _GrobagMyOrderState extends State<GrobagMyOrder> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Order History'),
            backgroundColor: white,
            leading: Builder(builder: (BuildContext context) {
              return Container(
                margin: EdgeInsets.all(10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(4),
                  onTap: () => Navigator.of(context).pop(),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: primary,
                    ),
                  ),
                ),
              );
            }),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: lightBack,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: TabBar(
                  tabs: const <Widget>[
                    Tab(
                      child: Text(
                        "On Going",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text("Past Orders",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                    )
                  ],
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primary.withOpacity(0.1)),
                  unselectedLabelColor: lightBack,
                  labelColor: primary,
                ),
              ),
              Expanded(
                child: TabBarView(children: const [
                  OnGoing(),
                  PastOrder(),
                ]),
              ),
            ],
          ),
        ));
  }
}

List orderList = [
  {
    "id": "931",
    "mobile": "7405046482",
    "total": "219980",
    "total_payable": "230979",
    "final_total": "230979",
    "payment_method": "PayPal",
    "address": "Ff, delhi north east, Delhi, Gujarat, India, 370105",
    "delivery_time": "Morning 9 AM to 1 PM",
    "delivery_date": "2021-03-08",
    "status": [
      ["received", "03-03-2021 06:54:32pm"],
      ["processed", "16-03-2021 12:48:09pm"],
      ["shipped", "16-03-2021 12:48:09pm"]
    ],
    "active_status": "awaiting",
    "date_added": "2021-03-04 10:52:55",
    "username": "Hetal gohil",
    "product_name": "Asus ZenBook Core i7 10th Gen",
    "quantity": "2",
    "price": "109990",
  },
  {
    "id": "900",
    "total": "399",
    "final_total": "418.95",
    "payment_method": "Wallet",
    "address": "Ff, delhi north east, Delhi, Gujarat, India, 370105",
    "delivery_time": "Morning 9 AM to 1 PM",
    "delivery_date": "2021-03-08",
    "status": [
      ["received", "04-03-2021 10:52:55am"]
    ],
    "active_status": "received",
    "date_added": "2021-03-04 10:52:55",
    "username": "Hetal gohil",
    "product_name": "Men Blue Slim Fit Faded Denim Casual Shirt",
    "quantity": "1",
    "price": "399",
  },
  {
    "id": "899",
    "total": "109990",
    "final_total": "115489.5",
    "payment_method": "COD",
    "address": "Ff, delhi north east, Delhi, Gujarat, India, 370105",
    "delivery_time": "Morning 2 PM to 8 PM",
    "delivery_date": "2021-03-09",
    "status": [
      ["received", "03-03-2021 06:51:33pm"],
      ["processed", "16-03-2021 12:50:40pm"],
      ["shipped", "16-03-2021 12:50:40pm"],
      ["delivered", "16-03-2021 12:50:40pm"],
      ["returned", "16-03-2021 12:50:50pm"]
    ],
    "active_status": "received",
    "date_added": "2021-03-04 10:43:50",
    "username": "Hetal gohil",
    "product_name": "Asus ZenBook Core i7 10th Gen",
    "quantity": "1",
    "price": "109990",
  },
  {
    "id": "898",
    "user_id": "99",
    "mobile": "7405046482",
    "total": "3000",
    "final_total": "3150",
    "address": "Ff, delhi north east, Delhi, Gujarat, India, 370105",
    "delivery_time": "Morning 2 PM to 8 PM",
    "delivery_date": "2021-03-09",
    "status": [
      ["received", "04-03-2021 10:43:08am"]
    ],
    "active_status": "received",
    "date_added": "2021-03-04 10:43:08",
    "username": "Hetal gohil",
    "product_name": "Adidas Running Shoes",
    "quantity": "1",
    "price": "4599",
  },
  {
    "id": "896",
    "user_id": "99",
    "mobile": "7405046482",
    "total": "6599",
    "total_payable": "6828.95",
    "final_total": "6828.95",
    "address": "Ff, delhi north east, Delhi, Gujarat, India, 370105",
    "delivery_time": "Morning 2 PM to 8 PM",
    "delivery_date": "2021-03-09",
    "status": [
      ["received", "04-03-2021 10:38:25am"]
    ],
    "active_status": "received",
    "date_added": "2021-03-04 10:38:25",
    "username": "Hetal gohil",
    "product_name": "Puma Zod Runner V3 IDP Running Shoes For Men  (Black)",
    "quantity": "1",
    "price": "4599",
  },
  {
    "id": "892",
    "mobile": "7405046482",
    "total": "31990",
    "total_payable": "33589.5",
    "promo_code": " ",
    "final_total": "33589.5",
    "address": "Ff, delhi north east, Delhi, Gujarat, India, 370105",
    "delivery_time": "Morning 9 AM to 1 PM",
    "delivery_date": "2021-03-08",
    "status": [
      ["received", "03-03-2021 06:54:32pm"],
      ["processed", "16-03-2021 12:48:09pm"],
      ["shipped", "16-03-2021 12:48:09pm"]
    ],
    "active_status": "received",
    "date_added": "2021-03-04 10:38:25",
    "username": "Hetal gohil",
    "product_name": "HP Core i3 (10th Gen) 02",
    "quantity": "1",
    "price": "31990",
  },
  {
    "id": "889",
    "mobile": "7405046482",
    "total": "109990",
    "delivery_charge": "0",
    "wallet_balance": "0",
    "total_payable": "115489.5",
    "final_total": "115489.5",
    "payment_method": "COD",
    "address": "Ff, delhi north east, Delhi, Gujarat, India, 370105",
    "delivery_time": "Morning 9 AM to 1 PM",
    "delivery_date": "2021-03-08",
    "status": [
      ["received", "04-03-2021 09:57:43am"]
    ],
    "active_status": "received",
    "date_added": "2021-03-04 10:38:25",
    "username": "Hetal gohil",
    "product_name": "Asus ZenBook Core i7 10th Gen",
    "quantity": "1",
    "price": "109990",
  },
  {
    "id": "888",
    "mobile": "7405046482",
    "total": "109990",
    "delivery_charge": "0",
    "wallet_balance": "0",
    "total_payable": "115489.5",
    "final_total": "115489.5",
    "payment_method": "COD",
    "address": "Ff, delhi north east, Delhi, Gujarat, India, 370105",
    "delivery_time": "Morning 9 AM to 1 PM",
    "delivery_date": "2021-03-08",
    "status": [
      ["received", "04-03-2021 09:57:42am"]
    ],
    "active_status": "received",
    "date_added": "2021-03-04 09:57:42",
    "username": "Hetal gohil",
    "product_name": "Asus ZenBook Core i7 10th Gen",
    "quantity": "1",
    "price": "109990",
  },
  {
    "id": "887",
    "mobile": "7405046482",
    "total": "200",
    "delivery_charge": "0",
    "wallet_balance": "0",
    "total_payable": "210",
    "promo_code": " ",
    "promo_discount": "0",
    "discount": "0",
    "final_total": "210",
    "payment_method": "COD",
    "address": "Ff, delhi north east, Delhi, Gujarat, India, 370105",
    "delivery_time": "Morning 9 AM to 1 PM",
    "delivery_date": "2021-03-08",
    "status": [
      ["received", "03-03-2021 06:51:33pm"],
      ["cancelled", "16-03-2021 12:48:52pm"]
    ],
    "active_status": "received",
    "date_added": "2021-03-04 09:47:49",
    "username": "Hetal gohil",
    "is_returnable": "0",
    "product_name":
        "Jack & Jones Men White & Red Brand Logo Printed Round Neck T-shirt",
    "quantity": "1",
    "price": "200",
  },
  {
    "id": "886",
    "user_id": "99",
    "delivery_boy_id": null,
    "mobile": "7405046482",
    "total": "200",
    "final_total": "210",
    "payment_method": "COD",
    "address": "Ff, delhi north east, Delhi, Gujarat, India, 370105",
    "delivery_time": "Morning 9 AM to 1 PM",
    "delivery_date": "2021-03-08",
    "status": [
      ["received", "04-03-2021 09:47:45am"]
    ],
    "active_status": "received",
    "date_added": "2021-03-04 09:47:45",
    "username": "Hetal gohil",
    "product_name":
        "Jack & Jones Men White & Red Brand Logo Printed Round Neck T-shirt",
    "quantity": "1",
    "price": "200",
  },
  {
    "id": "870",
    "user_id": "99",
    "delivery_boy_id": null,
    "mobile": "7405046482",
    "total": "15999",
    "delivery_charge": "0",
    "wallet_balance": "0",
    "total_payable": "15999",
    "final_total": "15999",
    "payment_method": "COD",
    "address": "Ff, delhi north east, Delhi, Gujarat, India, 370105",
    "delivery_time": "Morning 9 AM to 1 PM",
    "delivery_date": "2021-03-07",
    "status": [
      ["received", "03-03-2021 07:09:56pm"]
    ],
    "active_status": "received",
    "date_added": "2021-03-03 19:09:56",
    "username": "Hetal gohil",
    "product_name":
        "Reebok Classic Unisex Black Solid Fury DMX L Millennium Slip-On Sneakers",
    "quantity": "1",
    "price": "15999",
  },
  {
    "id": "869",
    "user_id": "99",
    "delivery_boy_id": null,
    "mobile": "7405046482",
    "total": "15999",
    "delivery_charge": "0",
    "wallet_balance": "0",
    "total_payable": "15999",
    "final_total": "15999",
    "payment_method": "COD",
    "address": "Ff, delhi north east, Delhi, Gujarat, India, 370105",
    "delivery_time": "Morning 9 AM to 1 PM",
    "delivery_date": "2021-03-07",
    "status": [
      ["received", "03-03-2021 07:09:55pm"]
    ],
    "active_status": "received",
    "date_added": "2021-03-03 19:09:55",
    "username": "Hetal gohil",
    "product_name":
        "Reebok Classic Unisex Black Solid Fury DMX L Millennium Slip-On Sneakers",
    "quantity": "1",
  },
  {
    "id": "857",
    "user_id": "99",
    "delivery_boy_id": null,
    "mobile": "7405046482",
    "total": "4599",
    "final_total": "4828.95",
    "payment_method": "COD",
    "address": "Ff, delhi north east, Delhi, Gujarat, India, 370105",
    "delivery_time": "Morning 9 AM to 1 PM",
    "delivery_date": "2021-03-07",
    "status": [
      ["received", "03-03-2021 06:54:32pm"]
    ],
    "active_status": "received",
    "date_added": "2021-03-03 18:54:32",
    "username": "Hetal gohil",
    "product_name": "Puma Zod Runner V3 IDP Running Shoes For Men  (Black)",
    "quantity": "1",
    "price": "4599",
  },
  {
    "id": "856",
    "mobile": "7405046482",
    "total": "4599",
    "delivery_charge": "0",
    "wallet_balance": "0",
    "total_payable": "4828.95",
    "final_total": "4828.95",
    "payment_method": "COD",
    "address": "Ff, delhi north east, Delhi, Gujarat, India, 370105",
    "delivery_time": "Morning 9 AM to 1 PM",
    "delivery_date": "2021-03-07",
    "status": [
      ["received", "05-03-2021 06:12:30pm"],
      ["processed", "16-03-2021 12:43:15pm"],
      ["shipped", "16-03-2021 12:43:15pm"],
      ["delivered", "16-03-2021 12:43:15pm"]
    ],
    "active_status": "received",
    "date_added": "2021-03-03 18:54:31",
    "username": "Hetal gohil",
    "product_name": "Puma Zod Runner V3 IDP Running Shoes For Men  (Black)",
    "quantity": "1",
    "price": "4599",
  },
];

class OnGoing extends StatefulWidget {
  const OnGoing({Key? key}) : super(key: key);

  @override
  _OnGoingState createState() => _OnGoingState();
}

class _OnGoingState extends State<OnGoing> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: orderList.length,
        itemBuilder: (context, index) {
          return listItem(index);
        });
  }

  Widget listItem(int index) {
    var item = orderList[index];
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        elevation: 0.2,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('EEE, dd MMM, yyyy')
                        .format(DateTime.parse(item["date_added"])),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: fontColor),
                  ),
                  Text(
                    "\$" + item["final_total"],
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: primary),
                  ),
                ],
              ),
              Text("Order #" + item["id"]),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.description_outlined,
                      size: 15,
                      color: fontLight,
                    ),
                  ),
                  Expanded(child: Text(item["product_name"])),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: fontLight,
                    ),
                  ),
                  Text(
                    item["active_status"],
                    style: TextStyle(color: secondary),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    child: Text(
                      'Cancel Order',
                      style: TextStyle(color: fontLight),
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: Text('Track Your Order'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GrobagTrackOrder(
                                  index: index,
                                )),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class PastOrder extends StatefulWidget {
  const PastOrder({Key? key}) : super(key: key);

  @override
  _PastOrderState createState() => _PastOrderState();
}

class _PastOrderState extends State<PastOrder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: orderList.length,
        itemBuilder: (context, index) {
          return listItem(index);
        });
  }

  Widget listItem(int index) {
    var item = orderList[index];
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        elevation: 0.1,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('EEE, dd MMM, yyyy')
                        .format(DateTime.parse(item["date_added"])),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: fontColor),
                  ),
                  Text(
                    "\$" + item["final_total"],
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: primary),
                  ),
                ],
              ),
              Text("Order #" + item["id"]),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.description_outlined,
                      size: 15,
                      color: fontLight,
                    ),
                  ),
                  Expanded(child: Text(item["product_name"])),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.location_on_outlined,
                      size: 15,
                      color: fontLight,
                    ),
                  ),
                  Text(
                    item["active_status"],
                    style: TextStyle(color: secondary),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    child: Text(
                      'Re-Order',
                      style: TextStyle(color: fontLight),
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: Text('Write Review'),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
