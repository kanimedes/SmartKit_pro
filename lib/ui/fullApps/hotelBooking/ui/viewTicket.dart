import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/model/hotel.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appBar.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/imageAsset.dart';

class ViewTicket extends StatelessWidget {
  const ViewTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Ticket'),
      body: Padding(
        padding: EdgeInsetsDirectional.all(20),
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsetsDirectional.all(20),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(hotelList[0].name,
                        softWrap: true,
                        style: appTextTheme(context).titleSmall),
                    getSizedBox(height: 20),
                    imageAsset(
                      fileName: 'qrcode.png',
                      isNormalImage: true,
                      imgWidth: MediaQuery.of(context).size.height * 0.25,
                      imgHeight: MediaQuery.of(context).size.height * 0.25,
                    ),
                    getSizedBox(height: 20),
                    Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    getSizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Name',
                                softWrap: true,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(color: AppColors.textColorLight),
                              ),
                              Text(
                                'Alexander',
                                softWrap: true,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Phone Number',
                                softWrap: true,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(color: AppColors.textColorLight),
                              ),
                              Text(
                                '+1 111 467 998 562',
                                softWrap: true,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    getSizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Check in',
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(color: AppColors.textColorLight),
                              ),
                              Text(
                                'Dec 16, 2020',
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Check Out',
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(color: AppColors.textColorLight),
                              ),
                              Text(
                                'Dec 27, 2020',
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    getSizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Hotel',
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(color: AppColors.textColorLight),
                              ),
                              Text(
                                hotelList[0].name,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Guest',
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(color: AppColors.textColorLight),
                              ),
                              Text(
                                '3',
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
            getSizedBox(height: 20),
            AppButton(
              btnText: 'Download Ticket',
              voidCallBack: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
