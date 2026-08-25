import 'package:app_multi_screens/riverpods/CartProvider.dart';
import 'package:app_multi_screens/widgets/CartItemGrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final  cartItems=ref.watch(cartProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Mes Produits favoris'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pop();
            },
          ),
        ),

        body:CartItemGrid(items: cartItems)
    );
  }
}