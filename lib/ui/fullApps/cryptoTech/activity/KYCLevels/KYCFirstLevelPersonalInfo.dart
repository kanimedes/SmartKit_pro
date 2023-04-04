import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/activity/KYCLevels/KYCFirstLevelBVNVerification.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/Constant.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/StringsRes.dart';
import 'package:smartkit_pro/ui/fullApps/cryptoTech/helper/UIData.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();

class KYCFirstLevelPersonalInfo extends StatelessWidget {
  const KYCFirstLevelPersonalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.bgcolor,
      key: scaffoldKey,
      appBar: DesignConfig.SetAppbar(StringsRes.kycapplication)
          as PreferredSizeWidget?,
      body: Builder(
        builder: (context) => Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: MyCustomForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtfname = TextEditingController(text: UIData.fname);
  TextEditingController edtlname = TextEditingController(text: UIData.lname);
  TextEditingController edtmobile =
      TextEditingController(text: UIData.usermobileno);
  TextEditingController edtaddress =
      TextEditingController(text: UIData.useraddress);
  TextEditingController edtdob = TextEditingController(text: "26/01/1947");

  Future _selectDate(TextEditingController edtcontroller) async {
    int year = DateTime.now().year;
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(year + 1),
    );

    if (picked != null) {
      edtcontroller.text = DateFormat('dd/MM/yyyy').format(picked).toString();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // session = new UserSessionManager(context);

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${StringsRes.personaldetails}\t",
                  style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                      color: ColorsRes.secondgradientcolor,
                      fontWeight: FontWeight.bold)),
                ),
                Text(
                  StringsRes.level1bankinfo,
                  style: Theme.of(context).textTheme.caption,
                ),
              ]),
          SizedBox(
            height: 5,
          ),
          Divider(
            color: ColorsRes.grey,
          ),
          SizedBox(
            height: 5,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(
              Icons.info_outline,
              color: ColorsRes.black,
              size: 16,
            ),
            Flexible(
                child: Text("\t\t${StringsRes.level1infowarning}",
                    style: Theme.of(context).textTheme.caption!.merge(TextStyle(
                        color: ColorsRes.black, fontWeight: FontWeight.w500)))),
          ]),
          SizedBox(
            height: 15,
          ),
          Text(StringsRes.first_name,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: ColorsRes.appcolor))),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: DesignConfig.outlineboxtext,
            padding: EdgeInsets.only(left: 5, right: 5),
            child: TextFormField(
              style: TextStyle(color: ColorsRes.black, fontSize: 14),
              cursorColor: ColorsRes.appcolor,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: StringsRes.first_name,
                hintStyle: TextStyle(color: ColorsRes.grey),
              ),
              controller: edtfname,
              keyboardType: TextInputType.text,
              validator: (val) =>
                  val!.trim().isEmpty ? StringsRes.enter_first_name : null,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(StringsRes.last_name,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: ColorsRes.appcolor))),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: DesignConfig.outlineboxtext,
            padding: EdgeInsets.only(left: 5, right: 5),
            child: TextFormField(
              style: TextStyle(color: ColorsRes.black, fontSize: 14),
              cursorColor: ColorsRes.appcolor,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: StringsRes.last_name,
                hintStyle: TextStyle(color: ColorsRes.grey),
              ),
              controller: edtlname,
              keyboardType: TextInputType.text,
              validator: (val) =>
                  val!.trim().isEmpty ? StringsRes.enter_last_name : null,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(StringsRes.dob,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: ColorsRes.appcolor))),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              _selectDate(edtdob);
            },
            child: Container(
              decoration: DesignConfig.outlineboxtext,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                style: TextStyle(color: ColorsRes.black, fontSize: 14),
                cursorColor: ColorsRes.appcolor,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: StringsRes.dob,
                  hintStyle: TextStyle(color: ColorsRes.grey),
                  errorStyle: TextStyle(color: ColorsRes.red),
                ),
                validator: (val) =>
                    val!.trim().isEmpty ? StringsRes.enter_dob : null,
                controller: edtdob,
                enabled: false,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(StringsRes.mobile_number,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: ColorsRes.appcolor))),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: DesignConfig.outlineboxtext,
            padding: EdgeInsets.only(left: 5, right: 5),
            child: TextFormField(
              style: TextStyle(color: ColorsRes.black, fontSize: 14),
              cursorColor: ColorsRes.appcolor,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: StringsRes.mobile_number,
                hintStyle: TextStyle(color: ColorsRes.grey),
              ),
              keyboardType: TextInputType.phone,
              validator: (val) => Constant.validateMobile(val!),
              controller: edtmobile,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(StringsRes.address,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .merge(TextStyle(color: ColorsRes.appcolor))),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: DesignConfig.outlineboxtext,
            padding: EdgeInsets.only(left: 5, right: 5),
            child: TextFormField(
              style: TextStyle(color: ColorsRes.black, fontSize: 14),
              cursorColor: ColorsRes.appcolor,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: StringsRes.address,
                hintStyle: TextStyle(color: ColorsRes.grey),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 3,
              validator: (val) =>
                  val!.trim().isEmpty ? StringsRes.enteraddress : null,
              controller: edtaddress,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () async {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => KYCFirstLevelBVNVerification(
                      edtfname.text,
                      edtlname.text,
                      edtdob.text,
                      edtmobile.text,
                      edtaddress.text)));
            },
            child: Container(
              decoration: DesignConfig.circulargradient_box,
              margin: EdgeInsets.only(top: 10),
              width: double.maxFinite,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                StringsRes.next,
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
