import 'package:app_multi_screens/services/ProductService.dart';
import 'package:app_multi_screens/servicesImpl/productServicesImpl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/Products.dart';

final productServiceProvider = Provider<ProductService>((ref) {
  return ProductservicesImpl();
});

final productsProvider = FutureProvider<List<Products>>((ref) async {
  final service = ref.read(productServiceProvider);
  return service.listAllProducts();
});