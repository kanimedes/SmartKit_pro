import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/SignUp/Signup_Page2.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ease_in_widget.dart';

import '../TermsConditionActivity.dart';

class Signup_Page1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Signup_Page1State();
  }
}

class Signup_Page1State extends State<Signup_Page1> {
  Color btntextcolor = ColorsRes.firstgradientcolor;
  TextEditingController edtfname = new TextEditingController();
  TextEditingController edtlname = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String selectedtype = '';
  bool txt1enable = false,
      txt2enable = false,
      chktypeerr = false,
      acceptterms = false;

  @override
  Widget build(BuildContext context) {
    double toppadding =
        (2 * kToolbarHeight) + MediaQuery.of(context).padding.top;

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
        body: Stack(
          children: <Widget>[
            Center(
              child: Container(
                color: ColorsRes.bgcolor,
                padding: EdgeInsets.only(top: toppadding, left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringsRes.enter_first_name,
                          style: Theme.of(context).textTheme.button!.merge(
                              TextStyle(
                                  color: ColorsRes.txtlightcolor,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: DesignConfig.BoxDecorationContainer(
                              ColorsRes.editboxcolor, 15),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          child: TextFormField(
                            style: TextStyle(color: ColorsRes.appcolor),
                            cursorColor: ColorsRes.appcolor,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: StringsRes.first_name,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .merge(TextStyle(
                                      color:
                                          ColorsRes.appcolor.withOpacity(0.5))),
                            ),
                            controller: edtfname,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          StringsRes.enter_last_name,
                          style: Theme.of(context).textTheme.button!.merge(
                              TextStyle(
                                  color: ColorsRes.txtlightcolor,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                            decoration: DesignConfig.BoxDecorationContainer(
                                ColorsRes.editboxcolor, 15),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            child: TextFormField(
                              style: TextStyle(color: ColorsRes.appcolor),
                              cursorColor: ColorsRes.appcolor,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: StringsRes.last_name,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .merge(TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorsRes.appcolor
                                            .withOpacity(0.5))),
                              ),
                              controller: edtlname,
                              keyboardType: TextInputType.text,
                            )),
                        SizedBox(height: 30),
                        Row(children: [
                          Expanded(
                            child: EaseInWidget(
                              onTap: () {
                                if (selectedtype != Constant.UserType_Amateur) {
                                  setState(() {
                                    selectedtype = Constant.UserType_Amateur;
                                  });
                                }
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: ColorsRes.editboxcolor,
                                      border: Border.all(
                                          width: 1,
                                          color: selectedtype ==
                                                  Constant.UserType_Amateur
                                              ? ColorsRes.appcolor
                                              : ColorsRes.editboxcolor)),
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, left: 10, right: 5),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/fullApps/cryptotech/enable_amateur.svg',
                                        height:
                                            MediaQuery.of(context).size.width /
                                                10,
                                        color: selectedtype ==
                                                Constant.UserType_Amateur
                                            ? ColorsRes.appcolor
                                            : ColorsRes.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(StringsRes.lblamateur,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button!
                                                  .merge(TextStyle(
                                                      color: selectedtype ==
                                                              Constant
                                                                  .UserType_Amateur
                                                          ? ColorsRes.appcolor
                                                          : ColorsRes
                                                              .firstgradientcolor
                                                              .withOpacity(0.7),
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'MyFont'))),
                                          Text(StringsRes.lblbeginner,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .merge(TextStyle(
                                                      color: selectedtype ==
                                                              Constant
                                                                  .UserType_Amateur
                                                          ? ColorsRes
                                                              .txtlightcolor
                                                          : ColorsRes.grey,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'MyFont'))),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: EaseInWidget(
                              onTap: () {
                                if (selectedtype != Constant.UserType_Pro) {
                                  setState(() {
                                    selectedtype = Constant.UserType_Pro;
                                  });
                                }
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: ColorsRes.editboxcolor,
                                      border: Border.all(
                                          width: 1,
                                          color: selectedtype ==
                                                  Constant.UserType_Pro
                                              ? ColorsRes.appcolor
                                              : ColorsRes.editboxcolor)),
                                  padding: EdgeInsets.only(
                                      top: 8, bottom: 8, left: 10, right: 5),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/images/fullApps/cryptotech/enable_pro.svg',
                                        height:
                                            MediaQuery.of(context).size.width /
                                                10,
                                        color: selectedtype ==
                                                Constant.UserType_Pro
                                            ? ColorsRes.appcolor
                                            : ColorsRes.grey,
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(StringsRes.lblpro,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .button!
                                                  .merge(TextStyle(
                                                      color: selectedtype ==
                                                              Constant
                                                                  .UserType_Pro
                                                          ? ColorsRes.appcolor
                                                          : ColorsRes
                                                              .firstgradientcolor
                                                              .withOpacity(0.7),
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'MyFont'))),
                                          Text(StringsRes.lblexpert,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .merge(TextStyle(
                                                      color: selectedtype ==
                                                              Constant
                                                                  .UserType_Pro
                                                          ? ColorsRes
                                                              .txtlightcolor
                                                          : ColorsRes.grey,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'MyFont'))),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ]),
                        SizedBox(height: 50),
                        RichText(
                            text: TextSpan(
                                style: new TextStyle(
                                    color: ColorsRes.txtlightcolor
                                        .withOpacity(0.5)),
                                text: StringsRes.i_accept,
                                children: <TextSpan>[
                              TextSpan(
                                  text: StringsRes.terms_and_condition,
                                  style: TextStyle(
                                    color: ColorsRes.appcolor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TermsConditionActivity(
                                                      StringsRes
                                                          .terms_and_condition)));
                                    }),
                              TextSpan(text: "\t${StringsRes.Lbl_AND}\t"),
                              TextSpan(
                                  text: StringsRes.privacy_policy,
                                  style: TextStyle(
                                    color: ColorsRes.appcolor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TermsConditionActivity(
                                                      StringsRes
                                                          .privacy_policy)));
                                    }),
                            ])),
                        SizedBox(height: 25),
                        EaseInWidget(
                            onTap: () {
                              if (!chktypeerr) {
                                setState(() {
                                  chktypeerr = true;
                                });
                              }
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Signup_Page2(
                                      edtfname.text,
                                      edtlname.text,
                                      selectedtype)));
                            },
                            child: DesignConfig.EnDisButton(
                                StringsRes.lblcontinue.toUpperCase(),
                                txt1enable && txt2enable && selectedtype != ''
                                    ? ColorsRes.white
                                    : ColorsRes.grey,
                                context)),
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
                          'assets/images/fullApps/cryptotech/back_button.svg')),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
