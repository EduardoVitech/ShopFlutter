import 'package:shop_flutter/models/cart_model/cart_item.dart';

class Order {
  final String orderId;
  final double orderTotal;
  final List<CartItem> products;
  final DateTime orderDate;

  Order({
    required this.orderId,
    required this.orderTotal,
    required this.products,
    required this.orderDate,
  });
}
