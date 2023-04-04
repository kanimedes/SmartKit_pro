import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/model/hotel.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appBar.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/bottomSheetDialog.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/customDialog.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/roundedImageView.dart';

class BookHotelBookingDescriptionScreen extends StatefulWidget {
  const BookHotelBookingDescriptionScreen({Key? key}) : super(key: key);

  @override
  State<BookHotelBookingDescriptionScreen> createState() =>
      _BookHotelBookingDescriptionScreenState();
}

class _BookHotelBookingDescriptionScreenState
    extends State<BookHotelBookingDescriptionScreen> {
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Booking Details'),
      body: Padding(
        padding: EdgeInsetsDirectional.all(20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              getSizedBox(height: 30),
              Padding(
                padding: EdgeInsetsDirectional.only(bottom: 15),
                child: Container(
                  padding: EdgeInsetsDirectional.all(10),
                  height: 130,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Row(
                    children: [
                      roundedImageView(
                          context, 'hotel_1.jpg', true, 120, 120, 0),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(start: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hotelList[0].name,
                                style: appTextTheme(context)
                                    .labelSmall
                                    ?.copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                softWrap: false,
                                overflow: TextOverflow.fade,
                              ),
                              Text(
                                hotelList[0].city,
                                style:
                                    appTextTheme(context).labelSmall?.copyWith(
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
                                      Text(hotelList[0].ratings,
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                          style: appTextTheme(context)
                                              .labelSmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color:
                                                      AppColors.primaryColor))
                                    ],
                                  ),
                                  getSizedBox(height: 5),
                                  Text(

                                    "(${hotelList[0].totalReviewed} reviews)",
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
                                Text('${hotelList[0].price}\$',
                                    softWrap: false,
                                    style: appTextTheme(context)
                                        .labelSmall
                                        ?.copyWith(
                                            color: AppColors.primaryColor,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                Text(
                                  '/night',
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  style: appTextTheme(context)
                                      .labelSmall
                                      ?.copyWith(fontSize: 10),
                                )
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  RemoveBookmarkBottomDialog(context, 0);
                                },
                                icon: Icon(Icons.bookmark_border))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              getSizedBox(height: 60),
              AppButton(
                  btnText: 'Confirm Payment',
                  voidCallBack: () {
                    showCustomDialog(
                        context,
                        'Payment successful!',
                        'Successfully made payment and hotel booking!',
                        'OK', () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
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
