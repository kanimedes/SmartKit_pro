import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/helper/DesignConfig.dart';
import 'package:smartkit_pro/ui/fullApps/pureBeauty/styles/colors.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController edtnewpsw = TextEditingController();
  TextEditingController edtcnewpsw = TextEditingController();
  bool _obscureText = true;
  bool loginpress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: salonbgcolor,
        body: Column(children: [
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
                  "Create New\nPassword",
                  style: Theme.of(context).textTheme.headline4!.merge(TextStyle(
                      color: salonappcolor, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 8),
                Text(
                  "Ane now, you can create new password and confirm it below.",
                  style: Theme.of(context).textTheme.subtitle1!.merge(
                      TextStyle(color: salonlightfont, letterSpacing: 0.5)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 25),
                  /*decoration: DesignConfig.innerDecoration(15),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),*/

                  alignment: Alignment.centerLeft,
                  decoration: DesignConfig.newInnerDecoration(15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    style: TextStyle(color: salonappcolor),
                    cursorColor: salonappcolor,
                    decoration: InputDecoration(
                        hintText: "New Password",
                        hintStyle: Theme.of(context).textTheme.subtitle2!.merge(
                            TextStyle(
                                color: salonlightfont, letterSpacing: 0.5)),
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
                    keyboardType: TextInputType.text,
                    obscureText: _obscureText,
                    controller: edtnewpsw,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, top: 20),
                  /* decoration: DesignConfig.innerDecoration(15),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),*/

                  alignment: Alignment.centerLeft,
                  decoration: DesignConfig.newInnerDecoration(15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    style: TextStyle(color: salonappcolor),
                    cursorColor: salonappcolor,
                    decoration: InputDecoration(
                        hintText: "Confirm Password",
                        hintStyle: Theme.of(context).textTheme.subtitle2!.merge(
                            TextStyle(
                                color: salonlightfont, letterSpacing: 0.5)),
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
                    keyboardType: TextInputType.text,
                    obscureText: _obscureText,
                    controller: edtcnewpsw,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      loginpress = !loginpress;
                    });

                    Future.delayed(DesignConfig.animationdelay, () {
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

                    margin: EdgeInsets.only(left: 10, top: 50),
                    // decoration: DesignConfig.outerDecoration(15),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Text(
                      "Submit",
                      style: Theme.of(context).textTheme.headline6!.merge(
                          TextStyle(
                              color: salonappcolor,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
