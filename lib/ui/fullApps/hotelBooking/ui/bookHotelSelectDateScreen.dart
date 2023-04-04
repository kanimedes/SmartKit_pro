import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appBar.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookHotelSelectDateScreen extends StatefulWidget {
  const BookHotelSelectDateScreen({Key? key}) : super(key: key);

  @override
  State<BookHotelSelectDateScreen> createState() =>
      _BookHotelSelectDateScreenState();
}

class _BookHotelSelectDateScreenState extends State<BookHotelSelectDateScreen> {
  int adultCount = 0, childCount = 0;

  setAdultCount(int count, bool isAdd) {
    setState(() {
      isAdd == true
          ? count++
          : count > 0
              ? count--
              : count = 0;
      adultCount = count;
    });
  }

  setChildCount(int count, bool isAdd) {
    isAdd == true
        ? count++
        : count > 0
            ? count--
            : count = 0;
    setState(() {
      childCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Select Date'),
      body: Padding(
        padding: EdgeInsetsDirectional.all(20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                height: MediaQuery.of(context).size.height * 0.45,
                child: SfDateRangePicker(
                  view: DateRangePickerView.month,
                  monthViewSettings:
                      DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
                  enablePastDates: false,
                  enableMultiView: false,
                  selectionMode: DateRangePickerSelectionMode.range,
                  startRangeSelectionColor: AppColors.primaryColor,
                  endRangeSelectionColor: AppColors.primaryColor,
                  selectionColor: AppColors.primaryLightColor,
                ),
              ),
              getSizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Adults',
                      style: appTextTheme(context)
                          .labelSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  getSizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: AppColors.primaryLightColor),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: AppColors.primaryColor,
                            ),
                            onPressed: () {
                              setAdultCount(adultCount, false);
                            },
                          ),
                        ),
                      ),
                      Text(
                        '$adultCount',
                        style: appTextTheme(context)
                            .labelMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: AppColors.primaryLightColor),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: AppColors.primaryColor,
                            ),
                            onPressed: () {
                              setAdultCount(adultCount, true);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  getSizedBox(height: 20),
                  Text('Children',
                      style: appTextTheme(context)
                          .labelSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  getSizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: AppColors.primaryLightColor),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.remove,
                              color: AppColors.primaryColor,
                            ),
                            onPressed: () {
                              setChildCount(childCount, false);
                            },
                          ),
                        ),
                      ),
                      Text(
                        '$childCount',
                        style: appTextTheme(context)
                            .labelMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: AppColors.primaryLightColor),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: AppColors.primaryColor,
                            ),
                            onPressed: () {
                              setChildCount(childCount, true);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  getSizedBox(height: 20),
                  AppButton(
                      btnText: 'Continue',
                      voidCallBack: () {
                        Navigator.pushNamed(
                            context, bookHotelNameReservationScreen);
                      }),
                  getSizedBox(height: 20),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
