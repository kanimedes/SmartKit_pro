import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/UIData.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();
TextStyle? textStyle;

class WithdrawActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorsRes.white,
        appBar: new AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(
              color: ColorsRes.white,
            ),
            elevation: 0.0,
            backgroundColor: ColorsRes.white,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: SvgPicture.asset(
                  'assets/images/fullApps/cryptotech/close_button.svg'),
            )),
        body: Builder(builder: (context) {
          textStyle = Theme.of(context).textTheme.subtitle2!.merge(TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorsRes.black,
              ));
          return Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: MyCustomForm(),
            ),
          );
        }));
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false, isdialogloading = false;
  TextEditingController edtfname = TextEditingController(text: UIData.fname);
  TextEditingController edtlname = TextEditingController(text: UIData.lname);
  TextEditingController edtmobile =
      TextEditingController(text: UIData.usermobileno);
  TextEditingController edtpsw = TextEditingController();
  TextEditingController edttransactionpin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(StringsRes.bankname, style: textStyle),
          Card(
            margin: EdgeInsets.only(bottom: 15, top: 5),
            shape: DesignConfig.SetRoundedBorder(ColorsRes.grey, 8),
            child: Container(
              width: double.maxFinite,
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
              child: Text(
                "SBI Bank",
                style: TextStyle(
                  color: ColorsRes.textgrey,
                ),
              ),
            ),
          ),
          Text(StringsRes.accountname, style: textStyle),
          Card(
            margin: EdgeInsets.only(bottom: 15, top: 5),
            shape: DesignConfig.SetRoundedBorder(ColorsRes.grey, 8),
            child: Container(
              width: double.maxFinite,
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
              child: Text(
                UIData.username,
                style: TextStyle(
                  color: ColorsRes.textgrey,
                ),
              ),
            ),
          ),
          Text(StringsRes.accountno, style: textStyle),
          Card(
            margin: EdgeInsets.only(bottom: 15, top: 5),
            shape: DesignConfig.SetRoundedBorder(ColorsRes.grey, 8),
            child: Container(
              width: double.maxFinite,
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
              child: Text(
                "123456789",
                style: TextStyle(
                  color: ColorsRes.textgrey,
                ),
              ),
            ),
          ),
          Text(StringsRes.accounttype, style: textStyle),
          Card(
            margin: EdgeInsets.only(bottom: 15, top: 5),
            shape: DesignConfig.SetRoundedBorder(ColorsRes.grey, 8),
            child: Container(
              width: double.maxFinite,
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
              child: Text(
                "Saving",
                style: TextStyle(
                  color: ColorsRes.textgrey,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(StringsRes.transactionpin, style: textStyle),
              GestureDetector(
                  onTap: () async {
                    Constant.ResetPinDialog(context, _scaffoldKey);
                  },
                  child: Text(StringsRes.resetpin,
                      style: Theme.of(context).textTheme.subtitle2!.merge(
                          TextStyle(
                              color: ColorsRes.firstgradientcolor,
                              decoration: TextDecoration.underline)))),
            ],
          ),
          Card(
            margin: EdgeInsets.only(bottom: 15, top: 5),
            shape: DesignConfig.SetRoundedBorder(ColorsRes.grey, 8),
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                style: TextStyle(
                    color: ColorsRes.firstgradientcolor,
                    fontWeight: FontWeight.bold),
                cursorColor: ColorsRes.appcolor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hoverColor: ColorsRes.appcolor,
                  fillColor: ColorsRes.white,
                  focusColor: ColorsRes.white,
                ),
                obscureText: true,
                obscuringCharacter: "*",
                validator: (val) => val!.trim().isEmpty
                    ? StringsRes.enter_transactionpin
                    : null,
                controller: edttransactionpin,
              ),
            ),
          ),
          Text(StringsRes.password, style: textStyle),
          Card(
            margin: EdgeInsets.only(bottom: 15, top: 5),
            shape: DesignConfig.SetRoundedBorder(ColorsRes.grey, 8),
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                style: TextStyle(
                    color: ColorsRes.firstgradientcolor,
                    fontWeight: FontWeight.bold),
                cursorColor: ColorsRes.appcolor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hoverColor: ColorsRes.appcolor,
                  fillColor: ColorsRes.white,
                  focusColor: ColorsRes.white,
                ),
                obscureText: true,
                obscuringCharacter: "*",
                validator: (val) =>
                    val!.trim().isEmpty ? StringsRes.password : null,
                controller: edtpsw,
              ),
            ),
          ),
          Text(StringsRes.accountbalance, style: textStyle),
          Card(
            margin: EdgeInsets.only(bottom: 15, top: 5),
            shape: DesignConfig.SetRoundedBorder(ColorsRes.grey, 8),
            child: Container(
              width: double.maxFinite,
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
              child: Row(
                children: <Widget>[
                  Text("\t\t${Constant.CURRENCYSYMBOL}\t\t",
                      style: TextStyle(
                        color: ColorsRes.black,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.4655,
                      )),
                  Container(
                      padding: EdgeInsetsDirectional.only(start: 5, end: 15),
                      height: 25,
                      child: VerticalDivider(
                        width: 1,
                        thickness: 1,
                      )),
                  Text(
                    UIData.bankbalance,
                    style: TextStyle(
                      color: ColorsRes.textgrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: isLoading ? new CircularProgressIndicator() : Container(),
          ),
          GestureDetector(
            onTap: () async {},
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(new Radius.circular(10)),
                  gradient: DesignConfig.btngradient),
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              margin: const EdgeInsets.only(top: 12, bottom: 5),
              child: Text(
                StringsRes.withdraw,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                      color: ColorsRes.white,
                      letterSpacing: 1.65,
                      fontWeight: FontWeight.w700,
                      //fontWeight: FontWeight.w500,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
