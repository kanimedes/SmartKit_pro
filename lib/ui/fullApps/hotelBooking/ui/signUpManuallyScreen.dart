import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appBar.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appTextField.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/imageAsset.dart';

List<FocusNode> focusNodes = [
  FocusNode(),
  FocusNode(),
  FocusNode(),
  FocusNode(),
  FocusNode(),
  FocusNode(),
  FocusNode(),
];

var selectedValue = "Male";

class SignUpManuallyScreen extends StatefulWidget {
  const SignUpManuallyScreen({Key? key}) : super(key: key);

  @override
  State<SignUpManuallyScreen> createState() => _SignUpManuallyScreenState();
}

class _SignUpManuallyScreenState extends State<SignUpManuallyScreen> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: "Male",
          child: Text(
            "Male",
            style: appTextTheme(context).labelSmall,
          )),
      DropdownMenuItem(
          value: "Female",
          child: Text(
            "Female",
            style: appTextTheme(context).labelSmall,
          )),
    ];
    return menuItems;
  }

  void onFocusChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Fill your profile"),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsetsDirectional.all(20),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColors.primaryLightColor,
                      child: imageAsset(
                        isNormalImage: true,
                        fileName: 'avatar.png',
                        imgHeight: 70,
                        imgWidth: 70,
                      ),
                    ),
                    PositionedDirectional(
                      bottom: 0,
                      end: 0,
                      child: CircleAvatar(
                        radius: 15,
                        child: imageAsset(
                          isNormalImage: false,
                          fileName: 'ic_edit.svg',
                          imgHeight: 15,
                          imgWidth: 15,
                        ),
                      ),
                    )
                  ],
                ),
                getSizedBox(height: 20),
                AppTextField(
                    textFieldCallBack: onFocusChanged,
                    hintText: 'Full name',
                    prefixIcon: Icons.person,
                    focusNode: focusNodes[0]),
                AppTextField(
                    textFieldCallBack: onFocusChanged,
                    hintText: 'Nickname',
                    prefixIcon: Icons.person,
                    focusNode: focusNodes[1]),
                AppTextField(
                  textFieldCallBack: onFocusChanged,
                  hintText: 'Date of birth',
                  prefixIcon: Icons.calendar_month,
                  focusNode: focusNodes[2],
                  keyboardType: TextInputType.datetime,
                ),
                AppTextField(
                  textFieldCallBack: onFocusChanged,
                  hintText: 'Email',
                  prefixIcon: Icons.mail_rounded,
                  focusNode: focusNodes[3],
                  keyboardType: TextInputType.emailAddress,
                ),
                AppTextField(
                  textFieldCallBack: onFocusChanged,
                  hintText: 'Phone number',
                  prefixIcon: Icons.phone_android,
                  focusNode: focusNodes[4],
                  keyboardType: TextInputType.phone,
                ),
                DropdownButtonFormField(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  decoration: InputDecoration(
                    prefixIcon: selectedValue == "Male"
                        ? Icon(Icons.male, color: AppColors.textColorLight)
                        : Icon(Icons.female, color: AppColors.textColorLight),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                    fillColor: AppColors.grey,
                  ),
                  dropdownColor: AppColors.grey,
                  value: selectedValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: dropdownItems,
                ),
                getSizedBox(height: 20),
                AppButton(
                  btnText: 'Create Account',
                  textSize: 15,
                  voidCallBack: (){
                    Navigator.pushReplacementNamed(context, homeScreen);
                  },
                )
              ],
            ),
          )),
    );
  }
}
