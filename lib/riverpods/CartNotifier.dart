import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/CartIem.dart';
import '../models/Products.dart';

class CartNotifier
    extends StateNotifier<List<CartItem>> {

  CartNotifier() : super([]);

  void addProduct(Products product) {
    final index = state.indexWhere(
          (item) => item.product.id == product.id,
    );

    if (index == -1) {
      state = [
        ...state,
        CartItem(
          product: product,
          quantity: 1,
        ),
      ];
    } else {
      final items = [...state];

      items[index] = items[index].copyWith(
        quantity: items[index].quantity + 1,
      );

      state = items;
    }
  }

  void removeProduct(int productId) {
    state = state
        .where(
          (item) => item.product.id != productId,
    )
        .toList();
  }

  void increment(int productId) {
    final items = [...state];

    final index = items.indexWhere(
          (item) => item.product.id == productId,
    );

    if (index != -1) {
      items[index] = items[index].copyWith(
        quantity: items[index].quantity + 1,
      );

      state = items;
    }
  }

  void decrement(int productId) {
    final items = [...state];

    final index = items.indexWhere(
          (item) => item.product.id == productId,
    );

    if (index == -1) return;

    if (items[index].quantity <= 1) {
      items.removeAt(index);
    } else {
      items[index] = items[index].copyWith(
        quantity: items[index].quantity - 1,
      );
    }

    state = items;
  }

  void updateQuantity(int productId,int quantity) {
    final items = [...state];

    final index = items.indexWhere(
          (item) => item.product.id == productId,
    );

    if (index != -1) {
      items[index] = items[index].copyWith(
        quantity: quantity,
      );

      state = items;
    }
  }

  double get total {
    return state.fold(
      0,
          (sum, item) => sum + item.total,
    );
  }
}