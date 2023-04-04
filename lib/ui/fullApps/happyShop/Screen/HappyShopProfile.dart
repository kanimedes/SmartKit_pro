// ignore_for_file: empty_catches

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopString.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/widget/HappyShopbtn.dart';

import 'HappyShopHome.dart';

class HappyShopPeofile extends StatefulWidget {
  const HappyShopPeofile({Key? key}) : super(key: key);

  @override
  _HappyShopPeofileState createState() => _HappyShopPeofileState();
}

class _HappyShopPeofileState extends State<HappyShopPeofile>
    with TickerProviderStateMixin {
  String? name, email, mobile, city, area, pincode, address, image;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController? nameC, emailC, mobileC, pincodeC, addressC;
  bool isDateSelected = false;
  DateTime? birthDate;
  bool isSelected = false;
  // ignore: prefer_final_fields
  final _isNetworkAvail = true;
  Animation? buttonSqueezeanimation;
  AnimationController? buttonController;

  @override
  void initState() {
    super.initState();
    image = "assets/cryptotech/profilepic.jpg";
    mobileC = new TextEditingController();
    nameC = new TextEditingController();
    emailC = new TextEditingController();
    pincodeC = new TextEditingController();
    addressC = new TextEditingController();

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
    mobileC?.dispose();
    nameC?.dispose();
    addressC!.dispose();
    pincodeC?.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await buttonController!.forward();
    } on TickerCanceled {}
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      _playAnimation();
      checkNetwork();
    }
  }

  Future<void> checkNetwork() async {
    if (_isNetworkAvail) {
    } else {
      Future.delayed(Duration(seconds: 2)).then((_) async {
        await buttonController!.reverse();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HappyShopHome()));
      });
    }
  }

  bool validateAndSave() {
    final form = _formkey.currentState!;

    if (form.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  getAppBar(String title, BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: primary),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: primary,
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.white,
      elevation: 5,
    );
  }

  _showContent() {
    return Form(
      key: _formkey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: <Widget>[
              profileImage(),
              setUserName(),
              setEmail(),
              setMobileNo(),
              setAddress(),
              setPincode(),
              updateBtn(),
            ],
          ),
        ),
      ),
    );
  }

  profileImage() {
    return Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
        child: Stack(
          children: <Widget>[
            image != null && image != ""
                ? CircleAvatar(
                    radius: 50,
                    //backgroundColor: primary,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: OctoImage(
                        image: CachedNetworkImageProvider(
                            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/cryptotech%2Fprofilepic.jpg?alt=media&token=2be2819f-6007-4763-a727-cb93f08f460c"),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          "LNIX]g_3.TIU%NRjRPxukXR*s9of",
                        ),
                        width: 100,
                        height: 100,
                        errorBuilder: OctoError.icon(color: textcolor),
                        fit: BoxFit.fill,
                      ),
                    ))
                : CircleAvatar(
                    radius: 50,
                    backgroundColor: primary,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: primary)),
                        child: Icon(Icons.person, size: 100)),
                  ),
            Positioned(
                bottom: 1,
                right: 1,
                child: Container(
                  height: 30,
                  width: 30,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: primary,
                      size: 15,
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      border: Border.all(color: primary)),
                )),
          ],
        ));
  }

  updateBtn() {
    return AppBtn(
      title: UPDATE_PROFILE_LBL,
      btnAnim: buttonSqueezeanimation,
      btnCntrl: buttonController,
      onBtnSelected: () {
        validateAndSubmit();
      },
    );
  }

  setUserName() {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: nameC,
        style: Theme.of(this.context)
            .textTheme
            .subtitle1!
            .copyWith(color: darkgrey),
        onChanged: (v) => setState(() {
          name = v;
        }),
        onSaved: (String? value) {
          name = value;
        },
        decoration: InputDecoration(
          hintText: NAMEHINT_LBL,
          hintStyle: Theme.of(this.context)
              .textTheme
              .subtitle1!
              .copyWith(color: darkgrey),
          filled: true,
          fillColor: Colors.white,
          contentPadding: new EdgeInsets.only(right: 30.0, left: 30.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  setMobileNo() {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: mobileC,
          readOnly: true,
          style: Theme.of(this.context)
              .textTheme
              .subtitle1!
              .copyWith(color: darkgrey),
          decoration: InputDecoration(
            hintText: MOBILEHINT_LBL,
            hintStyle: Theme.of(this.context)
                .textTheme
                .subtitle1!
                .copyWith(color: darkgrey),
            filled: true,
            fillColor: Colors.white,
            contentPadding: new EdgeInsets.only(right: 30.0, left: 30.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  setEmail() {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: emailC,
          style: Theme.of(this.context)
              .textTheme
              .subtitle1!
              .copyWith(color: darkgrey),
          onChanged: (v) => setState(() {
            email = v;
          }),
          onSaved: (String? value) {
            email = value;
          },
          decoration: InputDecoration(
            hintText: EMAILHINT_LBL,
            hintStyle: Theme.of(this.context)
                .textTheme
                .subtitle1!
                .copyWith(color: darkgrey),
            filled: true,
            fillColor: Colors.white,
            contentPadding: new EdgeInsets.only(right: 30.0, left: 30.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  setAddress() {
    return Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: addressC,
                style: Theme.of(this.context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: darkgrey),
                onChanged: (v) => setState(() {
                  address = v;
                }),
                onSaved: (String? value) {
                  address = value;
                },
                decoration: InputDecoration(
                  hintText: ADDRESS_LBL,
                  hintStyle: Theme.of(this.context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: darkgrey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: new EdgeInsets.only(right: 30.0, left: 30.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: white),
                  color: white),
              child: IconButton(
                icon: new Icon(Icons.my_location),
                onPressed: () async {},
              ),
            )
          ],
        ));
  }

  setPincode() {
    double width = MediaQuery.of(this.context).size.width;
    return Container(
      width: width,
      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: pincodeC,
          style: Theme.of(this.context)
              .textTheme
              .subtitle1!
              .copyWith(color: darkgrey),
          onChanged: (v) => setState(() {
            pincode = v;
          }),
          onSaved: (String? value) {
            pincode = value;
          },
          decoration: InputDecoration(
            hintText: PINCODEHINT_LBL,
            hintStyle: Theme.of(this.context)
                .textTheme
                .subtitle1!
                .copyWith(color: darkgrey),
            filled: true,
            fillColor: Colors.white,
            contentPadding: new EdgeInsets.only(right: 30.0, left: 30.0),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HappyShopHome(),
          ),
        ) as Future<bool>;
      } as Future<bool> Function()?,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: lightgrey,
        appBar: getAppBar(PROFILE, context),
        body: Center(
          child: _showContent(),
        ),
      ),
    );
  }
}
