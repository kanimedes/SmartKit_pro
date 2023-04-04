import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';

class imageAsset extends StatelessWidget {
  String fileName;
  double? imgHeight, imgWidth;
  bool isNormalImage;

  imageAsset({
    Key? key,
    required this.fileName,
    this.imgHeight,
    this.imgWidth,
    required this.isNormalImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isNormalImage == true
        ? Image.asset(
            "$imagePath$fileName",
            height: imgHeight ?? 20,
            width: imgWidth ?? 20,
            fit: BoxFit.fill,
          )
        : SvgPicture.asset(
            "$imagePath$fileName",
            height: imgHeight ?? 20,
            width: imgWidth ?? 20,
          );
  }
}
