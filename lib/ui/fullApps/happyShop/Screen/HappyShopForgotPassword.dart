// ignore_for_file: empty_catches

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopString.dart';

import 'HappyShopHome.dart';

class HappyShopForgotPassword extends StatefulWidget {
  const HappyShopForgotPassword({Key? key}) : super(key: key);

  @override
  _HappyShopForgotPasswordState createState() =>
      _HappyShopForgotPasswordState();
}

class _HappyShopForgotPasswordState extends State<HappyShopForgotPassword>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isCodeSent = false;
  String? mobile, name, email, id, otp, countrycode, countryName;
  final mobileController = TextEditingController();
  final ccodeController = TextEditingController();
  late Animation buttonSqueezeanimation;
  late AnimationController buttonController;

  @override
  void dispose() {
    buttonController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    buttonController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);

    buttonSqueezeanimation = new Tween(
      begin: deviceWidth * 0.7,
      end: 50.0,
    ).animate(new CurvedAnimation(
      parent: buttonController,
      curve: new Interval(
        0.0,
        0.150,
      ),
    ));
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      _playAnimation();
      validAniatin();
    }
  }

  Future<void> _playAnimation() async {
    try {
      await buttonController.forward();
    } on TickerCanceled {}
  }

  Future<void> validAniatin() async {
    Future.delayed(Duration(seconds: 2)).then((_) async {
      await buttonController.reverse();

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HappyShopHome()));
    });
  }

  getPwdBtn() {
    return new AnimatedBuilder(
      builder: _buildBtnAnimation,
      animation: buttonSqueezeanimation,
    );
  }

  Widget _buildBtnAnimation(BuildContext context, Widget? child) {
    return CupertinoButton(
      child: Container(
        width: buttonSqueezeanimation.value,
        height: 45,
        alignment: FractionalOffset.center,
        decoration: new BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: const [primaryLight2, primaryLight3],
              stops: const [0, 1]),
          borderRadius: new BorderRadius.all(const Radius.circular(50.0)),
        ),
        child: buttonSqueezeanimation.value > 75.0
            ? Text(GET_PASSWORD,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: white, fontWeight: FontWeight.normal))
            : new CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
      ),
      onPressed: () {
        validateAndSubmit();
      },
    );
  }

  bool validateAndSave() {
    final form = _formkey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  imageView() {
    return Container(
      padding: EdgeInsets.only(top: 100.0),
      child: Center(
        child: new SvgPicture.asset(
          'assets/images/fullApps/happyshop/happyshopwhitelogo.svg',
          width: 80.0,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  forgotPassTxt() {
    return Padding(
        padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
        child: Center(
          child: new Text(
            FORGOT_PASSWORDTITILE,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: lightblack, fontWeight: FontWeight.bold),
          ),
        ));
  }

  setCountryCode() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
        child: Container(
          width: width,
          height: 49,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: darkgrey)),
          child: CountryCodePicker(
              showCountryOnly: false,
              searchDecoration: InputDecoration(
                hintText: COUNTRY_CODE_LBL,
                fillColor: primary,
              ),
              showOnlyCountryWhenClosed: false,
              initialSelection: 'IN',
              alignLeft: true,
              dialogSize: Size(width, height),
              builder: _buildCountryPicker,
              onChanged: (CountryCode countryCode) {
                countrycode = countryCode.toString().replaceFirst("+", "");

                countryName = countryCode.name;
              },
              onInit: (code) {
                countrycode = code.toString().replaceFirst("+", "");
              }),
        ));
  }

  Widget _buildCountryPicker(CountryCode? country) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Flexible(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: new Image.asset(
                country!.flagUri!,
                package: 'country_code_picker',
                height: 35,
                width: 30,
              ),
            ),
          ),
          new Flexible(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: new Text(country.dialCode!),
            ),
          ),
          new Flexible(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: new Text(
                country.name!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      );

  setMobileNo() {
    return Padding(
      padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: mobileController,
        onSaved: (String? value) {
          mobile = value;
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.call),
            hintText: MOBILEHINT_LBL,
            contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
      ),
    );
  }

  expandedBottomView() {
    return Expanded(
        child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 60.0),
                    child: Form(
                      key: _formkey,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        margin: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            forgotPassTxt(),
                            setCountryCode(),
                            setMobileNo(),
                            getPwdBtn(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  back() {
    return BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [primaryLight2, primaryLight3],
          stops: const [0, 1]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: back(),
        child: Center(
            child: kIsWeb
                ? SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          imageView(),
                          expandedBottomView(),
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: <Widget>[
                      imageView(),
                      expandedBottomView(),
                    ],
                  )),
      ),
    );
  }
}
