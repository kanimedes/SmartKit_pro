import 'dart:ui';

import 'package:smartkit_pro/ui/fullApps/music/helper/constanat.dart';

class CategoryList {
  String? id;
  String? name;
  Color? backGroundColor;
  String? backgroundImage;

  CategoryList(
      {this.id, this.name, this.backGroundColor, this.backgroundImage});
}

List<CategoryList> categoriesList = [
  CategoryList(
      id: "1",
      name: "Hip Hop",
      backGroundColor: Color(0xff92B4EC),
      backgroundImage: "${imagePath}hiphop.jpg"),
  CategoryList(
      id: "2",
      name: "Concert",
      backGroundColor: Color(0xffFF8C8C),
      backgroundImage: "${imagePath}concert.jpg"),
  CategoryList(
      id: "3",
      name: "EDM",
      backGroundColor: Color(0xffFFC3C3),
      backgroundImage: "${imagePath}edm.jpg"),
  CategoryList(
      id: "4",
      name: "Jazz",
      backGroundColor: Color(0xffFFE3A9),
      backgroundImage: "${imagePath}jazz.jpg"),
  CategoryList(
      id: "5",
      name: "Party",
      backGroundColor: Color(0xffFFD9C0),
      backgroundImage: "${imagePath}party.jpg"),
  CategoryList(
      id: "6",
      name: "Rock",
      backGroundColor: Color(0xffB9F8D3),
      backgroundImage: "${imagePath}rock.jpg"),
];
