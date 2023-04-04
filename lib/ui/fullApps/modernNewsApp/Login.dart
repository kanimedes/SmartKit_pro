import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Color.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/Session.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/ManagePref.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/SignUp.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/Helper/String.dart';
import 'package:smartkit_pro/ui/fullApps/modernNewsApp/RequestOtp.dart';
import 'Privacy.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();
  bool isLoading = false;
  String? id, name, email, pass, mobile, type, status, profile, confpass;
  String? uid;
  String? userEmail;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //show snackbar msg
  setSnackbar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: new Text(
        msg,
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).colorScheme.fontColor),
      ),
      backgroundColor: isDark! ? colors.tempdarkColor : colors.bgColor,
      elevation: 1.0,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            showContent(),
            showCircularProgress(isLoading, colors.primary)
          ],
        ));
  }

  //show form content
  showContent() {
    return SingleChildScrollView(
        padding: EdgeInsetsDirectional.only(
            top: 35.0, bottom: 20.0, start: 20.0, end: 20.0),
        child: Form(
            key: _formkey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  skipBtn(),
                  loginTxt(),
                  emailSet(),
                  passSet(),
                  forgotPassSet(),
                  loginBtn(),
                  dontHaveAccTxt(),
                  dividerOr(),
                  bottomBtn(),
                  termPolicyTxt(),
                ])));
  }

  //navigate page route
  Future<void> navigationPage() async {
    bool isFirstTime = await getPrefrenceBool(ISFIRSTTIME);
    if (isFirstTime) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => ManagePref(
                    from: 2,
                  )),
          (Route<dynamic> route) => false);
    }
  }

  //set skip login btn
  skipBtn() {
    return InkWell(
      child: Align(
          alignment: Alignment.topRight,
          child: Container(
              height: 44,
              width: 43,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.boxColor,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: colors.tempdarkColor.withOpacity(0.4),
                        blurRadius: 2.0,
                        offset: Offset(0.0, 0.3),
                        spreadRadius: 0.1)
                  ],
                  borderRadius: BorderRadius.circular(15.0)),
              child: SvgPicture.asset(
                "assets/images/fullApps/modernNews/svg/skip_icon.svg",
                semanticsLabel: 'skip icon',
              ))),
      onTap: () {
        setPrefrenceBool(ISFIRSTTIME, true);
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
      },
    );
  }

  loginTxt() {
    return Padding(
      padding: EdgeInsets.only(top: 35.0),
      child: Text(
        getTranslated(context, 'login_txt')!,
        style: Theme.of(context).textTheme.headline5?.copyWith(
            color: colors.primary,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5),
      ),
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  emailSet() {
    return Padding(
      padding: EdgeInsets.only(top: 40.0),
      child: TextFormField(
        focusNode: emailFocus,
        textInputAction: TextInputAction.next,
        controller: emailC,
        style: Theme.of(this.context)
            .textTheme
            .subtitle1
            ?.copyWith(color: Theme.of(context).colorScheme.fontColor),
        validator: (val) => emailValidation(val!, context),
        onChanged: (String value) {
          setState(() {
            email = value;
          });
        },
        onFieldSubmitted: (v) {
          _fieldFocusChange(context, emailFocus, passFocus);
        },
        decoration: InputDecoration(
          hintText: getTranslated(context, 'email_lbl')!,
          hintStyle: Theme.of(this.context)
              .textTheme
              .subtitle1
              ?.copyWith(color: Theme.of(context).colorScheme.fontColor),
          filled: true,
          fillColor: Theme.of(context).colorScheme.boxColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 17),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:
                    Theme.of(context).colorScheme.borderColor.withOpacity(0.7)),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:
                    Theme.of(context).colorScheme.borderColor.withOpacity(0.7),
                width: 1.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  passSet() {
    return Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: TextFormField(
          focusNode: passFocus,
          textInputAction: TextInputAction.done,
          controller: passC,
          style: Theme.of(this.context).textTheme.subtitle1?.copyWith(
                color: Theme.of(context).colorScheme.fontColor,
              ),
          validator: (val) => passValidation(val!, context),
          onChanged: (String value) {
            setState(() {
              pass = value;
            });
          },
          decoration: InputDecoration(
            hintText: getTranslated(context, 'pass_lbl'),
            hintStyle: Theme.of(this.context).textTheme.subtitle1?.copyWith(
                  color: Theme.of(context).colorScheme.fontColor,
                ),
            suffixIcon: Padding(
                padding: EdgeInsetsDirectional.only(end: 12.0),
                child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/images/fullApps/modernNews/svg/eye_icon.svg",
                    semanticsLabel: 'eye icon',
                    height: 11.0,
                    width: 11.0,
                    color: Theme.of(context).colorScheme.fontColor,
                  ),
                  onPressed: () {},
                )),
            filled: true,
            fillColor: Theme.of(context).colorScheme.boxColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 17),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .borderColor
                      .withOpacity(0.6)),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .borderColor
                      .withOpacity(0.7),
                  width: 1.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ));
  }

  forgotPassSet() {
    return Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Align(
          alignment: Alignment.topRight,
          child: InkWell(
            child: Text(
              getTranslated(context, 'forgot_pass_lbl')!,
              style: Theme.of(this.context).textTheme.subtitle1?.copyWith(
                    color: colors.primary,
                  ),
            ),
            onTap: () {
              forgotPassBottomSheet();
            },
          ),
        ));
  }

  //check validation of form data
  bool validateAndSave() {
    final form = _formkey.currentState;
    form!.save();
    if (form.validate()) {
      return true;
    }
    return false;
  }

  //set forgot password bottomsheet
  forgotPassBottomSheet() {
    showModalBottomSheet<dynamic>(
        context: context,
        isScrollControlled: true,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        builder: (builder) {
          return Container(
              padding: EdgeInsetsDirectional.only(
                  bottom: 20.0, top: 5.0, start: 20.0, end: 20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Theme.of(context).colorScheme.boxColor),
              child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Form(
                      key: _formkey2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                    child: SvgPicture.asset(
                                      "assets/images/fullApps/modernNews/svg/close_icon.svg",
                                      semanticsLabel: 'close icon',
                                      height: 23,
                                      width: 23,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .darkColor,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    })),
                          ),
                          Padding(
                              padding: EdgeInsetsDirectional.only(top: 10.0),
                              child: Text(
                                getTranslated(context, 'forgt_pass_head')!,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .fontColor,
                                    ),
                              )),
                          Padding(
                              padding: EdgeInsetsDirectional.only(top: 10.0),
                              child: Text(
                                getTranslated(context, 'forgot_pass_sub')!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .fontColor,
                                    ),
                              )),
                          Padding(
                              padding: EdgeInsetsDirectional.only(
                                  top: 25.0, bottom: 10.0),
                              child: TextFormField(
                                textInputAction: TextInputAction.done,
                                controller: emailC,
                                style: Theme.of(this.context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .fontColor),
                                /*validator: (val) => emailValidation(val!, context),*/
                                onChanged: (String value) {
                                  setState(() {
                                    email = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText:
                                      getTranslated(context, 'email_enter_lbl'),
                                  hintStyle: Theme.of(this.context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .fontColor),
                                  filled: true,
                                  fillColor:
                                      Theme.of(context).colorScheme.boxColor,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 17),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .borderColor
                                            .withOpacity(0.7)),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .borderColor
                                            .withOpacity(0.7),
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              )),
                          const SizedBox(height: 20.0),
                          Center(
                            child: InkWell(
                              child: Container(
                                height: 48.0,
                                width: deviceWidth! * 0.6,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: colors.primary,
                                    borderRadius: BorderRadius.circular(7.0)),
                                child: Text(
                                  getTranslated(context, 'submit_btn')!,
                                  style: Theme.of(this.context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                          color: colors.tempboxColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 21,
                                          letterSpacing: 0.6),
                                ),
                              ),
                              onTap: () async {
                                Navigator.pop(context);
                              },
                            ),
                          )
                        ],
                      ))));
        });
  }

  //set login with email and password btn
  loginBtn() {
    return Padding(
      padding: EdgeInsets.only(top: 40.0),
      child: InkWell(
        child: Container(
          height: 48.0,
          width: deviceWidth! * 0.6,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(7.0)),
          child: Text(
            getTranslated(context, 'login_btn')!,
            style: Theme.of(this.context).textTheme.headline6?.copyWith(
                color: colors.tempboxColor,
                fontWeight: FontWeight.w600,
                fontSize: 21,
                letterSpacing: 0.6),
          ),
        ),
        onTap: () async {
          navigationPage();
        },
      ),
    );
  }

