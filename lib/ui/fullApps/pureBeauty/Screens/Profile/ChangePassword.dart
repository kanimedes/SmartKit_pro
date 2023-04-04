import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController edtoldpsw = TextEditingController();
  TextEditingController edtnewpsw = TextEditingController();
  TextEditingController edtcnewpsw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: salonbgcolor,
        body: Column(children: [
          Container(
            height: 120.0,
            decoration: BoxDecoration(
              color: salonbgcolor,
              boxShadow: [
                BoxShadow(
                    color: salondarkshadow.withOpacity(0.5),
                    blurRadius: 25.0, // soften the shadow
                    spreadRadius: 5.0, //extend the shadow
                    offset: Offset(0.0, 0.75))
              ],
            ),
            padding: EdgeInsets.only(top: 18, left: 15, right: 15),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  decoration: DesignConfig.outerCircularDecoration(),
                  padding: EdgeInsets.all(15),
                  child: SvgPicture.asset(
                    "assets/images/fullApps/pureBeauty/svgimg/back01.svg",
                    color: salonappcolor,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Text(
                "Change Password",
                style: Theme.of(context).textTheme.headline6!.merge(TextStyle(
                    color: salonappcolor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5)),
              ),
            ]),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 25),
                    alignment: Alignment.centerLeft,
                    decoration: DesignConfig.newInnerDecoration(15),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      style: TextStyle(color: salonappcolor),
                      cursorColor: salonappcolor,
                      decoration: InputDecoration(
                          hintText: "Old Password",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .merge(TextStyle(
                                  color: salonlightfont, letterSpacing: 0.5)),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: salonappcolor,
                          )),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: edtoldpsw,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 25),
                    alignment: Alignment.centerLeft,
                    decoration: DesignConfig.newInnerDecoration(15),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      style: TextStyle(color: salonappcolor),
                      cursorColor: salonappcolor,
                      decoration: InputDecoration(
                          hintText: "New Password",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .merge(TextStyle(
                                  color: salonlightfont, letterSpacing: 0.5)),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: salonappcolor,
                          )),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: edtnewpsw,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 25),
                    alignment: Alignment.centerLeft,
                    decoration: DesignConfig.newInnerDecoration(15),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      style: TextStyle(color: salonappcolor),
                      cursorColor: salonappcolor,
                      decoration: InputDecoration(
                          hintText: "Confirm New Password",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .merge(TextStyle(
                                  color: salonlightfont, letterSpacing: 0.5)),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: salonappcolor,
                          )),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      controller: edtcnewpsw,
                    ),
                  ),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: DesignConfig.outerDecorationService(
                          30, salonappcolor),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Text(
                        "Update",
                        style: Theme.of(context).textTheme.headline6!.merge(
                            TextStyle(color: Colors.white, letterSpacing: 0.5)),
                      ),
                    ),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
