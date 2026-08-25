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
  Future<void> addToFavorite(int id) async{
    this._repository.addToFavorite(id);
  }

  @override
  Future<void> removeFromFavoris(int productId) async{
    this._repository.removeFromFavorite(productId);
  }

}