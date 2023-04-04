import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/StringsRes.dart';

import '../../widgets/slideAnimation.dart';

class ForgotPasswordActivity extends StatefulWidget {
  const ForgotPasswordActivity({Key? key}) : super(key: key);

  @override
  ForgotPasswordActivityState createState() => ForgotPasswordActivityState();
}

class ForgotPasswordActivityState extends State<ForgotPasswordActivity>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  late TextEditingController emailController;

  Widget showEmail() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 12,
          vertical: MediaQuery.of(context).size.width / 40),
      child: SlideAnimation(
        position: 4,
        itemCount: 10,
        slideDirection: SlideDirection.fromRight,
        animationController: _animationController,
        child: TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 15.0),
            hintStyle: TextStyle(
                color: ColorsRes.purpalColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            labelStyle: TextStyle(
                color: ColorsRes.greyColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
            filled: false,
            focusColor: ColorsRes.warmGreyColor,
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: ColorsRes.warmGreyColor,
              ),
            ),
            border: OutlineInputBorder(
              gapPadding: 0.0,
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: ColorsRes.warmGreyColor,
                width: 1,
              ),
            ),
            labelText: StringsRes.emailText,
            hintText: StringsRes.emailAddressText,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    emailController = TextEditingController(text: "blacksmith@gmail.com");
  }

  @override
  void dispose() {
    super.dispose();
    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController!.repeat();
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: ColorsRes.backgroundColor,
          appBar: AppBar(
              backgroundColor: ColorsRes.backgroundColor,
              shadowColor: Colors.transparent,
              leading: SlideAnimation(
                  position: 1,
                  itemCount: 8,
                  slideDirection: SlideDirection.fromTop,
                  animationController: _animationController,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 20),
                        child: Icon(Icons.close, color: ColorsRes.purpalColor),
                      )))),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 10,
                            left: MediaQuery.of(context).size.height / 22,
                            right: MediaQuery.of(context).size.height / 18,
                            bottom: 10.0),
                        child: SlideAnimation(
                          position: 2,
                          itemCount: 10,
                          slideDirection: SlideDirection.fromRight,
                          animationController: _animationController,
                          child: Text(
                            StringsRes.forgotPasswordTitleText,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorsRes.purpalColor,
                              fontSize: 28,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 40,
                            left: MediaQuery.of(context).size.height / 22,
                            right: MediaQuery.of(context).size.height / 18,
                            bottom: 10.0),
                        child: SlideAnimation(
                          position: 3,
                          itemCount: 10,
                          slideDirection: SlideDirection.fromRight,
                          animationController: _animationController,
                          child: Text(
                            StringsRes.forgotPasswordSubTitleText,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: ColorsRes.greyColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 89),
                    showEmail(),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    SlideAnimation(
                        position: 5,
                        itemCount: 10,
                        slideDirection: SlideDirection.fromRight,
                        animationController: _animationController,
                        child: Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                    margin: EdgeInsets.only(
                                        right:
                                            MediaQuery.of(context).size.width /
                                                15),
                                    padding: EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                        color: ColorsRes.greenColor,
                                        shape: BoxShape.circle),
                                    child: Icon(Icons.arrow_forward,
                                        color: ColorsRes.white))))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
