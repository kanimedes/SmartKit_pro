import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/MainActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class TransactionDetail extends StatefulWidget {
  String from;

  TransactionDetail(this.from);

  @override
  TransactionDetailState createState() => new TransactionDetailState(this.from);
}

class TransactionDetailState extends State<TransactionDetail> {
  String from;

  TransactionDetailState(this.from);

  @override
  void initState() {
    super.initState();
    //DesignConfig.SetStatusbarColor(ColorsRes.firstgradientcolor);
  }

  @override
  void dispose() {
    //DesignConfig.SetStatusbarColor(from == 'history' ? ColorsRes.bgcolor : ColorsRes.secondgradientcolor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = 2 * kToolbarHeight;

    return new Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsRes.bgcolor,
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: DesignConfig.gradient,
            ),
            padding: EdgeInsets.only(top: toppadding, left: 20, right: 20),
            child: SingleChildScrollView(child: TransactionDetailData()),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(
                    StringsRes.transactiondetails,
                    style: TextStyle(
                        color: ColorsRes.white, fontWeight: FontWeight.bold),
                  ),
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                        'assets/images/fullApps/cryptotech/close_button.svg'),
                  )),
            ),
          )
        ],
      ),
    );
  }

  Widget TransactionDetailData() {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Card(
          color: ColorsRes.txtmaincolor,
          shape: DesignConfig.SetRoundedBorder(ColorsRes.txtmaincolor, 10),
          margin: EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringsRes.amount,
                          style: TextStyle(
                              color: ColorsRes.white.withOpacity(0.6),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${Constant.CURRENCYSYMBOL} ${selectedtransaction!.naira_amount == null || selectedtransaction!.naira_amount!.isEmpty ? selectedtransaction!.amount : selectedtransaction!.naira_amount}",
                          style: Theme.of(context).textTheme.subtitle1!.merge(
                              TextStyle(
                                  color: ColorsRes.white.withOpacity(0.6),
                                  fontWeight: FontWeight.bold)),
                        )
                      ]),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Text(
                      StringsRes.staus,
                      style: TextStyle(
                          color: ColorsRes.white.withOpacity(0.6),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(selectedtransaction!.status!.toUpperCase(),
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                            TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constant.StatusColor(
                                    selectedtransaction!.status!)))),
                  ]),
                ]),
          )),
      Card(
          color: ColorsRes.white,
          shape: DesignConfig.SetRoundedBorder(ColorsRes.white, 10),
          margin: EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringsRes.dolleramount,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .merge(TextStyle(
                                      color: ColorsRes.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Text(
                              "${Constant.USCURRENCYSYMBOL}${selectedtransaction!.dollar_amount}",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .merge(TextStyle(
                                      color: ColorsRes.firstgradientcolor,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              StringsRes.transactiondate,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .merge(TextStyle(
                                      color: ColorsRes.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Text(
                                "${Constant.DisplayDateTime(selectedtransaction!.created_on!, true)} ",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .merge(TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorsRes.firstgradientcolor))),
                          ]),
                    ]),
                Divider(
                  color: ColorsRes.appcolor,
                  thickness: 1,
                ),
                Text(
                  StringsRes.transactiontype,
                  style: TextStyle(
                      color: ColorsRes.textgrey, fontWeight: FontWeight.w600),
                ),
                Text(
                  selectedtransaction!.type!.toUpperCase(),
                  style: TextStyle(
                      color: ColorsRes.firstgradientcolor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  StringsRes.tradetype,
                  style: TextStyle(
                      color: ColorsRes.textgrey, fontWeight: FontWeight.w600),
                ),
                Text(
                  selectedtransaction!.trade_type!.toUpperCase(),
                  style: TextStyle(
                      color: ColorsRes.firstgradientcolor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  StringsRes.cryptoamount,
                  style: TextStyle(
                      color: ColorsRes.textgrey, fontWeight: FontWeight.w600),
                ),
                Text(
                  "${selectedtransaction!.crypto_amount}\t\t${selectedtransaction!.crypto_currency_type}",
                  style: TextStyle(
                      color: ColorsRes.firstgradientcolor,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Text(
                  StringsRes.message,
                  style: TextStyle(
                      color: ColorsRes.textgrey, fontWeight: FontWeight.w600),
                ),
                Text(
                  "${selectedtransaction!.message}",
                  style: TextStyle(
                    color: ColorsRes.grey,
                  ),
                ),
                Divider(
                  color: ColorsRes.firstgradientcolor,
                  thickness: 1,
                ),
                Text(
                  StringsRes.userdetails,
                  style: TextStyle(
                      color: ColorsRes.textgrey, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${selectedtransaction!.first_name} ${selectedtransaction!.last_name}",
                  style: TextStyle(
                      color: ColorsRes.firstgradientcolor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${selectedtransaction!.email}",
                  style: TextStyle(
                      color: ColorsRes.firstgradientcolor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
    ]);
  }
}
