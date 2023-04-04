import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/imageAsset.dart';

Widget roundedImageView(BuildContext context, String imageName,
    bool isNormalImage, double height, double width, double opacity) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(25),
    child: ColorFiltered(
      colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(opacity), BlendMode.srcOver),
      child: imageAsset(
        fileName: imageName,
        isNormalImage: isNormalImage,
        imgHeight: height,
        imgWidth: width,
      ),
    ),
  );
}
