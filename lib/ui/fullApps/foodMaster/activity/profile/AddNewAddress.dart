import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Address.dart';

import 'AddressList.dart';

class AddNewAddress extends StatefulWidget {
  final List? address;

  const AddNewAddress({Key? key, this.address}) : super(key: key);
  @override
  _AddNewAddressState createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtlongitude = TextEditingController();
  TextEditingController edtlattitude = TextEditingController();
  TextEditingController edtaddress = TextEditingController();
  TextEditingController edtapartment = TextEditingController();
  TextEditingController edtintercom = TextEditingController();
  TextEditingController edtfloor = TextEditingController();
  TextEditingController edtentry = TextEditingController();
  bool isloading = false;

  Address? address;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.address!.length; i++) {
      address = widget.address![i];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsRes.backgroundColor,
        key: scaffoldKey,
        appBar: DesignConfig.setAppbar(StringsRes.addaddress, context),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {},
                  child: Container(
                      decoration: DesignConfig.boxDecorationContainerborder(
                          ColorsRes.orangeColor, 10),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      child: Text(StringsRes.filladdressfromsearch)),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: DesignConfig.boxDecorationContainerShadow(
                      ColorsRes.containerShadowColor, 14, 14, 14, 14),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.button,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 15, top: 2, bottom: 2),
                        hintText: StringsRes.address,
                        labelText: StringsRes.address,
                        hintStyle: TextStyle(
                            color: ColorsRes.grayColor,
                            fontWeight: FontWeight.normal)),
                    controller: edtaddress,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: DesignConfig.boxDecorationContainerShadow(
                      ColorsRes.containerShadowColor, 14, 14, 14, 14),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.button,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 15, top: 2, bottom: 2),
                        hintText: StringsRes.lattitude,
                        labelText: StringsRes.lattitude,
                        hintStyle: TextStyle(
                            color: ColorsRes.grayColor,
                            fontWeight: FontWeight.normal)),
                    controller: edtlattitude,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: DesignConfig.boxDecorationContainerShadow(
                      ColorsRes.containerShadowColor, 14, 14, 14, 14),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.button,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 15, top: 2, bottom: 2),
                        hintText: StringsRes.longitude,
                        labelText: StringsRes.longitude,
                        hintStyle: TextStyle(
                            color: ColorsRes.grayColor,
                            fontWeight: FontWeight.normal)),
                    controller: edtlongitude,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: DesignConfig.boxDecorationContainerShadow(
                      ColorsRes.containerShadowColor, 14, 14, 14, 14),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.button,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 15, top: 2, bottom: 2),
                        hintText: StringsRes.apartment,
                        labelText: StringsRes.apartment,
                        hintStyle: TextStyle(
                            color: ColorsRes.grayColor,
                            fontWeight: FontWeight.normal)),
                    controller: edtapartment,
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: DesignConfig.boxDecorationContainerShadow(
                      ColorsRes.containerShadowColor, 14, 14, 14, 14),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.button,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 15, top: 2, bottom: 2),
                        hintText: StringsRes.intercom,
                        labelText: StringsRes.intercom,
                        hintStyle: TextStyle(
                            color: ColorsRes.grayColor,
                            fontWeight: FontWeight.normal)),
                    controller: edtapartment,
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: DesignConfig.boxDecorationContainerShadow(
                      ColorsRes.containerShadowColor, 14, 14, 14, 14),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.button,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 15, top: 2, bottom: 2),
                        hintText: StringsRes.floor,
                        labelText: StringsRes.floor,
                        hintStyle: TextStyle(
                            color: ColorsRes.grayColor,
                            fontWeight: FontWeight.normal)),
                    controller: edtfloor,
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: DesignConfig.boxDecorationContainerShadow(
                      ColorsRes.containerShadowColor, 14, 14, 14, 14),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.button,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        contentPadding:
                            EdgeInsets.only(left: 15, top: 2, bottom: 2),
                        hintText: StringsRes.entry,
                        labelText: StringsRes.entry,
                        hintStyle: TextStyle(
                            color: ColorsRes.grayColor,
                            fontWeight: FontWeight.normal)),
                    controller: edtentry,
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                if (isloading)
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  )),
                GestureDetector(
                    onTap: () async {
                      address!.address = edtaddress.text;
                      address!.lat = edtlattitude.text;
                      address!.lng = edtlongitude.text;
                      address!.apartment = edtapartment.text;
                      address!.intercom = edtintercom.text;
                      address!.floor = edtfloor.text;
                      address!.entry = edtentry.text;
                      address!.active = "1";
                      address!.cost_per_km = "";
                      address!.cost_total = "";
                      widget.address!.insert(0, address);
                      Navigator.of(context).pushReplacement(CupertinoPageRoute(
                          builder: (context) => AddressList()));
                    },
                    child: IntrinsicHeight(
                      child: Container(
                        height: 67.0,
                        padding: EdgeInsets.only(top: 13, bottom: 13),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        alignment: Alignment.center,
                        decoration: DesignConfig.buttonShadowColor(
                            ColorsRes.continueShoppingGradient1Color,
                            37,
                            ColorsRes.continueShoppingGradient2Color),
                        child: Text(
                          StringsRes.lbladd,
                          style: TextStyle(
                              fontSize: 17,
                              color: ColorsRes.white,
                              fontWeight: FontWeight.normal,
                              fontFamily: "Poppins"),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
