import 'package:app_multi_screens/models/Products.dart';
import 'package:app_multi_screens/riverpods/filterProductsProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ProductSort {
  name,
  priceAscending,
  priceDescending,
}

final productSortProvider =
StateProvider<ProductSort>((ref) {
  return ProductSort.name;
});
final sortedProductsProvider =
Provider<AsyncValue<List<Products>>>((ref) {
  final products =
  ref.watch(filteredProductsProvider);

  final sort =
  ref.watch(productSortProvider);

  return products.whenData(
        (items) {
      final result = [...items];

      switch (sort) {
        case ProductSort.name:
          result.sort(
                (a, b) => a.title.compareTo(b.title),
          );
          break;

        case ProductSort.priceAscending:
          result.sort(
                (a, b) => a.price.compareTo(b.price),
          );
          break;

        case ProductSort.priceDescending:
          result.sort(
                (a, b) => b.price.compareTo(a.price),
          );
          break;
      }

      return result;
    },
  );
});