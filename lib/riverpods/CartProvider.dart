import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/CartIem.dart';
import 'CartNotifier.dart';

final cartProvider = StateNotifierProvider<
    CartNotifier,
    List<CartItem>
>((ref) {
  return CartNotifier();
});