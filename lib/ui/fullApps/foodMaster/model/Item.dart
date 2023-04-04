class Item {
  int? id;
  String? name;
  String? description;
  String? image;
  double? price;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  int? available;
  int? hasVariants;
  int? vat;
  String? deletedAt;
  String? logom;
  String? icon;
  String? shortDescription;
  List<Variants>? variants;
  String? categoryName;
  List<Extras>? extras;
  List<Options>? options;
  int? restaurantid;
  OrderPivot? orderPivot;
  String? deliveryTime;
  String? blurUrl;
  String? localimg;
  String? rating;
  int? views;

  Item(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.price,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.available,
      this.hasVariants,
      this.vat,
      this.deletedAt,
      this.logom,
      this.icon,
      this.shortDescription,
      this.variants,
      this.categoryName,
      this.extras,
      this.options,
      this.restaurantid,
      this.orderPivot,
      this.deliveryTime,
      this.localimg,
      this.blurUrl,
      this.rating,
      this.views});
}

class Variants {
  int? id;
  double? price;
  String? options;
  String? image;
  int? qty;
  int? enableQty;
  int? order;
  int? itemId;
  String? createdAt;
  String? updatedAt;
  void deletedAt;
  List<Extras>? extras;

  Variants(
      {this.id,
      this.price,
      this.options,
      this.image,
      this.qty,
      this.enableQty,
      this.order,
      this.itemId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.extras});
}

class Extras {
  int? id;
  int? itemId;
  String? price;
  String? name;
  String? createdAt;
  String? updatedAt;
  void deletedAt;
  int? extraForAllVariants;
  Pivot? pivot;
  int? qty;

  Extras(
      {this.id,
      this.itemId,
      this.price,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.extraForAllVariants,
      this.pivot,
      this.qty});
}

List<Extras> extrasforall = [
  Extras(
      id: 1,
      itemId: 1,
      price: "1.19",
      name: "Extra cheese",
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      deletedAt: null,
      extraForAllVariants: 1,
      qty: 5),
  Extras(
      id: 2,
      itemId: 2,
      price: "2.199",
      name: "Extra Ketchup",
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      deletedAt: null,
      extraForAllVariants: 1,
      qty: 5),
  Extras(
      id: 3,
      itemId: 3,
      price: "5.199",
      name: "Extra Sauce",
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      deletedAt: null,
      extraForAllVariants: 1,
      qty: 5)
];
List<Extras> displayextraslist = [
  Extras(
      id: 1,
      itemId: 1,
      price: "1",
      name: "Extra cheese",
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      deletedAt: null,
      extraForAllVariants: 1,
      qty: 5),
  Extras(
      id: 2,
      itemId: 2,
      price: "2.19",
      name: "Extra Ketchup",
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      deletedAt: null,
      extraForAllVariants: 1,
      qty: 5),
  Extras(
      id: 3,
      itemId: 3,
      price: "5.19",
      name: "Extra Sauce",
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      deletedAt: null,
      extraForAllVariants: 1,
      qty: 5),
  Extras(
      id: 4,
      itemId: 4,
      price: "3.19",
      name: "Extra Cold Drinks",
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      deletedAt: null,
      extraForAllVariants: 1,
      qty: 5),
  Extras(
      id: 5,
      itemId: 5,
      price: "7.19",
      name: "Extra Drink",
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      deletedAt: null,
      extraForAllVariants: 1,
      qty: 5),
  Extras(
      id: 6,
      itemId: 6,
      price: "6.1",
      name: "Extra salad",
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      deletedAt: null,
      extraForAllVariants: 1,
      qty: 5)
];

class Pivot {
  int? variantId;
  int? extraId;

  Pivot({this.variantId, this.extraId});
}

class Options {
  int? id;
  int? itemId;
  String? name;
  String? options;
  String? createdAt;
  String? updatedAt;
  void deletedAt;

  Options(
      {this.id,
      this.itemId,
      this.name,
      this.options,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});
}

class OrderPivot {
  int? orderId;
  int? itemId;
  int? qty;
  String? extras;
  int? vat;
  double? vatvalue;
  double? variantPrice;
  String? variantName;

  OrderPivot(
      {this.orderId,
      this.itemId,
      this.qty,
      this.extras,
      this.vat,
      this.vatvalue,
      this.variantPrice,
      this.variantName});
}

