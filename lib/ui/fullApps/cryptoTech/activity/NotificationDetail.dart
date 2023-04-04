import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';

import 'NotificationActivity.dart';

class NotificationDetailActivity extends StatefulWidget {
  const NotificationDetailActivity({Key? key}) : super(key: key);

  @override
  NotificationDetailState createState() => NotificationDetailState();
}

class NotificationDetailState extends State<NotificationDetailActivity> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 40;
    return Scaffold(
      backgroundColor: ColorsRes.bgcolor,
      /*appBar: new AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsRes.white,),
        elevation: 0.0,
        //backgroundColor: ColorsRes.bgcolor,
        flexibleSpace: Container(
          width: double.infinity,
          decoration: BoxDecoration(gradient: DesignConfig.appbargradient),
        ),
        title: Text(StringsRes.notification, style: TextStyle(color: ColorsRes.white)),

      ),*/
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        selectednotification.title!,
                        style: Theme.of(context).textTheme.headline6!.merge(
                            TextStyle(
                                color: ColorsRes.secondgradientcolor,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("${selectednotification.date_created}",
                          style: Theme.of(context).textTheme.caption!.merge(
                              TextStyle(
                                  color: ColorsRes.grey,
                                  fontWeight: FontWeight.w500))),
                    ),
                    Divider(
                      color: ColorsRes.grey,
                      indent: 8,
                      endIndent: 8,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            selectednotification.description!,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .merge(TextStyle(color: ColorsRes.black)),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(StringsRes.notification,
                      style: TextStyle(color: ColorsRes.white)),
                  leading: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset(
                          'assets/images/fullApps/cryptotech/back_button.svg'))),
            ),
          )
        ],
      ),
    );
  }
}
