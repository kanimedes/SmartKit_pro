import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/model/hotel.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/bottomSheetDialog.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/roundedImageView.dart';

Widget sliderImages(BuildContext context, int index) {
  HotelModel hotel = hotelList[index];
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.4,
    width: MediaQuery.of(context).size.width * 0.6,
    child: Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, hotelDetailScreen,
                arguments: hotelList[index]);
          },
          child: Hero(
            tag: '$index',
            child: roundedImageView(
                context,
                hotel.mainImage,
                true,
                MediaQuery.of(context).size.height * 0.4,
                MediaQuery.of(context).size.width * 0.6,
                0.2),
          ),
        ),
        PositionedDirectional(
            top: 20,
            end: 20,
            child: Container(
              padding: EdgeInsetsDirectional.only(
                  start: 10, end: 10, top: 5, bottom: 5),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.white,
                    size: 15,
                  ),
                  getSizedBox(width: 5),
                  Text(
                    hotel.ratings,
                    style: appTextTheme(context)
                        .labelSmall
                        ?.copyWith(color: AppColors.white),
                  )
                ],
              ),
            )),
        PositionedDirectional(
            bottom: 20,
            end: 20,
            start: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  hotel.name,
                  softWrap: true,
                  style: appTextTheme(context)
                      .titleSmall
                      ?.copyWith(color: AppColors.white),
                ),
                getSizedBox(height: 5),
                Text(
                  hotel.city,
                  softWrap: true,
                  style: appTextTheme(context)
                      .labelSmall
                      ?.copyWith(color: AppColors.white),
                ),
                getSizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${hotel.price}\$',
                          softWrap: true,
                          style: appTextTheme(context)
                              .titleSmall
                              ?.copyWith(color: AppColors.white),
                        ),
                        Text(
                          '/ per night',
                          softWrap: true,
                          style: appTextTheme(context)
                              .labelSmall
                              ?.copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        RemoveBookmarkBottomDialog(context, index);
                      },
                      icon: Icon(
                        Icons.bookmark_border,
                        color: AppColors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ))
      ],
    ),
  );
}
