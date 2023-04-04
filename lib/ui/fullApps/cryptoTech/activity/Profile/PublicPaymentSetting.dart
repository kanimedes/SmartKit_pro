import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';

class PublicPaymentSetting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PublicPaymentSettingState();
  }
}

class PublicPaymentSettingState extends State<PublicPaymentSetting> {
  bool isLoading = false;
  TextStyle? textStyle;
  GlobalKey<ScaffoldState>? scaffoldKey;
  bool pagestatus = true,
      isbtc = false,
      ispaxfulbtc = false,
      iseth = false,
      ispm = false,
      isltc = false,
      isbank = false,
      isusdt = false;

  bool isbankenable = false;

  Map<String, dynamic>? paymentmap;

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    textStyle = Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
          fontWeight: FontWeight.bold,
          color: ColorsRes.black,
        ));

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        key: scaffoldKey,
        body: Padding(
          padding: EdgeInsets.only(
              right: 25,
              top: kToolbarHeight - MediaQuery.of(context).padding.top),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 25.0),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      'assets/images/fullApps/cryptotech/close_button.svg',
                      height: MediaQuery.of(context).size.width / 7,
                    )),
                SwitchListTile(
                    title: Text("${StringsRes.pubpaypagestatus} ",
                        style: textStyle),
                    activeColor: ColorsRes.firstgradientcolor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: pagestatus,
                    onChanged: (bool ischecked) {
                      setState(() {
                        pagestatus = ischecked;
                      });
                    }),
                Card(
                    color: Color(0xFFf8d7da),
                    shape: DesignConfig.SetRoundedBorder(Color(0xFFf5c6cb), 8),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text(
                        StringsRes.pubpaypagestatuswarning,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .merge(TextStyle(color: Color(0xFF721c24))),
                      ),
                    )),
                Divider(
                  height: 25,
                ),
                SwitchListTile(
                    title:
                        Text("${StringsRes.paxfulbitcoin} ", style: textStyle),
                    activeColor: ColorsRes.firstgradientcolor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: ispaxfulbtc,
                    onChanged: (bool ischecked) {
                      setState(() {
                        ispaxfulbtc = ischecked;
                      });
                    }),
                SwitchListTile(
                    title: Text("${StringsRes.eth} ", style: textStyle),
                    activeColor: ColorsRes.firstgradientcolor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: iseth,
                    onChanged: (bool ischecked) {
                      setState(() {
                        iseth = ischecked;
                      });
                    }),
                SwitchListTile(
                    title: Text("${StringsRes.ltc} ", style: textStyle),
                    activeColor: ColorsRes.firstgradientcolor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isltc,
                    onChanged: (bool ischecked) {
                      setState(() {
                        isltc = ischecked;
                      });
                    }),
                SwitchListTile(
                    title: Text("${StringsRes.btc} ", style: textStyle),
                    activeColor: ColorsRes.firstgradientcolor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isbtc,
                    onChanged: (bool ischecked) {
                      setState(() {
                        isbtc = ischecked;
                      });
                    }),
                SwitchListTile(
                    title:
                        Text("${StringsRes.perfectmoney} ", style: textStyle),
                    activeColor: ColorsRes.firstgradientcolor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: ispm,
                    onChanged: (bool ischecked) {
                      setState(() {
                        ispm = ischecked;
                      });
                    }),
                SwitchListTile(
                    title: Text("${StringsRes.usdt} ", style: textStyle),
                    activeColor: ColorsRes.firstgradientcolor,
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isusdt,
                    onChanged: (bool ischecked) {
                      setState(() {
                        isusdt = ischecked;
                      });
                    }),
                AbsorbPointer(
                  absorbing: !isbankenable,
                  child: SwitchListTile(
                      title: Text("${StringsRes.lblbank} ", style: textStyle),
                      activeColor: ColorsRes.firstgradientcolor,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: isbank,
                      onChanged: (bool ischecked) {
                        setState(() {
                          isbank = ischecked;
                        });
                      }),
                ),
                isbankenable
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          StringsRes.bankenablemsg,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .merge(TextStyle(color: ColorsRes.red)),
                        ),
                      ),
                GestureDetector(
                  onTap: () async {},
                  child: Container(
                    margin: EdgeInsets.all(30),
                    decoration: DesignConfig.circulargradient_box,
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: Center(
                      child: Text(
                        StringsRes.update,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorsRes.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
