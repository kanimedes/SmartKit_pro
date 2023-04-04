import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/model/hotel.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/bottomSheetDialog.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/roundedImageView.dart';

class SectionView extends StatelessWidget {
  String title;
  List<HotelModel> hotelList;

  SectionView({Key? key, required this.title, required this.hotelList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getSizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: appTextTheme(context)
                    .labelSmall
                    ?.copyWith(fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, hotelListingScreen,
                    arguments: hotelList);
              },
              child: Text('See All',
                  style: appTextTheme(context).labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor)),
            ),
          ],
        ),
        getSizedBox(height: 15),
        SizedBox(
          height: 265,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotelList.length,
            itemBuilder: (context, indexHotelList) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, hotelDetailScreen,
                      arguments: hotelList[indexHotelList]);
                },
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    height: constraints.maxHeight,
                    width: 180,
                    margin: EdgeInsetsDirectional.only(end: 10),
                    padding: EdgeInsetsDirectional.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: hotelList[indexHotelList].id,
                          child: roundedImageView(
                              context,
                              hotelList[indexHotelList].mainImage,
                              true,
                              constraints.maxHeight * 0.6,
                              constraints.maxHeight * 0.6,
                              0),
                        ),
                        Text(
                          hotelList[indexHotelList].name,
                          style: appTextTheme(context).labelSmall?.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold),
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
                                Text(hotelList[indexHotelList].ratings,
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                    style: appTextTheme(context)
                                        .labelSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: AppColors.primaryColor))
                              ],
                            ),
                            getSizedBox(width: 15),
                            Expanded(
                              child: Text(
                                hotelList[indexHotelList].city,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('${hotelList[indexHotelList].price}\$',
                                    softWrap: true,
                                    style: appTextTheme(context)
                                        .labelSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold)),
                                Text(
                                  '/ per night',
                                  softWrap: true,
                                  style: appTextTheme(context)
                                      .labelSmall
                                      ?.copyWith(fontSize: 10),
                                )
                              ],
                            ),
                            IconButton(
                              splashRadius: 1,
                              onPressed: () {
                                RemoveBookmarkBottomDialog(
                                    context, indexHotelList);
                              },
                              icon: Icon(
                                Icons.bookmark_border,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}
