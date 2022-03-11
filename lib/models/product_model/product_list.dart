import 'package:flutter/material.dart';
import 'package:shop_flutter/data/dummy_data.dart';
import 'package:shop_flutter/models/product_model/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];
  List<Product> get FavoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}


//bool _showFavoriteOnly = false;

//  List<Product> get items {
//    if (_showFavoriteOnly) {
//      return _items.where((prod) => prod.isFavorite).toList();
//    }
//    return [..._items];
//  }
//
//  void showFavoriteOnly() {
//    _showFavoriteOnly = true;
//    notifyListeners();
//  }
//
//  void showAll() {
//    _showFavoriteOnly = false;
//    notifyListeners();
//  }