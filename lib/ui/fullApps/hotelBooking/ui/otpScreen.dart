import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appBar.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/otpScreen/resendOtpTimer.dart';
import 'package:pinput/pinput.dart';

int currentIndex = 0;
List<String> fileName = ["sms.svg", "mail.svg"];
List<String> viaText = ["via SMS", "via Email"];
List<String> textId = ["+1 122******987", "x****ge@mail.com"];

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(
      fontSize: 20, color: AppColors.primaryColor, fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: AppColors.primaryLightColor),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: AppColors.primaryColor),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: AppColors.primaryLightColor,
  ),
);

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  onContainerTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Forgot password'),
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 20, end: 20),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Text(
                        "Code has been sent to +1 122******987",
                        softWrap: true,
                        style: appTextTheme(context).labelSmall?.copyWith(
                            color: AppColors.textColorLight,
                            fontWeight: FontWeight.bold),
                      ),
                      getSizedBox(height: 50),
                      Pinput(
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        length: 6,
                        showCursor: true,
                        onCompleted: (pin) => {},
                      ),
                      getSizedBox(height: 50),
                      ResendOtpTimer(),
                    ],
                  ),
                ),
                AppButton(
                  btnText: 'Continue',
                  textSize: 15,
                  voidCallBack: () {
                    Navigator.pushNamed(context, resetPasswordScreen);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
