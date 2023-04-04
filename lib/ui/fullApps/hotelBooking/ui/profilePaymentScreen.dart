import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appBar.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/imageAsset.dart';

class ProfilePaymentScreen extends StatefulWidget {
  const ProfilePaymentScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePaymentScreen> createState() => _ProfilePaymentScreenState();
}

class _ProfilePaymentScreenState extends State<ProfilePaymentScreen> {
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Payment'),
      body: Padding(
        padding: EdgeInsetsDirectional.all(20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(top: 20),
                padding: EdgeInsetsDirectional.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    imageAsset(fileName: 'google.png', isNormalImage: true),
                    Text('Google Pay'),
                    Radio(
                        groupValue: groupValue,
                        value: 0,
                        onChanged: (int? value) {
                          setState(() {
                            groupValue = 0;
                          });
                        }),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 20),
                padding: EdgeInsetsDirectional.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    imageAsset(fileName: 'apple.png', isNormalImage: true),
                    Text('    Apple Pay    '),
                    Radio(
                        groupValue: groupValue,
                        value: 1,
                        onChanged: (int? value) {
                          setState(() {
                            groupValue = 1;
                          });
                        }),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 20),
                padding: EdgeInsetsDirectional.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    imageAsset(
                      fileName: 'card.png',
                      isNormalImage: true,
                      imgHeight: 50,
                      imgWidth: 50,
                    ),
                    Text('**** **** 6688'),
                    Radio(
                        groupValue: groupValue,
                        value: 2,
                        onChanged: (int? value) {
                          setState(() {
                            groupValue = 2;
                          });
                        }),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 20),
                padding: EdgeInsetsDirectional.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    imageAsset(
                      fileName: 'card.png',
                      isNormalImage: true,
                      imgHeight: 50,
                      imgWidth: 50,
                    ),
                    Text('**** **** 6688'),
                    Radio(
                        groupValue: groupValue,
                        value: 3,
                        onChanged: (int? value) {
                          setState(() {
                            groupValue = 3;
                          });
                        }),
                  ],
                ),
              ),
              getSizedBox(height: 30),
              AppButton(
                  btnText: 'Continue',
                  voidCallBack: () {
                    //open custom dialog
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
