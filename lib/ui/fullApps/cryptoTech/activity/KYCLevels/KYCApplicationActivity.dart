// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/KYCLevels/KYCFirstLevelPersonalInfo.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/KYCLevels/KYCSecondLevelActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'KYCThirdLevelActivity.dart';

class KYCApplicationActivity extends StatefulWidget {
  const KYCApplicationActivity({Key? key}) : super(key: key);

  @override
  KYCApplicationState createState() => KYCApplicationState();
}

class KYCApplicationState extends State<KYCApplicationActivity> {
  bool setlevelinfo = false, isloading = false;
  late List<Widget> levelwidget;
  bool islevelpending = false,
      noanykycdetail = false,
      gettingkycdetails = false,
      second_documentEmpty = false,
      third_documentEmpty = false,
      bvnverified = false,
      contact_verified = false;
  String currentlevel = "1";
  String daily_transaction_limit = "50",
      monthly_transaction_limit = "100",
      remaining_daily_transaction_limit = "30",
      remaining_monthly_transaction_limit = "50";

  String daily3_transaction_limit = "500000",
      monthly3_transaction_limit = "5000000";
  String daily2_transaction_limit = "100000",
      monthly2_transaction_limit = "500000";
  String daily1_transaction_limit = "50000",
      monthly1_transaction_limit = "200000";
  String desc1 =
      "Required to perform BVN number and phone number verification for the activation. Activation is done instantly";
  String desc2 =
      "Complete Level 1 and then upload national ID card and utility bill for Level 2 KYC. Verification will be approved by SmartkitPro Team";
  String desc3 =
      "Complete Level 1 & 2 and then upload selfie with the ID card and written paper to enter Level 3. Verification will be approved by SmartkitPro Team";

  String title1 = "KYC Level 1";
  String title2 = "KYC Level 2";
  String title3 = "KYC Level 3";

  String kycimage1 = "assets/images/fullApps/cryptotech/avatar/kycimage1.svg";
  String kycimage2 = "assets/images/fullApps/cryptotech/avatar/kycimage2.svg";
  String kycimage3 = "assets/images/fullApps/cryptotech/avatar/kycimage3.svg";

  @override
  void initState() {
    super.initState();

    GetData();
  }

  GetData() async {
    await GetKYCDetails(false);

    await GetKYCLevelInfo();
  }

