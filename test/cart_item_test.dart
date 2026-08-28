import 'package:app_multi_screens/models/CartIem.dart';
import 'package:app_multi_screens/models/Products.dart';
import 'package:app_multi_screens/widgets/CustomCartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets(
    'CustomCartItem should display product and quantity',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomCartItem(

              onIncrement: () {},
              onDecrement: () {},
              onRemove: () {}, cartItem: CartItem(product: Products(id: 1, url: "url", title: "iPhone 15", description: "description", price: 1000, isInPromotion: false, promotionPrice: 0), quantity: 2),
            ),
          ),
        ),
      );

      expect(find.text('iPhone 15'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);

      expect(
        find.byIcon(Icons.add),
        findsOneWidget,
      );

      expect(
        find.byIcon(Icons.remove),
        findsOneWidget,
      );
    },
  );
}