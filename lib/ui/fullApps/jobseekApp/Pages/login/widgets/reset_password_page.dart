import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/UI/widgets/app_bar.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';

class resetPassword extends StatefulWidget {
  const resetPassword({Key? key}) : super(key: key);

  @override
  State<resetPassword> createState() => _resetPasswordState();
}

class _resetPasswordState extends State<resetPassword> {

  bool _isObscure = true;
  bool _isObscureconfirm=true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 10, left: 20, right: 20),
        child: Column(
          children: [
            CommanAppBar(title: ""),
            AppLargeText(
              text: "Jobseek",
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            AppLargeText(
              text: "Reset Password",
              color: Theme.of(context).colorScheme.secondary,
              size: 24,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              "Enter your new password and confirm the\nnew password to reset password.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.5))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.password_sharp,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.6),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Flexible(
                    child: Center(
                      child: TextField(
                        obscureText: _isObscure,
                        decoration: InputDecoration.collapsed(
                          hintText: "New Password",
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6)),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.secondary.withOpacity(0.5))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.password_sharp,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.6),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Flexible(
                    child: Center(
                      child: TextField(
                        obscureText: _isObscureconfirm,
                        decoration: InputDecoration.collapsed(
                          hintText: "Confirm New Password",
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.6)),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isObscureconfirm = !_isObscureconfirm;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        _isObscureconfirm ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Container(

              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(
                  child: AppLargeText(
                    text: "Reset Password",
                    color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                    size: 18,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
