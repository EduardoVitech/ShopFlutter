import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/models/auth_model/auth.dart';
import 'package:shop_flutter/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Bem vindo Usuario!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Loja'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.AUTH_OR_HOME,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Pedidos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.ORDERS,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Gerenciar Produtos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.PRODUCTS,
              );
            },
          ),
          const Divider(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ListTile(
              leading: const Icon(Icons.exit_to_app_rounded),
              title: const Text('SAIR'),
              onTap: () {
                Provider.of<Auth>(
                  context,
                  listen: false,
                ).logout();

                Navigator.of(context).pushReplacementNamed(
                  AppRoutes.AUTH_OR_HOME,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
