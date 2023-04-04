import 'package:flutter/material.dart';

class AddToCartModel {
  final int? id;
  final String? name;
  final String? subTitle;
  final String? assetName;
  final String? price;
  const AddToCartModel(
      {Key? key,
      this.name,
      this.subTitle,
      this.assetName,
      this.id,
      this.price});
}

List<AddToCartModel> itemList1 = [
  AddToCartModel(
      subTitle: "Fresh Hot Rabadi Nodules with tomato sauce",
      assetName: "1.jpg",
      name: "Hot Rabadi Nodules",
      price: "\$ 10.00"),
  AddToCartModel(
      subTitle: "Small Chili Town with sauce",
      assetName: "2.jpg",
      name: "Small Chili Town",
      price: "\$ 30.00"),
  AddToCartModel(
      subTitle: "Spye Chili Nodules with sauce",
      assetName: "3.jpg",
      name: "Spye Chili Nodules",
      price: "\$ 40.00"),
  AddToCartModel(
      subTitle: "Sweet Butter Bread with sauce",
      assetName: "4.jpg",
      name: "Sweet Butter Bread",
      price: "\$ 15.00"),
  AddToCartModel(
      subTitle: "Veg Tomato Nodules with sauce",
      assetName: "5.jpg",
      name: "Veg Tomato Nodules",
      price: "\$ 45.00"),
];
//second list for if list is empty then reload list
List<AddToCartModel> itemList2 = [
  AddToCartModel(
      subTitle: "Fresh Hot Rabadi Nodules with tomato sauce",
      assetName: "1.jpg",
      name: "Hot Rabadi Nodules",
      price: "\$ 10.00"),
  AddToCartModel(
      subTitle: "Small Chili Town with sauce",
      assetName: "2.jpg",
      name: "Small Chili Town",
      price: "\$ 30.00"),
  AddToCartModel(
      subTitle: "Spye Chili Nodules with sauce",
      assetName: "3.jpg",
      name: "Spye Chili Nodules",
      price: "\$ 40.00"),
  AddToCartModel(
      subTitle: "Sweet Butter Bread with sauce",
      assetName: "4.jpg",
      name: "Sweet Butter Bread",
      price: "\$ 15.00"),
  AddToCartModel(
      subTitle: "Veg Tomato Nodules with sauce",
      assetName: "5.jpg",
      name: "Veg Tomato Nodules",
      price: "\$ 45.00"),
];
