import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/models/auth_model/auth.dart';
import 'package:shop_flutter/pages/auth_page/auth_page.dart';
import 'package:shop_flutter/pages/product_overview_page/products_overview_page.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);

    return FutureBuilder(
      future: auth.tryAutoLogin(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return const Center(
            child: Text('ERRO!'),
          );
        } else {
          return auth.isAuth ? const ProductsOverViewPage() : const AuthPage();
        }
      },
    );
  }
}
