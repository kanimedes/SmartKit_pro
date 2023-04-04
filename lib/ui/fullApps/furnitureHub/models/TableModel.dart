import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/ColorModel.dart';

class TableModel {
  String? id;
  String? like;
  String? name;
  String? time;
  String? rating;
  String? image;
  String? price;
  String? description;
  List<ColorModel>? colorList;
  String? imgurl;
  String? hash;
  int? quantity;

  TableModel(
      {this.id,
      this.like,
      this.name,
      this.time,
      this.rating,
      this.image,
      this.price,
      this.description,
      this.colorList,
      this.imgurl,
      this.hash,
      this.quantity});
}

List<TableModel> tableList = [
  TableModel(
      id: "1",
      name: "Living Room Table",
      like: "0",
      time: "2021 9eps Tv-PG",
      rating: "4.0",
      image: "assets/furniture/furniture01/table-a.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Fchair-e.jpg?alt=media&token=425cc33d-181a-4147-b69e-bcdcd013c663",
      hash: "LPO{jb.TxtM|yEVsRjbI-ToLXT%L",
      price: "\$20.00",
      description:
          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ",
      colorList: [
        ColorModel(id: "1", name: "Brown", color: ColorsRes.brownColor),
        ColorModel(id: "2", name: "Yellow", color: ColorsRes.yellowColor),
        ColorModel(id: "3", name: "Green", color: ColorsRes.greenColor),
        ColorModel(id: "4", name: "Red", color: ColorsRes.redBorderColor),
        ColorModel(id: "5", name: "Violate", color: ColorsRes.violateColor),
      ],
      quantity: 1),
  TableModel(
      id: "2",
      name: "Office Table",
      like: "0",
      time: "2021 9eps Tv-PG",
      rating: "3.0",
      image: "assets/furniture/furniture01/table-b.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Ftable-b.jpg?alt=media&token=e85fa887-f8b2-465b-8599-11cc4096360c",
      hash: "LTP6z2_N%Mof_NozM{oLxuWBM{j[",
      price: "\$23.00",
      description:
          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ",
      colorList: [
        ColorModel(id: "1", name: "Brown", color: ColorsRes.brownColor),
        ColorModel(id: "2", name: "Yellow", color: ColorsRes.yellowColor),
        ColorModel(id: "3", name: "Green", color: ColorsRes.greenColor),
        ColorModel(id: "4", name: "Red", color: ColorsRes.redBorderColor),
        ColorModel(id: "5", name: "Violate", color: ColorsRes.violateColor),
      ],
      quantity: 1),
  TableModel(
      id: "3",
      name: "Wooden Table",
      like: "1",
      time: "2021 9eps Tv-PG",
      rating: "4.0",
      image: "assets/furniture/furniture01/table-c.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Ftable-c.jpg?alt=media&token=7dc44425-4b32-4bf4-a94d-f4f7c78a9998",
      hash: "LTJ@|D00Xn%MyEM{ITkC_4NGo\$k9",
      price: "\$20.00",
      description:
          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ",
      colorList: [
        ColorModel(id: "1", name: "Brown", color: ColorsRes.brownColor),
        ColorModel(id: "2", name: "Yellow", color: ColorsRes.yellowColor),
        ColorModel(id: "3", name: "Green", color: ColorsRes.greenColor),
        ColorModel(id: "4", name: "Red", color: ColorsRes.redBorderColor),
        ColorModel(id: "5", name: "Violate", color: ColorsRes.violateColor),
      ],
      quantity: 1),
  TableModel(
      id: "4",
      name: "Study Table",
      like: "0",
      time: "2021 9eps Tv-PG",
      rating: "4.1",
      image: "assets/furniture/furniture01/table-d.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Ftable-d.jpg?alt=media&token=2526554c-45f9-445b-94be-437f1da8d2ae",
      hash: "LPLX0%8_4noy_NoJt7WBxuxuWBjF",
      price: "\$23.00",
      description:
          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ",
      colorList: [
        ColorModel(id: "1", name: "Brown", color: ColorsRes.brownColor),
        ColorModel(id: "2", name: "Yellow", color: ColorsRes.yellowColor),
        ColorModel(id: "3", name: "Green", color: ColorsRes.greenColor),
        ColorModel(id: "4", name: "Red", color: ColorsRes.redBorderColor),
        ColorModel(id: "5", name: "Violate", color: ColorsRes.violateColor),
      ],
      quantity: 1),

//
];
