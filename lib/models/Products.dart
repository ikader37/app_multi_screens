class Products {
  String url;
  String title;
  String description;
 int price;
 bool isInPromotion;
 int promotionPrice;
 int id;
 bool isFavorite;

  Products({required this.id, required this.url, required this.title, required this.description, required this.price,
    required this.isInPromotion, required this.promotionPrice,this.isFavorite=false});

  Map<String, dynamic> toJson(){
    return {
      'id':this.id,
      "title":this.title,
      "description":this.description,
      "price":this.price,
      "isInPromotion":this.isInPromotion,
      "promotionPrice":this.promotionPrice,
      "isFavorite":this.isFavorite
    };
  }
  factory Products.fromJson(Map<String, dynamic> json){
    return Products(id:json['id'],
        url:json['url'],
        title:json['title'],
        description:json['description'],
        price:json['price'],
        isInPromotion:json['isInPromotion'],
        promotionPrice:json['promotionPrice'],
      isFavorite: json['isFavorite']
    );
  }

}