  Future GetKYCLevelInfo() async {
    levelwidget = [];

    levelwidget.add(Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WebsafeSvg.asset(kycimage1, height: 80, width: 80),
            SizedBox(height: 8),
            Text(
              title1,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .merge(TextStyle(color: ColorsRes.black)),
            ),
            SizedBox(height: 8),
            Text(
              "Daily Buy Limit : ${Constant.CURRENCYSYMBOL}$daily1_transaction_limit",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: ColorsRes.black)),
            ),
            Text(
              "Monthly Limit : ${Constant.CURRENCYSYMBOL}$monthly1_transaction_limit",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: ColorsRes.black)),
            ),
            SizedBox(height: 10),
            Text(
              "There is no limit for selling coins",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: ColorsRes.firstgradientcolor,
                  fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Text(
              "- $desc1",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: ColorsRes.black)),
            ),
            SizedBox(height: 30),
            isloading
                ? Center(child: CircularProgressIndicator())
                : Container(),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KYCFirstLevelPersonalInfo()));
                },
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    alignment: Alignment.center,
                    decoration: DesignConfig.BoxDecorationContainer(
                        ColorsRes.appcolor, 12),
                    child: Text(
                      StringsRes.submitdetails,
                      style: TextStyle(
                          color: ColorsRes.white, fontWeight: FontWeight.bold),
                    ))),
          ],
        ),
      ),
    ));

    levelwidget.add(Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WebsafeSvg.asset(kycimage2, height: 80, width: 80),
            SizedBox(height: 8),
            Text(
              title2,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .merge(TextStyle(color: ColorsRes.black)),
            ),
            SizedBox(height: 8),
            Text(
              "Daily Buy Limit : ${Constant.CURRENCYSYMBOL}$daily2_transaction_limit",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: ColorsRes.black)),
            ),
            Text(
              "Monthly Limit : ${Constant.CURRENCYSYMBOL}$monthly2_transaction_limit",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: ColorsRes.black)),
            ),
            SizedBox(height: 10),
            Text(
              "There is no limit for selling coins",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: ColorsRes.firstgradientcolor,
                  fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Text(
              "- $desc2",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: ColorsRes.black)),
            ),
            SizedBox(height: 30),
            isloading
                ? Center(child: CircularProgressIndicator())
                : Container(),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KYCSecondLevelActivity(
                              daily2_transaction_limit,
                              monthly2_transaction_limit)));
                },
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    alignment: Alignment.center,
                    decoration: DesignConfig.BoxDecorationContainer(
                        ColorsRes.appcolor, 12),
                    child: Text(
                      StringsRes.submitdetails,
                      style: TextStyle(
                          color: ColorsRes.white, fontWeight: FontWeight.bold),
                    )))
          ],
        ),
      ),
    ));

    levelwidget.add(Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WebsafeSvg.asset(kycimage3, height: 80, width: 80),
            SizedBox(height: 8),
            Text(
              title3,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .merge(TextStyle(color: ColorsRes.black)),
            ),
            SizedBox(height: 8),
            Text(
              "Daily Buy Limit : ${Constant.CURRENCYSYMBOL}$daily3_transaction_limit",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: ColorsRes.black)),
            ),
            Text(
              "Monthly Limit : ${Constant.CURRENCYSYMBOL}$monthly3_transaction_limit",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: ColorsRes.black)),
            ),
            SizedBox(height: 10),
            Text(
              "There is no limit for selling coins",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: ColorsRes.firstgradientcolor,
                  fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            Text(
              "- $desc3",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: ColorsRes.black)),
            ),
            SizedBox(height: 30),
            isloading
                ? Center(child: CircularProgressIndicator())
                : Container(),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => KYCThirdLevelActivity(
                          daily3_transaction_limit,
                          monthly3_transaction_limit)));
                },
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    alignment: Alignment.center,
                    decoration: DesignConfig.BoxDecorationContainer(
                        ColorsRes.appcolor, 12),
                    child: Text(
                      StringsRes.submitdetails,
                      style: TextStyle(
                          color: ColorsRes.white, fontWeight: FontWeight.bold),
                    )))
          ],
        ),
      ),
    ));

    //

    setlevelinfo = true;

    setState(() {});
  }

  Future GetKYCDetails(bool takeaction) async {
    noanykycdetail = false;
    islevelpending = true;

    second_documentEmpty = true;
    third_documentEmpty = true;
    bvnverified = true;

    noanykycdetail = true;

    if (takeaction) {
      if (noanykycdetail) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => KYCFirstLevelPersonalInfo()));
      } else if (currentlevel == "2" &&
          !second_documentEmpty &&
          !islevelpending) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => KYCThirdLevelActivity(
                daily3_transaction_limit, monthly3_transaction_limit)));
      } else {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => KYCSecondLevelActivity(
                daily2_transaction_limit, monthly2_transaction_limit)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 35;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: ColorsRes.statusbarcolor,
      ),
      backgroundColor: ColorsRes.bgcolor,
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: DesignConfig.gradient,
            ),
            padding: EdgeInsets.only(
                top: toppadding, left: 20, right: 20, bottom: 20),
            child: Stack(
              children: [
                Card(
                    color: ColorsRes.white,
                    shape: DesignConfig.roundedrectangleshape,
                    //margin: EdgeInsets.only(left: 10, right: 10, top: 10,bottom: 10),
                    child: gettingkycdetails
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : currentlevel == "2" &&
                                !second_documentEmpty &&
                                islevelpending
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, bottom: 25, left: 8, right: 8),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline,
                                        color: ColorsRes.firstgradientcolor,
                                        size: 50,
                                      ),
                                      Text(
                                        "You have completed the KYC Level 2 process",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .merge(TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Text(
                                        "One of our Team Member is Reviewing your Documents, Thanks.",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .merge(TextStyle()),
                                      )
                                    ]),
                              )
                            : currentlevel == "2" &&
                                    !second_documentEmpty &&
                                    !islevelpending
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25.0,
                                        bottom: 25,
                                        left: 8,
                                        right: 8),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.check_circle_outline,
                                            color: ColorsRes.firstgradientcolor,
                                            size: 50,
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            "Your Identity is verified. You have completed Level 2 KYC",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1!
                                                .merge(TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          SizedBox(height: 10),
                                          Html(
                                            data:
                                                "One of our team member verified your identity. You are now eligible to conduct buy and sell trades on Instant Coins worth <b>${Constant.CURRENCYSYMBOL} $daily_transaction_limit</b> on Daily Basis and <b>${Constant.CURRENCYSYMBOL} $monthly_transaction_limit</b> Monthly, Great job champ!.",
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Html(
                                              data:
                                                  "Now, Complete KYC Level 3 and increase your Daily and Monthly limits of trades to the highest upto <b>$daily3_transaction_limit</b> Daily and <b>$monthly3_transaction_limit</b> Monthly"),
                                          SizedBox(height: 10),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              primary: ColorsRes.white,
                                              backgroundColor: ColorsRes
                                                  .secondgradientcolor, /*textStyle: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)*/
                                            ),
                                            child: Text(
                                              "Continue to KYC Level 3",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 0.5,
                                                  color: ColorsRes.white),
                                            ),
                                            //textColor: ColorsRes.white,
                                            //color: ColorsRes.secondgradientcolor,
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          KYCThirdLevelActivity(
                                                              daily3_transaction_limit,
                                                              monthly3_transaction_limit)));
                                            },
                                          )
                                        ]),
                                  )
                                : currentlevel == "3" &&
                                        !third_documentEmpty &&
                                        islevelpending
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25.0,
                                            bottom: 25,
                                            left: 8,
                                            right: 8),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.check_circle_outline,
                                                color: ColorsRes
                                                    .firstgradientcolor,
                                                size: 50,
                                              ),
                                              Text(
                                                "Great job! you have completed the KYC process for Level 3!",
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .merge(TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Text(
                                                "We have recieved your documents, and one of our team members is reviewing them, once our team verifies your identity, you will be notified by email. You can also check your KYC compliance status from your profile page.",
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2!
                                                    .merge(TextStyle()),
                                              )
                                            ]),
                                      )
                                    : currentlevel == "3" &&
                                            !third_documentEmpty &&
                                            !islevelpending
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                top: 25.0,
                                                bottom: 25,
                                                left: 8,
                                                right: 8),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.check_circle_outline,
                                                    color: ColorsRes
                                                        .firstgradientcolor,
                                                    size: 50,
                                                  ),
                                                  Text(
                                                    "Your Identity is verified. You have completed Level 3 KYC",
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle1!
                                                        .merge(TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  Html(
                                                      data:
                                                          "One of our team member verified your identity. You are now eligible to conduct buy and sell trades on Instant Coins worth <b>$daily3_transaction_limit</b>  on Daily Basis and <b>$monthly3_transaction_limit</b> Monthly, Great job champ!."),
                                                ]),
                                          )
                                        : KYCInfoContent()),
                gettingkycdetails
                    ? Container()
                    : Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            icon: Icon(
                              Icons.info,
                              color: ColorsRes.firstgradientcolor,
                            ),
                            onPressed: () {
                              ShowInfoDialog();
                            }),
                      )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(StringsRes.kycapplication,
                    style: TextStyle(color: ColorsRes.white)),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(
                      'assets/images/fullApps/cryptotech/close_button.svg'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget KYCInfoContent() {
    return setlevelinfo
        ? Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SetLevelInfoContent(),
          )
        : Container();
  }

  Widget SetLevelInfoContent() {
    //return Column(
    return PageView(
      children: levelwidget,
    );
  }

  Widget KycCompletionInfo() {
    return noanykycdetail
        ? Container(
            decoration: DesignConfig.BoxDecorationContainer(
                ColorsRes.yellow.withOpacity(0.1), 3),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(top: 10),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.info,
                    color: ColorsRes.yellow,
                    size: 16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      child: Text(
                          "You have not completed any KYC level. Please Complete any of the following KYC level to enable more trading options.",
                          style: TextStyle(color: ColorsRes.orange))),
                ]),
          )
        : currentlevel == "1" && !bvnverified
            ? Container(
                decoration: DesignConfig.BoxDecorationContainer(
                    ColorsRes.yellow.withOpacity(0.1), 3),
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(top: 10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.info,
                        color: ColorsRes.yellow,
                        size: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                          child: Text(
                              "You have not completed any KYC level. Please Complete any of the following KYC level to enable more trading options.",
                              style: TextStyle(color: ColorsRes.orange))),
                    ]),
              )
            : currentlevel == "1" && !contact_verified
                ? Container(
                    decoration: DesignConfig.BoxDecorationContainer(
                        ColorsRes.yellow.withOpacity(0.1), 3),
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.info,
                            color: ColorsRes.yellow,
                            size: 16,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                              child: Text(
                                  "You have not completed any KYC level. Verified your Contact Number",
                                  style: TextStyle(color: ColorsRes.yellow))),
                        ]),
                  )
                : currentlevel == "1" && bvnverified && contact_verified
                    ? Container(
                        decoration: DesignConfig.BoxDecorationContainer(
                            ColorsRes.yellow.withOpacity(0.1), 3),
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.info,
                                color: ColorsRes.yellow,
                                size: 16,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                  child: Text(
                                      "Congratulations! You have completed KYC level 1. Please Complete the next level of KYC to enable more trading options.",
                                      style:
                                          TextStyle(color: ColorsRes.yellow))),
                            ]),
                      )
                    : currentlevel == "2" &&
                            !second_documentEmpty &&
                            !islevelpending
                        ? Container(
                            decoration: DesignConfig.BoxDecorationContainer(
                                ColorsRes.orange.withOpacity(0.1), 3),
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Icon(
                                    Icons.check_circle,
                                    color: ColorsRes.orange,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Flexible(
                                      child: Text(
                                          "Congratulations! You have completed and verified KYC level 2. Please Complete the next level of KYC to enable more trading options.",
                                          style: TextStyle(
                                              color: ColorsRes.orange))),
                                ]),
                          )
                        : currentlevel == "2" && second_documentEmpty
                            ? Container(
                                decoration: DesignConfig.BoxDecorationContainer(
                                    ColorsRes.orange.withOpacity(0.1), 3),
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Icon(
                                        Icons.check_circle,
                                        color: ColorsRes.orange,
                                        size: 16,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Flexible(
                                          child: Text(
                                              "Congratulations! You have completed KYC level 1. Please Complete the next level of KYC to enable more trading options.",
                                              style: TextStyle(
                                                  color: ColorsRes.orange))),
                                    ]),
                              )
                            : currentlevel == "2" &&
                                    !second_documentEmpty &&
                                    islevelpending
                                ? Container(
                                    decoration:
                                        DesignConfig.BoxDecorationContainer(
                                            ColorsRes.orange.withOpacity(0.1),
                                            3),
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Icon(
                                            Icons.verified_user,
                                            color: ColorsRes.orange,
                                            size: 16,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Flexible(
                                              child: Text(
                                                  "You have submitted Documents for KYC level 2. Pending for Verification, after Verification you can submit Documentation for KYC Level 3.",
                                                  style: TextStyle(
                                                      color:
                                                          ColorsRes.orange))),
                                        ]),
                                  )
                                : currentlevel == "3" &&
                                        !third_documentEmpty &&
                                        !islevelpending
                                    ? Container(
                                        decoration:
                                            DesignConfig.BoxDecorationContainer(
                                                ColorsRes.firstgradientcolor
                                                    .withOpacity(0.1),
                                                3),
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Icon(
                                                Icons.check_circle,
                                                color: ColorsRes
                                                    .firstgradientcolor,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Flexible(
                                                  child: Text(
                                                      "Congratulations! You have completed and verified all KYC levels",
                                                      style: TextStyle(
                                                          color: ColorsRes
                                                              .secondgradientcolor))),
                                            ]),
                                      )
                                    : currentlevel == "3" && third_documentEmpty
                                        ? Container(
                                            decoration: DesignConfig
                                                .BoxDecorationContainer(
                                                    ColorsRes.firstgradientcolor
                                                        .withOpacity(0.1),
                                                    3),
                                            padding: EdgeInsets.all(5),
                                            margin: EdgeInsets.only(top: 10),
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Icon(
                                                    Icons.check_circle,
                                                    color: ColorsRes
                                                        .firstgradientcolor,
                                                    size: 16,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Flexible(
                                                      child: Text(
                                                          "Congratulations! You have completed KYC level 2. Please Complete the next level of KYC to enable more trading options.",
                                                          style: TextStyle(
                                                              color: ColorsRes
                                                                  .secondgradientcolor))),
                                                ]),
                                          )
                                        : currentlevel == "3" &&
                                                !third_documentEmpty &&
                                                islevelpending
                                            ? Container(
                                                decoration: DesignConfig
                                                    .BoxDecorationContainer(
                                                        ColorsRes
                                                            .firstgradientcolor
                                                            .withOpacity(0.1),
                                                        3),
                                                padding: EdgeInsets.all(5),
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      Icon(
                                                        Icons.verified_user,
                                                        color: ColorsRes
                                                            .firstgradientcolor,
                                                        size: 16,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Flexible(
                                                          child: Text(
                                                              "You have submitted Documents for KYC level 3. Pending for Verification, after Verification your KYC Application process completed.",
                                                              style: TextStyle(
                                                                  color: ColorsRes
                                                                      .secondgradientcolor))),
                                                    ]),
                                              )
                                            : Container();
  }

  void ShowInfoDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              shape: DesignConfig.SetRoundedBorder(ColorsRes.white, 12),
              insetPadding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
              //title: new Text("Material Dialog"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      StringsRes.docinfotitle,
                      style: Theme.of(context).textTheme.subtitle2!.merge(
                          TextStyle(
                              color: ColorsRes.firstgradientcolor,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 5),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_right, color: ColorsRes.black),
                          Flexible(
                              child: Text(
                            "\tBank verification number (BVN). ( for level 1 )",
                            style: Theme.of(context).textTheme.caption!.merge(
                                TextStyle(
                                    color: ColorsRes.black,
                                    fontWeight: FontWeight.bold)),
                          ))
                        ]),
                    SizedBox(height: 5),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_right,
                            color: ColorsRes.black,
                          ),
                          Flexible(
                              child: Text(
                            "\tYour personal Phone number. ( for level 1 )",
                            style: Theme.of(context).textTheme.caption!.merge(
                                TextStyle(
                                    color: ColorsRes.black,
                                    fontWeight: FontWeight.bold)),
                          ))
                        ]),
                    SizedBox(height: 5),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_right, color: ColorsRes.black),
                          Flexible(
                              child: Text(
                            "\tProof of identity: We only accepts a valid: International passport, driver's license and other Nigerian government-issued photo ID card (Voter's, National and Residence card, etc). ( for level 2 )",
                            style: Theme.of(context).textTheme.caption!.merge(
                                TextStyle(
                                    color: ColorsRes.black,
                                    fontWeight: FontWeight.bold)),
                          ))
                        ]),
                    SizedBox(height: 8),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_right,
                            color: ColorsRes.black,
                          ),
                          Flexible(
                              child: Text(
                            "\tProof of address: We only accept a valid: utility bill. ( for level 2 )",
                            style: Theme.of(context).textTheme.caption!.merge(
                                TextStyle(
                                    color: ColorsRes.black,
                                    fontWeight: FontWeight.bold)),
                          ))
                        ]),
                    SizedBox(height: 8),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_right, color: ColorsRes.black),
                          Flexible(
                              child: Text(
                            "\tSelfie: You should take a clear photo with your face while holding up the proof of identity and a piece of paper that has \"Buying coins on smartkit/AppFeature/FullApp/CryptoTech.ng\" written on it with today's date and your signature. ( for level 3 )",
                            style: Theme.of(context).textTheme.caption!.merge(
                                TextStyle(
                                    color: ColorsRes.black,
                                    fontWeight: FontWeight.bold)),
                          ))
                        ])
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text(
                    StringsRes.lblok.toUpperCase(),
                    style: TextStyle(
                        color: ColorsRes.firstgradientcolor,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (mounted) Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
