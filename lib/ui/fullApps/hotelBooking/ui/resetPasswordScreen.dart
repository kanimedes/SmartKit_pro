import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appBar.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appTextField.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/customDialog.dart';
import 'package:lottie/lottie.dart';

List<FocusNode> focusNodes = [
  FocusNode(),
  FocusNode(),
];

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  void onFocusChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, 'Reset password'),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 20, end: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Lottie.asset('${imagePath}lottiefiles/shield_animation.json',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.8,
                    repeat: false),
                Text(
                  "Create your new password",
                  softWrap: true,
                  style: appTextTheme(context).labelSmall?.copyWith(
                      color: AppColors.textColorLight,
                      fontWeight: FontWeight.bold),
                ),
                getSizedBox(height: 20),
                AppTextField(
                  textFieldCallBack: onFocusChanged,
                  hintText: 'New Password',
                  prefixIcon: Icons.lock,
                  focusNode: focusNodes[0],
                  isPasswordField: true,
                ),
                AppTextField(
                  textFieldCallBack: onFocusChanged,
                  hintText: 'Confirm New Password',
                  prefixIcon: Icons.lock,
                  focusNode: focusNodes[1],
                  isPasswordField: true,
                ),
                AppButton(
                  btnText: 'Reset Password',
                  textSize: 15,
                  voidCallBack: () {
                    //open custom dialog
                    showCustomDialog(
                        context,
                        'Congratulations!',
                        'Your account is ready to use',
                        'Go to home screen', () {
                      Navigator.pushReplacementNamed(context, homeScreen);
                    });
                  },
                )
              ],
            ),
          ),
        ));
  }
}
