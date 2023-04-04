import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'StringsRes.dart';

class Dialogs {
  /// Show info dialogs with OK button
  static showInfoDialog(BuildContext context, String message,
      {Function? onPressed, bool isCancelable = true}) async {
    String btnText = StringsRes.lblok;
    String title = StringsRes.appname;

    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        CupertinoDialogAction(
            onPressed: onPressed as void Function()? ??
                () {
                  Navigator.pop(context);
                },
            child: Text(btnText)),
      ],
    );

    showDialog(
      context: context,
      barrierDismissible: isCancelable,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  /// Show dialogs with three option buttons
  static showDialogWithTwoOptions(
      BuildContext context, String message, String positiveButtonText,
      {VoidCallback? positiveButtonCallBack, bool isCancelable = true}) async {
    String btnText = StringsRes.lblcancel;
    String title = StringsRes.appname;

    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        CupertinoDialogAction(
            onPressed: positiveButtonCallBack, child: Text(positiveButtonText)),
        CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(btnText)),
      ],
    );

    showDialog(
      context: context,
      barrierDismissible: isCancelable,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
