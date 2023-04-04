import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/ui/screens/auth/verificaiton_page.dart';
import 'package:smartkit_pro/ui/fullApps/nftApp/ui/styles/login_box.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.onBackground),
                      child: Icon(
                        Icons.close,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 20, top: MediaQuery.of(context).size.height * 0.05),
                child: Text(
                  "Enter your Email!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 20, top: MediaQuery.of(context).size.height * 0.01),
                child: Text(
                  "Enter your email and accept a code",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              loginBox(
                hintText: 'Email Address',
                iconColor: Color(0xffc576d7),
                boxColor: Color(0xffebd9ee),
                topMargin: MediaQuery.of(context).size.height * 0.06,
                icons: Icons.email_outlined,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhoneVerificaiton()));
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: MediaQuery.of(context).size.height * 0.2),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
