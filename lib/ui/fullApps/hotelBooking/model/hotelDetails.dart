import 'package:flutter/material.dart';

class HotelDetails {
  String name;
  IconData iconData;

  HotelDetails({required this.name, required this.iconData});
}

List<HotelDetails> hotelDetails = [
  HotelDetails(name: 'Hotels', iconData: Icons.home_work_rounded),
  HotelDetails(name: '4 Bedrooms', iconData: Icons.king_bed_sharp),
  HotelDetails(name: '2 Bathrooms', iconData: Icons.bathtub),
  HotelDetails(name: '4000 sqft', iconData: Icons.width_wide_sharp),
];
