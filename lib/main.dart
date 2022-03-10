import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/models/cart.dart';
import 'package:shop_flutter/models/product_list.dart';
import 'package:shop_flutter/pages/cart_page.dart';
import 'package:shop_flutter/pages/product_detail_page.dart';
import 'package:shop_flutter/pages/products_overview_page.dart';
import 'package:shop_flutter/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          // ignore: deprecated_member_use
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: const ProductsOverViewPage(),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailPage(),
          AppRoutes.CART: (ctx) => const CartPage(),
        },
      ),
    );
  }
}
