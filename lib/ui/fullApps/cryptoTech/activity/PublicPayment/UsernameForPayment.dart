// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/UIData.dart';

import 'PublicPaymentTypes.dart';

bool ispm = true,
    ispaxbit = true,
    isbtc = true,
    iseth = true,
    isltc = true,
    isusdt = true,
    isbank = true,
    isltct = true;

class UsernameForPayment extends StatefulWidget {
  @override
  UsernameForPaymentState createState() => UsernameForPaymentState();
}

class UsernameForPaymentState extends State<UsernameForPayment> {
  bool isLoading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController edtusername =
      TextEditingController(text: UIData.username);
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 40;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsRes.bgcolor,
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: DesignConfig.gradient,
            ),
            padding: EdgeInsets.only(top: toppadding),
            child: Container(
              decoration: BoxDecoration(
                color: ColorsRes.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    topLeft: Radius.circular(18)),
              ),
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              child: ContentWidget(),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(StringsRes.publicpayment,
                    style: TextStyle(color: ColorsRes.white)),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(
                      'assets/images/fullApps/cryptotech/back_button.svg'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget ContentWidget() {
    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(StringsRes.getotheruser,
            style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                color: ColorsRes.firstgradientcolor,
                fontWeight: FontWeight.bold))),
        SizedBox(
          height: 30,
        ),
        Text(StringsRes.username,
            style: Theme.of(context).textTheme.subtitle2!.merge(
                TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.bold))),
        Container(
          decoration: DesignConfig.outlineboxtext,
          padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
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
            controller: edtusername,
          ),
        ),
        SizedBox(height: 45),
        isLoading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              )
            : Container(),
        GestureDetector(
            onTap: () {
              //FindUser();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PublicPaymentTypes(edtusername.text)));
            },
            child: DesignConfig.EnDisButton(
                StringsRes.lblfind, ColorsRes.white, context)),
      ]),
    );
  }
}
