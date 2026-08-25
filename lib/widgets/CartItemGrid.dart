import 'package:app_multi_screens/models/CartIem.dart';
import 'package:app_multi_screens/providers/CartProvider.dart';
import 'package:app_multi_screens/utilities/Responsive.dart';
import 'package:app_multi_screens/widgets/CustomCartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartItemGrid extends ConsumerWidget {

  final List<CartItem> items;
  final Responsive responsive=Responsive();



  CartItemGrid({required this.items,super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return GridView.builder(

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: this.responsive.isMobile(context)
            ? 1
            : this.responsive.isTablet(context)
            ? 3
            : 6,
        crossAxisSpacing: 8, // Espace horizontal
        mainAxisSpacing: 8, // Espace vertical
        childAspectRatio: 1.0, // Ratio largeur/hauteur de chaque cellule
      ),

      itemBuilder: (context, index) =>CustomCartItem(cartItem: items[index],
        onDecrement: (){ref.read(cartProvider.notifier).decrement(items[index].product.id);},
      onIncrement: (){ref.read(cartProvider.notifier).increment(items[index].product.id);},
        onRemove: (){ref.read(cartProvider.notifier).removeProduct(items[index].product.id);},
      ),
      itemCount: items.length,
    );
  }
}