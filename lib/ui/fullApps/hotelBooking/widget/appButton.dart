import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';

class AppButton extends StatelessWidget {
  String btnText;
  Color? backgroundColor, textColor, borderColor;
  double? textSize, height, width;
  VoidCallback? voidCallBack;

  AppButton(
      {Key? key,
      required this.btnText,
      this.backgroundColor,
      this.textColor,
      this.borderColor,
      this.textSize,
      this.height,
      this.width,
      this.voidCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Material(
        color: backgroundColor ?? AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        child: InkWell(
          onTap: voidCallBack,
          highlightColor: AppColors.white.withOpacity(0.4),
          splashColor: AppColors.white.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(50)),
          child: Center(
              child: Padding(
            padding: EdgeInsetsDirectional.only(top: 15, bottom: 15),
            child: Text(
              btnText,
              style: appTextTheme(context).labelSmall?.copyWith(
                  color: textColor ?? AppColors.white, fontSize: textSize ?? 15),
            ),
          )),
        ),
      ),
    );
  }
}
