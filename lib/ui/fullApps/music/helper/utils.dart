import 'package:flutter/material.dart';

import 'colors.dart';

class Utils {
  static getAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Colors.grey[50],
      title: Text(title,
          style: TextStyle(
            color: black,
          )),
      centerTitle: true,

      elevation: 1,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_sharp, color: black)),
    );
  }
}
