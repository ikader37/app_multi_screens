import 'package:app_multi_screens/RepositoriesImpl/ProductRepositoryImpl.dart';
import 'package:app_multi_screens/models/Products.dart';
import 'package:app_multi_screens/repositories/Repository.dart';

class Productservices {
  final Repository <Products> _repository=Productrepositoryimpl();

  Future <List<Products>> listAllProducts() async{
    return this._repository.findAll();
  }

  Future<Products> findById(int id) async{
    return this._repository.findProductById(id);
  }

  Future<List<Products>> searchProducts(String search){
    return this._repository.searchByTitle(search);
  }

  Future<List<Products>> findMyFavorite(){
    return this._repository.findMyFavorite();
  }
}