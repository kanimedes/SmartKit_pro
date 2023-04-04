import 'package:smartkit_pro/ui/fullApps/furnitureHub/helper/ColorsRes.dart';
import 'package:smartkit_pro/ui/fullApps/furnitureHub/models/ColorModel.dart';

class SofaModel {
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

  SofaModel(
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

List<SofaModel> sofaList = [
  SofaModel(
      id: "1",
      name: "Living Room Sofa",
      like: "0",
      time: "2021 9eps Tv-PG",
      rating: "4.0",
      image: "assets/furniture/furniture01/sofa-a.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Fsofa-a.jpg?alt=media&token=2505eb2a-ad4b-4577-a3b0-ef20bca57a6c",
      hash: "LTP=oe.i02M*,6XgT2RoiK%0%eWo",
      price: "\$20.00",
      description:
          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ",
      colorList: [
        ColorModel(id: "1", name: "Purpal", color: ColorsRes.purpalColor),
        ColorModel(id: "2", name: "Equva", color: ColorsRes.equvaColor),
        ColorModel(id: "3", name: "Red", color: ColorsRes.darkredColor),
        ColorModel(
            id: "4", name: "Light Purpal", color: ColorsRes.lightpurpalColor),
        ColorModel(id: "5", name: "Cream", color: ColorsRes.lightcreamColor),
        ColorModel(id: "6", name: "Grey", color: ColorsRes.darkgreyColor),
      ],
      quantity: 1),
  SofaModel(
      id: "2",
      name: "Blue Sofa",
      like: "0",
      time: "2021 9eps Tv-PG",
      rating: "3.0",
      image: "assets/furniture/furniture01/sofa-b.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Fsofa-b.jpg?alt=media&token=c655cd19-2c66-4b1e-9d34-27aa6500d6d7",
      hash: "L;PQ51of-pay~qWVM|ayRPf6WBof",
      price: "\$23.00",
      description:
          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ",
      colorList: [
        ColorModel(id: "1", name: "Purpal", color: ColorsRes.purpalColor),
        ColorModel(id: "2", name: "Equva", color: ColorsRes.equvaColor),
        ColorModel(id: "3", name: "Red", color: ColorsRes.darkredColor),
        ColorModel(
            id: "4", name: "Light Purpal", color: ColorsRes.lightpurpalColor),
        ColorModel(id: "5", name: "Cream", color: ColorsRes.lightcreamColor),
        ColorModel(id: "6", name: "Grey", color: ColorsRes.darkgreyColor),
      ],
      quantity: 1),
  SofaModel(
      id: "3",
      name: "Moden Sofa",
      like: "1",
      time: "2021 9eps Tv-PG",
      rating: "4.0",
      image: "assets/furniture/furniture01/sofa-c.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furniture%2Ffurniture01%2Fsofa-c.jpg?alt=media&token=a2179148-98ed-49c4-b80b-82010ddf8732",
      hash: "LrLz{rtSjERk~qayRkR+-;a#RiRj",
      price: "\$20.00",
      description:
          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ",
      colorList: [
        ColorModel(id: "1", name: "Purpal", color: ColorsRes.purpalColor),
        ColorModel(id: "2", name: "Equva", color: ColorsRes.equvaColor),
        ColorModel(id: "3", name: "Red", color: ColorsRes.darkredColor),
        ColorModel(
            id: "4", name: "Light Purpal", color: ColorsRes.lightpurpalColor),
        ColorModel(id: "5", name: "Cream", color: ColorsRes.lightcreamColor),
        ColorModel(id: "6", name: "Grey", color: ColorsRes.darkgreyColor),
      ],
      quantity: 1),

//
];
