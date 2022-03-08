import 'package:flutter/material.dart';
import 'package:shop_flutter/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Teste'),
        ),
      ),
    );
  }
}
