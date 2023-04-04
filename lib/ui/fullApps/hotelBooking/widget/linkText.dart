import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';

Widget linkText(String text, BuildContext context, VoidCallback voidCallback) {
  return GestureDetector(
    onTap: voidCallback,
    child: Center(
      child: Text(
        text,
        style: appTextTheme(context).labelSmall?.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    ),
  );
}
