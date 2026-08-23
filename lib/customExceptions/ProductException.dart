abstract class ProductException implements Exception {
  final String message;

  ProductException(this.message);

  @override
  String toString() {
    return 'ProductException{message: $message}';
  }
}

class ProductNotFoundExecption extends ProductException{
  final String productId;

  ProductNotFoundExecption(this.productId)
      : super('Le produit avec ID "$productId" n\'existe pas');
}
class ProductFileReadException extends ProductException {
  ProductFileReadException(String message)
      : super('PRODUCT_FILE_READ_ERROR: $message');
}