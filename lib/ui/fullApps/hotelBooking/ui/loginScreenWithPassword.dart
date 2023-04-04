import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appBar.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appTextField.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/linkText.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/socialMediaButton.dart';

List<FocusNode> focusNodes = [
  FocusNode(),
  FocusNode(),
];

bool _isRememberChecked = false;

class LoginWithPassword extends StatefulWidget {
  const LoginWithPassword({Key? key}) : super(key: key);

  @override
  State<LoginWithPassword> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<LoginWithPassword> {
  onFocusChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, ""),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
            margin: EdgeInsetsDirectional.only(
                top: 20, start: 20, end: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Login to your account!',
                    style: appTextTheme(context).titleLarge,
                  ),
                ),
                getSizedBox(height: 30),
                AppTextField(
                    textFieldCallBack: onFocusChanged,
                    hintText: 'Email',
                    prefixIcon: Icons.mail_rounded,
                    focusNode: focusNodes[0]),
                AppTextField(
                  textFieldCallBack: onFocusChanged,
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  focusNode: focusNodes[1],
                  isPasswordField: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          activeColor: AppColors.primaryColor,
                          value: _isRememberChecked,
                          side: BorderSide(
                              color: AppColors.primaryColor, width: 2),
                          onChanged: onCheckChange),
                    ),
                    Text(
                      'Remember me',
                      style: appTextTheme(context).labelSmall,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                AppButton(
                  btnText: 'Sign in',
                  textSize: 18,
                  voidCallBack: () {
                    Navigator.pushReplacementNamed(context, homeScreen);
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                linkText('Forgot the password?', context, () {
                  Navigator.pushNamed(context, forgotPasswordScreen);
                }),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Divider(
                        height: 2,
                        thickness: 2,
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 5, end: 5),
                      child: Text(
                        'or continue with',
                        style: appTextTheme(context).labelSmall?.copyWith(
                              color: AppColors.textColorLight,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        height: 2,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton(fileName: 'google.png'),
                    SocialMediaButton(fileName: 'facebook.png'),
                    SocialMediaButton(fileName: 'apple.png'),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                        style: appTextTheme(context).labelSmall),
                    linkText(' Sign in', context, () {
                      Navigator.pushNamed(context, signInScreen);
                    }),
                  ],
                )
              ],
            )),
      ),
    );
  }

  void onCheckChange(bool? value) {
    setState(() {
      _isRememberChecked = _isRememberChecked == true ? false : true;
    });
  }
}
