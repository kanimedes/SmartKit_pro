import 'package:flutter/material.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/appBar.dart';
import 'package:smartkit_pro/ui/fullApps/hotelBooking/widget/roundedImageView.dart';

class HotelGalleryScreen extends StatelessWidget {
  const HotelGalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Hotel Gallery Photos'),
      body: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 15, end: 15, start: 15),
        child: GridView(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1 / 1),
          children: List.generate(
              16,
              (index) => Hero(
                    tag: 'hotel_$index',
                    child: roundedImageView(
                        context, 'hotel_${index + 1}.jpg', true, 500, 500, 0),
                  )),
        ),
      ),
    );
  }
}
