import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appBar.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/customDialog.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/imageAsset.dart';

class CancellationConfirmScreen extends StatefulWidget {
  const CancellationConfirmScreen({Key? key}) : super(key: key);

  @override
  State<CancellationConfirmScreen> createState() =>
      _CancellationConfirmScreenState();
}

class _CancellationConfirmScreenState extends State<CancellationConfirmScreen> {
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Cancel Hotel Booking'),
      body: Padding(
        padding: EdgeInsetsDirectional.all(20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                'Please select a payment refund method (Only 80% of payment amount will be refunded).',
                softWrap: true,
                style: appTextTheme(context).labelSmall,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Paid: \$479.5 ',
                    softWrap: true,
                    style: appTextTheme(context).labelSmall?.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                  ),
                  Text('Refund: \$383.8 ',
                      softWrap: true,
                      style: appTextTheme(context).labelSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                ],
              ),
              getSizedBox(height: 30),
              AppButton(
                  btnText: 'Confirm Cancellation',
                  voidCallBack: () {
                    //open custom dialog
                    showCustomDialog(
                        context,
                        'Successful!',
                        'You have successfully cancelled your order, 80% amount will be returned to your account!',
                        'OK', () {
                      Navigator.pop(context);
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
