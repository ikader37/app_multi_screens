import 'package:app_multi_screens/models/Products.dart';
import 'package:app_multi_screens/services/productServices.dart';
import 'package:app_multi_screens/widgets/primary_button.dart';
import 'package:app_multi_screens/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  final int selectedId;

  const DetailsScreen({
    super.key,
    required this.selectedId,
  });

  @override
  Widget build(BuildContext context) {
    final Productservices productservices = Productservices();

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
          return _buildProductDetails(context, product);
        },
      ),
    );
  }

  Widget _buildProductDetails(
      BuildContext context,
      Products product,
      ) {
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
          PrimaryButton(text: "Mettre en favorie")
        ],
      ),
    );
  }
}