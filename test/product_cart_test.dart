import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_multi_screens/models/Products.dart';
import 'package:app_multi_screens/widgets/product_card.dart';

void main() {
  final product = Products(
    id: 1,
    title: 'iPhone 15',
    price: 450000,
    isFavorite: false, url: '', description: '', isInPromotion: false, promotionPrice: 0,
  );

  testWidgets(
    'ProductCard should display product information',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProductCard(
              products: product,
            ),
          ),
        ),
      );

      expect(find.text('iPhone 15'), findsOneWidget);

      expect(
        find.textContaining('450000'),
        findsOneWidget,
      );
    },
  );
}