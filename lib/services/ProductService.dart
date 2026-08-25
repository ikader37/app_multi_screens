import 'package:app_multi_screens/models/Products.dart';


abstract  interface class ProductService{
  Future <List<Products>> listAllProducts();
  Future <List<Products>> searchProducts(String search);
  Future<Products> findById(int id);
  Future<void> addToFavorite(int id);
  Future<List<Products>> findMyFavorite();
  Future<void> removeFromFavoris(int productId);

}