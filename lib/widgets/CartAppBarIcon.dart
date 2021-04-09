import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Cart.dart';

cartIcon(cart, context) {
  return Stack(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 5),
        child: IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.black,
          ),
          onPressed: () {
            //TODO: Navigate to cart screen
            if (cart.itemsCount > 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
            }
          },
        ),
      ),
      cart.itemsCount == 0
          ? SizedBox()
          : Positioned(
        right: 3.0,
        top: 2.0,
        child: Container(
          alignment: Alignment.center,
          height: 20.0,
          width: 20.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.green),
          child: FittedBox(
            child: Text(
              cart.itemsCount.toString(),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    ],
  );
}