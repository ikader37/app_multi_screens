import 'package:app_multi_screens/models/Products.dart';
import 'package:app_multi_screens/riverpods/CartNotifier.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CartNotifier cartNotifier;
  late Products product;

  setUp(() {
    cartNotifier = CartNotifier();

    product = Products(
      id: 1,
      title: 'Test Product',
      price: 100,
      url: '', description: '',
      isInPromotion: false, promotionPrice: 0,
    );
  });

  group('CartNotifier', () {
    test('should add a product to the cart', () {
      cartNotifier.addProduct(product);

      expect(cartNotifier.state.length, 1);
      expect(cartNotifier.state.first.product.id, 1);
      expect(cartNotifier.state.first.quantity, 1);
    });

    test('should increase product quantity', () {
      cartNotifier.addProduct(product);

      cartNotifier.increment(product.id);

      expect(cartNotifier.state.first.quantity, 2);
    });

    test('should decrease product quantity', () {
      cartNotifier.addProduct(product);
      cartNotifier.increment(product.id);

      cartNotifier.decrement(product.id);

      expect(cartNotifier.state.first.quantity, 1);
    });

    test('should remove product from cart', () {
      cartNotifier.addProduct(product);

      cartNotifier.removeProduct(product.id);

      expect(cartNotifier.state, isEmpty);
    });

    test('should update product quantity', () {
      cartNotifier.addProduct(product);

      cartNotifier.updateQuantity(product.id, 5);

      expect(cartNotifier.state.first.quantity, 5);
    });

    test('should remove product when quantity becomes zero', () {
      cartNotifier.addProduct(product);

      cartNotifier.updateQuantity(product.id, 0);

      expect(cartNotifier.state, isEmpty);
    });
  });
}