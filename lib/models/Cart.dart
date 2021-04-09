import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/Product.dart';

class Cart extends ChangeNotifier{
  List<Product> _productList = List();

  List<Product> get productList => _productList;

  addProduct(Product product){
    _productList.add(product);
    notifyListeners();
  }

  removeProduct(Product product){
    _productList.remove(product);
    notifyListeners();
  }

  int get itemsCount => _productList.length;

  double get totalPrice =>
      _productList.fold(0, (total, current) => total + current.price);

}