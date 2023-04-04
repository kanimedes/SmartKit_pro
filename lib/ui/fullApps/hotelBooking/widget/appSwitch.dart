import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';

Widget appSwitch(BuildContext context,String title,bool isSwitched,ValueChanged valueChanged,VoidCallback voidCallback) {
  return GestureDetector(
    onTap: voidCallback,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(title,style: appTextTheme(context).labelSmall?.copyWith(
          color: AppColors.textColor
        ))),
        Switch(
          onChanged: valueChanged,
          value: isSwitched,
          activeColor: AppColors.primaryColor,
          activeTrackColor: AppColors.primaryLightColor,
          inactiveThumbColor: AppColors.textColorLight,
          inactiveTrackColor: AppColors.grey,
        ),
      ],
    ),
  );
}

