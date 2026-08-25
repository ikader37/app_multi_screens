import 'package:app_multi_screens/utilities/Responsive.dart';
import 'package:app_multi_screens/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Products.dart';

class CustomGrid extends StatelessWidget {
  final List<Products> items;
  final Responsive responsive = Responsive();

  CustomGrid({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: this.responsive.isMobile(context)
            ? 2
            : this.responsive.isTablet(context)
            ? 4
            : 6,
        crossAxisSpacing: 8, // Espace horizontal
        mainAxisSpacing: 8, // Espace vertical
        childAspectRatio: 1.0, // Ratio largeur/hauteur de chaque cellule
      ),

      itemBuilder: (context, index) =>ProductCard(products: items[index],onTap: null,onFavorite: null,),
      itemCount: items.length,
    );
  }
}
