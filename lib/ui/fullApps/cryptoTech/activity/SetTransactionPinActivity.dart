import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';

class SetTransactionPinActivity extends StatefulWidget {
  String from;

  SetTransactionPinActivity(this.from);

  @override
  State<StatefulWidget> createState() {
    return new SetTransactionPinState();
  }
}

class SetTransactionPinState extends State<SetTransactionPinActivity> {
  TextEditingController edtpin = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  bool isLoading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 40;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: ColorsRes.statusbarcolor,
      ),
      key: _scaffoldKey,
      backgroundColor: ColorsRes.bgcolor,
      bottomNavigationBar: BottomAppBar(
        color: ColorsRes.white,
        child: IntrinsicHeight(
          child: GestureDetector(
            onTap: () async {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                isLoading ? new CircularProgressIndicator() : Container(),
                Container(
                  decoration: DesignConfig.circulargradient_box,
                  margin: EdgeInsets.only(left: 15, right: 15),
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    StringsRes.lblsubmit,
                    textAlign: TextAlign.center,
                    style:
                        Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                              color: ColorsRes.white,
                              letterSpacing: 1.65,
                              fontWeight: FontWeight.w700,
                              //fontWeight: FontWeight.w500,
                            )),
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Text(
                          StringsRes.transactionpinmsg,
                          style: Theme.of(context).textTheme.caption!.merge(
                              TextStyle(
                                  color: ColorsRes.firstgradientcolor,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                        child: Text(StringsRes.transactionpin),
                      ),
                      Container(
                        decoration: DesignConfig.BoxDecorationContainer(
                            ColorsRes.grey.withOpacity(0.2), 10),
                        margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                        padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        child: TextFormField(
                          style: TextStyle(color: ColorsRes.black),
                          cursorColor: ColorsRes.black,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: StringsRes.transactionpin,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .merge(TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorsRes.grey)),
                            border: InputBorder.none,
                            errorStyle: TextStyle(color: ColorsRes.grey),
                            //prefixIcon: Icon(Icons.person,color: ColorsRes.grey,),
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          controller: edtpin,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12, left: 10, right: 10),
                        child: Text(StringsRes.password),
                      ),
                      Container(
                        decoration: DesignConfig.BoxDecorationContainer(
                            ColorsRes.grey.withOpacity(0.2), 10),
                        margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: TextFormField(
                          controller: edtpsw,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: ColorsRes.black),
                          cursorColor: ColorsRes.black,
                          decoration: InputDecoration(
                            hintText: StringsRes.password,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .merge(TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorsRes.grey)),
                            border: InputBorder.none,
                            errorStyle: TextStyle(color: ColorsRes.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(StringsRes.transactionpin,
                      style: TextStyle(color: ColorsRes.white)),
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                        'assets/images/fullApps/cryptotech/back_button.svg'),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
