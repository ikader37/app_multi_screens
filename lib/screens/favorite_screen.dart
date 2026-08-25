import 'package:app_multi_screens/models/Products.dart';
import 'package:app_multi_screens/servicesImpl/productServicesImpl.dart';
import 'package:app_multi_screens/widgets/customGrid.dart';
import 'package:app_multi_screens/widgets/primary_button.dart';
import 'package:app_multi_screens/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class MyFavorites extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final ProductservicesImpl productservices = ProductservicesImpl();

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

      body: FutureBuilder<List<Products>?>(
        future: productservices.findMyFavorite(),
        builder: (context, snapshot) {
          // Chargement
          print("OOOOOfff $snapshot");

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Erreur
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erreur : ${snapshot.error}',
              ),
            );
          }

          // Produit inexistant
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text(
                'Produit introuvable',
              ),
            );
          }

          final product = snapshot.data!;
          return _buildProductDetails(context, product);
        },
      ),
    );
  }

  Widget _buildProductDetails(
      BuildContext context,
      List<Products> product,
      ) {
    return CustomGrid(items: product);
  }
  
}