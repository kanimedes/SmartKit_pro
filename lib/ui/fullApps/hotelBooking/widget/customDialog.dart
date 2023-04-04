import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:lottie/lottie.dart';

void showCustomDialog(BuildContext context, String title, String subTitle,
    String buttonText, VoidCallback voidCallback) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) {
      return Center(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsetsDirectional.all(20),
              margin: EdgeInsetsDirectional.only(start: 50, end: 50),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  Lottie.asset('${imagePath}lottiefiles/shield_animation.json',
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.5,
                      repeat: false),
                  Text(title,
                      style: appTextTheme(context).labelMedium?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold)),
                  getSizedBox(height: 20),
                  Text(subTitle,
                      softWrap: true, style: appTextTheme(context).labelSmall),
                  AppButton(
                    btnText: buttonText,
                    textSize: 15,
                    voidCallBack: voidCallback,
                  )
                ],
              )),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
