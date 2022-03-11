import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:shop_flutter/models/order_model/order.dart';

import '../cart_model/cart.dart';

class OrderList with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(Cart cart) {
    _items.insert(
      0,
      Order(
        orderId: Random().nextDouble().toString(),
        orderTotal: cart.totalAmount,
        products: cart.items.values.toList(),
        orderDate: DateTime.now(),
      ),
    );

    notifyListeners();
  }
}
