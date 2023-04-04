//KYCInfoDialog

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/KYCLevels/KYCSecondLevelActivity.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';

import 'KYCApplicationActivity.dart';
import 'KYCFirstLevelPersonalInfo.dart';
import 'KYCThirdLevelActivity.dart';

class KYCInfoDialog extends StatefulWidget {
  const KYCInfoDialog({Key? key}) : super(key: key);

  @override
  KYCInfoDialogState createState() => KYCInfoDialogState();
}

class KYCInfoDialogState extends State<KYCInfoDialog> {
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
      "Complete Level 1 and then upload national ID card and utility bill for Level 2 KYC. Verification will be approved by smartkit/AppFeature/FullApp/CryptoTech Team";
  String desc3 =
      "Complete Level 1 & 2 and then upload selfie with the ID card and written paper to enter Level 3. Verification will be approved by smartkit/AppFeature/FullApp/CryptoTech Team";

  String title1 = "KYC Level 1";
  String title2 = "KYC Level 2";
  String title3 = "KYC Level 3";

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      GetKYCDetails(false);
      GetKYCLevelInfo();
    });
  }

  Future GetKYCLevelInfo() async {
    levelwidget = [];

    levelwidget.add(Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Flexible(
          child: RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
                      color: ColorsRes.secondgradientcolor,
                      fontWeight: FontWeight.bold)),
                  text: "$title1 : \n",
                  children: <TextSpan>[
                TextSpan(
                    text: "Daily Buy Limit : ",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .merge(TextStyle(color: ColorsRes.black))),
                TextSpan(
                    text: daily1_transaction_limit,
                    style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                        fontWeight: FontWeight.bold, color: ColorsRes.grey))),
                TextSpan(
                    text: "\nMonthly Limit : ",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .merge(TextStyle(color: ColorsRes.black))),
                TextSpan(
                    text:
                        "${Constant.CURRENCYSYMBOL}$monthly1_transaction_limit\nThere is no limit for selling coins\n",
                    style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                        fontWeight: FontWeight.bold, color: ColorsRes.grey))),
                TextSpan(
                    text: "- $desc1",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .merge(TextStyle(color: ColorsRes.black))),
              ])),
        )
      ]),
    ));
    levelwidget.add(Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Flexible(
          child: RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
                      color: ColorsRes.secondgradientcolor,
                      fontWeight: FontWeight.bold)),
                  text: "$title2 : \n",
                  children: <TextSpan>[
                TextSpan(
                    text: "Daily Buy Limit : ",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .merge(TextStyle(color: ColorsRes.black))),
                TextSpan(
                    text: daily2_transaction_limit,
                    style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                        fontWeight: FontWeight.bold, color: ColorsRes.grey))),
                TextSpan(
                    text: "\nMonthly Limit : ",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .merge(TextStyle(color: ColorsRes.black))),
                TextSpan(
                    text:
                        "${Constant.CURRENCYSYMBOL}$monthly2_transaction_limit\nThere is no limit for selling coins\n",
                    style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                        fontWeight: FontWeight.bold, color: ColorsRes.grey))),
                TextSpan(
                    text: "- $desc2",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .merge(TextStyle(color: ColorsRes.black))),
              ])),
        )
      ]),
    ));
    levelwidget.add(Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Flexible(
          child: RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
                      color: ColorsRes.secondgradientcolor,
                      fontWeight: FontWeight.bold)),
                  text: "$title3 : \n",
                  children: <TextSpan>[
                TextSpan(
                    text: "Daily Buy Limit : ",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .merge(TextStyle(color: ColorsRes.black))),
                TextSpan(
                    text: daily3_transaction_limit,
                    style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                        fontWeight: FontWeight.bold, color: ColorsRes.grey))),
                TextSpan(
                    text: "\nMonthly Limit : ",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .merge(TextStyle(color: ColorsRes.black))),
                TextSpan(
                    text:
                        "${Constant.CURRENCYSYMBOL}$monthly3_transaction_limit\nThere is no limit for selling coins\n",
                    style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                        fontWeight: FontWeight.bold, color: ColorsRes.grey))),
                TextSpan(
                    text: "- $desc3",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .merge(TextStyle(color: ColorsRes.black))),
              ])),
        )
      ]),
    ));

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
    return gettingkycdetails
        ? Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            child: CircularProgressIndicator())
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              currentlevel == "2" && !second_documentEmpty && islevelpending
                  ? Padding(
                      padding: const EdgeInsets.only(
                          top: 25.0, bottom: 25, left: 8, right: 8),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
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
                              .merge(TextStyle(fontWeight: FontWeight.bold)),
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
                              top: 25.0, bottom: 25, left: 8, right: 8),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
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
                                  .merge(
                                      TextStyle(fontWeight: FontWeight.bold)),
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
                          ]),
                        )
                      : currentlevel == "3" &&
                              !third_documentEmpty &&
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
                                      "Great job! you have completed the KYC process for Level 3!",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .merge(TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                          "Your Identity is verified. You have completed Level 3 KYC",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .merge(TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Html(
                                            data:
                                                "One of our team member verified your identity. You are now eligible to conduct buy and sell trades on Instant Coins worth <b>$daily3_transaction_limit</b>  on Daily Basis and <b>$monthly3_transaction_limit</b> Monthly, Great job champ!."),
                                      ]),
                                )
                              : KYCInfoContent(),
              SizedBox(height: 20),
              !gettingkycdetails &&
                      currentlevel == "2" &&
                      !second_documentEmpty &&
                      !islevelpending
                  ? Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            //shape: DesignConfig.SetRoundedBorder(ColorsRes.grey, 10),
                            style: TextButton.styleFrom(
                              primary: ColorsRes.white,
                              backgroundColor: ColorsRes
                                  .grey, /*textStyle: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)*/
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 12),
                              child: Text(
                                StringsRes.cancel,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    color: ColorsRes.white),
                              ),
                            ),
                            //textColor: ColorsRes.white,
                            //color: ColorsRes.grey,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextButton(
                            //shape: DesignConfig.SetRoundedBorder(ColorsRes.appcolor, 10),
                            style: TextButton.styleFrom(
                              primary: ColorsRes.white,
                              backgroundColor: ColorsRes
                                  .secondgradientcolor, /*textStyle: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)*/
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 10),
                              child: Text(
                                StringsRes.lblcontinue,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    color: ColorsRes.white),
                              ),
                            ),
                            //textColor: ColorsRes.white,
                            //color: ColorsRes.secondgradientcolor,
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          KYCThirdLevelActivity(
                                              daily3_transaction_limit,
                                              monthly3_transaction_limit)));
                            },
                          ),
                        ),
                      ],
                    )
                  : !gettingkycdetails &&
                          !((currentlevel == "2" && !second_documentEmpty) ||
                              (currentlevel == "3" && !third_documentEmpty))
                      ? Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                //shape: DesignConfig.SetRoundedBorder(ColorsRes.grey, 10),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  primary: ColorsRes.white,
                                  backgroundColor: ColorsRes
                                      .grey, /*textStyle: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)*/
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 10),
                                  child: Text(
                                    StringsRes.cancel,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                        color: ColorsRes.white),
                                  ),
                                ),
                                //textColor: ColorsRes.white,
                                //color: ColorsRes.grey,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextButton(
                                //shape: DesignConfig.SetRoundedBorder(ColorsRes.appcolor, 10),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  primary: ColorsRes.white,
                                  backgroundColor: ColorsRes
                                      .secondgradientcolor, /*textStyle: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)*/
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 10),
                                  child: Text(
                                    StringsRes.lblcontinue,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                        color: ColorsRes.white),
                                  ),
                                ),
                                //textColor: ColorsRes.white,
                                //color: ColorsRes.secondgradientcolor,
                                onPressed: () {
                                  if (currentlevel == "2" &&
                                      !second_documentEmpty &&
                                      !islevelpending) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                KYCThirdLevelActivity(
                                                    daily3_transaction_limit,
                                                    monthly3_transaction_limit)));
                                  } else {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                KYCApplicationActivity()));
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      : TextButton(
                          //shape: DesignConfig.SetRoundedBorder(ColorsRes.grey, 10),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            primary: ColorsRes.white,
                            backgroundColor: ColorsRes
                                .grey, /*textStyle: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)*/
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12, bottom: 10),
                            child: Text(
                              StringsRes.lblok,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  color: ColorsRes.white),
                            ),
                          ),
                          //textColor: ColorsRes.white,
                          //color: ColorsRes.grey,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
            ],
          );
  }

  Widget KYCInfoContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          StringsRes.kycverification,
          style: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
              color: ColorsRes.secondgradientcolor,
              fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 5),
        Text(StringsRes.kycverificationinfo,
            style: TextStyle(color: ColorsRes.textgrey)),
        gettingkycdetails ? Container() : KycCompletionInfo(),
        SizedBox(
          height: 10,
        ),
        Text(
          StringsRes.note,
          style: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
              color: ColorsRes.secondgradientcolor,
              fontWeight: FontWeight.bold)),
        ),
        Text(StringsRes.kycverificationnote,
            style: Theme.of(context)
                .textTheme
                .caption!
                .merge(TextStyle(color: ColorsRes.red))),
      ],
    );
  }

  Widget KycCompletionInfo() {
    return noanykycdetail
        ? Container(
            decoration: DesignConfig.BoxDecorationContainer(
                ColorsRes.yellow.withOpacity(0.1), 3),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(top: 10),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
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
}
