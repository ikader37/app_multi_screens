import 'package:app_multi_screens/RepositoriesImpl/ProductRepositoryImpl.dart';
import 'package:app_multi_screens/models/Products.dart';
import 'package:app_multi_screens/repositories/Repository.dart';
import 'package:app_multi_screens/services/ProductService.dart';

class ProductservicesImpl implements ProductService{
  final Repository <Products> _repository=Productrepositoryimpl();
  @override
  Future <List<Products>> listAllProducts() async{
    return this._repository.findAll();
  }
  @override
  Future<Products> findById(int id) async{
    return this._repository.findProductById(id);
  }
  @override
  Future<List<Products>> searchProducts(String search){
    return this._repository.searchByTitle(search);
  }
  @override
  Future<List<Products>> findMyFavorite(){
    return this._repository.findMyFavorite();
  }

  @override
  Future<String> addToCart(int id, int quantity) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<Products> addToFavorite(int id) {
    // TODO: implement addToFavorite
    throw UnimplementedError();
  }


  @override
  Future<List<Products>> listCartItems() {
    // TODO: implement listCartItems
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromCart(int id) {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }
}