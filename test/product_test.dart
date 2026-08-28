import 'package:app_multi_screens/models/Products.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Products Model Tests', () {
    test('should create a product correctly', () {
      final product = Products(
        id: 1,
        title: 'iPhone 15',
        price: 450000,
        isFavorite: false, url: '', description: '', isInPromotion: false, promotionPrice: 20000,
      );

      expect(product.id, 1);
      expect(product.title, 'iPhone 15');
      expect(product.price, 450000);
      expect(product.isFavorite, false);
    });

    test('should correctly parse product from JSON', () {
      final json = {
        'id': 1,
        'name': 'Samsung Galaxy',
        'price': 500000,
        'isFavorite': true,
      };

      final product = Products.fromJson(json);

      expect(product.id, 1);
      expect(product.title, 'Samsung Galaxy');
      expect(product.price, 500000);
      expect(product.isFavorite, true);
    });
  });
}