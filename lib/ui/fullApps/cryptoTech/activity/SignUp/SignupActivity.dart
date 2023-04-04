// ignore_for_file: unnecessary_this, no_logic_in_create_state, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/OTPView.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ease_in_widget.dart';

class SignupActivity extends StatefulWidget {
  String fname, lname, type;
  File profilefile;

  SignupActivity(this.fname, this.lname, this.type, this.profilefile);

  @override
  SignupActivityState createState() {
    return SignupActivityState(
        this.fname, this.lname, this.type, this.profilefile);
  }
}

class SignupActivityState extends State<SignupActivity> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtfdcode = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController edtusername = TextEditingController();
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtmobile = TextEditingController();
  bool issendmarketingemail = false;
  //UserSessionManager session;
  bool isLoading = false;
  bool isusernameLoading = false;

  String fname, lname, type;
  File profilefile;
  final scaffoldKeysignup = GlobalKey<ScaffoldState>();
  bool isusernameexist = false;

  SignupActivityState(this.fname, this.lname, this.type, this.profilefile);

  @override
  Widget build(BuildContext context) {
    //session = new UserSessionManager(context);
    double toppadding = 2 * kToolbarHeight;

    return Scaffold(
      key: scaffoldKeysignup,
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: DesignConfig.gradient,
            ),
            padding: EdgeInsets.only(top: toppadding, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      StringsRes.pickusername,
                      style: Theme.of(context).textTheme.headline6!.merge(
                          TextStyle(
                              color: ColorsRes.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      style: TextStyle(color: ColorsRes.white),
                      cursorColor: ColorsRes.white,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: StringsRes.email_address,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .merge(TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsRes.white.withOpacity(0.5))),
                          errorStyle: TextStyle(color: ColorsRes.grey)),
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) => Constant.validateEmail(val!),
                      controller: edtemail,
                    ),
                    TextFormField(
                      style: TextStyle(color: ColorsRes.white),
                      cursorColor: ColorsRes.white,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: StringsRes.username,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .merge(TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsRes.white.withOpacity(0.5))),
                          errorStyle: TextStyle(color: ColorsRes.grey)),
                      keyboardType: TextInputType.text,
                      validator: (val) =>
                          val!.trim().isEmpty ? StringsRes.enterusername : null,
                      controller: edtusername,
                      onChanged: (String name) async {},
                    ),
                    Row(children: [
                      isusernameLoading
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new CircularProgressIndicator(
                                backgroundColor: ColorsRes.white,
                              ),
                            )
                          : Container(),
                      SizedBox(width: 10),
                      edtusername.text.trim().isNotEmpty && !isusernameexist
                          ? Icon(
                              Icons.check,
                              color: ColorsRes.white.withOpacity(0.7),
                            )
                          : Container(),
                      edtusername.text.trim().isNotEmpty && isusernameexist
                          ? Text(
                              StringsRes.usernameexist,
                              style: TextStyle(
                                  color: ColorsRes.white.withOpacity(0.7),
                                  decoration: TextDecoration.underline),
                            )
                          : Container(),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: TextFormField(
                        style: TextStyle(color: ColorsRes.white),
                        cursorColor: ColorsRes.white,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: StringsRes.mobile_number,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .merge(TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorsRes.white.withOpacity(0.5))),
                            errorStyle: TextStyle(color: ColorsRes.grey)),
                        keyboardType: TextInputType.phone,
                        validator: (val) => Constant.validateMobile(val!),
                        controller: edtmobile,
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(color: ColorsRes.white, fontSize: 20),
                      obscuringCharacter: "*",
                      cursorColor: ColorsRes.white,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: StringsRes.password,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .merge(TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsRes.white.withOpacity(0.5))),
                          errorStyle: TextStyle(color: ColorsRes.grey)),
                      controller: edtpsw,
                      validator: (val) => val!.trim().length < 8
                          ? StringsRes.password_length_warning
                          : null,
                      obscureText: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: TextFormField(
                        style: TextStyle(color: ColorsRes.white, fontSize: 20),
                        obscuringCharacter: "*",
                        cursorColor: ColorsRes.white,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: StringsRes.confirm_password,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .merge(TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorsRes.white.withOpacity(0.5))),
                            errorStyle: TextStyle(color: ColorsRes.grey)),
                        validator: (val) => val == edtpsw.text
                            ? null
                            : StringsRes.confirm_psw_notmatch,
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: TextFormField(
                        style: TextStyle(color: ColorsRes.white),
                        cursorColor: ColorsRes.white,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: StringsRes.refercode,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .merge(TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsRes.white.withOpacity(0.5))),
                        ),
                        controller: edtfdcode,
                      ),
                    ),
                    EaseInWidget(
                        onTap: () {
                          setState(() {
                            issendmarketingemail = !issendmarketingemail;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Container(
                                decoration: BoxDecoration(
                                  color: ColorsRes.txtmaincolor,
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: ColorsRes.bgcolor,
                                      offset: Offset(1, 1),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: issendmarketingemail
                                      ? ColorsRes.white
                                      : ColorsRes.txtmaincolor,
                                )),
                            SizedBox(width: 8),
                            Expanded(
                                child: Text(
                              StringsRes.sendmemarketingemail,
                              style: Theme.of(context).textTheme.caption!.merge(
                                  TextStyle(
                                      color: ColorsRes.txtlightcolor,
                                      letterSpacing: 0.2)),
                            )),
                          ],
                        )),
                    SizedBox(height: 30),
                    isLoading
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new CircularProgressIndicator(
                              backgroundColor: ColorsRes.white,
                            ),
                          )
                        : Container(),
                    EaseInWidget(
                      onTap: () async {},
                      child: DesignConfig.EnDisButton(
                          StringsRes.lblcontinue.toUpperCase(),
                          ColorsRes.white,
                          context),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      'assets/images/fullApps/cryptotech/back_button.svg',
                      height: 50,
                      width: 50,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VerifyOtpDialog extends StatefulWidget {
  String email, password;

  VerifyOtpDialog(this.email, this.password);

  @override
  VerifyOtpAlert createState() => new VerifyOtpAlert(this.email, this.password);
}

class VerifyOtpAlert extends State<VerifyOtpDialog> {
  BuildContext? _scaffoldContext;
  bool iserror = false;
  //TextEditingController edtotp;
  String otp = '';
  bool isdialogloading = false, isgettingdata = false;
  String msg = StringsRes.enter_otp;
  String email, password;
  //UserSessionManager session;
  late double toppadding;
  final scaffoldKeyverify = GlobalKey<ScaffoldState>();

  VerifyOtpAlert(this.email, this.password);

  @override
  initState() {
    //edtotp = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    toppadding = (2 * kToolbarHeight) + MediaQuery.of(context).padding.top;

    _scaffoldContext = context;
    //session = new UserSessionManager(context);

    return Scaffold(
      key: scaffoldKeyverify,
      body: Stack(
        children: [
          Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                gradient: DesignConfig.gradient,
              ),
              padding: EdgeInsets.only(top: toppadding, left: 20, right: 20),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      StringsRes.receiveactivationmailmsg,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1!.merge(
                          TextStyle(
                              color: ColorsRes.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Container(
                    decoration: DesignConfig.BoxDecorationContainer(
                        ColorsRes.txtmaincolor, 10),
                    margin: EdgeInsets.only(top: 35),
                    padding: EdgeInsets.all(8),
                    child: OTPTextField(
                      fields: 6,
                      cursorColor: ColorsRes.white,
                      textColor: ColorsRes.white,
                      boxColor: ColorsRes.txtlightcolor,
                      onChange: (String val) {
                        otp = val.replaceAll("null", '');
                        setState(() {});
                      },
                    ),
                  ),
                  iserror
                      ? Text(
                          StringsRes.enter_otp,
                          style: TextStyle(
                              color: ColorsRes.white.withOpacity(0.5)),
                        )
                      : Container(),
                  SizedBox(height: 10),
                  isdialogloading
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new CircularProgressIndicator(
                              backgroundColor: ColorsRes.white),
                        )
                      : Container(),
                  SizedBox(height: 25),
                  EaseInWidget(
                      onTap: () async {},
                      child: DesignConfig.EnDisButton(
                          StringsRes.lblcontinue.toUpperCase(),
                          !isdialogloading && otp.trim().length == 6
                              ? ColorsRes.white
                              : ColorsRes.firstgradientcolor,
                          context)),
                ],
              ))),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      'assets/images/fullApps/cryptotech/back_button.svg',
                      height: 50,
                      width: 50,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthOtpDialog extends StatefulWidget {
  String userid;

  AuthOtpDialog(this.userid);

  @override
  AuthOtpAlert createState() => new AuthOtpAlert(this.userid);
}

class AuthOtpAlert extends State<AuthOtpDialog> {
  late BuildContext _scaffoldContext;
  bool iserror = false;
  TextEditingController? edtotp;
  bool isdialogloading = false, isgettingdata = false;
  String msg = StringsRes.enter_otp;
  String userid;

  AuthOtpAlert(this.userid);

  @override
  initState() {
    edtotp = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scaffoldContext = context;
    return OpenOTPDialog();
  }

  OpenOTPDialog() {
    return AlertDialog(
      title: Text(StringsRes.authtitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            controller: edtotp,
            decoration: InputDecoration(
              hintText: StringsRes.enter_otp,
              errorText: iserror ? msg : null,
            ),
          ),
          isdialogloading
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new CircularProgressIndicator(),
                )
              : Container(),
        ],
      ),
      actions: <Widget>[
        new TextButton(
          child: new Text(StringsRes.verify),
          onPressed: () async {},
        ),
        new TextButton(
          child: new Text(StringsRes.cancel),
          onPressed: () {
            Navigator.of(_scaffoldContext).pop();
          },
        ),
      ],
    );
  }
}
