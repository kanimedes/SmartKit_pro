// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/linear_percent_indicator.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/model/Gift.dart';

import 'GiftOrderListActivity.dart';

class GiftItemPageActivity extends StatefulWidget {
  const GiftItemPageActivity({Key? key}) : super(key: key);

  @override
  GiftItemPageState createState() => GiftItemPageState();
}

class GiftItemPageState extends State<GiftItemPageActivity> {
  bool isLoading = true, requestloading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Gift? currentgift, nextgift;
  String mytradeamount = "0";
  String dmytradeamount = "0";

  TextEditingController edtname = TextEditingController();
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtaddress = TextEditingController();
  TextEditingController edtphone = TextEditingController();

  double nxtper = 0;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    GetGiftData();
  }

  String giftdata = '''
  {
    
        "gift": {
            "id": "2",
            "title": "Computer Keyboard",
            "min_sell_trade_amount": "2000",
            "image": "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/cryptotech%2Fgift1.jpg?alt=media&token=cc8645a2-82a0-4e8d-bd20-94a3e1333f8a",
            "status": "1",
            "created_on": "2021-01-25 13:28:00",
            "blurUrl": "LHSPOsf+x]t7_Nj[RPWB?vo1jFWB",
            "localimg":"assets/images/fullApps/cryptotech/gift1.jpg"
        },
        "user_sell_trade_amount": "49942.72000002861",
        "next_gift": {
            "id": "3",
            "title": "Watch",
            "min_sell_trade_amount": "100000",
            "image": "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/cryptotech%2Fgift1.jpg?alt=media&token=cc8645a2-82a0-4e8d-bd20-94a3e1333f8a",
            "status": "1",
            "created_on": "2021-01-25 13:29:31",
            "blurUrl": "LHSPOsf+x]t7_Nj[RPWB?vo1jFWB",
             "localimg":"assets/images/fullApps/cryptotech/gift1.jpg"
        }
    
}
  ''';

  Future<void> GetGiftData() async {
    final res = json.decode(giftdata);

    mytradeamount = res['user_sell_trade_amount'].toString();
    dmytradeamount =
        double.parse(res['user_sell_trade_amount']).toStringAsFixed(2);
    currentgift = res['gift'] == null ? null : Gift.fromJson(res['gift']);
    nextgift =
        res['next_gift'] == null ? null : Gift.fromJson(res['next_gift']);

    if (nextgift != null) {
      nxtper = ((double.parse(mytradeamount) * 100) /
              double.parse(nextgift!.min_sell_trade_amount!)) /
          100;
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 40;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsRes.bgcolor,
      bottomNavigationBar: currentgift == null
          ? null
          : Container(
              margin: EdgeInsets.only(bottom: 20),
              color: ColorsRes.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  requestloading
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        )
                      : Container(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        StringsRes.confirmorder,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                            color: ColorsRes.white),
                      ),
                      color: ColorsRes.firstgradientcolor,
                    ),
                  ),
                ],
              ),
            ),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: DesignConfig.gradient,
            ),
            padding: EdgeInsets.only(top: toppadding),
            child: Container(
                padding: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: ColorsRes.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      topLeft: Radius.circular(18)),
                ),
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : currentgift == null && nextgift == null
                          ? Center(
                              child: Text(
                              StringsRes.nofreegiftfound,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .merge(
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ))
                          : ContentWidget(),
                )),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(StringsRes.freegift,
                    style: TextStyle(color: ColorsRes.white)),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(
                      'assets/images/fullApps/cryptotech/back_button.svg'),
                ),
                actions: [
                  IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GiftOrderListActivity()));
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget ContentWidget() {
    if (currentgift != null) {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Align(
                alignment: Alignment.center,
                heightFactor: 0.9,
                widthFactor: 1,
                child: OctoImage(
                  image: CachedNetworkImageProvider(currentgift!.image!),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    currentgift!.blurUrl!,
                  ),
                  height: 250,
                  errorBuilder: OctoError.icon(color: ColorsRes.black),
                  fit: BoxFit.fill,
                ),
              ),
            )),
            Center(
                child: Text(
              currentgift!.title!,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 15,
            ),
            Center(
                child: Text(
              "Your Total Sell Trade : $dmytradeamount",
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  color: ColorsRes.firstgradientcolor)),
            )),
            SizedBox(
              height: 15,
            ),
            Text(StringsRes.username,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .merge(TextStyle(color: ColorsRes.appcolor))),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: DesignConfig.outlineboxtext,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                style: TextStyle(color: ColorsRes.black, fontSize: 14),
                cursorColor: ColorsRes.appcolor,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: StringsRes.username,
                  hintStyle: TextStyle(color: ColorsRes.grey),
                ),
                keyboardType: TextInputType.text,
                validator: (val) =>
                    val!.trim().isEmpty ? StringsRes.enterusername : null,
                controller: edtname,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(StringsRes.email_address,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .merge(TextStyle(color: ColorsRes.appcolor))),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: DesignConfig.outlineboxtext,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                style: TextStyle(color: ColorsRes.black, fontSize: 14),
                cursorColor: ColorsRes.appcolor,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: StringsRes.email_address,
                  hintStyle: TextStyle(color: ColorsRes.grey),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (val) => Constant.validateEmail(val!),
                controller: edtemail,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(StringsRes.phonenumber,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .merge(TextStyle(color: ColorsRes.appcolor))),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: DesignConfig.outlineboxtext,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                style: TextStyle(color: ColorsRes.black, fontSize: 14),
                cursorColor: ColorsRes.appcolor,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: StringsRes.phonenumber,
                  hintStyle: TextStyle(color: ColorsRes.grey),
                ),
                keyboardType: TextInputType.phone,
                validator: (val) => Constant.validateMobile(val!),
                controller: edtphone,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(StringsRes.address,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .merge(TextStyle(color: ColorsRes.appcolor))),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: DesignConfig.outlineboxtext,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                style: TextStyle(color: ColorsRes.black, fontSize: 14),
                cursorColor: ColorsRes.appcolor,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: StringsRes.address,
                  hintStyle: TextStyle(color: ColorsRes.grey),
                ),
                textAlign: TextAlign.start,
                minLines: 5,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                validator: (val) =>
                    val!.trim().isEmpty ? StringsRes.enteraddress : null,
                controller: edtaddress,
              ),
            ),
          ],
        ),
      );
    } else if (nextgift != null) {
      return Column(
        children: [
          Center(
              child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    nextgift!.image!,
                    height: 250,
                  ))),
          Center(
              child: Text(
            nextgift!.title!,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 15,
          ),
          Center(
              child: Text(
            "Your Total Sell Trade : $dmytradeamount",
            style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                color: ColorsRes.firstgradientcolor)),
          )),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              lineHeight: 15.0,
              percent: nxtper,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: ColorsRes.firstgradientcolor,
              backgroundColor: ColorsRes.firstgradientcolor.withOpacity(0.3),
            ),
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .merge(TextStyle(color: ColorsRes.black)),
                  text: "You Need to Complete\t",
                  children: <TextSpan>[
                    TextSpan(
                        text: nextgift!.min_sell_trade_amount,
                        style: TextStyle(
                            color: ColorsRes.firstgradientcolor,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "\tSell Trade Amount to get this exciting Gift. Click below button to start trading.",
                        style: TextStyle(color: ColorsRes.black)),
                  ])),
        ],
      );
    } else {
      return Container(
        height: 5,
      );
    }
  }
}
