import 'package:flutter/material.dart';

import 'ToyModel.dart';

enum HomeState { normal, cart }

class ToyController extends ChangeNotifier {
  HomeState homeState = HomeState.normal;

  List<ToyItem> cartlist = [];

   changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }

  void addToyToCart(ToyModel toy) {
    for (ToyItem item in cartlist) {
      if (item.item!.id == toy.id) {
        item.increment();
        notifyListeners();
        return;
      }
    }
    cartlist.add(ToyItem(item: toy));
    notifyListeners();
  }

  int totalCartItems() => cartlist.fold(
      0, (previousValue, element) => previousValue + element.qty);
}
