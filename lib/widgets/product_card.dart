import 'package:app_multi_screens/models/Products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget{
  final Products products;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;

  ProductCard({super.key, required this.products, this.onTap, this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return Card(

      clipBehavior: Clip.antiAlias,
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),

        onTap: () {
          print('Produit sélectionné : ${this.products.title}');
          context.push("/details/${this.products.id}");
        },
        child: Column(
          children: [
            Expanded(

              child: Image.asset(
                this.products.url,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                this.products.title,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize:15
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                this.products.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(

                "${this.products.price} FCFA",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),

      ),
    );
  }

}