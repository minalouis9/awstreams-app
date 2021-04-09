import 'package:flutter/material.dart';
import 'package:flutter_app/models/Cart.dart';
import 'package:flutter_app/models/Product.dart';
import 'package:flutter_app/utils/InterfaceUtilities.dart';
import 'package:flutter_app/widgets/CartAppBarIcon.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  final Product product;

  ProductScreen({@required this.product});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          widget.product.name,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          cartIcon(cart, context),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(InterfaceUtilities.screenPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FadeInImage(
                  height: InterfaceUtilities.getPercentageOfScreenHeight(context, 0.35),
                    image: NetworkImage(widget.product.photoURL), placeholder: AssetImage("assets/images/png/shoppingBagIcon.png")),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.product.name,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        print(widget.product.photoURL);
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        color: _isFavorite ? Colors.red : Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.9),
        child: MaterialButton(
          height: InterfaceUtilities.getPercentageOfScreenHeight(context, 0.06),
          color: Colors.blue,
          elevation: InterfaceUtilities.elevation,
          onPressed: () {
            cart.addProduct(widget.product);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Add to cart", style: TextStyle(fontSize: 18.0, color: Colors.white),),
              Text("\$ ${widget.product.price}", style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