List<Item> itemlist = [
  Item(
      id: 1,
      name: "Burrito with chicken",
      description: "chicken on a plate,totilla cake",
      localimg: "assets/images/fullApps/foodMaster/Detail_1.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_1.jpg?alt=media&token=0bafc4f2-9989-4b81-b38f-a82d8072bc9b",
      price: 50,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_1.jpg?alt=media&token=0bafc4f2-9989-4b81-b38f-a82d8072bc9b",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_1.jpg?alt=media&token=0bafc4f2-9989-4b81-b38f-a82d8072bc9b",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "1.19",
            name: "Extra cheese",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "45 Min",
      rating: "0",
      views: 1,
      blurUrl: "LRN+d}E1LNrq^gRPNIV[0%#;z;oN"),
  Item(
      id: 1,
      name: "Burrito Veggie",
      description: "peeled tomatoes, mozzarella salad, Genovese pesto",
      localimg: "assets/images/fullApps/foodMaster/Detail_6.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_6.jpg?alt=media&token=5d6d6c3f-682d-47dd-80fd-8b40e3efa4da",
      price: 60,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_6.jpg?alt=media&token=5d6d6c3f-682d-47dd-80fd-8b40e3efa4da",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_6.jpg?alt=media&token=5d6d6c3f-682d-47dd-80fd-8b40e3efa4da",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "2.19",
            name: "Extra Ketchup",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "20 Min",
      rating: "0",
      views: 1,
      blurUrl: "L5EB{D_20o01Vx9b03s800RQ9F~U"),
  Item(
      id: 1,
      name: "Burrito with beef roast",
      description: "veal or minced meat(specify),tortilla...",
      localimg: "assets/images/fullApps/foodMaster/Detail_16.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_16.jpg?alt=media&token=1829aad0-ea47-40e4-80f9-5bc3b001de13",
      price: 70,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_16.jpg?alt=media&token=1829aad0-ea47-40e4-80f9-5bc3b001de13",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_16.jpg?alt=media&token=1829aad0-ea47-40e4-80f9-5bc3b001de13",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "3.19",
            name: "Extra Sauce",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "55 Min",
      rating: "0",
      views: 1,
      blurUrl: "LOLzQ#^*ktyE}@bcXTIUWKE2IAa0"),
  Item(
      id: 2,
      name: "Homemade Potatoes with Cheddar and Jalapenos (300g)",
      description: "Cheddar cheese, butter, russet...",
      localimg: "assets/images/fullApps/foodMaster/Detail_29.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_29.jpg?alt=media&token=4c6293a9-0fb9-43c5-b437-79e4b7d81f86",
      price: 80,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_29.jpg?alt=media&token=4c6293a9-0fb9-43c5-b437-79e4b7d81f86",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_29.jpg?alt=media&token=4c6293a9-0fb9-43c5-b437-79e4b7d81f86",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "2.2",
            name: "Extra Ketchup",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "35 Min",
      rating: "0",
      views: 1,
      blurUrl: "LMD+xX#RDSVa~prXMzi|58M_yAXl"),
  Item(
      id: 2,
      name: "Homemade Potatoes with Ranch Sauce (300g)",
      description: "Sour cream, ranch dressing, bacon,...",
      localimg: "assets/images/fullApps/foodMaster/Detail_19.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_19.jpg?alt=media&token=35116d32-7043-44e4-9ca8-5cf5178ba842",
      price: 90,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_19.jpg?alt=media&token=35116d32-7043-44e4-9ca8-5cf5178ba842",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_19.jpg?alt=media&token=35116d32-7043-44e4-9ca8-5cf5178ba842",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "1",
            name: "Extra Sauce",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "55 Min",
      rating: "0",
      views: 1,
      blurUrl: "LKJ6sCv*J7X9~TV]X4fl0MafX7Rk"),
  Item(
      id: 2,
      name: "Cheddar Sticks (250g)",
      description: "String cheese, bread crumbs, smoked...",
      localimg: "assets/images/fullApps/foodMaster/Detail_2.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_2.jpg?alt=media&token=f83c3e5a-0e9c-49e2-a423-6cca71a4d373",
      price: 40,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_2.jpg?alt=media&token=f83c3e5a-0e9c-49e2-a423-6cca71a4d373",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_2.jpg?alt=media&token=f83c3e5a-0e9c-49e2-a423-6cca71a4d373",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "5",
            name: "Extra Cold Drinks",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "15 Min",
      rating: "0",
      views: 1,
      blurUrl: "LNNlYwS^yZEg.PD\$X9I.0NITnLs*"),
  Item(
      id: 3,
      name: "Chicken Taco (250g)",
      description: "chicken on a plate,totilla cake",
      localimg: "assets/images/fullApps/foodMaster/Detail_25.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_25.jpg?alt=media&token=9c65ab73-d8d2-4d4b-b6e2-b9d7f6421ac7",
      price: 3.49,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_25.jpg?alt=media&token=9c65ab73-d8d2-4d4b-b6e2-b9d7f6421ac7",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_25.jpg?alt=media&token=9c65ab73-d8d2-4d4b-b6e2-b9d7f6421ac7",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "1.65",
            name: "Extra Sauce",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "45 Min",
      rating: "0",
      views: 1,
      blurUrl: "LCEV=?D#~qtKxs%0Rjx@00_3M^xt"),
  Item(
      id: 3,
      name: "Taco with beef roasted meat (250g)",
      description: "peeled tomatoes, mozzarella salad, Genovese pesto",
      localimg: "assets/images/fullApps/foodMaster/Detail_5.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_5.jpg?alt=media&token=f7a971b4-f8d4-441e-9f43-7df80f802d90",
      price: 3.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_5.jpg?alt=media&token=f7a971b4-f8d4-441e-9f43-7df80f802d90",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_5.jpg?alt=media&token=f7a971b4-f8d4-441e-9f43-7df80f802d90",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "1.85",
            name: "Extra Cold Drinks",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "35 Min",
      rating: "0",
      views: 1,
      blurUrl: "L3BxcW^N04OEK5\$iNGI@040\$}p^O"),
  Item(
      id: 3,
      name: " Pork Taco (250g)",
      description: "v16cm tortilla cake, pork roast,...",
      localimg: "assets/images/fullApps/foodMaster/Detail_20.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_20.jpg?alt=media&token=37fe0da5-7ecf-40b5-abb1-52fdd8a0f0ac",
      price: 3.49,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_20.jpg?alt=media&token=37fe0da5-7ecf-40b5-abb1-52fdd8a0f0ac",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_20.jpg?alt=media&token=37fe0da5-7ecf-40b5-abb1-52fdd8a0f0ac",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "1.22",
            name: "Extra Drink",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "15 Min",
      rating: "0",
      views: 1,
      blurUrl: "LTH]~_575SW=}sI;R+WW5Ss,xZod"),
  Item(
      id: 4,
      name: "Mozzarella Pizza",
      description: "tomato sauce, mozzarella sabelli,...",
      localimg: "assets/images/fullApps/foodMaster/Detail_12.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_12.jpg?alt=media&token=33d2ea0c-9760-43b3-92ae-6a24e9623820",
      price: 10.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_12.jpg?alt=media&token=33d2ea0c-9760-43b3-92ae-6a24e9623820",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_12.jpg?alt=media&token=33d2ea0c-9760-43b3-92ae-6a24e9623820",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "1.88",
            name: "Extra  Cold Drinks",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "10 Min",
      rating: "0",
      views: 1,
      blurUrl: "L8DuJ80M0;\$^03?G+[NK04-U}lNK"),
  Item(
      id: 4,
      name: " Prosciutto crust pizza",
      description: "tomato sauce, mozzarella sabelli,...",
      localimg: "assets/images/fullApps/foodMaster/Detail_4.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_4.jpg?alt=media&token=89144de7-cbdb-4cae-a065-95c96774e941",
      price: 14.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_4.jpg?alt=media&token=89144de7-cbdb-4cae-a065-95c96774e941",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_4.jpg?alt=media&token=89144de7-cbdb-4cae-a065-95c96774e941",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "7.19",
            name: "Extra  cheese",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "25 Min",
      rating: "0",
      views: 1,
      blurUrl: "LHH^zp~k0hjF0N-CRjI@wgVu%1jE"),
  Item(
      id: 4,
      name: " Pepperoni Pizza",
      description: "tomato sauce, mozzarella Sabelli,...",
      localimg: "assets/images/fullApps/foodMaster/Detail_22.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_22.jpg?alt=media&token=93913843-fa7c-48fd-94a5-b9607cb25e37",
      price: 14.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_22.jpg?alt=media&token=93913843-fa7c-48fd-94a5-b9607cb25e37",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_22.jpg?alt=media&token=93913843-fa7c-48fd-94a5-b9607cb25e37",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "9.19",
            name: "Extra Drink",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "20 Min",
      rating: "0",
      views: 1,
      blurUrl: "LCHUOV.m0EeE0Jjo={RU0VMyv|s%"),
  Item(
      id: 5,
      name: "Mozzarella Pizza",
      description: "tomato sauce, mozzarella sabelli,...",
      localimg: "assets/images/fullApps/foodMaster/Detail_23.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_23.jpg?alt=media&token=59d32281-31cb-438f-bb62-f4d6d8614a48",
      price: 10.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_23.jpg?alt=media&token=59d32281-31cb-438f-bb62-f4d6d8614a48",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_23.jpg?alt=media&token=59d32281-31cb-438f-bb62-f4d6d8614a48",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "5.19",
            name: "Extra Drink",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "45 Min",
      rating: "0",
      views: 1,
      blurUrl: "LHE2,=Vs0epI~WRQE2tR9Gxua0M{"),
  Item(
      id: 5,
      name: " Prosciutto crust pizza",
      description: "tomato sauce, mozzarella sabelli,...",
      localimg: "assets/images/fullApps/foodMaster/Detail_15.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_15.jpg?alt=media&token=f6e435bd-511b-42cf-a0cb-a06f163dc2e2",
      price: 14.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_15.jpg?alt=media&token=f6e435bd-511b-42cf-a0cb-a06f163dc2e2",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_15.jpg?alt=media&token=f6e435bd-511b-42cf-a0cb-a06f163dc2e2",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "8.89",
            name: "Extra Drink",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "35 Min",
      rating: "0",
      views: 1,
      blurUrl: "LDExhG\$_02R%oJ%1SdNH01xa~AIp"),
  Item(
      id: 5,
      name: " Pepperoni Pizza",
      description: "tomato sauce, mozzarella Sabelli,...",
      localimg: "assets/images/fullApps/foodMaster/Detail_18.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_18.jpg?alt=media&token=063ce605-7d2b-4bae-8260-9d11c07b34a7",
      price: 14.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_18.jpg?alt=media&token=063ce605-7d2b-4bae-8260-9d11c07b34a7",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_18.jpg?alt=media&token=063ce605-7d2b-4bae-8260-9d11c07b34a7",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "6.10",
            name: "Extra Drink",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "50 Min",
      rating: "0",
      views: 1,
      blurUrl: "LCLe}p4=0PEQCQ,:9wS#03~8EyFu"),
  Item(
      id: 6,
      name: "Homemade french fries with ranch sauce (150g)",
      description: "French fries, homemade ranch dressing,...",
      localimg: "assets/images/fullApps/foodMaster/Detail_26.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_26.jpg?alt=media&token=416eb80f-ec02-4780-ab05-e94a55079f34",
      price: 2.98,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_26.jpg?alt=media&token=416eb80f-ec02-4780-ab05-e94a55079f34",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_26.jpg?alt=media&token=416eb80f-ec02-4780-ab05-e94a55079f34",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "5.19",
            name: "Extra salad",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "40 Min",
      rating: "0",
      views: 1,
      blurUrl: "LAH_V+4;1B~W00x]xoM|05xu}kE1"),
  Item(
      id: 6,
      name: " Homemade french fries with cheddar and jalapenos (190g)",
      description: "tOlive oil, cheddar, green mix",
      localimg: "assets/images/fullApps/foodMaster/Detail_8.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_8.jpg?alt=media&token=67120fb2-a432-4ba6-b16d-e2755ebdd1ca",
      price: 3.96,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_8.jpg?alt=media&token=67120fb2-a432-4ba6-b16d-e2755ebdd1ca",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_8.jpg?alt=media&token=67120fb2-a432-4ba6-b16d-e2755ebdd1ca",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "8.16",
            name: "Extra cheese",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "55 Min",
      rating: "0",
      views: 1,
      blurUrl: "LBF#EaEM5s%1}?I@EMjZ05s:-7j="),
  Item(
      id: 6,
      name: " Homemade french fries (100g)",
      description: "100g",
      localimg: "assets/images/fullApps/foodMaster/Detail_13.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_13.jpg?alt=media&token=86d7506e-266d-428d-87a7-aac3fa788214",
      price: 1.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_13.jpg?alt=media&token=86d7506e-266d-428d-87a7-aac3fa788214",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_13.jpg?alt=media&token=86d7506e-266d-428d-87a7-aac3fa788214",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "3.15",
            name: "Extra Sauce",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "10 Min",
      rating: "0",
      views: 1,
      blurUrl: "LXPF}+?byExY~WMxbwM|Tz%NadRj"),
  Item(
      id: 7,
      name: "Burrito with chicken",
      description: "chicken on a plate,totilla cake",
      localimg: "assets/images/fullApps/foodMaster/Detail_3.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_3.jpg?alt=media&token=26f47478-19ba-4179-b6ed-a74c422449ec",
      price: 50,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_3.jpg?alt=media&token=26f47478-19ba-4179-b6ed-a74c422449ec",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_3.jpg?alt=media&token=26f47478-19ba-4179-b6ed-a74c422449ec",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "5.69",
            name: "Extra cheese",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "50 Min",
      rating: "0",
      views: 1,
      blurUrl: "LlOMy\$%gTeV@xuRiofWB.TM{Z\$bb"),
  Item(
      id: 7,
      name: "Burrito Veggie",
      description: "peeled tomatoes, mozzarella salad, Genovese pesto",
      localimg: "assets/images/fullApps/foodMaster/Detail_24.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_24.jpg?alt=media&token=7616db3f-4e77-416f-9206-f0c31386dd1b",
      price: 50,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_24.jpg?alt=media&token=7616db3f-4e77-416f-9206-f0c31386dd1b",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_24.jpg?alt=media&token=7616db3f-4e77-416f-9206-f0c31386dd1b",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "8.59",
            name: " Extra Ketchup",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "25 Min",
      rating: "0",
      views: 1,
      blurUrl: "LGLpv.tk.AOa,ksQxws;#7EkMHn2"),
  Item(
      id: 7,
      name: "Burrito with beef roast",
      description: "veal or minced meat(specify),tortilla...",
      localimg: "assets/images/fullApps/foodMaster/Detail_27.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_27.jpg?alt=media&token=beb7fe5b-6bc2-4d3a-892d-0b660528da76",
      price: 50,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_27.jpg?alt=media&token=beb7fe5b-6bc2-4d3a-892d-0b660528da76",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_27.jpg?alt=media&token=beb7fe5b-6bc2-4d3a-892d-0b660528da76",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "3.79",
            name: "Extra Cold Drinks",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "45 Min",
      rating: "0",
      views: 1,
      blurUrl: "L4D8:x0\$00pb2]v#vgu305xA}8}a"),
  Item(
      id: 8,
      name: "Spaghetti Carbonara (450g)",
      description: "fresh pasta, cream (animal), onion,..",
      localimg: "assets/images/fullApps/foodMaster/Detail_7.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_7.jpg?alt=media&token=ab1b724a-b56f-4724-8ee4-0ebe7be07e3b",
      price: 11.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_7.jpg?alt=media&token=ab1b724a-b56f-4724-8ee4-0ebe7be07e3b",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_7.jpg?alt=media&token=ab1b724a-b56f-4724-8ee4-0ebe7be07e3b",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "2.15",
            name: "Extra  Cold Drinks",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "30 Min",
      rating: "0",
      views: 1,
      blurUrl: "LLMj2N%%F}i]-WI.V@xDK*Vrivt8"),
  Item(
      id: 8,
      name: "Spaghetti Formaggi (450g)",
      description: " fresh pasta, cream (animal), blue...",
      localimg: "assets/images/fullApps/foodMaster/Detail_17.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_17.jpg?alt=media&token=d6b19de1-d49f-4c22-b18b-6724e30c89cc",
      price: 11.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_17.jpg?alt=media&token=d6b19de1-d49f-4c22-b18b-6724e30c89cc",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_17.jpg?alt=media&token=d6b19de1-d49f-4c22-b18b-6724e30c89cc",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "7.11",
            name: "Extra  cheese",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "40 Min",
      rating: "0",
      views: 1,
      blurUrl: "L5JjYaUA00000000K+020KXA%f~V"),
  Item(
      id: 8,
      name: "Tagliatelle with mushrooms (400g)",
      description: "fresh pasta, cream (animal), mushrooms,...",
      localimg: "assets/images/fullApps/foodMaster/Detail_9.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_9.jpg?alt=media&token=d720a9f9-ecb9-494b-8d27-8beb5291cb31",
      price: 11.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_9.jpg?alt=media&token=d720a9f9-ecb9-494b-8d27-8beb5291cb31",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_9.jpg?alt=media&token=d720a9f9-ecb9-494b-8d27-8beb5291cb31",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "5.59",
            name: "Drink",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "30 Min",
      rating: "0",
      views: 1,
      blurUrl: "LJPieSoh.Ts:e+DNVWk9D*xuMwx^"),
  Item(
      id: 8,
      name: "Tagliatelle with mushrooms (400g)",
      description: "fresh pasta, cream (animal), mushrooms,...",
      localimg: "assets/images/fullApps/foodMaster/Detail_10.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_10.jpg?alt=media&token=f2c8a87b-d375-4001-993c-5fc7ed1b7fda",
      price: 11.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_10.jpg?alt=media&token=f2c8a87b-d375-4001-993c-5fc7ed1b7fda",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_10.jpg?alt=media&token=f2c8a87b-d375-4001-993c-5fc7ed1b7fda",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "5.59",
            name: "Drink",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "30 Min",
      rating: "0",
      views: 1,
      blurUrl: "LEFEJo5W0U}qEfw]\$iR+0i%0=tNI"),
  Item(
      id: 8,
      name: "Tagliatelle with mushrooms (400g)",
      description: "fresh pasta, cream (animal), mushrooms,...",
      localimg: "assets/images/fullApps/foodMaster/Detail_11.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_11.jpg?alt=media&token=2c71e3b6-c38a-46c4-b3e7-458543e4f936",
      price: 11.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_11.jpg?alt=media&token=2c71e3b6-c38a-46c4-b3e7-458543e4f936",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_11.jpg?alt=media&token=2c71e3b6-c38a-46c4-b3e7-458543e4f936",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "5.59",
            name: "Drink",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "30 Min",
      rating: "0",
      views: 1,
      blurUrl: "LTKvgC-:%#S\$~BRkNHaf?uW==wxF"),
  Item(
      id: 8,
      name: "Tagliatelle with mushrooms (400g)",
      description: "fresh pasta, cream (animal), mushrooms,...",
      localimg: "assets/images/fullApps/foodMaster/Detail_14.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_14.jpg?alt=media&token=02b52a8b-756a-451e-a5aa-46f8129c93a4",
      price: 11.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_14.jpg?alt=media&token=02b52a8b-756a-451e-a5aa-46f8129c93a4",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_14.jpg?alt=media&token=02b52a8b-756a-451e-a5aa-46f8129c93a4",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "5.59",
            name: "Drink",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "30 Min",
      rating: "0",
      views: 1,
      blurUrl: "LHF;i+n,02Se~Bs:E1of0M\$%^Pa{"),
  Item(
      id: 8,
      name: "Tagliatelle with mushrooms (400g)",
      description: "fresh pasta, cream (animal), mushrooms,...",
      localimg: "assets/images/fullApps/foodMaster/Detail_21.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_21.jpg?alt=media&token=b858b7ba-6a6a-4433-80b2-67aad1d10501",
      price: 11.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_21.jpg?alt=media&token=b858b7ba-6a6a-4433-80b2-67aad1d10501",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_21.jpg?alt=media&token=b858b7ba-6a6a-4433-80b2-67aad1d10501",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "5.59",
            name: "Drink",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "30 Min",
      rating: "0",
      views: 1,
      blurUrl: "L6G@}E5Y0DI[0qxFQ-rp00-3}%M}"),
  Item(
      id: 8,
      name: "Tagliatelle with mushrooms (400g)",
      description: "fresh pasta, cream (animal), mushrooms,...",
      localimg: "assets/images/fullApps/foodMaster/Detail_28.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_28.jpg?alt=media&token=816dafb6-45c8-4cf5-b9ea-2a52a9636f96",
      price: 11.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_28.jpg?alt=media&token=816dafb6-45c8-4cf5-b9ea-2a52a9636f96",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_28.jpg?alt=media&token=816dafb6-45c8-4cf5-b9ea-2a52a9636f96",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "5.59",
            name: "Drink",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "30 Min",
      rating: "0",
      views: 1,
      blurUrl: "LKKc|Rxb0Mo|?w%1McI;K8%Miu\$f"),
  Item(
      id: 8,
      name: "Tagliatelle with mushrooms (400g)",
      description: "fresh pasta, cream (animal), mushrooms,...",
      localimg: "assets/images/fullApps/foodMaster/Detail_30.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_30.jpg?alt=media&token=27026cfd-d89a-4465-af04-d924d7e0c307",
      price: 11.99,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_30.jpg?alt=media&token=27026cfd-d89a-4465-af04-d924d7e0c307",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_30.jpg?alt=media&token=27026cfd-d89a-4465-af04-d924d7e0c307",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "5.59",
            name: "Drink",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "30 Min",
      rating: "0",
      views: 1,
      blurUrl: "L9Hw**010@~LZMtI0hM-0q^Qzp0-"),
];
List<Item> allitemlist = [
  Item(
      id: 1,
      name: "Salads",
      description: "v",
      localimg: "assets/images/fullApps/foodMaster/Detail_1.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_1.jpg?alt=media&token=0bafc4f2-9989-4b81-b38f-a82d8072bc9b",
      price: 50,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_1.jpg?alt=media&token=0bafc4f2-9989-4b81-b38f-a82d8072bc9b",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_1.jpg?alt=media&token=0bafc4f2-9989-4b81-b38f-a82d8072bc9b",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "1.19",
            name: "Extra cheese",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "40 Min",
      rating: "0",
      views: 1,
      blurUrl: "LRN+d}E1LNrq^gRPNIV[0%#;z;oN"),
  Item(
      id: 2,
      name: "Pizza",
      description:
          "peeled tomatoes, mozzarella salad, Genovese pest tortilla tortilla 16cm, veal minced...o",
      localimg: "assets/images/fullApps/foodMaster/Detail_19.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_19.jpg?alt=media&token=35116d32-7043-44e4-9ca8-5cf5178ba842",
      price: 50,
      categoryId: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_19.jpg?alt=media&token=35116d32-7043-44e4-9ca8-5cf5178ba842",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_19.jpg?alt=media&token=35116d32-7043-44e4-9ca8-5cf5178ba842",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "2.22",
            name: "Extra Ketchup",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "55 Min",
      rating: "0",
      views: 1,
      blurUrl: "LKJ6sCv*J7X9~TV]X4fl0MafX7Rk"),
  Item(
      id: 3,
      name: "Fresh Pasta and Risotto",
      description: "veal or minced meat(specify),tortilla...",
      localimg: "assets/images/fullApps/foodMaster/Detail_11.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_11.jpg?alt=media&token=2c71e3b6-c38a-46c4-b3e7-458543e4f936",
      price: 70,
      categoryId: 2,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_11.jpg?alt=media&token=2c71e3b6-c38a-46c4-b3e7-458543e4f936",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_11.jpg?alt=media&token=2c71e3b6-c38a-46c4-b3e7-458543e4f936",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "3.33",
            name: "Extra Sauce",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "45 Min",
      rating: "0",
      views: 1,
      blurUrl: "LTKvgC-:%#S\$~BRkNHaf?uW==wxF"),
  Item(
      id: 4,
      name: "Burrito with chicken",
      description: "chicken on a plate,totilla cake",
      localimg: "assets/images/fullApps/foodMaster/Detail_23.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_23.jpg?alt=media&token=59d32281-31cb-438f-bb62-f4d6d8614a48",
      price: 80,
      categoryId: 2,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_23.jpg?alt=media&token=59d32281-31cb-438f-bb62-f4d6d8614a48",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_23.jpg?alt=media&token=59d32281-31cb-438f-bb62-f4d6d8614a48",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "4.44",
            name: "Extra  Cold Drinks",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "50 Min",
      rating: "0",
      views: 1,
      blurUrl: "LHE2,=Vs0epI~WRQE2tR9Gxua0M{"),
  Item(
      id: 5,
      name: "Burrito Veggie",
      description: "peeled tomatoes, mozzarella salad, Genovese pesto",
      localimg: "assets/images/fullApps/foodMaster/Detail_6.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_6.jpg?alt=media&token=5d6d6c3f-682d-47dd-80fd-8b40e3efa4da",
      price: 90,
      categoryId: 3,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_6.jpg?alt=media&token=5d6d6c3f-682d-47dd-80fd-8b40e3efa4da",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_6.jpg?alt=media&token=5d6d6c3f-682d-47dd-80fd-8b40e3efa4da",
      shortDescription: "peeled tomatoes, mozzarella salad,...",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "5.55",
            name: "Extra Drink",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "40 Min",
      rating: "0",
      views: 1,
      blurUrl: "L5EB{D_20o01Vx9b03s800RQ9F~U"),
  Item(
      id: 6,
      name: "Burrito with beef roast",
      description: "veal or minced meat(specify),tortilla...",
      localimg: "assets/images/fullApps/foodMaster/Detail_15.jpg",
      image:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_15.jpg?alt=media&token=f6e435bd-511b-42cf-a0cb-a06f163dc2e2",
      price: 30,
      categoryId: 4,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-03-04T08:02:48.000000Z",
      available: 1,
      hasVariants: 0,
      vat: 21,
      deletedAt: null,
      logom:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_15.jpg?alt=media&token=f6e435bd-511b-42cf-a0cb-a06f163dc2e2",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/foodmaster%2FDetail_15.jpg?alt=media&token=f6e435bd-511b-42cf-a0cb-a06f163dc2e2",
      variants: [],
      categoryName: "Salads",
      extras: [
        Extras(
            id: 1,
            itemId: 1,
            price: "6.66",
            name: "Extra salad",
            createdAt: "2021-02-18T10:09:05.000000Z",
            updatedAt: "2021-02-18T10:09:05.000000Z",
            deletedAt: null,
            extraForAllVariants: 1,
            qty: 5)
      ],
      deliveryTime: "45 Min",
      rating: "0",
      views: 1,
      blurUrl: "LDExhG\$_02R%oJ%1SdNH01xa~AIp"),
  /* Item(id:1,name:"Salads",description:"v",image:"https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82",price:50,categoryId:4,createdAt:"2021-02-18T10:09:05.000000Z",updatedAt:"2021-03-04T08:02:48.000000Z",available:1,hasVariants:0,vat:21,deletedAt:null,logom:"assets/images/fullApps/foodMaster/Detail_1.jpg",icon:"https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82_thumbnail.jpg",shortDescription:"peeled tomatoes, mozzarella salad,...",variants:[],categoryName:"Salads",extras:[Extras(id:1,itemId:1,price:"7.77",name:"Extra cheese",createdAt:"2021-02-18T10:09:05.000000Z",updatedAt:"2021-02-18T10:09:05.000000Z",deletedAt:null,extraForAllVariants:1)]),
     Item(id:2,name:"Pizza",description:"peeled tomatoes, mozzarella salad, Genovese pest tortilla tortilla 16cm, veal minced...o",image:"https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82",price:50,categoryId:4,createdAt:"2021-02-18T10:09:05.000000Z",updatedAt:"2021-03-04T08:02:48.000000Z",available:1,hasVariants:0,vat:21,deletedAt:null,logom:"assets/images/fullApps/foodMaster/Detail_2.jpg",icon:"https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82_thumbnail.jpg",shortDescription:"peeled tomatoes, mozzarella salad,...",variants:[],categoryName:"Salads",extras:[Extras(id:1,itemId:1,price:"8.88",name:"Extra cheese",createdAt:"2021-02-18T10:09:05.000000Z",updatedAt:"2021-02-18T10:09:05.000000Z",deletedAt:null,extraForAllVariants:1)]),
     Item(id:3,name:"Fresh Pasta and Risotto",description:"veal or minced meat(specify),tortilla...",image:"https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82",price:30,categoryId:5,createdAt:"2021-02-18T10:09:05.000000Z",updatedAt:"2021-03-04T08:02:48.000000Z",available:1,hasVariants:0,vat:21,deletedAt:null,logom:"assets/images/fullApps/foodMaster/Detail_3.jpg",icon:"https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82_thumbnail.jpg",shortDescription:"peeled tomatoes, mozzarella salad,...",variants:[],categoryName:"Salads",extras:[Extras(id:1,itemId:1,price:"9.99",name:"Extra cheese",createdAt:"2021-02-18T10:09:05.000000Z",updatedAt:"2021-02-18T10:09:05.000000Z",deletedAt:null,extraForAllVariants:1)]),
*/
];
