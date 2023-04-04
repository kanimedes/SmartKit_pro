import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/activity/profile/AddNewAddress.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Address.dart';

StreamController<String>? addressstreamdata;

class AddressList extends StatefulWidget {
  final bool? fromcart;
  const AddressList({
    Key? key,
    this.fromcart,
  }) : super(key: key);
  @override
  _AddressListState createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  bool isgettingdata = true;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String errMsg = '';

  @override
  void initState() {
    super.initState();

    setupChannel();
  }

  void setupChannel() {
    addressstreamdata = StreamController<String>();
    addressstreamdata!.stream.listen((response) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (addressstreamdata != null && !addressstreamdata!.isClosed) {
      addressstreamdata!.sink.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.backgroundColor,
      key: scaffoldKey,
      appBar: DesignConfig.setAppbar(StringsRes.deliveryaddress, context),
      bottomNavigationBar: IntrinsicHeight(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(CupertinoPageRoute(
                  builder: (context) => AddNewAddress(address: addresslist)));
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
                  StringsRes.addnewaddress,
                  style: TextStyle(
                      fontSize: 17,
                      color: ColorsRes.white,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Poppins"),
                ),
              ),
            )),
      ),
      body: addListWidget(),
    );
  }

  addListWidget() {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: addresslist.length,
      itemBuilder: (context, index) {
        Address address = addresslist[index];
        return ListTile(
          tileColor: ColorsRes.backgroundColor,
          leading: Icon(
            Icons.location_on,
            color: ColorsRes.orangeColor,
          ),
          title: Text(address.address!),
          trailing: GestureDetector(
            onTap: () {
              deleteAddress(index, address.id.toString());
            },
            child: Icon(
              Icons.delete,
              color: ColorsRes.orangeColor,
            ),
          ),
          onTap: () {},
        );
      },
    );
  }

  void deleteAddress(int index, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              DesignConfig.setRoundedBorder(ColorsRes.orangeColor, 20, false),
          title: Text(StringsRes.lbldelete),
          content: Text(StringsRes.lbldeletemsg),
          actions: [
            TextButton(
              child: Text(
                StringsRes.lblcancel,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
                child: Text(
                  StringsRes.lbldelete,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  addresslist.removeAt(index);
                  setState(() {});

                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }
}
