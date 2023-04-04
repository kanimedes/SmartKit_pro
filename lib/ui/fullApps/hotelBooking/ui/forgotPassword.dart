import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appBar.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/forgotPasswordScreen/borderBox.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/imageAsset.dart';

int currentIndex = 0;
List<String> fileName = ["sms.svg", "mail.svg"];
List<String> viaText = ["via SMS", "via Email"];
List<String> textId = ["+1 122******987", "x****ge@mail.com"];

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  onContainerTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Forgot password'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 20, end: 20, bottom: 30),
          child: Column(
            children: [
              imageAsset(
                fileName: 'lock.png',
                isNormalImage: true,
                imgHeight: 250,
                imgWidth: 250,
              ),
              Text(
                'Select which contact details should we use to reset your password',
                style: appTextTheme(context)
                    .labelMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      onContainerTap(index);
                    },
                    child: BorderBox(
                      borderColor: currentIndex == index
                          ? AppColors.primaryColor
                          : AppColors.grey,
                      textId: textId[index],
                      textVia: viaText[index],
                      fileName: fileName[index],
                    ),
                  );
                },
              ),
              AppButton(
                btnText: 'Continue',
                textSize: 15,
                voidCallBack: () {
                  Navigator.pushNamed(context, otpScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
