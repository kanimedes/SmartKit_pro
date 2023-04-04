// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ease_in_widget.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/new_dialog.dart';

import 'SignUp/Signup_Page1.dart';

GlobalKey<ScaffoldState>? scaffoldKey;

class LoginActivity extends StatefulWidget {
  const LoginActivity({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginActivityState();
  }
}

class LoginActivityState extends State<LoginActivity> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController forgotedtemail = TextEditingController();

  final bool _obscureText = true;
  bool isLoading = false, isdialogloading = false;

  @override
  void initState() {
    super.initState();

    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = 2 * kToolbarHeight;
    var width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: ColorsRes.bgcolor,
          shadowColor: Colors.transparent,
        ),
        backgroundColor: ColorsRes.bgcolor,
        key: scaffoldKey,
        body: Stack(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: toppadding,
                        ),
                        Image.asset(
                          'assets/images/fullApps/cryptotech/logo.png',
                          color: ColorsRes.appcolor,
                          height: width - 100,
                        ),
                        Container(
                          decoration: DesignConfig.BoxDecorationContainer(
                              ColorsRes.editboxcolor, 10),
                          margin: EdgeInsets.only(top: 30),
                          padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                          child: TextFormField(
                            style: TextStyle(color: ColorsRes.appcolor),
                            cursorColor: ColorsRes.appcolor,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: StringsRes.email_address,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .merge(TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          ColorsRes.appcolor.withOpacity(0.5))),
                              border: InputBorder.none,
                              errorStyle: TextStyle(color: ColorsRes.grey),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) => Constant.validateEmail(val!),
                            controller: edtemail,
                          ),
                        ),
                        Container(
                          decoration: DesignConfig.BoxDecorationContainer(
                              ColorsRes.editboxcolor, 10),
                          margin: EdgeInsets.only(top: 12),
                          padding: EdgeInsets.only(left: 10, right: 5),
                          child: TextFormField(
                            obscureText: _obscureText,
                            controller: edtpsw,
                            validator: (val) =>
                                val!.isEmpty ? StringsRes.enter_password : null,
                            style: TextStyle(color: ColorsRes.appcolor),
                            cursorColor: ColorsRes.appcolor,
                            decoration: InputDecoration(
                              hintText: StringsRes.password,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .merge(TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          ColorsRes.appcolor.withOpacity(0.5))),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              showNewDialog(
                                  context: context,
                                  builder: (context) => ForgotDialog());
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 2),
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                "${StringsRes.forgot_password} ?",
                                style: TextStyle(
                                    color: ColorsRes.firstgradientcolor),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        isLoading
                            ? Center(
                                child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(),
                              ))
                            : Container(),
                        EaseInWidget(
                          onTap: () async {
                            Constant.GoToMainPage("login", context);
                          },
                          child: DesignConfig.ButtonWithShadowNew(
                              StringsRes.login.toUpperCase(), context),
                        ),
                        SizedBox(height: 12),
                        Text(StringsRes.lblor,
                            style: TextStyle(color: ColorsRes.appcolor)),
                        SizedBox(height: 12),
                        Text(StringsRes.nothvaccount,
                            style:
                                TextStyle(color: ColorsRes.firstgradientcolor)),
                        EaseInWidget(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup_Page1()));
                          },
                          child: Container(
                              decoration:
                                  DesignConfig.BoxDecorationBorderContainer(
                                      ColorsRes.appcolor.withOpacity(0.5), 10),
                              width: double.maxFinite,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              margin:
                                  EdgeInsets.only(top: 5, left: 25, right: 25),
                              child: Text(StringsRes.createnewac,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .merge(TextStyle(
                                          color: ColorsRes.appcolor,
                                          fontWeight: FontWeight.bold)))),
                        ),
                        SizedBox(
                          height: toppadding - 80,
                        ),
                      ],
                    ),
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
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ForgotDialog extends StatefulWidget {
  const ForgotDialog({Key? key}) : super(key: key);

  @override
  ForgotAlert createState() => ForgotAlert();
}

class ForgotAlert extends State<ForgotDialog> {
  late BuildContext _scaffoldContext;
  bool iserror = false;
  TextEditingController? forgotedtemail;
  bool isdialogloading = false;

  @override
  initState() {
    forgotedtemail = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scaffoldContext = context;
    return OpenForgotDialog();
  }

  OpenForgotDialog() {
    return AlertDialog(
      title: Text(StringsRes.forgot_password),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: forgotedtemail,
            decoration: InputDecoration(
              hintText: "Enter Email",
              errorText: iserror ? 'Enter Valid Email Address' : null,
            ),
          ),
          isdialogloading ? CircularProgressIndicator() : Container(),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(StringsRes.recover_password),
          onPressed: () async {},
        ),
        TextButton(
          child: Text(StringsRes.cancel),
          onPressed: () {
            Navigator.of(_scaffoldContext).pop();
          },
        ),
      ],
    );
  }
}
