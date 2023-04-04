import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';

import 'GiftOrderListActivity.dart';

class GiftOrderDetail extends StatefulWidget {
  const GiftOrderDetail({Key? key}) : super(key: key);

  @override
  GiftOrderDetailState createState() => GiftOrderDetailState();
}

class GiftOrderDetailState extends State<GiftOrderDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 40;
    return Scaffold(
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
              padding: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: ColorsRes.homebgcolor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    topLeft: Radius.circular(18)),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            selectedorder.title!,
                            style: Theme.of(context).textTheme.headline6!.merge(
                                TextStyle(
                                    color: ColorsRes.secondgradientcolor,
                                    fontWeight: FontWeight.bold)),
                          )),
                          Card(
                              color: Constant.StatusColor(
                                  selectedorder.status!.trim()),
                              child: Text(
                                "\t${selectedorder.status}\t",
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .merge(TextStyle(
                                        color: ColorsRes.white,
                                        fontWeight: FontWeight.bold)),
                              )),
                        ],
                      ),
                      Text("${selectedorder.created_on}",
                          style: Theme.of(context).textTheme.caption!.merge(
                              TextStyle(
                                  color: ColorsRes.grey,
                                  fontWeight: FontWeight.w500))),
                      Divider(
                        color: ColorsRes.grey,
                        indent: 8,
                        endIndent: 8,
                      ),
                      Text(
                        "${StringsRes.username} : ${selectedorder.username}",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .merge(TextStyle(color: ColorsRes.black)),
                      ),
                      Text(
                        "${StringsRes.phonenumber} : ${selectedorder.phone}",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .merge(TextStyle(color: ColorsRes.black)),
                      ),
                      Text(
                        "${StringsRes.email} : ${selectedorder.email}",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .merge(TextStyle(color: ColorsRes.black)),
                      ),
                      Text(
                        "${StringsRes.name} : ${selectedorder.first_name} ${selectedorder.last_name}",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .merge(TextStyle(color: ColorsRes.black)),
                      ),
                      Text(
                        "${StringsRes.address} : ${selectedorder.address}",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .merge(TextStyle(color: ColorsRes.black)),
                      ),
                    ]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(StringsRes.giftorders,
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
}
