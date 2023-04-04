import 'package:flutter/cupertino.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/route.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/imageAsset.dart';

class SocialMediaButton extends StatelessWidget {
  String fileName;
  String? text;

  SocialMediaButton({Key? key, this.text, required this.fileName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, homeScreen);
      },
      child: Container(
        padding: EdgeInsetsDirectional.all(15),
        // margin: EdgeInsetsDirectional.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            border: BorderDirectional(
                bottom: BorderSide(width: 2, color: AppColors.grey),
                end: BorderSide(width: 2, color: AppColors.grey),
                start: BorderSide(width: 2, color: AppColors.grey),
                top: BorderSide(width: 2, color: AppColors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            imageAsset(
              fileName: fileName,
              imgWidth: 24,
              imgHeight: 24,
              isNormalImage: true,
            ),
            Text(
              text ?? '',
              style: appTextTheme(context).labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
