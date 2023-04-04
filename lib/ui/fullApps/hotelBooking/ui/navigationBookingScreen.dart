import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/model/hotel.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/actionChip.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/bottomSheetDialog.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/roundedImageView.dart';

bool isGridActive = false;

class NavigationBookingScreen extends StatefulWidget {
  const NavigationBookingScreen({Key? key}) : super(key: key);

  @override
  State<NavigationBookingScreen> createState() =>
      _NavigationBookingScreenState();
}

class _NavigationBookingScreenState extends State<NavigationBookingScreen> {
  var currentSelectedIndex = 0;
  List<String> labels = ['All', 'Ongoing', 'Completed', 'Cancelled'];

  List<String> bookingStatus = ['Paid', 'Completed', 'Cancelled and Refunded'];

  void onChipTap(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsetsDirectional.only(bottom: 70),
              child: Column(children: [
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: labels.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return actionChip(
                          context, labels[index], currentSelectedIndex, index,
                          () {
                        onChipTap(index);
                      });
                    },
                  ),
                ),
                getSizedBox(height: 20),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.only(bottom: 15),
                      child: Container(
                        padding: EdgeInsetsDirectional.all(10),
                        height: 240,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                roundedImageView(
                                    context, 'hotel_1.jpg', true, 120, 120, 0),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        getSizedBox(height: 15),
                                        Text(
                                          hotelList[0].city,
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                          style: appTextTheme(context)
                                              .labelSmall
                                              ?.copyWith(
                                                fontSize: 15,
                                              ),
                                        ),
                                        getSizedBox(height: 15),
                                        Container(
                                          padding: EdgeInsetsDirectional.only(
                                              start: 10,
                                              end: 10,
                                              top: 5,
                                              bottom: 5),
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryLightColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: Text(
                                            bookingStatus[0],
                                            softWrap: false,
                                            overflow: TextOverflow.fade,
                                            style: appTextTheme(context)
                                                .labelSmall
                                                ?.copyWith(
                                                    fontSize: 12,
                                                    color:
                                                        AppColors.primaryColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            getSizedBox(height: 15),
                            Divider(
                                color: AppColors.grey, height: 2, thickness: 1),
                            getSizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.only(end: 5),
                                    child: AppButton(
                                      voidCallBack: () {
                                        BottomDialogYesNo(
                                            context,
                                            'Cancel Booking',
                                            'Yes, Continue', () {
                                          Navigator.pop(context);
                                          Navigator.pushNamed(
                                              context, cancellationConfirmScreen);
                                        }, 'Are you sure you want to cancel your hotel booking?',
                                            'Only 80% of the money you can get refund from your payment according to our policy');
                                      },
                                      height: 100,
                                      width: 600,
                                      btnText: 'Cancel',
                                      backgroundColor:
                                          AppColors.primaryLightColor,
                                      textColor: AppColors.primaryColor,
                                      textSize: 15,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.only(start: 5),
                                    child: AppButton(
                                      voidCallBack: () {
                                        Navigator.pushNamed(context, viewTicket);
                                      },
                                      height: 100,
                                      width: 600,
                                      btnText: 'View Ticket',
                                      textSize: 15,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(bottom: 15),
                      child: Container(
                        padding: EdgeInsetsDirectional.all(10),
                        height: 210,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                roundedImageView(
                                    context, 'hotel_1.jpg', true, 120, 120, 0),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          hotelList[1].name,
                                          style: appTextTheme(context)
                                              .labelSmall
                                              ?.copyWith(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                        ),
                                        getSizedBox(height: 15),
                                        Text(
                                          hotelList[1].city,
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                          style: appTextTheme(context)
                                              .labelSmall
                                              ?.copyWith(
                                                fontSize: 15,
                                              ),
                                        ),
                                        getSizedBox(height: 15),
                                        Container(
                                          padding: EdgeInsetsDirectional.only(
                                              start: 10,
                                              end: 10,
                                              top: 5,
                                              bottom: 5),
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryLightColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: Text(
                                            bookingStatus[1],
                                            softWrap: false,
                                            overflow: TextOverflow.fade,
                                            style: appTextTheme(context)
                                                .labelSmall
                                                ?.copyWith(
                                                    fontSize: 12,
                                                    color:
                                                        AppColors.primaryColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            getSizedBox(height: 15),
                            Divider(
                                color: AppColors.grey, height: 2, thickness: 1),
                            getSizedBox(height: 15),
                            Container(
                                padding: EdgeInsetsDirectional.only(
                                    start: 10, end: 10, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLightColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: AppColors.primaryColor,
                                    ),
                                    Text(
                                      'Yeay, You completed it!',
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
                                      style: appTextTheme(context)
                                          .labelSmall
                                          ?.copyWith(
                                              fontSize: 15,
                                              color: AppColors.primaryColor),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(bottom: 15),
                      child: Container(
                        padding: EdgeInsetsDirectional.all(10),
                        height: 210,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                roundedImageView(
                                    context, 'hotel_1.jpg', true, 120, 120, 0),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          hotelList[2].name,
                                          style: appTextTheme(context)
                                              .labelSmall
                                              ?.copyWith(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                        ),
                                        getSizedBox(height: 15),
                                        Text(
                                          hotelList[2].city,
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                          style: appTextTheme(context)
                                              .labelSmall
                                              ?.copyWith(
                                                fontSize: 15,
                                              ),
                                        ),
                                        getSizedBox(height: 15),
                                        Container(
                                          padding: EdgeInsetsDirectional.only(
                                              start: 10,
                                              end: 10,
                                              top: 5,
                                              bottom: 5),
                                          decoration: BoxDecoration(
                                            color: AppColors.redLight,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          child: Text(
                                            bookingStatus[2],
                                            softWrap: false,
                                            overflow: TextOverflow.fade,
                                            style: appTextTheme(context)
                                                .labelSmall
                                                ?.copyWith(
                                                    fontSize: 12,
                                                    color: AppColors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            getSizedBox(height: 15),
                            Divider(
                                color: AppColors.grey, height: 2, thickness: 1),
                            getSizedBox(height: 15),
                            Container(
                                padding: EdgeInsetsDirectional.only(
                                    start: 10, end: 10, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                  color: AppColors.redLight,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.info,
                                      color: AppColors.red,
                                    ),
                                    Text(
                                      'You cancelled this hotel booking!',
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
                                      style: appTextTheme(context)
                                          .labelSmall
                                          ?.copyWith(
                                              fontSize: 15,
                                              color: AppColors.red),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            )));
  }
}
