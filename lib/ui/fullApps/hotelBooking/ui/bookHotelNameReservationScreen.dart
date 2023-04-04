import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/actionChip.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appBar.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appButton.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appTextField.dart';

class BookHotelNameReservationScreen extends StatefulWidget {
  const BookHotelNameReservationScreen({Key? key}) : super(key: key);

  @override
  State<BookHotelNameReservationScreen> createState() =>
      _BookHotelNameReservationScreenState();
}

class _BookHotelNameReservationScreenState
    extends State<BookHotelNameReservationScreen> {
  var currentSelectedIndex = 0;

  void onChipTap(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  List<String> title = ['Mr.', 'Mrs.', 'Ms.'];

  List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  void onFocusChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Name of Reservation'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsetsDirectional.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: title.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return actionChip(
                        context, title[index], currentSelectedIndex, index, () {
                      onChipTap(index);
                    });
                  },
                ),
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
              getSizedBox(height: 30),
              AppButton(
                btnText: 'Continue',
                textSize: 15,
                voidCallBack: () {
                  Navigator.pushNamed(context, bookHotelPaymentScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
