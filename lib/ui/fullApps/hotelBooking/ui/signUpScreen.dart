import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/linkText.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/socialMediaButton.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getSizedBox(height: 100),
            Text(
              'Sign up!',
              style: appTextTheme(context).titleLarge,
            ),
            getSizedBox(height: 30),
            SocialMediaButton(
                text: "Continue with Google", fileName: "google.png"),
            SocialMediaButton(
                text: "Continue with Facebook", fileName: "facebook.png"),
            SocialMediaButton(
                text: "Continue with Apple", fileName: "apple.png"),
            getSizedBox(height: 30),
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
                    'or',
                    style: appTextTheme(context).labelSmall!.copyWith(
                          color: AppColors.textColorLight,
                        ),
                  ),
                ),
                getSizedBox(height: 50),
                Expanded(
                  child: Divider(
                    height: 2,
                    thickness: 2,
                  ),
                ),
              ],
            ),
            getSizedBox(height: 50),
            Container(
              margin: EdgeInsetsDirectional.only(start: 20,end: 20),
              child: AppButton(
                btnText: 'Create Account',
                textSize: 15,
                voidCallBack: () {
                  Navigator.pushNamed(context, signUpManuallyScreen);
                },
              ),
            ),
            getSizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: appTextTheme(context).labelSmall,
                ),
                linkText(' Sign in', context, () {
                  Navigator.pushReplacementNamed(context, signInScreen);
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
