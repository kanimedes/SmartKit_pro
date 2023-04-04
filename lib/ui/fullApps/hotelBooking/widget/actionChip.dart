import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';

Widget actionChip(BuildContext context, String title, int currentSelectedIndex,
    int index, VoidCallback voidCallback) {
  return Padding(
    padding: EdgeInsetsDirectional.only(end: 10),
    child: ActionChip(
      labelPadding: EdgeInsetsDirectional.only(start: 15, end: 15),
      backgroundColor: currentSelectedIndex == index
          ? AppColors.primaryColor
          : Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      labelStyle: appTextTheme(context).labelSmall?.copyWith(
            color: currentSelectedIndex == index
                ? AppColors.white
                : AppColors.textColorLight,
            fontWeight: FontWeight.bold,
          ),
      onPressed: voidCallback,
      elevation: 1,
      label: Text(
        title,
      ),
    ),
  );
}

Widget multiSelectActionChip(
    BuildContext context,
    String title,
    bool isSelected,
    int index,
    VoidCallback voidCallback,
    bool iconAvailable,
    IconData iconData) {
  return Padding(
    padding: EdgeInsetsDirectional.only(end: 10),
    child: ActionChip(
        labelPadding: EdgeInsetsDirectional.only(start: 15, end: 15),
        backgroundColor:
            isSelected ? AppColors.primaryColor : Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        labelStyle: appTextTheme(context).labelSmall?.copyWith(
              color: isSelected ? AppColors.white : AppColors.textColorLight,
              fontWeight: FontWeight.bold,
            ),
        onPressed: voidCallback,
        elevation: 1,
        label: Row(
          children: [
            iconAvailable == true
                ? Icon(
                    iconData,
                    color:
                        isSelected ? AppColors.white : AppColors.textColorLight,
                    size: 20,
                  )
                : Icon(
                    iconData,
                    size: 0,
                  ),
            getSizedBox(width: iconAvailable ? 5 : 0),
            Text(
              title,
            ),
          ],
        )),
  );
}
