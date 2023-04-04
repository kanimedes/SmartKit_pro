import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopString.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopHome.dart';

import 'HappyShopOrderDetails.dart';

class HappyShopTreackOrder extends StatefulWidget {
  final bool? appbar;
  const HappyShopTreackOrder({Key? key, this.appbar}) : super(key: key);

  @override
  _HappyShopTreackOrderState createState() => _HappyShopTreackOrderState();
}

int offset = 0;
int total = 0;
bool isLoadingmore = true;

class _HappyShopTreackOrderState extends State<HappyShopTreackOrder>
    with TickerProviderStateMixin {
  List tempList = [];

  ScrollController controller = new ScrollController();
  Animation? buttonSqueezeanimation;
  late AnimationController buttonController;

  @override
  void initState() {
    offset = 0;
    total = 0;

    buttonController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);

    buttonSqueezeanimation = new Tween(
      begin: deviceWidth * 0.7,
      end: 50.0,
    ).animate(new CurvedAnimation(
      parent: buttonController,
      curve: new Interval(
        0.0,
        0.150,
      ),
    ));
    super.initState();
  }

  @override
  void dispose() {
    buttonController.dispose();
    super.dispose();
  }

  List orderList = [
    {
      'id': "0123456",
      'listStatus': "returned",
      'orderDate': "5-2-2021",
      'total': "150",
      'itemList': [
        {
          'localimg': "assets/images/fullApps/happyshop/woman_a1.jpg",
          'image':
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_a1.jpg?alt=media&token=624b4d16-86f5-45ab-9c2c-40a6c957f10e",
          'blurUrl': "LDRAQ99y}8-7?E\$}oJNx,Cr?J-S}",
          'name': "Dress",
          'qty': "2",
          'price': "75"
        }
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appbar == true
          ? AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: primary),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HappyShopHome(),
                  ),
                ),
              ),
              title: Text(
                "Track order",
                style: TextStyle(
                  color: primary,
                ),
              ),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              backgroundColor: Colors.white,
              elevation: 5,
            )
          : PreferredSize(preferredSize: Size.fromHeight(0), child: AppBar()),
      body: ListView.builder(
        shrinkWrap: true,
        controller: controller,
        itemCount: orderList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ORDER_ID_LBL + " : " + orderList[index]['id']),
                            Text(ORDER_DATE +
                                " : " +
                                orderList[index]['orderDate']),
                            Text(TOTAL_PRICE +
                                ":" +
                                CUR_CURRENCY +
                                " " +
                                orderList[index]['total']),
                          ],
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            color: primary,
                          ),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HappyShopOrderDetails()),
                            );
                          })
                    ],
                  ),
                  Divider(),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: orderList[index]['itemList'].length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return productItem(index, orderList[index]['itemList']);
                    },
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        getPlaced("2-2-2020"),
                        getProcessed("3-2-2020", "4-2-2020"),
                        getShipped("4-2-2020", null),
                        getDelivered("5-2-2021", null),
                        getCanceled("5-2-2021"),
                        getReturned("6-2-2021", index),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  getDelivered(String dDate, String? cDate) {
    return cDate == null
        ? Flexible(
            flex: 1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Divider(
                  thickness: 2,
                  color: dDate == null ? Colors.grey : happyshopcolor8,
                )),
                Column(
                  children: [
                    Text(
                      ORDER_DELIVERED,
                      style: TextStyle(fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Icon(
                        dDate == null
                            ? Icons.radio_button_unchecked
                            : Icons.radio_button_checked,
                        color: dDate == null ? Colors.grey : happyshopcolor8,
                      ),
                    ),
                    Text(
                      dDate,
                      style: TextStyle(fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container();
  }

  getCanceled(String cDate) {
    return cDate != null
        ? Flexible(
            flex: 1,
            child: Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Divider(
                      thickness: 2,
                      color: Colors.red,
                    )),
                Column(
                  children: [
                    Text(
                      ORDER_CANCLED,
                      style: TextStyle(fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Icon(
                        Icons.radio_button_checked,
                        color: Colors.red[700],
                      ),
                    ),
                    Text(
                      cDate,
                      style: TextStyle(fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container();
  }

  getReturned(String rDate, int index) {
    return orderList[index]['listStatus'].contains(RETURNED)
        ? Flexible(
            flex: 1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    flex: 1,
                    child: Divider(
                      thickness: 2,
                      color: Colors.red,
                    )),
                Column(
                  children: [
                    Text(
                      ORDER_RETURNED,
                      style: TextStyle(fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Icon(
                        Icons.radio_button_checked,
                        color: Colors.red[700],
                      ),
                    ),
                    Text(
                      rDate,
                      style: TextStyle(fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container();
  }

  getShipped(String sDate, String? cDate) {
    return cDate == null
        ? Flexible(
            flex: 1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 1,
                    child: Divider(
                      thickness: 2,
                      color: sDate == null ? Colors.grey : happyshopcolor8,
                    )),
                Column(
                  children: [
                    Text(
                      ORDER_SHIPPED,
                      style: TextStyle(fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Icon(
                        sDate == null
                            ? Icons.radio_button_unchecked
                            : Icons.radio_button_checked,
                        color: sDate == null ? Colors.grey : happyshopcolor8,
                      ),
                    ),
                    Text(
                      sDate,
                      style: TextStyle(fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          )
        : sDate == null
            ? Container()
            : Flexible(
                flex: 1,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Divider(
                          thickness: 2,
                        )),
                    Column(
                      children: [
                        Text(
                          ORDER_SHIPPED,
                          style: TextStyle(fontSize: 8),
                          textAlign: TextAlign.center,
                        ),
                        Icon(
                          Icons.radio_button_checked,
                          color: happyshopcolor8,
                        ),
                        Text(
                          sDate,
                          style: TextStyle(fontSize: 8),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              );
  }

  getProcessed(String prDate, String cDate) {
    return cDate == null
        ? Flexible(
            flex: 1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    flex: 1,
                    child: Divider(
                      thickness: 2,
                      color: prDate == null ? Colors.grey : happyshopcolor8,
                    )),
                Column(
                  children: [
                    Text(
                      ORDER_PROCESSED,
                      style: TextStyle(fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Icon(
                        prDate == null
                            ? Icons.radio_button_unchecked
                            : Icons.radio_button_checked,
                        color: prDate == null ? Colors.grey : happyshopcolor8,
                      ),
                    ),
                    Text(
                      prDate,
                      style: TextStyle(fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          )
        : prDate == null
            ? Container()
            : Flexible(
                flex: 1,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Flexible(
                        flex: 1,
                        child: Divider(
                          thickness: 2,
                          color: happyshopcolor8,
                        )),
                    Column(
                      children: [
                        Text(
                          ORDER_PROCESSED,
                          style: TextStyle(fontSize: 8),
                          textAlign: TextAlign.center,
                        ),
                        Icon(
                          Icons.radio_button_checked,
                          color: happyshopcolor8,
                        ),
                        Text(
                          prDate,
                          style: TextStyle(fontSize: 8),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              );
  }

  getPlaced(String pDate) {
    return Column(
      children: [
        Text(
          ORDER_NPLACED,
          style: TextStyle(fontSize: 8),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Icon(
            Icons.radio_button_checked,
            color: happyshopcolor8,
          ),
        ),
        Text(
          pDate,
          style: TextStyle(fontSize: 8),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  productItem(int index, orderItem) {
    return Row(
      children: [
        OctoImage(
          image: CachedNetworkImageProvider(
            orderItem[index]['image'],
          ),
          placeholderBuilder: OctoPlaceholder.blurHash(
            orderItem[index]['blurUrl'],
          ),
          height: 100.0,
          width: 100.0,
          errorBuilder: OctoError.icon(color: textcolor),
          fit: BoxFit.fill,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(orderItem[index]['name']),
              Text(QUANTITY_LBL + ": " + orderItem[index]['qty']),
              Text(CUR_CURRENCY + " " + orderItem[index]['price']),
            ],
          ),
        )
      ],
    );
  }
}
