import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/catalog.dart';
// import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class CartModel extends ChangeNotifier {
  final List<Item> _itemIds = [];

  List<Item> get itemIds => _itemIds;
  late CatalogModel _catalogModel;

  // CatalogModel get catalog => _catalogModel;
  //
  // set catalog(CatalogModel newcatalog) {
  //   _catalogModel = newcatalog;
  //   notifyListeners();
  // }
  //
  // //List of items in the cart
  // List<Item> get items =>
  //     _itemIds.map((id) => catalog.getByPosition(id)).toList();

  //current total price
  int get totalPrice =>
      _itemIds.fold(0, (total, current) => total + current.price);

  void addItemInList(Item item) {
    _itemIds.add(item);
    notifyListeners();
  }

  void removeItemFromList(Item item) {
    _itemIds.remove(item);
    notifyListeners();
  }

  void clearList() {
    _itemIds.clear();
    notifyListeners();
  }
}
