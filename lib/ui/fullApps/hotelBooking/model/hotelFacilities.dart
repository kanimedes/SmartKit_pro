import 'package:flutter/material.dart';

class HotelFacilities {
  String name;
  IconData iconData;

  HotelFacilities({required this.name, required this.iconData});
}

List<HotelFacilities> hotelFacilities = [
  HotelFacilities(name: 'Swimming Pool', iconData: Icons.pool),
  HotelFacilities(name: 'WiFi', iconData: Icons.wifi),
  HotelFacilities(name: 'Restaurant', iconData: Icons.restaurant_menu),
  HotelFacilities(name: 'Parking', iconData: Icons.local_parking),
  HotelFacilities(name: 'Meeting Room', iconData: Icons.meeting_room),
  HotelFacilities(name: 'Elevator', iconData: Icons.move_to_inbox_outlined),
  HotelFacilities(name: 'Gym', iconData: Icons.fitness_center),
  HotelFacilities(name: '24x7 Service', iconData: Icons.home_repair_service),
];
