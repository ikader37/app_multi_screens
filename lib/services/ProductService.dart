import 'package:app_multi_screens/models/Products.dart';


abstract  interface class ProductService{
  Future <List<Products>> listAllProducts();
  Future <List<Products>> searchProducts(String search);
  Future<Products> findById(int id);
  Future<Products> addToFavorite(int id);
  Future<List<Products>> findMyFavorite();
  Future<String> addToCart(int id,int quantity);
  Future<void> removeFromCart(int id);
  Future<List<Products>> listCartItems();

}