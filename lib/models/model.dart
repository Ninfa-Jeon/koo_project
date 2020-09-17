import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class CartModel extends Model {
  List _items = [];
  List get items => _items;
  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }

  static CartModel of(BuildContext context) =>
      ScopedModel.of<CartModel>(context);
}
