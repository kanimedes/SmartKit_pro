// ignore_for_file: non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/Profile/BankAccountPage.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/Profile/NotificationSettings.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/Profile/PersonalInfoPage.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/Profile/PublicPaymentSetting.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/UIData.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/new_dialog.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/model/Bank.dart';

TextStyle? textStyle;
final _scaffoldKey = GlobalKey<ScaffoldState>();
List<Bank>? banklist;
bool isbankavailable = false, isgettingdata = true;
Bank? selectedbank;

class ProfileActivity extends StatefulWidget {
  @override
  ProfileActivityState createState() => ProfileActivityState();
}

class ProfileActivityState extends State<ProfileActivity>
    with SingleTickerProviderStateMixin {
  double topheight = 250;
  String? from;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    textStyle = Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
          fontWeight: FontWeight.w500,
          color: ColorsRes.appcolor,
        ));

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      key: _scaffoldKey,
      backgroundColor: ColorsRes.white,
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: topheight,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    height: topheight,
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(bottom: 50),
                    child: OctoImage(
                      image: CachedNetworkImageProvider(
                        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/cryptotech%2Fprofileback.jpg?alt=media&token=7f5818ee-c56c-417b-9355-b929e1c2326c",
                      ),
                      placeholderBuilder: OctoPlaceholder.blurHash(
                        "LGE0tM0]].I.}a5l\$%R*ofafkBay",
                      ),
                      errorBuilder: OctoError.icon(color: ColorsRes.black),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    backgroundColor: ColorsRes.white,
                    radius: 55,
                    child: Stack(children: [
                      CircleAvatar(
                        radius: 47,
                        child: ClipOval(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Constant.ImageWidget(UIData.userimage, 95, 95),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Center(
              child: Text(UIData.username,
                  style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                      color: ColorsRes.black, fontWeight: FontWeight.bold)))),
          Center(
              child: Text(UIData.useremail,
                  style: Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
                        color: ColorsRes.black,
                      )))),
          Padding(
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, left: 20, right: 10),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("\t\t${StringsRes.walletbalance.toUpperCase()}",
                              style: TextStyle(
                                color: ColorsRes.black,
                              )),
                          Text(
                              "\t\t${Constant.CURRENCYSYMBOL}\t${UIData.walletbalance}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .merge(TextStyle(
                                      color: ColorsRes.firstgradientcolor,
                                      fontWeight: FontWeight.w600))),
                        ],
                      ),
                    ),
                    VerticalDivider(color: ColorsRes.black),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("\t\t${StringsRes.bankingbalance.toUpperCase()}",
                              style: TextStyle(
                                color: ColorsRes.black,
                              )),
                          Text(
                              "\t\t${Constant.CURRENCYSYMBOL}\t${UIData.bankbalance}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .merge(TextStyle(
                                      color: ColorsRes.firstgradientcolor,
                                      fontWeight: FontWeight.w600))),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Divider(
            color: ColorsRes.firstgradientcolor,
            thickness: 1,
            endIndent: 30,
            indent: 30,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 10),
            child: Text(
              StringsRes.lblgeneral,
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                  color: ColorsRes.black, fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PersonalInfoPage()));
                  },
                  leading: SvgPicture.asset(
                    'assets/images/fullApps/cryptotech/pro_info.svg',
                    height: MediaQuery.of(context).size.width / 16,
                  ),
                  title: Text(
                    StringsRes.personaldetails,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  dense: true,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BankAccountPage()));
                  },
                  leading: SvgPicture.asset(
                    'assets/images/fullApps/cryptotech/pro_pass.svg',
                    height: MediaQuery.of(context).size.width / 16,
                  ),
                  title: Text(StringsRes.bankaccount,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  dense: true,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PublicPaymentSetting()));
                  },
                  leading: Icon(
                    Icons.attach_money,
                    color: ColorsRes.grey.withOpacity(0.8),
                  ),
                  title: Text(StringsRes.publicpayment,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  dense: true,
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NotificationSettings()));
                  },
                  leading: Icon(
                    Icons.notifications,
                    color: ColorsRes.grey.withOpacity(0.8),
                  ),
                  title: Text(StringsRes.notification,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  dense: true,
                ),
                ListTile(
                  onTap: () {
                    showNewDialog(
                        context: context,
                        builder: (context) => ChangePswDialog());
                  },
                  leading: SvgPicture.asset(
                    'assets/images/fullApps/cryptotech/pro_account.svg',
                    height: MediaQuery.of(context).size.width / 16,
                  ),
                  title: Text(StringsRes.change_password,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  dense: true,
                ),
                ListTile(
                  onTap: () {},
                  leading: SvgPicture.asset(
                    'assets/images/fullApps/cryptotech/pro_logout.svg',
                    height: MediaQuery.of(context).size.width / 16,
                  ),
                  title: Text(StringsRes.logout,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: ColorsRes.red)),
                  dense: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChangePswDialog extends StatefulWidget {
  @override
  ChangePswAlert createState() => ChangePswAlert();
}

class ChangePswAlert extends State<ChangePswDialog> {
  late BuildContext _scaffoldContext;
  bool iserror = false,
      iserrornew = false,
      iserrorcpsw = false,
      isotperr = false,
      isbtnvisible = true;
  TextEditingController? oldpsw, newpsw, cpsw; //,otp;
  bool isdialogloading = false;
  String? cpswerrtext;

  @override
  initState() {
    oldpsw = TextEditingController();
    //otp = new TextEditingController();
    newpsw = TextEditingController();
    cpsw = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scaffoldContext = context;
    return OpenChangePswDialog();
  }

  Container titleheader() {
    return Container(
      color: ColorsRes.white,
      width: double.maxFinite,
      padding: EdgeInsets.only(bottom: 15),
      child: Text(
        "${StringsRes.change_password} ?",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: ColorsRes.secondgradientcolor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  OpenChangePswDialog() {
    bool _obscureTextold = true, _obscureTextnew = true, _obscureTextcm = true;
    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        shape: DesignConfig.roundedrectangleshape,
        insetPadding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        content: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.close,
                  color: ColorsRes.grey,
                ),
              ),
            ),
            titleheader(),
            Container(
                margin: EdgeInsetsDirectional.only(top: 20),
                alignment: Alignment.centerLeft,
                child: Text("\tEnter Old Password",
                    style: Theme.of(context).textTheme.subtitle2!.merge(
                        TextStyle(
                            color: ColorsRes.black,
                            fontWeight: FontWeight.bold)))),
            TextField(
              obscureText: _obscureTextold,
              controller: oldpsw,
              decoration: InputDecoration(
                hintText: "Enter Old Password",
                errorText: iserror ? 'Old password not matched' : null,
                isDense: true,
                focusedBorder:
                    DesignConfig.Setoutlineborderedittext(ColorsRes.grey, 5),
                disabledBorder:
                    DesignConfig.Setoutlineborderedittext(ColorsRes.grey, 5),
                enabledBorder:
                    DesignConfig.Setoutlineborderedittext(ColorsRes.grey, 5),
                errorBorder:
                    DesignConfig.Setoutlineborderedittext(ColorsRes.grey, 5),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureTextold = !_obscureTextold;
                    });
                  },
                  child: Icon(
                    _obscureTextold ? Icons.visibility : Icons.visibility_off,
                    color: ColorsRes.grey,
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsetsDirectional.only(top: 10),
                alignment: Alignment.centerLeft,
                child: Text("\t${StringsRes.enter_new_password}",
                    style: Theme.of(context).textTheme.subtitle2!.merge(
                        TextStyle(
                            color: ColorsRes.black,
                            fontWeight: FontWeight.bold)))),
            TextField(
              obscureText: _obscureTextnew,
              controller: newpsw,
              decoration: InputDecoration(
                hintText: StringsRes.enter_new_password,
                errorText:
                    iserrornew ? StringsRes.password_length_warning : null,
                focusedBorder:
                    DesignConfig.Setoutlineborderedittext(ColorsRes.grey, 5),
                disabledBorder:
                    DesignConfig.Setoutlineborderedittext(ColorsRes.grey, 5),
                enabledBorder:
                    DesignConfig.Setoutlineborderedittext(ColorsRes.grey, 5),
                errorBorder:
                    DesignConfig.Setoutlineborderedittext(ColorsRes.grey, 5),
                isDense: true,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureTextnew = !_obscureTextnew;
                    });
                  },
                  child: Icon(
                    _obscureTextnew ? Icons.visibility : Icons.visibility_off,
                    color: ColorsRes.grey,
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsetsDirectional.only(top: 10),
                alignment: Alignment.centerLeft,
                child: Text("\t${StringsRes.enter_confirm_password}",
                    style: Theme.of(context).textTheme.subtitle2!.merge(
                        TextStyle(
                            color: ColorsRes.black,
                            fontWeight: FontWeight.bold)))),
            TextField(
              obscureText: _obscureTextcm,
              controller: cpsw,
              decoration: InputDecoration(
                hintText: StringsRes.enter_confirm_password,
                errorText: iserrorcpsw ? cpswerrtext : null,
                focusedBorder:
                    DesignConfig.Setoutlineborderedittext(ColorsRes.grey, 5),
                disabledBorder:
                    DesignConfig.Setoutlineborderedittext(ColorsRes.grey, 5),
                enabledBorder:
                    DesignConfig.Setoutlineborderedittext(ColorsRes.grey, 5),
                errorBorder:
                    DesignConfig.Setoutlineborderedittext(ColorsRes.grey, 5),
                isDense: true,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureTextcm = !_obscureTextcm;
                    });
                  },
                  child: Icon(
                    _obscureTextcm ? Icons.visibility : Icons.visibility_off,
                    color: ColorsRes.grey,
                  ),
                ),
              ),
            ),
            !isbtnvisible
                ? Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      StringsRes.otp_send,
                      style: TextStyle(
                          color: ColorsRes.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                : Container(),
            isdialogloading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  )
                : Container(),
            SizedBox(
              height: 15,
            ),
            Row(children: [
              Expanded(
                child: TextButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide(
                        width: 2, color: ColorsRes.secondgradientcolor)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
                  ),
                  //textColor: ColorsRes.secondgradientcolor,
                  //shape: DesignConfig.SetRoundedBorder(ColorsRes.secondgradientcolor, 5),
                  child: Text(StringsRes.cancel,
                      style: TextStyle(
                        color: ColorsRes.secondgradientcolor,
                      )),
                  onPressed: () {
                    Navigator.of(_scaffoldContext).pop();
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: ColorsRes.white,
                    backgroundColor: ColorsRes
                        .secondgradientcolor, /*textStyle: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)*/
                  ),
                  //textColor: ColorsRes.white,
                  //color: ColorsRes.secondgradientcolor,
                  //shape: DesignConfig.SetRoundedBorder(ColorsRes.secondgradientcolor, 5),
                  child: Text(StringsRes.change,
                      style: TextStyle(
                        color: ColorsRes.white,
                      )),
                  onPressed: () async {
                    Navigator.of(_scaffoldContext).pop();
                  },
                ),
              ),
            ])
          ]),
        ),
      );
    });
  }
}
