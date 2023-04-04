import 'package:flutter/material.dart';

String imagePath = 'assets/images/fullApps/hotelBookingApp/';

TextTheme appTextTheme(BuildContext context) {
  return Theme.of(context).textTheme;
}

Widget getSizedBox({double? height, double? width}) {
  return SizedBox(
    height: height ?? 0,
    width: width ?? 0,
  );
}
