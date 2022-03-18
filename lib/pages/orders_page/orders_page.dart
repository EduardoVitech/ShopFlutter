import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/components/app_drawer/app_drawer.dart';
import 'package:shop_flutter/components/order_widget/order_widget.dart';
import 'package:shop_flutter/models/order_model/order_list.dart';
import 'package:shop_flutter/models/product_model/product_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<ProductList>(
      context,
      listen: false,
    ).loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Meus Pedidos'),
        ),
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<OrderList>(context, listen: false).loadOrders(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return const Center(child: Text('Ocorreu um erro!'));
          } else {
            return Consumer<OrderList>(
              builder: (ctx, orders, child) => RefreshIndicator(
                onRefresh: () => _refreshProducts(context),
                child: ListView.builder(
                  itemCount: orders.itemsCount,
                  itemBuilder: (ctx, i) => OrderWidget(order: orders.items[i]),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
