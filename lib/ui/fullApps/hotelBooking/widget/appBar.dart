import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';

AppBar appBar(BuildContext context, String title) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios),
      splashRadius: 1,
    ),
    title: Text(
      title,
      style: appTextTheme(context).labelSmall,
    ),
  );
}

AppBar appBarWithActions(
    BuildContext context, String title, List<Widget> actions) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios),
      splashRadius: 1,
    ),
    title: Text(
      title,
      style: appTextTheme(context).labelSmall,
    ),
    actions: actions,
  );
}
