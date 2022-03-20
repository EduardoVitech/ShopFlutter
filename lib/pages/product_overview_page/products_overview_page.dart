import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/components/app_drawer/app_drawer.dart';
import 'package:shop_flutter/components/badge/badge.dart';
import 'package:shop_flutter/components/product_grid/product_grid.dart';
import 'package:shop_flutter/models/cart_model/cart.dart';
import 'package:shop_flutter/models/product_model/product_list.dart';
import 'package:shop_flutter/utils/app_routes.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverViewPage extends StatefulWidget {
  const ProductsOverViewPage({Key? key}) : super(key: key);

  @override
  State<ProductsOverViewPage> createState() => _ProductsOverViewPageState();
}

class _ProductsOverViewPageState extends State<ProductsOverViewPage> {
  bool _showFavoriteOnly = false;
  bool _isLoading = true;

  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<ProductList>(
      context,
      listen: false,
    ).loadProducts();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<ProductList>(
      context,
      listen: false,
    ).loadProducts().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/image/logo.png',
            scale: 3.6,
            alignment: Alignment.center,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.keyboard_arrow_down),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Somente favoritos'),
                value: FilterOptions.Favorite,
              ),
              const PopupMenuItem(
                child: Text('Todos produtos'),
                value: FilterOptions.All,
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART);
              },
            ),
            builder: (ctx, cart, child) => Badge(
              value: cart.itemsCount.toString(),
              child: child!,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ProductGrid(_showFavoriteOnly),
      ),
      drawer: const AppDrawer(),
    );
  }
}
