import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/foodMaster/helper/StringsRes.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool iserrorold = false;
  TextEditingController? oldpsw, newpsw, cpsw;
  String? cpswerrtext;
  bool _obscureTextold = true, _obscureTextnew = true, _obscureTextcm = true;

  @override
  void initState() {
    super.initState();
    oldpsw = TextEditingController();
    newpsw = TextEditingController();
    cpsw = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorsRes.backgroundColor,
      body: Stack(children: [
        Column(children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 15,
                left: 15,
                right: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Card(
                  shape:
                      DesignConfig.setRoundedBorder(ColorsRes.white, 8, false),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: ColorsRes.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: changePswWidget()),
        ])
      ]),
    );
  }

  Widget changePswWidget() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: kToolbarHeight, left: 20, right: 20),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              StringsRes.lblchangepassword,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                  color: ColorsRes.black, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 15),
            Text(
              StringsRes.enteroldpassword,
              style: TextStyle(
                  fontSize: 18,
                  color: ColorsRes.black,
                  fontWeight: FontWeight.normal),
            ),
            Container(
              decoration: DesignConfig.boxDecorationContainerShadow(
                  ColorsRes.containerShadowColor, 14, 14, 14, 14),
              margin: EdgeInsets.only(top: 3),
              padding: EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
              alignment: Alignment.center,
              child: TextField(
                obscureText: _obscureTextold,
                controller: oldpsw,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: ColorsRes.grayColor.withOpacity(0.5)),
                  hintText: "Enter Old Password",
                  errorText: iserrorold ? 'Enter Old Password' : null,
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureTextold = !_obscureTextold;
                      });
                    },
                    child: Icon(
                      _obscureTextold ? Icons.visibility : Icons.visibility_off,
                      color: ColorsRes.grayColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              StringsRes.enternewpassword,
              style: TextStyle(
                  fontSize: 18,
                  color: ColorsRes.black,
                  fontWeight: FontWeight.normal),
            ),
            Container(
              decoration: DesignConfig.boxDecorationContainerShadow(
                  ColorsRes.containerShadowColor, 14, 14, 14, 14),
              margin: EdgeInsets.only(top: 3),
              padding: EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
              alignment: Alignment.center,
              child: TextField(
                obscureText: _obscureTextnew,
                controller: newpsw,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: ColorsRes.grayColor.withOpacity(0.5)),
                  hintText: StringsRes.enternewpassword,
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureTextnew = !_obscureTextnew;
                      });
                    },
                    child: Icon(
                      _obscureTextnew ? Icons.visibility : Icons.visibility_off,
                      color: ColorsRes.grayColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              StringsRes.enterconfirmpassword,
              style: TextStyle(
                  fontSize: 18,
                  color: ColorsRes.black,
                  fontWeight: FontWeight.normal),
            ),
            Container(
              decoration: DesignConfig.boxDecorationContainerShadow(
                  ColorsRes.containerShadowColor, 14, 14, 14, 14),
              margin: EdgeInsets.only(top: 3),
              padding: EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
              alignment: Alignment.center,
              child: TextField(
                obscureText: _obscureTextcm,
                controller: cpsw,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: ColorsRes.grayColor.withOpacity(0.5)),
                  hintText: StringsRes.enterconfirmpassword,
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureTextcm = !_obscureTextcm;
                      });
                    },
                    child: Icon(
                      _obscureTextcm ? Icons.visibility : Icons.visibility_off,
                      color: ColorsRes.grayColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: GestureDetector(
                  onTap: () {},
                  child: IntrinsicHeight(
                    child: Container(
                      height: 67.0,
                      padding: EdgeInsets.only(top: 13, bottom: 13),
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      alignment: Alignment.center,
                      decoration: DesignConfig.buttonShadowColor(
                          ColorsRes.continueShoppingGradient1Color,
                          37,
                          ColorsRes.continueShoppingGradient2Color),
                      child: Text(
                        StringsRes.change,
                        style: TextStyle(
                            fontSize: 17,
                            color: ColorsRes.white,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Poppins"),
                      ),
                    ),
                  )),
            )
          ]),
    );
  }
}
