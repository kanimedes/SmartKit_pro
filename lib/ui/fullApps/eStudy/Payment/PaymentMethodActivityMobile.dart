import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Model/Payment_Model.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/Payment/PaymentSuccessActivityMobile.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/eStudy/helper/StringsRes.dart';

class PaymentMethodActivityMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PaymentMethodActivityMobileState();
  }
}

class PaymentMethodActivityMobileState
    extends State<PaymentMethodActivityMobile> {
  int? _currentIndex;
  List<Payment_Model> PaymentList = [
    Payment_Model(
      image: "assets/images/fullApps/eStudy/axis.svg",
      bankName: "Axis Bank",
      cardNumber: "**** 4989",
    ),
    Payment_Model(
      image: "assets/images/fullApps/eStudy/visa.svg",
      bankName: "HDFC Bank",
      cardNumber: "**** 5987",
    ),
  ];
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: ColorsRes.bgPage,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: ColorsRes.appcolor,
          ),
          title: Text(
            StringsRes.Payment_Methods_lb,
            style: TextStyle(color: ColorsRes.introTitlecolor, fontSize: 28),
          ),
          centerTitle: true,
        ),
        body: new SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(children: <Widget>[
                new Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: 57,
                    decoration: DesignConfig.boxDecorationContainer(
                        ColorsRes.white, 10),
                    child: ListTile(
                      visualDensity: VisualDensity(horizontal: 1, vertical: -1),
                      title: Text(
                        StringsRes.Google_Pay_lb,
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorsRes.black,
                        ),
                      ),
                      dense: true,
                      trailing: Icon(Icons.arrow_forward_ios_sharp,
                          size: 15, color: ColorsRes.radiobuttoncolor),
                      onTap: () {},
                    )),
                SizedBox(height: 15),
                new Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: 57,
                    decoration: DesignConfig.boxDecorationContainer(
                        ColorsRes.white, 10),
                    child: ListTile(
                      visualDensity: VisualDensity(horizontal: 1, vertical: -1),
                      title: Text(
                        StringsRes.Debit_Card_lb,
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorsRes.black,
                        ),
                      ),
                      dense: true,
                      trailing: Icon(Icons.arrow_forward_ios_sharp,
                          size: 15, color: ColorsRes.radiobuttoncolor),
                      onTap: () {},
                    )),
                SizedBox(height: 15),
                new Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: DesignConfig.boxDecorationContainer(
                        ColorsRes.white, 10),
                    child: ExpansionTile(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: PaymentList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: ColorsRes.radiobuttoncolor,
                                          spreadRadius: 1),
                                    ],
                                  ),
                                  child: RadioListTile(
                                    activeColor: ColorsRes.radiobuttoncolor,
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    value: index,
                                    groupValue: _currentIndex,
                                    title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SvgPicture.asset(
                                              PaymentList[index].image!),
                                          Text(
                                            PaymentList[index].bankName!,
                                            style: TextStyle(
                                                color: ColorsRes.appcolor,
                                                fontSize: 14),
                                          ),
                                          Text(
                                            PaymentList[index].cardNumber!,
                                            style: TextStyle(
                                                color: ColorsRes.appcolor,
                                                fontSize: 14),
                                          )
                                        ]),
                                    onChanged: (dynamic val) {
                                      setState(() {
                                        _currentIndex = val;
                                      });
                                    },
                                  ));
                            },
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: ColorsRes.bgcolor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Icon(Icons.add,
                                          color: ColorsRes.appcolor)),
                                  SizedBox(width: 9),
                                  Text(StringsRes.Add_a_new_card_lb,
                                      style: TextStyle(
                                          color: ColorsRes.introTitlecolor,
                                          fontSize: 14))
                                ],
                              )),
                          SizedBox(height: 10)
                        ],
                        title: Text(
                          StringsRes.Credit_Card_lb,
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorsRes.black,
                          ),
                        ))),
                SizedBox(height: 15),
                new Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: 57,
                    decoration: DesignConfig.boxDecorationContainer(
                        ColorsRes.white, 10),
                    child: ListTile(
                      visualDensity: VisualDensity(horizontal: 1, vertical: -1),
                      title: Text(
                        StringsRes.Internet_Baking_lb,
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorsRes.black,
                        ),
                      ),
                      dense: true,
                      trailing: Icon(Icons.arrow_forward_ios_sharp,
                          size: 15, color: ColorsRes.radiobuttoncolor),
                      onTap: () {},
                    )),
                SizedBox(height: 15),
                new Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: 57,
                    decoration: DesignConfig.boxDecorationContainer(
                        ColorsRes.white, 10),
                    child: ListTile(
                      visualDensity: VisualDensity(horizontal: 1, vertical: -1),
                      title: Text(
                        StringsRes.Pay_with_UPI_lb,
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorsRes.black,
                        ),
                      ),
                      dense: true,
                      trailing: Icon(Icons.arrow_forward_ios_sharp,
                          size: 15, color: ColorsRes.radiobuttoncolor),
                      onTap: () {},
                    )),
                SizedBox(height: 15),
                new Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: 57,
                    decoration: DesignConfig.boxDecorationContainer(
                        ColorsRes.white, 10),
                    child: ListTile(
                      visualDensity: VisualDensity(horizontal: 1, vertical: -1),
                      title: Text(
                        StringsRes.PayTM_lb,
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorsRes.black,
                        ),
                      ),
                      dense: true,
                      trailing: Icon(Icons.arrow_forward_ios_sharp,
                          size: 15, color: ColorsRes.radiobuttoncolor),
                      onTap: () {},
                    )),
                SizedBox(height: 15),
                new Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: 57,
                    decoration: DesignConfig.boxDecorationContainer(
                        ColorsRes.white, 10),
                    child: ListTile(
                      visualDensity: VisualDensity(horizontal: 1, vertical: -1),
                      title: Text(
                        StringsRes.PayPal_lb,
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorsRes.black,
                        ),
                      ),
                      dense: true,
                      trailing: Icon(Icons.arrow_forward_ios_sharp,
                          size: 15, color: ColorsRes.radiobuttoncolor),
                      onTap: () {},
                    )),
                SizedBox(height: 20),
              ]),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PaymentSuccessActivityMobile()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: const [
                            ColorsRes.secondgradientcolor,
                            ColorsRes.firstgradientcolor,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      StringsRes.By_Now_lb,
                      style: TextStyle(color: ColorsRes.white, fontSize: 20),
                    ),
                  )),
            ],
          ),
        ));
  }
}
