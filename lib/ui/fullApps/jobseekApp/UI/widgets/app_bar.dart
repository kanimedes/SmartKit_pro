import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/jobseekApp/widget/app_large_text.dart';

class CommanAppBar extends StatelessWidget {
  String title;
  String edit;

  Color editColor;

  CommanAppBar(
      {Key? key,
      required this.title,
      this.edit = "",
      this.editColor = Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.secondary,
                )),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: AppLargeText(
                text: title,
                color: Theme.of(context).colorScheme.secondary,
                size: 18,
              )),
          Align(
            alignment: Alignment.topRight,
            child: AppLargeText(
              text: edit,
              color: editColor,
              size: 14,
            ),
          )
        ],
      ),
    );
  }
}