//set have not account text
  dontHaveAccTxt() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsetsDirectional.only(top: 30.0),
      child: Column(
        children: <Widget>[
          Text(getTranslated(context, 'donthaveacc_lbl')!,
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .fontColor
                      .withOpacity(0.8))),
          InkWell(
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignUp()));
              },
              child: Text(
                getTranslated(context, 'create_acc_lbl')!,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: colors.primary, fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }

  //set divider on text
  dividerOr() {
    return Padding(
        padding: EdgeInsetsDirectional.only(top: 40.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Divider(
              color: Theme.of(context).colorScheme.fontColor.withOpacity(0.7),
              endIndent: 20,
              thickness: 1.0,
            )),
            Text(
              getTranslated(context, 'or_lbl')!,
              style: Theme.of(context).textTheme.subtitle1?.merge(TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .fontColor
                        .withOpacity(0.7),
                  )),
            ),
            Expanded(
                child: Divider(
              color: Theme.of(context).colorScheme.fontColor.withOpacity(0.7),
              indent: 20,
              thickness: 1.0,
            )),
          ],
        ));
  }

  googleBtn() {
    return InkWell(
      child: Container(
        height: 54,
        width: 54,
        padding: EdgeInsets.all(9.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).colorScheme.boxColor,
            border: Border.all(
                color:
                    Theme.of(context).colorScheme.borderColor.withOpacity(0.7),
                width: 1.8)),
        child: SvgPicture.asset(
          "assets/images/fullApps/modernNews/svg/google_button.svg",
          semanticsLabel: 'Google Btn',
        ),
      ),
      onTap: () {
        navigationPage();
      },
    );
  }

  fbBtn() {
    return Padding(
        padding: EdgeInsetsDirectional.only(start: 10.0),
        child: InkWell(
          child: Container(
            height: 54,
            width: 54,
            padding: EdgeInsets.all(9.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).colorScheme.boxColor,
                border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .borderColor
                        .withOpacity(0.7),
                    width: 1.8)),
            child: SvgPicture.asset(
              "assets/images/fullApps/modernNews/svg/facebook_button.svg",
              semanticsLabel: 'facebook Btn',
            ),
          ),
          onTap: () {
            navigationPage();
          },
        ));
  }

  phoneBtn() {
    return Padding(
        padding: EdgeInsetsDirectional.only(start: 10.0),
        child: InkWell(
          child: Container(
            height: 54,
            width: 54,
            padding: EdgeInsets.all(9.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).colorScheme.boxColor,
                border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .borderColor
                        .withOpacity(0.7),
                    width: 1.8)),
            child: SvgPicture.asset(
              "assets/images/fullApps/modernNews/svg/phone_button.svg",
              semanticsLabel: 'phone Btn',
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => RequestOtp()));
          },
        ));
  }

  appleBtn() {
    return Platform.isIOS
        ? Padding(
            padding: EdgeInsetsDirectional.only(start: 10.0),
            child: InkWell(
              child: Container(
                height: 54,
                width: 54,
                padding: EdgeInsets.all(9.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Theme.of(context).colorScheme.boxColor,
                    border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .borderColor
                            .withOpacity(0.7),
                        width: 1.8)),
                child: SvgPicture.asset(
                  "assets/images/fullApps/modernNews/svg/apple_logo.svg",
                  semanticsLabel: 'apple logo',
                ),
              ),
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    "/home", (Route<dynamic> route) => false);
              },
            ))
        : Container();
  }

  bottomBtn() {
    return Padding(
      padding: EdgeInsets.only(top: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[googleBtn(), fbBtn(), phoneBtn(), appleBtn()],
      ),
    );
  }

//set term and policy text
  termPolicyTxt() {
    return Padding(
        padding: EdgeInsets.only(bottom: 30.0, top: 25.0),
        child: Column(children: <Widget>[
          Text(
            getTranslated(context, 'agreeTermPolicy_lbl')!,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color:
                      Theme.of(context).colorScheme.fontColor.withOpacity(0.7),
                ),
          ),
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  child: Text(
                    getTranslated(context, 'term_lbl')!,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: colors.primary,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => PrivacyPolicy(
                                  title: getTranslated(context, 'term_cond')!,
                                  from: getTranslated(context, 'login_lbl'),
                                )));
                  },
                ),
                Text(
                  getTranslated(context, 'and_lbl')!,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .fontColor
                            .withOpacity(0.7),
                      ),
                ),
                InkWell(
                  child: Text(
                    getTranslated(context, 'pri_policy')!,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: colors.primary,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => PrivacyPolicy(
                                  title:
                                      getTranslated(context, 'privacy_policy')!,
                                  from: getTranslated(context, 'login_lbl'),
                                )));
                  },
                ),
              ])
        ]));
  }
}
