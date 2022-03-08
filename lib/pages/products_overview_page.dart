import 'package:flutter/material.dart';
import 'package:shop_flutter/components/product_grid.dart';

class ProductsOverViewPage extends StatelessWidget {
  const ProductsOverViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('ShoPi'),
        ),
      ),
      body: ProductGrid(),
    );
  }
}
