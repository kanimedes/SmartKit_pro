import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DashedRect.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class ReferpageActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ReferpageState();
  }
}

class ReferpageState extends State<ReferpageActivity> {
  String myrefercode = "abc123abc123";
  String referbonus = "50";

  @override
  void initState() {
    super.initState();
    //DesignConfig.SetStatusbarColor(ColorsRes.firstgradientcolor);
  }

  @override
  void dispose() {
    //DesignConfig.SetStatusbarColor(ColorsRes.secondgradientcolor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 30;

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorsRes.bgcolor,
        bottomNavigationBar: IntrinsicHeight(
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 10),
            decoration: BoxDecoration(
              color: ColorsRes.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(18), topLeft: Radius.circular(18)),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(StringsRes.refertext,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .merge(TextStyle(
                            color: ColorsRes.appcolor,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.5,
                          ))),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: myrefercode));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(StringsRes.lbl_copied),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Here's my code $myrefercode",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .merge(TextStyle(
                                color: ColorsRes.appcolor,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.5,
                              ))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: ColorsRes.appcolor,
                      margin: EdgeInsets.only(top: 15, left: 10, right: 10),
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          StringsRes.invite,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .merge(TextStyle(
                                color: ColorsRes.white,
                                letterSpacing: 1.65,
                                fontWeight: FontWeight.w700,
                                //fontWeight: FontWeight.w500,
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                gradient: DesignConfig.gradient,
              ),
              padding: EdgeInsets.only(top: toppadding, left: 20, right: 20),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                    child: Text(
                      StringsRes.refertitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6!.merge(
                          TextStyle(
                              color: ColorsRes.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: 10, bottom: 10),
                    child: SvgPicture.asset(
                      'assets/images/fullApps/cryptotech/refer.svg',
                    ),
                  ),
                  Html(
                    style: {
                      "div": Style(
                        color: Colors.white,
                      ),
                      "b": Style(
                        color: Colors.white,
                      ),
                    },
                    /*  customTextStyle: (node, TextStyle baseStyle) {
                      return baseStyle.merge(TextStyle(
                        color: Colors.white,
                      ));
                    },*/
                    data:
                        "<div>Each member has a unique smartkit/AppFeature/FullApp/CryptoTech referral link to share with friends and family and receive <b>${Constant.CURRENCYSYMBOL}$referbonus Bonus</b> for each of their completed trades. If any one sign-up with this link, you get <b>${Constant.CURRENCYSYMBOL}$referbonus</b> for every of their completed trades forever!</div>",
                  ),
                  GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: myrefercode));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(StringsRes.lbl_copied),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width - 100,
                            decoration: BoxDecoration(
                              color: ColorsRes.referurlbg,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            child: DashedRect(
                              color: ColorsRes.appcolor,
                              strokeWidth: 2.0,
                              gap: 4.0,
                            ),
                          ),
                          Text(
                            myrefercode,
                            style: TextStyle(color: ColorsRes.white),
                          ),
                        ],
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
        ));
  }
}
