import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagAppbar.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagAddAddress.dart';

import 'GrobagOrderSuccess.dart';

class GrobagCheckout extends StatefulWidget {
  const GrobagCheckout({Key? key}) : super(key: key);

  @override
  _GrobagCheckoutState createState() => _GrobagCheckoutState();
}

class _GrobagCheckoutState extends State<GrobagCheckout> {
  int? value, paymentValue;

  List addressList = [
    {
      "id": "233",
      "name": "Test",
      "type": "Home",
      "mobile": "123456789",
      "address": "Last",
      "landmark": "",
      "area_id": "138",
      "city_id": "44",
      "pincode": "12345",
      "state": "Gujarat",
      "country": "India",
      "latitude": "23.218674",
      "longitude": "69.7754183",
      "is_default": "0",
      "area": "KadNagar",
      "city": "Nashik"
    },
    {
      "id": "166",
      "name": "Ghhh",
      "type": "Home",
      "mobile": "88889855666",
      "address": "Dff",
      "landmark": "",
      "area_id": "136",
      "city_id": "40",
      "pincode": "370105",
      "state": "Gujarat",
      "country": "India",
      "latitude": "23.2178058",
      "longitude": "69.7769075",
      "is_default": "0",
      "area": "Redma",
      "city": "Dal"
    }
  ];
  List<String> paymentIconList = [
    'assets/images/fullApps/grobag/cod.svg',
    'assets/images/fullApps/grobag/flutterwave.svg',
    'assets/images/fullApps/grobag/mid.svg',
    'assets/images/fullApps/grobag/paypal.svg',
    'assets/images/fullApps/grobag/stripe.svg',
    'assets/images/fullApps/grobag/paytm.svg',
  ];
  List<String> paymentMethodList = [
    'Cash on delivery',
    'Flutterwave',
    'Midtrans',
    'Paypal',
    'Stripe',
    'Paytm',
  ];
  List<String> dateList = [];
  String? curDate = "Categories", curTime = "9:00 am-2:00pm";
  List<String> timeList = ["9:00 am-2:00pm", "4:00 pm-8:00pm"];
  String startingDate = "2021-03-13";
  int allowDay = 7;
  @override
  void initState() {
    super.initState();
    setState(() {
      DateTime today = DateTime.parse(startingDate);
      for (int i = 0; i < allowDay; i++) {
        dateList.add(
            DateFormat('EEE, dd MMM').format(today.add(Duration(days: i))));
      }
      curDate = dateList[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GrobagAppbar(
        title: 'Checkout',
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_addressModule(), _timeModule(), _paymentModule()],
                ),
              ),
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
                child: Text("PLACE ORDER",
                    style: TextStyle(
                      color: white,
                    )),
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OrderSuccess()));
            },
          ),
        ],
      ),
    );
  }

  Widget addressItem(int i) {
    return Card(
      elevation: 0.1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
        child: RadioListTile(
            value: i,
            dense: true,
            groupValue: value,
            onChanged: (dynamic ind) => setState(() => value = ind),
            title: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        addressList[i]["type"],
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(addressList[i]["address"] +
                          ", " +
                          addressList[i]["area"] +
                          ", " +
                          addressList[i]["city"] +
                          ", " +
                          addressList[i]["state"] +
                          ", " +
                          addressList[i]["country"] +
                          ", " +
                          addressList[i]["pincode"]),
                      Text("Mob: " + addressList[i]["mobile"])
                    ],
                  ),
                ),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.edit_outlined,
                      color: secondary,
                      size: 15,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GrobagAddAddress()));
                  },
                ),
              ],
            )),
      ),
    );
  }

  _addressModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shipping to'),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: addressList.length,
            itemBuilder: (context, index) {
              return addressItem(index);
            }),
        Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            child: Text(
              'Add New Address',
              style: TextStyle(color: secondary),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GrobagAddAddress()));
            },
          ),
        ),
        Divider(),
      ],
    );
  }

  _timeModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Peferred Delivery Time')),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(5.0),
                margin: const EdgeInsets.only(right: 8.0),
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.0, color: fontLight.withOpacity(0.5)),
                  borderRadius: BorderRadius.all(Radius.circular(10.0) //
                      ),
                ),
                child: Center(
                  child: DropdownButtonFormField<String>(
                    isDense: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: primary,
                    ),
                    decoration: InputDecoration(
                        labelText: 'Date',
                        contentPadding: EdgeInsets.all(0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                    dropdownColor: primary.withOpacity(0.9),
                    isExpanded: false,
                    value: curDate,
                    onChanged: (newValue) {
                      setState(() {
                        curDate = newValue;
                      });
                    },
                    items: dateList.map((String st) {
                      return DropdownMenuItem<String>(
                        value: st,
                        child: Text(
                          st,
                          style: TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(5.0),
                margin: const EdgeInsets.only(right: 8.0),
                decoration: BoxDecoration(
                  border:
                      Border.all(width: 1.0, color: fontLight.withOpacity(0.5)),
                  borderRadius: BorderRadius.all(Radius.circular(
                          10.0) //                 <--- border radius here
                      ),
                ),
                child: Center(
                  child: DropdownButtonFormField<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: primary,
                    ),
                    decoration: InputDecoration(
                        labelText: 'Time',
                        contentPadding: EdgeInsets.all(0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                    dropdownColor: primary.withOpacity(0.9),
                    isExpanded: false,
                    isDense: true,
                    value: curTime,
                    onChanged: (newValue) {
                      setState(() {
                        curTime = newValue;
                      });
                    },
                    items: timeList.map((String st) {
                      return DropdownMenuItem<String>(
                        value: st,
                        child: Text(
                          st,
                          style: TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  _paymentModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('Payment Method')),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: paymentMethodList.length,
            itemBuilder: (context, index) {
              return paymentItem(index);
            }),
        Divider(),
        Row(
          children: const [
            Text("Total 4 items in cart"),
            Spacer(),
            Text('\$400.00')
          ],
        )
      ],
    );
  }

  Widget paymentItem(int i) {
    return Card(
      elevation: 0.1,
      child: RadioListTile(
          value: i,
          dense: true,
          groupValue: paymentValue,
          onChanged: (dynamic ind) => setState(() => paymentValue = ind),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  paymentMethodList[i],
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SvgPicture.asset(paymentIconList[i]),
            ],
          )),
    );
  }
}
