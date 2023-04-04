import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/helper/ColorsRes.dart';

class MoreListTileUI extends StatelessWidget {
  const MoreListTileUI({
    Key? key,
    this.title,
    this.textcolor,
    this.ontap,
  }) : super(key: key);

  final String? title;
  final Color? textcolor;
  final Widget? ontap;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => ontap!));
      },
      child: Container(
        color: ColorsRes.backgroundColor,
        child: Center(
          child: ListTile(
            title: Text(
              "$title",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: textcolor,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios,
                size: width / 20, color: textcolor),
          ),
        ),
      ),
    );
  }
}
