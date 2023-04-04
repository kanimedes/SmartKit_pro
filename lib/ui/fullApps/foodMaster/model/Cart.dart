import 'package:smartkit_pro/ui/fullApps/foodMaster/model/Item.dart';

class Cart {
  int? id;
  String? restaurantid;
  String? userid;
  String? itemid;
  String? useritemid;
  String? userresid;
  String? qty;
  String? variantid;
  String? extrasSelected;
  String? perprice;
  String? totalprice;
  String? extradesc;
  String? extraids;
  String? itemname;
  String? itemimage;
  String? itemprice;
  Item? item;
  double? extrasprice;
  List<Extras>? extraslist;

  Cart({
    this.id,
    this.restaurantid,
    this.userid,
    this.itemid,
    this.useritemid,
    this.userresid,
    this.qty,
    this.variantid,
    this.extrasSelected,
    this.perprice,
    this.totalprice,
    this.extradesc,
    this.extraids,
    this.itemname,
    this.itemimage,
    this.itemprice,
    this.item,
    this.extraslist,
    this.extrasprice,
  });
}
