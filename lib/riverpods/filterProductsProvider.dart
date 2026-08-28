import 'package:app_multi_screens/models/Products.dart';
import 'package:app_multi_screens/riverpods/ProductProvier.dart';
import 'package:app_multi_screens/riverpods/productSortProvider.dart';
import 'package:app_multi_screens/riverpods/searchProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filteredProductsProvider =
Provider<AsyncValue<List<Products>>>((ref) {
  final products = ref.watch(productsProvider);
  final search = ref.watch(searchProvider);
  // final sort=ref.watch(productSortProvider);

  return products.whenData(
        (items) {
      if (search.trim().isEmpty) {
        return items;
      }

      final query = search.toLowerCase();

      return items.where((product) {
        return product.title
            .toLowerCase()
            .contains(query);
      }).toList();
    },
  );
});