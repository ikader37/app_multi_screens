import 'package:app_multi_screens/models/Products.dart';

class CartItem {
  final Products product;
   int quantity;

  void setQuantity(_quantity){
    return quantity=_quantity;
  }

  CartItem({
    required this.product,
    required this.quantity,
  });

  CartItem copyWith({
    int? quantity,
  }) {
    return CartItem(
      product: product,
      quantity: quantity ?? this.quantity,
    );
  }

  int get total {
    return product.price * quantity;
  }

  @override
  String toString() {
    return 'CartItem{product: $product, quantity: $quantity}';
  }
  Map<String,dynamic> toJson(){
    return {
      "product":this.product.toJson(),
      "quantity": this.quantity,
      "total": this.total
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json){
    return CartItem(product: json['product'], quantity: json['quantity']);
  }


}