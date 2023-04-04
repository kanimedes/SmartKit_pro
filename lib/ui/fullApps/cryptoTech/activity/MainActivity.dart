// ignore_for_file: unnecessary_this, no_logic_in_create_state, non_constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/AirTimeRecharge/PhoneNumberScreen.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/BankingActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/Gift/GiftItemPageActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/HallOfFame/HallOfFameUserList.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/HistoryActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/HomePage.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/KYCLevels/KYCApplicationActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/KYCLevels/KYCInfoDialog.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/NotificationActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/PublicPayment/UsernameForPayment.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/RateCalculator.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/ReferalListActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/ReferpageActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/SellActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/SetTransactionPinActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/SupportTicket/SupportTicketListActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/TermsConditionActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/WithdrawActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/UIData.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/new_dialog.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/model/NotificationData.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/model/Transaction.dart';

import '../../../../app/routes.dart';
import 'Profile/ProfileActivity.dart';

Transaction? selectedtransaction, selectedtrade;

StreamController<String>? countstream;
List<NotificationData>? unreadnotificaitonlist;
late List<String> unreadnotificaitonids;

//
GlobalKey<ScaffoldState>? scafolldmain;
List<Transaction>? maintransactionlist;
List<Transaction>? maintradelist;

class MainActivity extends StatefulWidget {
  String from;
  int selectedPostion;
  MainActivity(this.from, this.selectedPostion, {Key? key}) : super(key: key);

  @override
  MainActivityState createState() => MainActivityState(this.from);
}

class MainActivityState extends State<MainActivity> {
  String from;

  int? selectedPos;

  Color homeStatusbarcolor = ColorsRes.statusbarcolor;

  MainActivityState(this.from);

