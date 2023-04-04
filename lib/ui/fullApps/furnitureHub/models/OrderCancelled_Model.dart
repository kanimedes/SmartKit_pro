import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/ColorModel.dart';

// ignore: camel_case_types
class OrderCancelled_Model {
  String? id;
  String? like;
  String? name;
  String? time;
  String? rating;
  String? image;
  String? price;
  String? orderNo;
  String? trackingNo;
  String? status;
  String? description;
  List<ColorModel>? colorList;
  String? imgurl;
  String? hash;
  int? quantity;

  OrderCancelled_Model(
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
      this.quantity,
      this.orderNo,
      this.trackingNo,
      this.status});
}

List<OrderCancelled_Model> orderCancelledList = [
  OrderCancelled_Model(
      id: "1",
      name: "Chair Living Room",
      like: "0",
      time: "05-Nov-2021, 4:00 PM",
      rating: "4.0",
      image: "assets/furniture/furniture01/chair-a.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Fchair-a.jpg?alt=media&token=302fd91d-a79f-45dd-8e6d-507741b3e7ef",
      hash: "LgMQ*L~q4.M{tRRjV@oeIooMnia{",
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
      quantity: 1,
      orderNo: "4157487",
      trackingNo: "TN3894013248",
      status: "Cancelled"),
  OrderCancelled_Model(
      id: "2",
      name: "Round Chair",
      like: "0",
      time: "17-Sep-2021, 12:00 am",
      rating: "3.0",
      image: "assets/furniture/furniture01/chair-b.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Fchair-b.jpg?alt=media&token=39e78a7f-13c9-4b3c-97bb-424580628507",
      hash: "LxPGEg%0oLxG%faeaeay*Jf+ayR+",
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
      quantity: 1,
      orderNo: "12991215",
      trackingNo: "TN123662136",
      status: "Cancelled"),
  OrderCancelled_Model(
      id: "3",
      name: "Yellow Chair",
      like: "1",
      time: "Delivered on 06 Sep",
      rating: "4.0",
      image: "assets/furniture/furniture01/chair-c.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Fchair-c.jpg?alt=media&token=4653726a-ab8d-4cf6-b34e-0d2494ef40b4",
      hash: "LKQch*Ne%\$I9?w-;M_RktlROMwo~",
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
      quantity: 1,
      orderNo: "4157487",
      trackingNo: "TN34587881443",
      status: "Cancelled"),
  OrderCancelled_Model(
      id: "4",
      name: "Bad Room Chair",
      like: "0",
      time: "25-Jun-2021, 10:00 PM",
      rating: "4.1",
      image: "assets/furniture/furniture01/chair-d.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Fchair-d.jpg?alt=media&token=617eb785-2708-494b-8b27-12a3c48025f9",
      hash: "LLN^Cd04D\$--HqEYNgxT~E%DIxZ~",
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
      quantity: 1,
      orderNo: "7683456722",
      trackingNo: "TN2131867994",
      status: "Cancelled"),

//
];
