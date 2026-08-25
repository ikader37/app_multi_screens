
abstract interface class Repository<T>{
Future<void> init();
  Future<void> addProduct(T product);
  Future<T> findProductById(int id);
  Future<List<T>> findAll();
  Future<List<T>> findMyFavorite();
  Future<List<T>> searchByTitle(String title);
  Future<void> addToFavorite(int productId);
  // Future<void> commentOnProduct();

}