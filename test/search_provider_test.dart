import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Search Tests', () {
    final products = [
      'iPhone 15',
      'Samsung Galaxy',
      'MacBook Air',
    ];

    test('should filter products by search term', () {
      const query = 'iphone';

      final result = products
          .where(
            (product) =>
            product.toLowerCase().contains(query.toLowerCase()),
      )
          .toList();

      expect(result.length, 1);
      expect(result.first, 'iPhone 15');
    });

    test('should return empty list when product is not found', () {
      const query = 'Nokia';

      final result = products
          .where(
            (product) =>
            product.toLowerCase().contains(query.toLowerCase()),
      )
          .toList();

      expect(result, isEmpty);
    });
  });
}