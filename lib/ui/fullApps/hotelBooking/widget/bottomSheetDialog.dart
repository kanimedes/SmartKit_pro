import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/model/hotel.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/roundedImageView.dart';

Future RemoveBookmarkBottomDialog(BuildContext context, int index) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
    ),
    context: context,
    elevation: 5,
    builder: (BuildContext context) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getSizedBox(height: 40),
            Text(
              'Remove from bookmark?',
              textAlign: TextAlign.center,
              style: appTextTheme(context).titleSmall,
            ),
            getSizedBox(height: 25),
            Padding(
                padding: EdgeInsetsDirectional.only(start: 10, end: 10),
                child: Divider(color: AppColors.grey, height: 2, thickness: 1)),
            getSizedBox(height: 15),
            Container(
              margin: EdgeInsetsDirectional.all(10),
              padding: EdgeInsetsDirectional.all(10),
              height: 130,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Row(
                children: [
                  roundedImageView(
                      context, 'hotel_${index + 1}.jpg', true, 120, 120, 0),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(start: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hotelList[index].name,
                            style: appTextTheme(context).labelSmall?.copyWith(
                                fontSize: 17, fontWeight: FontWeight.bold),
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          ),
                          Text(
                            hotelList[index].city,
                            style: appTextTheme(context).labelSmall?.copyWith(
                                  fontSize: 15,
                                ),
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow[800],
                                    size: 15,
                                  ),
                                  Text(hotelList[index].ratings,
                                      style: appTextTheme(context)
                                          .labelSmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: AppColors.primaryColor))
                                ],
                              ),
                              getSizedBox(width: 5),
                              Text(
                                "(${hotelList[index].totalReviewed} reviews)",
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 10, top: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('${hotelList[index].price}\$',
                                softWrap: true,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(
                                        color: AppColors.primaryColor,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold)),
                            Text(
                              '/night',
                              softWrap: true,
                              style: appTextTheme(context)
                                  .labelSmall
                                  ?.copyWith(fontSize: 10),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      voidCallBack: () {
                        Navigator.pop(context);
                      },
                      height: 120,
                      width: 500,
                      btnText: 'Cancel',
                      backgroundColor: AppColors.primaryLightColor,
                      textColor: AppColors.primaryColor,
                      textSize: 15,
                    ),
                  ),
                  Expanded(
                    child: AppButton(
                      voidCallBack: () {
                        Navigator.pop(context);
                      },
                      height: 120,
                      width: 500,
                      btnText: 'Yes, Remove',
                      textSize: 15,
                    ),
                  )
                ],
              ),
            )
          ]);
    },
  );
}

Future BottomDialogYesNo(
  BuildContext context,
  String title,
  String confirmButtonText,
  VoidCallback confirmVoidCallback,
  String msgMain,
  String msgSub,
) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
    ),
    context: context,
    elevation: 5,
    builder: (BuildContext context) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            getSizedBox(height: 40),
            Text(
              title,
              textAlign: TextAlign.center,
              style: appTextTheme(context).titleSmall,
            ),
            getSizedBox(height: 25),
            Padding(
                padding: EdgeInsetsDirectional.only(start: 10, end: 10),
                child: Divider(color: AppColors.grey, height: 2, thickness: 1)),
            getSizedBox(height: 15),
            Text(
              msgMain,
              softWrap: true,
              textAlign: TextAlign.center,
              style: appTextTheme(context)
                  .labelMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            getSizedBox(height: 20),
            Text(
              msgSub,
              softWrap: true,
              textAlign: TextAlign.center,
              style: appTextTheme(context).labelSmall,
            ),
            getSizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(start: 20,end: 20),
                    child: AppButton(
                      voidCallBack: () {
                        Navigator.pop(context);
                      },
                      height: 120,
                      width: 500,
                      btnText: 'Cancel',
                      backgroundColor: AppColors.primaryLightColor,
                      textColor: AppColors.primaryColor,
                      textSize: 15,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(start: 20,end: 20),
                    child: AppButton(
                      voidCallBack: confirmVoidCallback,
                      height: 120,
                      width: 500,
                      btnText: confirmButtonText,
                      textSize: 15,
                    ),
                  ),
                )
              ],
            ),
            getSizedBox(height: 20),
          ]);
    },
  );
}
