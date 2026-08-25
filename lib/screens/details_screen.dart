import 'package:app_multi_screens/models/Products.dart';
import 'package:app_multi_screens/riverpods/CartProvider.dart';
import 'package:app_multi_screens/servicesImpl/productServicesImpl.dart';
import 'package:app_multi_screens/widgets/primary_button.dart';
import 'package:app_multi_screens/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends ConsumerWidget {
  final int selectedId;

  const DetailsScreen({
    super.key,
    required this.selectedId,
  });

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ProductservicesImpl productservices = ProductservicesImpl();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du produit'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),

      body: FutureBuilder<Products?>(
        future: productservices.findById(selectedId),
        builder: (context, snapshot) {
          // Chargement
          // print("OOOOOfff $snapshot");

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
          return _buildProductDetails(context, ref,product);
        },
      ),
    );
  }

  Widget _buildProductDetails(
      BuildContext context,
      WidgetRef ref,
      Products product,
      ) {
    final ProductservicesImpl productservices = ProductservicesImpl();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            product.url,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),

          const SizedBox(height: 20),

          SectionTitle(
            title: product.title,
          ),
          const SizedBox(height: 10),
          Text(
            '${product.price} FCFA',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          Text(
            '${product.description}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          PrimaryButton(text: "Ajouter au panier",onPressed: (){
            ref.read(cartProvider.notifier).addProduct(product);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Produit a été ajouté dans le panier"),));
          }

          , ),
          SizedBox(
            height: 9,
          ),
          PrimaryButton(text: "Mettre en favorie",
              onPressed: (){productservices.addToFavorite(product.id);})
        ],
      ),
    );
  }
}