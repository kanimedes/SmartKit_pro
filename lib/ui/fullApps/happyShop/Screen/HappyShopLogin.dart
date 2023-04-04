// ignore_for_file: empty_catches

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopString.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopForgotPassword.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopHome.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/widget/HappyShopbtn.dart';

import 'HappyShopSingUp.dart';

class HappyShopLogin extends StatefulWidget {
  const HappyShopLogin({Key? key}) : super(key: key);

  @override
  _HappyShopLoginState createState() => _HappyShopLoginState();
}

class _HappyShopLoginState extends State<HappyShopLogin>
    with TickerProviderStateMixin {
  String? password,
      mobile,
      username,
      email,
      id,
      countrycode,
      mobileno,
      city,
      area,
      pincode,
      address,
      latitude,
      longitude,
      image;
  String? countryName;

  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  Animation? buttonSqueezeanimation;

  AnimationController? buttonController;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    buttonController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);

    buttonSqueezeanimation = new Tween(
      begin: deviceWidth * 0.7,
      end: 50.0,
    ).animate(new CurvedAnimation(
      parent: buttonController!,
      curve: new Interval(
        0.0,
        0.150,
      ),
    ));
  }

  @override
  void dispose() {
    buttonController!.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await buttonController!.forward();
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            height: height,
            width: width,
            decoration: back(),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 40.0, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Future.delayed(Duration(milliseconds: 000))
                                .then((_) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HappyShopHome()));
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              SKIP,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(
                                      color: white,
                                      decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: new SvgPicture.asset(
                      'assets/images/fullApps/happyshop/happyshopwhitelogo.svg',
                      width: 80.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 10.0, bottom: 20),
                              child: Form(
                                key: _formkey,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  margin: EdgeInsets.only(
                                      left: 20.0, right: 20.0, top: 10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      welcomeHappyShopTxt(),
                                      eCommerceforBusinessTxt(),
                                      setCountryCode(),
                                      setMobileNo(),
                                      setPass(),
                                      forgetPass(),
                                      loginBtn(),
                                      accSignup(),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Future<void> validatanmation() async {
    await buttonController!.reverse();
    Future.delayed(Duration(milliseconds: 500)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HappyShopHome()));
    });
  }

  bool validateAndSave() {
    return true;
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

  welcomeHappyShopTxt() {
    return Padding(
        padding: EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: new Text(
            WELCOME_HappyShop,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: lightblack, fontWeight: FontWeight.bold),
          ),
        ));
  }

  eCommerceforBusinessTxt() {
    return Padding(
        padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: new Text(
            ECOMMERCE_APP_FOR_ALL_BUSINESS,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: lightblack2),
          ),
        ));
  }

  setCountryCode() {
    double height = MediaQuery.of(context).size.height * 0.9;
    double width = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: width,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
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
                height: 40,
                width: 20,
              ),
            ),
          ),
          new Flexible(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: new Text(
                country.dialCode!,
                style: TextStyle(fontSize: 12),
              ),
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
      padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: mobileController,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onSaved: (String? value) {
          mobileno = value;
          mobile = mobileno;
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.call_outlined,
            ),
            hintText: MOBILEHINT_LBL,
            prefixIconConstraints: BoxConstraints(minWidth: 40, maxHeight: 20),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(7.0))),
      ),
    );
  }

  setPass() {
    return Padding(
      padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        controller: passwordController,
        onSaved: (String? value) {
          password = value;
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_outline),
            hintText: PASSHINT_LBL,
            prefixIconConstraints: BoxConstraints(minWidth: 40, maxHeight: 20),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(7.0))),
      ),
    );
  }

  forgetPass() {
    return Padding(
        padding:
            EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0, top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HappyShopForgotPassword()));
              },
              child: Text(FORGOT_PASSWORD_LBL,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: lightblack)),
            ),
          ],
        ));
  }

  accSignup() {
    return Padding(
      padding:
          EdgeInsets.only(bottom: 30.0, left: 30.0, right: 30.0, top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(DONT_HAVE_AN_ACC,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: lightblack2, fontWeight: FontWeight.normal)),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HappyShopSingUp()));
              },
              child: Text(
                SIGN_UP_LBL,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: primary, decoration: TextDecoration.underline),
              ))
        ],
      ),
    );
  }

  loginBtn() {
    return AppBtn(
      title: LOGIN_LBL,
      btnAnim: buttonSqueezeanimation,
      btnCntrl: buttonController,
      onBtnSelected: () async {
        validateAndSubmit();
      },
    );
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      _playAnimation();
      validatanmation();
    }
  }
}
