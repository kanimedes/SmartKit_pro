import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';

class AppTextField extends StatelessWidget {
  String hintText;
  IconData prefixIcon;
  VoidCallback? textFieldCallBack;
  bool? isPasswordField, isEnabled, autoFocus;
  FocusNode focusNode;
  TextInputType? keyboardType;

  AppTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.focusNode,
    this.isPasswordField,
    this.textFieldCallBack,
    this.keyboardType,
    this.isEnabled,
    this.autoFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 20),
      child: TextField(
          enabled: isEnabled ?? true,
          autofocus: autoFocus ?? false,
          style: appTextTheme(context).labelSmall,
          onTap: textFieldCallBack,
          obscureText: isPasswordField ?? false,
          focusNode: focusNode,
          keyboardType: keyboardType ?? TextInputType.text,
          decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: focusedOutlineInputBorder(),
            enabledBorder: enabledOutlineInputBorder(),
            disabledBorder: enabledOutlineInputBorder(),
            prefixIcon: Icon(prefixIcon,
                color: focusNode.hasFocus
                    ? AppColors.primaryColor
                    : AppColors.textColorLight,
                size: 25),
            filled: true,
            fillColor: focusNode.hasFocus
                ? AppColors.primaryLightColor
                : AppColors.grey,
          )),
    );
  }
}

class AppTextFieldWithSuffixIcon extends StatelessWidget {
  String hintText;
  IconData prefixIcon;
  IconData postfixIcon;
  VoidCallback? textFieldCallBack, postfixIconCallBack;
  bool? isPasswordField, isEnabled, autoFocus;
  FocusNode focusNode;
  TextInputType? keyboardType;

  AppTextFieldWithSuffixIcon({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.focusNode,
    required this.postfixIcon,
    this.isPasswordField,
    this.postfixIconCallBack,
    this.textFieldCallBack,
    this.keyboardType,
    this.isEnabled,
    this.autoFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 20),
      child: TextField(
          enabled: isEnabled ?? true,
          autofocus: autoFocus ?? false,
          style: appTextTheme(context).labelSmall,
          onTap: textFieldCallBack,
          obscureText: isPasswordField ?? false,
          focusNode: focusNode,
          keyboardType: keyboardType ?? TextInputType.text,
          decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: focusedOutlineInputBorder(),
            enabledBorder: enabledOutlineInputBorder(),
            disabledBorder: enabledOutlineInputBorder(),
            prefixIcon: Icon(prefixIcon,
                color: focusNode.hasFocus
                    ? AppColors.primaryColor
                    : AppColors.textColorLight,
                size: 25),
            suffixIcon: IconButton(
                splashRadius: 1,
                onPressed: postfixIconCallBack,
                icon: Icon(postfixIcon,
                    color: focusNode.hasFocus
                        ? AppColors.primaryColor
                        : AppColors.textColorLight)),
            filled: true,
            fillColor: focusNode.hasFocus
                ? AppColors.primaryLightColor
                : AppColors.grey,
          )),
    );
  }
}

focusedOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor),
    borderRadius: BorderRadius.circular(15),
  );
}

enabledOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(15),
  );
}
