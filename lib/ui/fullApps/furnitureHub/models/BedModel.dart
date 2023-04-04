import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/ColorModel.dart';

class BedModel {
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

  BedModel(
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

List<BedModel> bedList = [
  BedModel(
      id: "1",
      name: "Double Bed",
      like: "0",
      time: "2021 9eps Tv-PG",
      rating: "4.0",
      image: "assets/furniture/furniture01/bed-a.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Fbed-a.jpg?alt=media&token=eab8438e-8b52-477b-9c5a-8dc6a57b1f50",
      hash: "LdL4NB~qo\$%N.7R:IVV[\$~afadWT",
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
  BedModel(
      id: "2",
      name: "Morden Bed",
      like: "0",
      time: "2021 9eps Tv-PG",
      rating: "3.0",
      image: "assets/furniture/furniture01/bed-b.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Fbed-b.jpg?alt=media&token=191700d6-ae86-4842-bec7-7eb91636d2fa",
      hash: "LVQIr8Tg_2oM_Ns-M{Six]R-o0xv",
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
  BedModel(
      id: "3",
      name: "Violate Bed",
      like: "1",
      time: "2021 9eps Tv-PG",
      rating: "4.0",
      image: "assets/furniture/furniture01/bed-c.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Fbed-c.jpg?alt=media&token=b13d04c3-fec9-4e84-855b-4adc9a35906c",
      hash: "LDJRm-00~q%NIus+WDM_0L%2Rjt7",
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
  BedModel(
      id: "4",
      name: "Peach Bed",
      like: "0",
      time: "2021 9eps Tv-PG",
      rating: "4.1",
      image: "assets/furniture/furniture01/bed-d.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Fbed-d.jpg?alt=media&token=b4629369-67a1-4120-88d3-4379763457e5",
      hash: "LIO|5{00?bMx~WadNHRi_4%1t7s;",
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
  BedModel(
      id: "5",
      name: "Comfort Bed",
      like: "0",
      time: "2021 9eps Tv-PG",
      rating: "4.0",
      image: "assets/furniture/furniture01/bed-e.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Fbed-e.jpg?alt=media&token=e5ca62a0-2987-4171-8bf1-65fe703867eb",
      hash: "LMI#\$8_NtR.8-;R*tRxuD%IUM{M{",
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
  BedModel(
      id: "6",
      name: "Cotton Bed",
      like: "0",
      time: "2021 9eps Tv-PG",
      rating: "3.0",
      image: "assets/furniture/furniture01/bed-f.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Fbed-f.jpg?alt=media&token=6425b280-057d-4d98-b5ff-29ceaaa8f536",
      hash: "L4I=7ND45A0100~VV?8^*wIV?Gac",
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
