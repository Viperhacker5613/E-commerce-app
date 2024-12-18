import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: "Product1",
      price: 99.9,
      description: "Item description",
    ),
    Product(
      name: "Product2",
      price: 99.9,
      description: "Item description",
    ),
    Product(
      name: "Product3",
      price: 99.9,
      description: "Item description",
    ),
    Product(
      name: "Product4",
      price: 99.9,
      description: "Item description",
    )
  ];
  List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addtocard(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removefromcart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
