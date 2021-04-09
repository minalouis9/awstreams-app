class Product{
  int id;
  double price;
  String name, photoURL;

  Product({this.id, this.price, this.name, this.photoURL});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        photoURL: json["photoURL"]);
  }
}