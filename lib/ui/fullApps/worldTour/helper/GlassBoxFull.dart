import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:smartkit_pro/ui/fullApps/worldTour/helper/ColorsRes.dart';

class GlassBoxFull extends StatelessWidget {
  final double width, height;
  final Widget child;

  const GlassBoxFull(
      {Key? key,
      required this.width,
      required this.height,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 7.0,
                sigmaY: 7.0,
              ),
              child: SizedBox(width: width, height: height, child: Text(" ")),
            ),
            Opacity(
                opacity: 0.30,
                child: OctoImage(
                  image: CachedNetworkImageProvider(
                      'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fimage_b.jpg?alt=media&token=2279a2b7-205e-4543-8260-b379377c5ba4'),
                  placeholderBuilder: OctoPlaceholder.blurHash(
                    'LA7{HstRnNyEK-.SkDkWMJXT%zWB',
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  errorBuilder: OctoError.icon(color: ColorsRes.bottomColor),
                  fit: BoxFit.fill,
                )),
            Container(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
