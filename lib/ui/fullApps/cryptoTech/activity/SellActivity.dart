// ignore_for_file: no_logic_in_create_state, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DecoratedTabBar.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';

import 'BuyCoinProcessPage.dart';
import 'SellCoinProcessPage.dart';

bool getselldata = true, getbuydata = true;
final _scaffoldKey = GlobalKey<ScaffoldState>();
TextStyle? textStyle;

class SellActivity extends StatefulWidget {
  int tabindex, sellselectedvalue;

  SellActivity(this.tabindex, this.sellselectedvalue);

  @override
  State<StatefulWidget> createState() {
    return SellActivitymainState(tabindex, sellselectedvalue);
  }
}

class SellActivitymainState extends State<SellActivity>
    with TickerProviderStateMixin {
  int tabindex, sellselectedvalue;
  TabController? tabController;
  int _selectedIndex = 0;

  SellActivitymainState(this.tabindex, this.sellselectedvalue);

  @override
  void initState() {
    super.initState();

    tabController =
        TabController(length: 2, vsync: this, initialIndex: tabindex);
    tabController!.addListener(() {
      setState(() {
        _selectedIndex = tabController!.index;
      });
    });
  }

  /*  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context) {
    getselldata = true;
    getbuydata = true;
    textStyle = Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
          fontWeight: FontWeight.w600,
          color: ColorsRes.firstgradientcolor,
        ));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: ColorsRes.bgcolor,
          appBar: AppBar(
            bottom: DecoratedTabBar(
              bgcolor: ColorsRes.bgcolor,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorsRes.lightgrey,
                    width: 0.3,
                  ),
                ),
              ),
              tabBar: TabBar(
                controller: tabController,
                labelStyle: TextStyle(
                  color: ColorsRes.hometitlecolor,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
                unselectedLabelStyle: TextStyle(
                  color: ColorsRes.grey,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
                unselectedLabelColor: ColorsRes.lightgrey,
                labelColor: ColorsRes.firstgradientcolor,
                indicatorColor: ColorsRes.firstgradientcolor,
                tabs: [
                  Tab(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/fullApps/cryptotech/sellcoins.svg",
                        height: MediaQuery.of(context).size.width / 16,
                        color: _selectedIndex == 0
                            ? ColorsRes.firstgradientcolor
                            : ColorsRes.lightgrey,
                      ),
                      SizedBox(width: 10),
                      Text(StringsRes.sellcoin),
                    ],
                  )),
                  Tab(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/fullApps/cryptotech/buycoins.svg",
                        height: MediaQuery.of(context).size.width / 16,
                        color: _selectedIndex == 1
                            ? ColorsRes.firstgradientcolor
                            : ColorsRes.lightgrey,
                      ),
                      SizedBox(width: 10),
                      Text(StringsRes.buycoin),
                    ],
                  )),
                ],
              ),
            ),
            centerTitle: true,
            iconTheme: IconThemeData(
              color: ColorsRes.black,
            ),
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            elevation: 0.0,
            backgroundColor: ColorsRes.bgcolor,
            title: Text(StringsRes.sellbuycoin,
                style: TextStyle(color: ColorsRes.black)),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
              Builder(builder: (context) {
                return SellCustomForm(sellselectedvalue);
              }),
              Builder(builder: (context) {
                return BuyCustomForm();
              }),
            ],
          )),
    );
  }
}

class SellCustomForm extends StatefulWidget {
  int sellselectedvalue;

  SellCustomForm(this.sellselectedvalue);

  @override
  SellCustomFormState createState() {
    return SellCustomFormState(sellselectedvalue);
  }
}

class SellCustomFormState extends State<SellCustomForm> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false, isdialogloading = false;
  TextEditingController edtusd = TextEditingController();
  TextEditingController edtnaira = TextEditingController();
  int _radioValue1 = -1;
  double coinprice = 0;
  String? cointype, message = "";
  bool ispm = true,
      ispaxbit = true,
      isbtc = true,
      iseth = true,
      isltct = true,
      isltc = true,
      isusdt = true;

  SellCustomFormState(this._radioValue1);

  void _handleRadioValueChange1(int value) {
    String image = '';
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          cointype = Constant.perfectmoney;
          coinprice = 50;
          image = 'assets/images/fullApps/cryptotech/pm.svg';
          break;
        case 1:
          cointype = Constant.paxfulbitcoin;
          coinprice = 100;
          image = 'assets/images/fullApps/cryptotech/paxful.svg';
          break;
        case 2:
          cointype = Constant.btc;
          coinprice = 10;
          image = 'assets/images/fullApps/cryptotech/btc.svg';
          break;
        case 3:
          cointype = Constant.eth;
          coinprice = 20;
          image = 'assets/images/fullApps/cryptotech/eth.svg';
          break;
        case 4:
          cointype = Constant.ltct;
          coinprice = 80;
          image = 'assets/images/fullApps/cryptotech/dollersymbol.svg';
          break;
        case 5:
          cointype = Constant.ltc;
          coinprice = 90;
          image = 'assets/images/fullApps/cryptotech/ltc.svg';
          break;
        case 6:
          cointype = Constant.usdt;
          coinprice = 25;
          image = 'assets/images/fullApps/cryptotech/usdt.svg';
          break;
      }

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              SellCoinProcessPage(_radioValue1, coinprice, cointype, image)));
      SetNairaAmt();
    });
  }

  List<Widget> sellwidgetlist = [];

  @override
  void initState() {
    sellwidgetlist = [];

    if (_radioValue1 != -1) _handleRadioValueChange1(_radioValue1);

    super.initState();
  }

  CreateSellWidgetList() {
    sellwidgetlist = [];
    if (ispm) {
      sellwidgetlist.add(GestureDetector(
        onTap: () {
          _handleRadioValueChange1(0);
        },
        child: Container(
          decoration:
              DesignConfig.BoxDecorationContainer(ColorsRes.cardyellow, 8),
          padding: EdgeInsets.only(left: 14, right: 10, top: 5, bottom: 5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/fullApps/cryptotech/pm.svg',
                  height: MediaQuery.of(context).size.width / 8,
                ),
                SizedBox(height: 8),
                Text(
                  StringsRes.sellnow,
                  style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 8),
                Text(
                  "1\$ = ${Constant.CURRENCYSYMBOL}10",
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold)),
                ),
                Text(
                  StringsRes.perfectmoney,
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.white.withOpacity(0.5),
                      fontWeight: FontWeight.bold)),
                ),
              ]),
        ),
      ));
    }

    if (ispaxbit) {
      sellwidgetlist.add(GestureDetector(
        onTap: () {
          _handleRadioValueChange1(1);
        },
        child: Container(
            decoration:
                DesignConfig.BoxDecorationContainer(ColorsRes.cardpurple, 8),
            padding: EdgeInsets.only(left: 14, right: 10, top: 5, bottom: 5),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/images/fullApps/cryptotech/paxful.svg',
                    height: MediaQuery.of(context).size.width / 8,
                  ),
                  SizedBox(height: 8),
                  Text(
                    StringsRes.sellnow,
                    style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                        color: ColorsRes.white, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "1\$ = ${Constant.CURRENCYSYMBOL}20",
                    style: Theme.of(context).textTheme.subtitle1!.merge(
                        TextStyle(
                            color: ColorsRes.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    StringsRes.paxfulbitcoin,
                    style: Theme.of(context).textTheme.subtitle1!.merge(
                        TextStyle(
                            color: ColorsRes.white.withOpacity(0.5),
                            fontWeight: FontWeight.bold)),
                  ),
                ])),
      ));
    }

    if (isbtc) {
      sellwidgetlist.add(GestureDetector(
        onTap: () {
          _handleRadioValueChange1(2);
        },
        child: Container(
          decoration:
              DesignConfig.BoxDecorationContainer(ColorsRes.cardblue, 8),
          padding: EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/fullApps/cryptotech/btc.svg',
                height: MediaQuery.of(context).size.width / 8,
              ),
              SizedBox(height: 5),
              Text(StringsRes.sellnow,
                  style: TextStyle(color: ColorsRes.white, fontSize: 10)),
              SizedBox(height: 5),
              Text(
                "1\$ = ${Constant.CURRENCYSYMBOL}30",
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: ColorsRes.white, fontWeight: FontWeight.bold)),
              ),
              Text(
                StringsRes.btc,
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorsRes.white.withOpacity(0.5))),
              ),
              Text(
                "(Blockchain, Luno, Coinbase, Remitano etc)",
                style: TextStyle(
                    fontSize: 8, color: ColorsRes.white.withOpacity(0.7)),
              ),
            ],
          ),
        ),
      ));
    }

    if (iseth) {
      sellwidgetlist.add(GestureDetector(
        onTap: () {
          _handleRadioValueChange1(3);
        },
        child: Container(
          decoration:
              DesignConfig.BoxDecorationContainer(ColorsRes.cardgreen, 8),
          padding: EdgeInsets.only(left: 14, right: 10, top: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/fullApps/cryptotech/eth.svg',
                height: MediaQuery.of(context).size.width / 8,
              ),
              SizedBox(height: 8),
              Text(
                StringsRes.sellnow,
                style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                    color: ColorsRes.white, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 8),
              Text(
                "1\$ = ${Constant.CURRENCYSYMBOL}40",
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: ColorsRes.white, fontWeight: FontWeight.bold)),
              ),
              Text(
                StringsRes.eth,
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: ColorsRes.white.withOpacity(0.5),
                    fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ));
    }

    if (isltct) {
      sellwidgetlist.add(GestureDetector(
        onTap: () {
          _handleRadioValueChange1(4);
        },
        child: Container(
          decoration:
              DesignConfig.BoxDecorationContainer(ColorsRes.cardpich, 8),
          padding: EdgeInsets.only(left: 14, right: 10, top: 5, bottom: 5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/fullApps/cryptotech/dollersymbol.svg',
                  height: MediaQuery.of(context).size.width / 8,
                ),
                SizedBox(height: 8),
                Text(
                  StringsRes.sellnow,
                  style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 8),
                Text(
                  "1\$ = ${Constant.CURRENCYSYMBOL}50",
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold)),
                ),
                Text(
                  StringsRes.ltct,
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.white.withOpacity(0.5),
                      fontWeight: FontWeight.bold)),
                ),
              ]),
        ),
      ));
    }

    if (isltc) {
      sellwidgetlist.add(GestureDetector(
        onTap: () {
          _handleRadioValueChange1(5);
        },
        child: Container(
          decoration:
              DesignConfig.BoxDecorationContainer(ColorsRes.cardpink, 8),
          padding: EdgeInsets.only(left: 14, right: 10, top: 5, bottom: 5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/fullApps/cryptotech/ltc.svg',
                  height: MediaQuery.of(context).size.width / 8,
                ),
                SizedBox(height: 8),
                Text(
                  StringsRes.sellnow,
                  style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 8),
                Text(
                  "1\$ = ${Constant.CURRENCYSYMBOL}60",
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold)),
                ),
                Text(
                  StringsRes.ltc,
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.white.withOpacity(0.5),
                      fontWeight: FontWeight.bold)),
                ),
              ]),
        ),
      ));
    }

    if (isusdt) {
      sellwidgetlist.add(GestureDetector(
        onTap: () {
          _handleRadioValueChange1(6);
        },
        child: Container(
          decoration:
              DesignConfig.BoxDecorationContainer(ColorsRes.cardbrown, 8),
          padding: EdgeInsets.only(left: 14, right: 10, top: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/fullApps/cryptotech/usdt.svg',
                height: MediaQuery.of(context).size.width / 8,
              ),
              SizedBox(height: 8),
              Text(
                StringsRes.sellnow,
                style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                    color: ColorsRes.white, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 8),
              Text(
                "1\$ = ${Constant.CURRENCYSYMBOL}70",
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: ColorsRes.white, fontWeight: FontWeight.bold)),
              ),
              Text(
                StringsRes.usdt,
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: ColorsRes.white.withOpacity(0.5),
                    fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CreateSellWidgetList();

    return Form(
      key: _formKey,
      child: message!.trim().isNotEmpty
          ? Center(
              child: Text(
              message!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ))
          : Column(children: [
              Padding(
                padding:
                    EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
                child: Center(
                  child: Text(
                    StringsRes.sellinfo,
                    style: textStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 12,
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    children: sellwidgetlist),
              ),
            ]),
    );
  }

  void SetNairaAmt() {
    double maincoin = 000000.0;
    if (edtusd.text != null && edtusd.text.toString().trim().isNotEmpty) {
      maincoin = coinprice * double.parse(edtusd.text);
    }
    edtnaira.text = maincoin.toString();
  }
}

class BuyCustomForm extends StatefulWidget {
  @override
  BuyCustomFormState createState() {
    return BuyCustomFormState();
  }
}

class BuyCustomFormState extends State<BuyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false, isdialogloading = false;
  TextEditingController edtusd = TextEditingController();
  TextEditingController edtnaira = TextEditingController();
  TextEditingController edtpayaddress = TextEditingController();
  int _radioValue1 = -1;
  String? cointype, message = "";
  bool ispm = true,
      ispaxbit = true,
      isbtc = true,
      iseth = true,
      isltct = true,
      isltc = true,
      isusdt = true;
  double coinprice = 0;
  List<Widget> buywidgetlist = [];

  void _handleRadioValueChange1(int value) {
    String image = '';
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          cointype = Constant.perfectmoney;
          coinprice = 50;
          image = 'assets/images/fullApps/cryptotech/pm.svg';
          break;
        case 1:
          cointype = Constant.paxfulbitcoin;
          coinprice = 100;
          image = 'assets/images/fullApps/cryptotech/paxful.svg';
          break;
        case 2:
          cointype = Constant.btc;
          coinprice = 10;
          image = 'assets/images/fullApps/cryptotech/btc.svg';
          break;
        case 3:
          cointype = Constant.eth;
          coinprice = 20;
          image = 'assets/images/fullApps/cryptotech/eth.svg';
          break;
        case 4:
          cointype = Constant.ltct;
          coinprice = 80;
          image = 'assets/images/fullApps/cryptotech/dollersymbol.svg';
          break;
        case 5:
          cointype = Constant.ltc;
          coinprice = 90;
          image = 'assets/images/fullApps/cryptotech/ltc.svg';
          break;
        case 6:
          cointype = Constant.usdt;
          coinprice = 25;
          image = 'assets/images/fullApps/cryptotech/usdt.svg';
          break;
      }

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              BuyCoinProcessPage(_radioValue1, coinprice, cointype, image)));
      SetNairaAmt();
    });
  }

  @override
  void initState() {
    buywidgetlist = [];

    super.initState();
  }

  CreateBuyWidgetList() {
    buywidgetlist = [];
    if (ispm) {
      buywidgetlist.add(GestureDetector(
        onTap: () {
          _handleRadioValueChange1(0);
        },
        child: Container(
          decoration:
              DesignConfig.BoxDecorationContainer(ColorsRes.cardyellow, 8),
          padding: EdgeInsets.only(left: 14, right: 10, top: 5, bottom: 5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/fullApps/cryptotech/pm.svg',
                  height: MediaQuery.of(context).size.width / 8,
                ),
                SizedBox(height: 8),
                Text(
                  StringsRes.buynow,
                  style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 8),
                Text(
                  "1\$ = ${Constant.CURRENCYSYMBOL}10",
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold)),
                ),
                Text(
                  StringsRes.perfectmoney,
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.white.withOpacity(0.5),
                      fontWeight: FontWeight.bold)),
                ),
              ]),
        ),
      ));
    }

    if (ispaxbit) {
      buywidgetlist.add(GestureDetector(
        onTap: () {
          _handleRadioValueChange1(1);
        },
        child: Container(
            decoration:
                DesignConfig.BoxDecorationContainer(ColorsRes.cardpurple, 8),
            padding: EdgeInsets.only(left: 14, right: 10, top: 5, bottom: 5),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/images/fullApps/cryptotech/paxful.svg',
                    height: MediaQuery.of(context).size.width / 8,
                  ),
                  SizedBox(height: 8),
                  Text(
                    StringsRes.buynow,
                    style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                        color: ColorsRes.white, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "1\$ = ${Constant.CURRENCYSYMBOL}20",
                    style: Theme.of(context).textTheme.subtitle1!.merge(
                        TextStyle(
                            color: ColorsRes.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    StringsRes.paxfulbitcoin,
                    style: Theme.of(context).textTheme.subtitle1!.merge(
                        TextStyle(
                            color: ColorsRes.white.withOpacity(0.5),
                            fontWeight: FontWeight.bold)),
                  ),
                ])),
      ));
    }

    if (isbtc) {
      buywidgetlist.add(GestureDetector(
        onTap: () {
          _handleRadioValueChange1(2);
        },
        child: Container(
          decoration:
              DesignConfig.BoxDecorationContainer(ColorsRes.cardblue, 8),
          padding: EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/fullApps/cryptotech/btc.svg',
                height: MediaQuery.of(context).size.width / 8,
              ),
              SizedBox(height: 5),
              Text(StringsRes.buynow,
                  style: TextStyle(color: ColorsRes.white, fontSize: 10)),
              SizedBox(height: 5),
              Text(
                "1\$ = ${Constant.CURRENCYSYMBOL}30",
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: ColorsRes.white, fontWeight: FontWeight.bold)),
              ),
              Text(
                StringsRes.btc,
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorsRes.white.withOpacity(0.5))),
              ),
              Text(
                "(Blockchain, Luno, Coinbase, Remitano etc)",
                style: TextStyle(
                    fontSize: 8, color: ColorsRes.white.withOpacity(0.7)),
              ),
            ],
          ),
        ),
      ));
    }

    if (iseth) {
      buywidgetlist.add(GestureDetector(
        onTap: () {
          _handleRadioValueChange1(3);
        },
        child: Container(
          decoration:
              DesignConfig.BoxDecorationContainer(ColorsRes.cardgreen, 8),
          padding: EdgeInsets.only(left: 14, right: 10, top: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/fullApps/cryptotech/eth.svg',
                height: MediaQuery.of(context).size.width / 8,
              ),
              SizedBox(height: 8),
              Text(
                StringsRes.buynow,
                style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                    color: ColorsRes.white, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 8),
              Text(
                "1\$ = ${Constant.CURRENCYSYMBOL}40",
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: ColorsRes.white, fontWeight: FontWeight.bold)),
              ),
              Text(
                StringsRes.eth,
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: ColorsRes.white.withOpacity(0.5),
                    fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ));
    }

    if (isltct) {
      buywidgetlist.add(GestureDetector(
        onTap: () {
          _handleRadioValueChange1(4);
        },
        child: Container(
          decoration:
              DesignConfig.BoxDecorationContainer(ColorsRes.cardpich, 8),
          padding: EdgeInsets.only(left: 14, right: 10, top: 5, bottom: 5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/fullApps/cryptotech/dollersymbol.svg',
                  height: MediaQuery.of(context).size.width / 8,
                ),
                SizedBox(height: 8),
                Text(
                  StringsRes.buynow,
                  style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 8),
                Text(
                  "1\$ = ${Constant.CURRENCYSYMBOL}50",
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold)),
                ),
                Text(
                  StringsRes.ltct,
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.white.withOpacity(0.5),
                      fontWeight: FontWeight.bold)),
                ),
              ]),
        ),
      ));
    }

    if (isltc) {
      buywidgetlist.add(GestureDetector(
        onTap: () {
          _handleRadioValueChange1(5);
        },
        child: Container(
          decoration:
              DesignConfig.BoxDecorationContainer(ColorsRes.cardpink, 8),
          padding: EdgeInsets.only(left: 14, right: 10, top: 5, bottom: 5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/fullApps/cryptotech/ltc.svg',
                  height: MediaQuery.of(context).size.width / 8,
                ),
                SizedBox(height: 8),
                Text(
                  StringsRes.buynow,
                  style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 8),
                Text(
                  "1\$ = ${Constant.CURRENCYSYMBOL}60",
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.white, fontWeight: FontWeight.bold)),
                ),
                Text(
                  StringsRes.ltc,
                  style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.white.withOpacity(0.5),
                      fontWeight: FontWeight.bold)),
                ),
              ]),
        ),
      ));
    }

    if (isusdt) {
      buywidgetlist.add(GestureDetector(
        onTap: () {
          _handleRadioValueChange1(6);
        },
        child: Container(
          decoration:
              DesignConfig.BoxDecorationContainer(ColorsRes.cardbrown, 8),
          padding: EdgeInsets.only(left: 14, right: 10, top: 5, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/fullApps/cryptotech/usdt.svg',
                height: MediaQuery.of(context).size.width / 8,
              ),
              SizedBox(height: 8),
              Text(
                StringsRes.buynow,
                style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                    color: ColorsRes.white, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 8),
              Text(
                "1\$ = ${Constant.CURRENCYSYMBOL}70",
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: ColorsRes.white, fontWeight: FontWeight.bold)),
              ),
              Text(
                StringsRes.usdt,
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: ColorsRes.white.withOpacity(0.5),
                    fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CreateBuyWidgetList();

    return Form(
      key: _formKey,
      child: message!.trim().isNotEmpty
          ? Center(
              child: Text(
              message!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
                  child: Center(
                    child: Text(
                      StringsRes.buyinfo,
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                      // primary: false,
                      padding: EdgeInsets.only(left: 20, right: 20),
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 12,
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      children: buywidgetlist),
                ),
              ],
            ),
    );
  }

  void SetNairaAmt() {
    double maincoin = 000000.0;
    if (edtusd.text != null && edtusd.text.toString().trim().isNotEmpty) {
      maincoin = coinprice * double.parse(edtusd.text);
    }
    edtnaira.text = maincoin.toString();
  }
}
