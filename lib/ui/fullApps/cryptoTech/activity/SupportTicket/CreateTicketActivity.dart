import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';

class CreateTicketActivity extends StatefulWidget {
  @override
  CreateTicketState createState() => new CreateTicketState();
}

class CreateTicketState extends State<CreateTicketActivity> {
  TextEditingController edttitle = TextEditingController();
  TextEditingController edtmessage = TextEditingController();
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
                    StringsRes.createticket,
                    textAlign: TextAlign.center,
                    style:
                        Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                              color: ColorsRes.white,
                              letterSpacing: 1.65,
                              fontWeight: FontWeight.w700,
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
                        child: Text(StringsRes.tickettitle),
                      ),
                      Container(
                        decoration: DesignConfig.BoxDecorationContainer(
                            ColorsRes.grey.withOpacity(0.5), 10),
                        margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                        padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        child: TextFormField(
                          style: TextStyle(color: ColorsRes.firstgradientcolor),
                          cursorColor: ColorsRes.black,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: StringsRes.tickettitle,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .merge(TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorsRes.firstgradientcolor)),
                            border: InputBorder.none,
                            errorStyle: TextStyle(color: ColorsRes.grey),
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: edttitle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12, left: 10, right: 10),
                        child: Text(StringsRes.message),
                      ),
                      Container(
                        decoration: DesignConfig.BoxDecorationContainer(
                            ColorsRes.grey.withOpacity(0.5), 10),
                        margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                        padding: EdgeInsets.only(left: 10, right: 5),
                        child: TextFormField(
                          controller: edtmessage,
                          style: TextStyle(color: ColorsRes.black),
                          cursorColor: ColorsRes.black,
                          minLines: 10,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: StringsRes.enterticketmessage,
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
                  systemOverlayStyle: SystemUiOverlayStyle.light,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text(StringsRes.createticket,
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
