// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/AirTimeRecharge/RechargeAmountPage.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/UIData.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/model/Operator.dart';

Operator? selectedoperator;

class AirTimeOperatorList extends StatefulWidget {
  const AirTimeOperatorList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AirTimeOperatorListState();
  }
}

class AirTimeOperatorListState extends State<AirTimeOperatorList> {
  TextEditingController edttitle = TextEditingController();
  TextEditingController edtmessage = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late List<Operator> operatorlist;

  @override
  void initState() {
    super.initState();
    selectedoperator = null;
    operatorlist = [];
    operatorlist = UIData.getOperatorList() as List<Operator>;
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 40;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsRes.bgcolor,
      bottomNavigationBar: selectedoperator == null
          ? null
          : GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RechargeAmountPage()));
              },
              child: DesignConfig.EnDisButton(
                  StringsRes.next, ColorsRes.white, context)),
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
                child: ContentWidget()),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(StringsRes.airtimerecharge,
                    style: TextStyle(color: ColorsRes.white)),
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                        'assets/images/fullApps/cryptotech/back_button.svg')),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget ContentWidget() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Align(
          alignment: Alignment.centerRight,
          child: Text(
              "${StringsRes.airtimepoints} : ${UIData.airtimepoints}\t\t",
              style: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
                  color: ColorsRes.black, fontWeight: FontWeight.bold)))),
      Text("\t\t${StringsRes.selectoperator}",
          style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
              color: ColorsRes.firstgradientcolor,
              fontWeight: FontWeight.bold))),
      Expanded(
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          children: List.generate(operatorlist.length, (index) {
            Operator operatordata = operatorlist[index];

            return GestureDetector(
                onTap: () async {
                  setState(() {
                    selectedoperator = operatordata;
                  });
                },
                child: Card(
                  shape: DesignConfig.SetRoundedBorder(ColorsRes.white, 10),
                  color: selectedoperator == operatordata
                      ? ColorsRes.firstgradientcolor.withOpacity(0.7)
                      : ColorsRes.lightgrey,
                  child: Center(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      SvgPicture.asset(
                        operatordata.logoUrls!,
                        fit: BoxFit.contain,
                        height: 80,
                        width: 80,
                      ),
                      Text(
                        operatordata.name!,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption!.merge(
                            TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedoperator == operatordata
                                    ? ColorsRes.white
                                    : ColorsRes.black.withOpacity(0.7))),
                      ),
                    ]),
                  ),
                ));
          }),
        ),
      )
    ]);
  }
}
