import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagAppbar.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagColor.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Helper/GrobagString.dart';
import 'package:smartkit_pro/ui/fullApps/grobag/Screen/GrobagMobInput.dart';

import 'GrobagHome.dart';

class GrobagSignup extends StatefulWidget {
  const GrobagSignup({Key? key}) : super(key: key);

  @override
  _GrobagSignupState createState() => _GrobagSignupState();
}

class _GrobagSignupState extends State<GrobagSignup> {
  bool _showNPassword = false, _showCPassword = false;
  String? countrycode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GrobagAppbar(
        title: '',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Register,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: fontColor),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [applebtn(), Spacer(), googlebtn()],
                ),
              ),
              Form(
                  child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          hintText: Email,
                          suffixIcon: Icon(
                            Icons.email_outlined,
                            color: primary,
                          )),
                      onChanged: (v) => setState(() {}),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        hintText: First,
                        suffixIcon: Icon(
                          Icons.person_outline,
                          color: primary,
                        )),
                    onChanged: (v) => setState(() {}),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          hintText: Last,
                          suffixIcon: Icon(
                            Icons.person_outline,
                            color: primary,
                          )),
                      onChanged: (v) => setState(() {}),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: Mobile,
                        prefixIcon: SizedBox(
                          width: 90,
                          child: setCountryCode(),
                        ),
                        suffixIcon: Icon(
                          Icons.call_outlined,
                          color: primary,
                        ),
                      ),
                      onChanged: (v) => setState(() {}),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          hintText: Password,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showNPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: primary,
                            ),
                            onPressed: () {
                              setState(() {
                                _showNPassword = !_showNPassword;
                              });
                            },
                          )),
                      obscureText: !_showNPassword,
                      onChanged: (v) => setState(() {}),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          hintText: ConPassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showCPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: primary,
                            ),
                            onPressed: () {
                              setState(() {
                                _showCPassword = !_showCPassword;
                              });
                            },
                          )),
                      obscureText: !_showCPassword,
                      onChanged: (v) => setState(() {}),
                    ),
                  ),
                ],
              )),
              createbtn()
            ],
          ),
        ),
      ),
    );
  }

  setCountryCode() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.9;
    return CountryCodePicker(
        showCountryOnly: false,
        searchDecoration: InputDecoration(
          hintText: CountryCodeLbl,
          hintStyle: TextStyle(color: fontColor),
          fillColor: fontColor,
        ),
        showOnlyCountryWhenClosed: false,
        initialSelection: 'IN',
        dialogSize: Size(width, height),
        alignLeft: true,
        // textStyle:TextStyle(color: fontColor,),
        onChanged: (CountryCode countryCode) {
          countrycode = countryCode.toString().replaceFirst("+", "");
        },
        onInit: (code) {
          countrycode = code.toString().replaceFirst("+", "");
        });
  }

  googlebtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.42,
        height: 48,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 0)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset('assets/images/fullApps/grobag/google.svg'),
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GrobagHome(),
          ),
        );
      },
    );
  }

  Widget applebtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.42,
        height: 48,
        decoration: BoxDecoration(
          color: fontColor,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 0)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset('assets/images/fullApps/grobag/apple.svg'),
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GrobagHome(),
          ),
        );
      },
    );
  }

  createbtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: Color(0xff00b65f),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 0)
          ],
        ),
        child: Center(
          child: Text("Create Account",
              style: TextStyle(
                color: white,
              )),
        ),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GrobagMobInput()));
      },
    );
  }
}
