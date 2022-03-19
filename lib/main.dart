import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/models/auth_model/auth.dart';
import 'package:shop_flutter/models/cart_model/cart.dart';
import 'package:shop_flutter/models/order_model/order_list.dart';
import 'package:shop_flutter/models/product_model/product_list.dart';
import 'package:shop_flutter/pages/auth_page/auth_page.dart';
import 'package:shop_flutter/pages/cart_page/cart_page.dart';
import 'package:shop_flutter/pages/orders_page/orders_page.dart';
import 'package:shop_flutter/pages/product_detail_page/product_detail_page.dart';
import 'package:shop_flutter/pages/product_form_page/product_form_page.dart';
import 'package:shop_flutter/pages/product_overview_page/products_overview_page.dart';
import 'package:shop_flutter/pages/products_page/product_page.dart';
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
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
      ],
      child: MaterialApp(
        title: 'ShoPi',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          // ignore: deprecated_member_use
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        //home: const ProductsOverViewPage(),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.AUTH: (ctx) => const AuthPage(),
          AppRoutes.HOME: (ctx) => const ProductsOverViewPage(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailPage(),
          AppRoutes.CART: (ctx) => const CartPage(),
          AppRoutes.ORDERS: (ctx) => const OrdersPage(),
          AppRoutes.PRODUCTS: (ctx) => const ProductsPage(),
          AppRoutes.PRODUCTS_FORM: (ctx) => const ProductFormPage(),
        },
      ),
    );
  }
}
