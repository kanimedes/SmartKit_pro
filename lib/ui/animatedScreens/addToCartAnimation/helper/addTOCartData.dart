import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'AddToCartModel.dart';

class AddToCartData with ChangeNotifier {
  bool successDrop = false;
  AddToCartModel? acceptedData;
  Color acceptedColor = Colors.grey;
  double animationVal = 0.5;
  bool dragStart = false;

  List<AddToCartModel>? items = itemList1;

  Data() {
    successDrop;
    acceptedColor;
    items;
    dragStart;
  }

  bool get isSuccessDrop => successDrop;
  List<AddToCartModel>? get itemsList => items;
  AddToCartModel? get getAcceptedData => acceptedData;
  bool get isDragStart => dragStart;

  Color get getAcceptedColor => acceptedColor;

  set setSuccessDrop(bool status) {
    successDrop = status;
    notifyListeners();
  }

  changeAcceptedData(AddToCartModel data) {
    acceptedData = data;
    notifyListeners();
  }

  changeSuccessDrop(bool status) {
    setSuccessDrop = status;
  }

  set animationValue(double val) {
    animationVal = val;
    notifyListeners();
  }

  changeAnimationValue(double val) {
    animationValue = val;
  }

  set animatedDragStart(bool val) {
    dragStart = val;
    notifyListeners();
  }

  changeDragStart(bool val) {
    animatedDragStart = val;
  }
}
