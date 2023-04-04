import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/Screens/authentication/OTPScreen.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

class SalonSignup extends StatefulWidget {
  const SalonSignup({Key? key}) : super(key: key);

  @override
  _SalonSignupState createState() => _SalonSignupState();
}

class _SalonSignupState extends State<SalonSignup> {
  TextEditingController edtemail = TextEditingController();
  TextEditingController edtpsw = TextEditingController();
  TextEditingController edtname = TextEditingController();
  TextEditingController edtdob = TextEditingController();
  bool _obscureText = true;
  bool loginpress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: salonbgcolor,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: kToolbarHeight,
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          alignment: Alignment.centerLeft,
          child: IconButton(
              icon: Icon(
                CupertinoIcons.chevron_left,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        Expanded(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15),
                children: [
              Text(
                "Create New\nAccount",
                style: Theme.of(context).textTheme.headline4!.merge(TextStyle(
                    color: salonappcolor, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 8),
              Text(
                "Please type full information below and we can create your account",
                style: Theme.of(context).textTheme.subtitle1!.merge(
                    TextStyle(color: salonlightfont, letterSpacing: 0.5)),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 30),
                decoration: DesignConfig.newInnerDecoration(15),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  style: TextStyle(color: salonappcolor),
                  cursorColor: salonappcolor,
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    hintStyle: Theme.of(context).textTheme.subtitle2!.merge(
                        TextStyle(color: salonlightfont, letterSpacing: 0.5)),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  controller: edtname,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                decoration: DesignConfig.newInnerDecoration(15),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  style: TextStyle(color: salonappcolor),
                  cursorColor: salonappcolor,
                  decoration: InputDecoration(
                    hintText: "Email Address",
                    hintStyle: Theme.of(context).textTheme.subtitle2!.merge(
                        TextStyle(color: salonlightfont, letterSpacing: 0.5)),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: edtemail,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                decoration: DesignConfig.newInnerDecoration(15),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  obscureText: _obscureText,
                  controller: edtpsw,
                  style: TextStyle(color: salonappcolor),
                  cursorColor: salonappcolor,
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: Theme.of(context).textTheme.subtitle2!.merge(
                          TextStyle(color: salonlightfont, letterSpacing: 0.5)),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 20, bottom: 10),
                decoration: DesignConfig.newInnerDecoration(15),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  obscureText: _obscureText,
                  controller: edtpsw,
                  style: TextStyle(color: salonappcolor),
                  cursorColor: salonappcolor,
                  decoration: InputDecoration(
                      hintText: "Date of Birth",
                      hintStyle: Theme.of(context).textTheme.subtitle2!.merge(
                          TextStyle(color: salonlightfont, letterSpacing: 0.5)),
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.grey,
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    loginpress = !loginpress;
                  });

                  Future.delayed(DesignConfig.animationdelay, () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OTPScreen(
                              isfromsignup: true,
                            )));
                    setState(() {
                      loginpress = !loginpress;
                    });
                  });
                },
                child: AnimatedContainer(
                  duration: DesignConfig.animationtime,

                  decoration: loginpress
                      ? DesignConfig.newInnerDecoration(15)
                      : DesignConfig.outerDecoration(15),
                  margin: EdgeInsets.only(left: 10, top: 30),
                  //decoration: DesignConfig.outerDecoration(15),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.headline5!.merge(
                        TextStyle(
                            color: salonappcolor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5)),
                  ),
                ),
              ),
            ])),
      ]),
    );
  }
}
