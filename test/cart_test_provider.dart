import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Cart Tests', () {
    test('should add product to cart', () {
      final cart = <String>[];

      cart.add('iPhone');

      expect(cart.length, 1);
      expect(cart.contains('iPhone'), true);
    });

    test('should remove product from cart', () {
      final cart = ['iPhone', 'Samsung'];

      cart.remove('iPhone');

      expect(cart.length, 1);
      expect(cart.contains('iPhone'), false);
    });
  });
}