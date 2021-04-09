import 'package:flutter_app/models/Product.dart';
import 'package:flutter_app/utils/URLs.dart';

class Catalog {
  static List<Product> productList = [
    Product(id:0 ,price: 12.0, name: "Black Nike Adapt BB", photoURL: blackNike),
    Product(id:1 ,price: 22.0, name: "Grey Nike Adapt BB", photoURL: greyNike),
    Product(id:2 ,price: 25.0, name: "White Nike Adapt BB", photoURL: whiteNike),
    Product(id:3 ,price: 19.99, name: "Blue Nike Adapt BB", photoURL: blueNike),
    Product(id:4 ,price: 70.50, name: "Black Adidas", photoURL: blackAdidas),
    Product(id:5 ,price: 50.00, name: "White Asics", photoURL: whiteAsics),
    Product(id:6 ,price: 35.00, name: "Black On Running", photoURL: blackOn),
    Product(id:7 ,price: 12.0, name: "OffWhite Asics", photoURL: offwhiteAsics),
    Product(id:8 ,price: 22.0, name: "Black Asics", photoURL: blackAsics),
    Product(id:9 ,price: 25.0, name: "Multi Color Asics", photoURL: colorAsics),
    Product(id:10 ,price: 19.99, name: "Blue Reebok", photoURL: blueReebok),
    Product(id:11 ,price: 70.50, name: "Blue Adidas", photoURL: blueAdidas),
    Product(id:12 ,price: 50.00, name: "Grey Adidas", photoURL: greyAdidas),
    Product(id:13 ,price: 35.00, name: "Red Veja", photoURL: redVeja)
  ];
}
