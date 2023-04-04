import 'package:flutter/material.dart';

import 'GrobagColor.dart';

class GrobagAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String? title;

  GrobagAppbar({Key? key, this.title})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      leading: Builder(builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.all(10),
          child: InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: () => Navigator.of(context).pop(),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: primary,
              ),
            ),
          ),
        );
      }),
      title: Text(
        title!,
        style: TextStyle(
          color: fontColor,
        ),
      ),
    );
  }
}
