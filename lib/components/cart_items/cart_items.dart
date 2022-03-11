import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/models/cart_model/cart.dart';
import 'package:shop_flutter/models/cart_model/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget(
    this.cartItem, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.productId),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 15),
        margin: const EdgeInsets.symmetric(
          vertical: 4,
        ),
      ),
      confirmDismiss: (_) {
        return showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Tem Certeza?'),
            content: const Text('Deseja remover o item do carrinho?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Não'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Sim'),
              ),
            ],
          ),
        );
      },
      onDismissed: (_) {
        Provider.of<Cart>(
          context,
          listen: false,
        ).removeItem(cartItem.productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text('${cartItem.price}'),
                ),
              ),
            ),
            title: Text(cartItem.productName),
            subtitle: Text('Total: R\$ ${cartItem.price * cartItem.quantity}'),
            trailing: Text('${cartItem.quantity}x'),
          ),
        ),
      ),
    );
  }
}
