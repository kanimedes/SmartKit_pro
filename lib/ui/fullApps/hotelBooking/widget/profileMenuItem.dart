import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';

Widget profileMenuItem(BuildContext context, String title, Color textColor,
    Color iconColor, IconData iconData, VoidCallback voidCallback) {
  return GestureDetector(
    onTap: voidCallback,
    child: Container(
        padding: EdgeInsetsDirectional.all(15),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Row(
          children: [
            Icon(
              iconData,
              color: iconColor,
              size: 25,
            ),
            getSizedBox(width: 25),
            Text(
              title,
              style: appTextTheme(context).labelMedium?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ],
        )),
  );
}
