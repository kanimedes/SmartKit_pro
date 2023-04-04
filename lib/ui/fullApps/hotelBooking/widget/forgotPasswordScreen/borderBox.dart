import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/theme/colors.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/imageAsset.dart';

class BorderBox extends StatelessWidget {
  String textVia, textId, fileName;
  Color borderColor;

  BorderBox({
    Key? key,
    required this.textVia,
    required this.textId,
    required this.fileName,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: EdgeInsetsDirectional.only(top: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(width: 2, color: borderColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(start: 10),
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.primaryLightColor,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: Center(
              child: imageAsset(
                fileName: fileName,
                isNormalImage: false,
                imgHeight: 40,
                imgWidth: 40,
              ),
            ),
          ),
          getSizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: Directionality.of(context),
              children: [
                Text(
                  textVia,
                  overflow: TextOverflow.ellipsis,
                  style: appTextTheme(context)
                      .labelSmall
                      ?.copyWith(color: AppColors.textColorLight),
                ),
                getSizedBox(height: 10),
                Text(textId,
                    overflow: TextOverflow.ellipsis,
                    style: appTextTheme(context)
                        .labelSmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