  @override
  void initState() {
    super.initState();

    maintransactionlist = [];
    maintradelist = [];

    maintransactionlist = UIData.getTransactionList();
    maintradelist = UIData.getTradeList();

    scafolldmain = GlobalKey<ScaffoldState>();

    unreadnotificaitonlist = [];
    unreadnotificaitonids = [];
    setState(() {
      selectedPos = widget.selectedPostion;
    });
    if (from == "kyc") {
      Future.delayed(Duration.zero, () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => KYCApplicationActivity()));
      });
    }
  }

  @override
  void dispose() {
    if (countstream != null) countstream!.sink.close();
    super.dispose();
  }

  currentPagePosition(int position) {
    if (position == 0 || position == 3) {
      homeStatusbarcolor = ColorsRes.statusbarcolor;
    } else {
      homeStatusbarcolor = ColorsRes.bgcolor;
    }
    setState(() {
      selectedPos = position;
    });
  }

  Widget setBottomNavigation(int? pos, BuildContext bcontext) {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: ColorsRes.white,
            boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)]),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    if (pos != 0) currentPagePosition(0);
                  },
                  child: SvgPicture.asset(
                    pos == 0
                        ? 'assets/images/fullApps/cryptotech/selectedhome.svg'
                        : 'assets/images/fullApps/cryptotech/home.svg',
                    height: pos == 0
                        ? MediaQuery.of(context).size.width / 8
                        : MediaQuery.of(context).size.width / 14,
                  )),
              GestureDetector(
                  onTap: () {
                    if (pos != 1) currentPagePosition(1);
                  },
                  child: SvgPicture.asset(
                      pos == 1
                          ? 'assets/images/fullApps/cryptotech/selectedsell.svg'
                          : 'assets/images/fullApps/cryptotech/sell.svg',
                      height: pos == 1
                          ? MediaQuery.of(context).size.width / 8
                          : MediaQuery.of(context).size.width / 14)),
              GestureDetector(
                  onTap: () {
                    if (pos != 2) currentPagePosition(2);
                  },
                  child: SvgPicture.asset(
                      pos == 2
                          ? 'assets/images/fullApps/cryptotech/selectedhistory.svg'
                          : 'assets/images/fullApps/cryptotech/history.svg',
                      height: pos == 2
                          ? MediaQuery.of(context).size.width / 8
                          : MediaQuery.of(context).size.width / 14)),
              GestureDetector(
                  onTap: () {
                    if (pos != 3) currentPagePosition(3);
                  },
                  child: SvgPicture.asset(
                      pos == 3
                          ? 'assets/images/fullApps/cryptotech/selectedprofile.svg'
                          : 'assets/images/fullApps/cryptotech/profile.svg',
                      height: pos == 3
                          ? MediaQuery.of(context).size.width / 8
                          : MediaQuery.of(context).size.width / 14)),
            ]),
      ),
    );
  }

  Widget bodyContainer() {
    if (selectedPos == 0) {
      return HomePage();
    } else if (selectedPos == 1) {
      return SellActivity(0, -1);
    } else if (selectedPos == 2) {
      return HistoryActivity(0);
    } else if (selectedPos == 3) {
      return ProfileActivity();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.home, (route) => false);
          return Future.value(true);
        } as Future<bool> Function()?,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(statusBarColor: homeStatusbarcolor),
          child: Scaffold(
            key: scafolldmain,
            bottomNavigationBar: setBottomNavigation(selectedPos, context),
            drawer: Drawer(
              child: drawerData(),
            ),
            body: bodyContainer(),
          ),
        ));
  }

  Widget drawerData() {
    var width = MediaQuery.of(context).size.width / 8;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: DesignConfig.gradient,
          ),
          padding: const EdgeInsets.only(top: 50, bottom: 15),
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Platform.isIOS ? BackButton(color: ColorsRes.white) : Text(""),
              Container(
                child: ClipOval(
                  child: Constant.ImageWidget(UIData.userimage, 81, 81),
                ),
                width: 85,
                height: 85,
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(45.0)),
                    border: Border.all(
                      color: ColorsRes.appcolor,
                      width: 2,
                    )),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        UIData.username,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorsRes.white,
                        ),
                      ),
                      Text(
                        UIData.useremail,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorsRes.white.withOpacity(0.9),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(children: <Widget>[
            SizedBox(
              height: width,
              child: ListTile(
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/drhome.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(
                    StringsRes.profile,
                    style: TextStyle(color: ColorsRes.appcolor),
                  ),
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileActivity()));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/sellbuycoins.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.sellbuycoin,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SellActivity(0, -1)));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/withdraw.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.withdraw,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WithdrawActivity()));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/drhistory.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.history,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HistoryActivity(0)));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/banking.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.banking,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BankingActivity()));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/kycapplication.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.kycapplication,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.pop(context);

                    showNewDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: DesignConfig.roundedrectangleshape,
                            insetPadding: EdgeInsets.only(
                                top: 10, bottom: 10, left: 15, right: 15),
                            //backgroundColor: ColorsRes.appcolor,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: KYCInfoDialog(),
                            ),
                          );
                        });
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/pin.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.transactionpin,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            SetTransactionPinActivity("main")));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/halloffame.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.halloffame,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HallOfFameUserList()));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/airtime.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.airtimerecharge,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PhoneNumberScreen()));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/freegift.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.freegift,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GiftItemPageActivity()));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/publicpay.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.publicpayment,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UsernameForPayment()));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/calculator.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.ratecalc,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RateCalculatorActivity()));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/invitefriend.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.referfrd,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ReferpageActivity()));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/referral.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.referral,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ReferalListActivity()));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/notification.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.notification,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NotificationActivity()));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/ticket.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.supportticket,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SupportTicketListActivity()));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/termscondition.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.terms_and_condition,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TermsConditionActivity(
                            StringsRes.terms_and_condition)));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/privacypolicy.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.privacy_policy,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.of(context).pop();
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage(title: "test",)));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            TermsConditionActivity(StringsRes.privacy_policy)));
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/drrateus.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.rateus,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.of(context).pop();
                    OpenRateUsDialog();
                  }),
            ),
            SizedBox(
              height: width,
              child: ListTile(
                  subtitle: Divider(
                    color: ColorsRes.appcolor,
                    endIndent: 40,
                  ),
                  dense: true,
                  leading: SvgPicture.asset(
                    "assets/images/fullApps/cryptotech/logout.svg",
                    height: MediaQuery.of(context).size.width / 14,
                  ),
                  title: Text(StringsRes.logout,
                      style: TextStyle(color: ColorsRes.appcolor)),
                  onTap: () {
                    Navigator.pop(context);
                    //Constant.session.logoutUser(context);
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: DesignConfig.roundedrectangleshape,
                            title: Text(
                              StringsRes.logout,
                              style: TextStyle(
                                  color: ColorsRes.secondgradientcolor,
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Text(StringsRes.logoutconfirm),
                            actions: [
                              TextButton(
                                child: Text(
                                  StringsRes.cancel,
                                  style: TextStyle(
                                      color: ColorsRes.secondgradientcolor),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                  child: Text(
                                    StringsRes.logout,
                                    style: TextStyle(
                                        color: ColorsRes.secondgradientcolor),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  })
                            ],
                          );
                        });
                  }),
            )
          ]),
        ),
      ],
    );
  }

  OpenRateUsDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            shape: DesignConfig.roundedrectangleshape,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0, top: 5),
                      child: Icon(
                        Icons.close,
                        color: ColorsRes.grey,
                      ),
                    ),
                  ),
                ),
                Image.asset("assets/images/fullApps/cryptotech/rateus.png"),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
                  child: Text(
                    StringsRes.rateustitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1!.merge(
                        TextStyle(
                            color: ColorsRes.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                  child: Text(
                    "Recommend us to others by rating us ",
                    // on ${Platform.isIOS ? "Apple Store" : "Play Store"}
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .merge(TextStyle(color: ColorsRes.grey)),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 38,
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                      child: Center(
                          child: Text(
                        StringsRes.rateus,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorsRes.white,
                            fontWeight: FontWeight.bold),
                      )),
                      decoration: DesignConfig.BoxDecorationContainer(
                          ColorsRes.secondgradientcolor, 10),
                    )),
              ],
            ),
          );
        });
  }
}
